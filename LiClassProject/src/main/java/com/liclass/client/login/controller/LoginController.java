package com.liclass.client.login.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Map;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.liclass.client.login.service.KakaoService;
import com.liclass.client.login.service.MailService;
import com.liclass.client.login.service.NaverService;
import com.liclass.client.login.service.UserService;
import com.liclass.client.login.vo.UserVO;

import lombok.Setter;

@Controller
@SessionAttributes("loginUser")
public class LoginController { //은아
	
	@Setter(onMethod_ = @Autowired)
	private UserService userService;
	@Setter(onMethod_ = @Autowired)
	private KakaoService kakaoService;
	@Setter(onMethod_ = @Autowired)
	private NaverService naverService;
	@Setter(onMethod_ = @Autowired)
    private MailService mailService;
	
	@GetMapping("/use")
	public String use() {
		return "common/error/error_500";
	}
	/************************************************
	 * 1.회원가입 화면
	 * 요청 url : http://localhost:8080/user/signupForm
	************************************************/
	@GetMapping("/user/signupForm")
	public String signupForm() {
		return "client/login/signupForm";
	}
	
	/************************************************
	 * 2.회원가입 처리
	 * 요청 url : http://localhost:8080/user/signup
	 * @throws MessagingException 
	 * @throws UnsupportedEncodingException 
	************************************************/
	@PostMapping(value ="/user/signup", produces="application/text; charset=UTF-8;")
	public String signup(@ModelAttribute UserVO vo,Model model) throws UnsupportedEncodingException, MessagingException {
		String message ="";
		int result = userService.signup(vo);
		
		if(result == 1) {
			mailService.sendEmail(mailService.welcomeMessage(vo));
			message = "환영합니다, "+vo.getUser_name()+"님";
			UserVO loginUser = userService.login(vo);
			model.addAttribute("loginUser", loginUser);
			
			model.addAttribute("message", message);
			model.addAttribute("url", "/");
		}else {
			message = "죄송합니다. 회원가입을 다시 진행해주세요.";
			model.addAttribute("message", message);
			model.addAttribute("url", "/user/signupForm");
		}
		return "client/login/signupForm";
	}
	
	/************************************************
	 * 3.이메일 인증
	 * 요청 url : http://localhost:8080/mailCertify
	************************************************/
	@ResponseBody
	@PostMapping("/mailCertify")
	public String mailCertify(@RequestParam("email") String email,Model model) throws Exception {
		String authoKey ="";
		
		int result = userService.checkEmail(email);
		if(result == 1) {
			authoKey = "duplication";
		}else if (result == 0) {
			authoKey = mailService.sendSimpleMessage(email);
		}else {
			authoKey = "error";
		}
		return authoKey;
	}
	
	/************************************************
	 * 4.이용약관 화면
	 * 요청 url : http://localhost:8080/user/userTerms
	************************************************/
	@GetMapping("/user/userTerms")
	public String userTerms() {
		return "client/login/userTerms";
	}
	
	/************************************************
	 * 5.개인정보 취급방침
	 * 요청 url : http://localhost:8080/user/userPolicy
	************************************************/
	@GetMapping("/user/userPolicy")
	public String userPolicy() {
		return "client/login/userPolicy";
	}
	
	/************************************************
	 * 6.비밀번호찾기 화면
	 * 요청 url : http://localhost:8080/user/userFindpw
	************************************************/
	@GetMapping("/user/userFindpw")
	public String userFindpw() {
		return "client/login/userFindpw";
	}
	
	/************************************************
	 * 7.비밀번호 찾으려는 이메일 확인
	 * 요청 url : http://localhost:8080/findEmail
	************************************************/
	@ResponseBody
	@PostMapping("/findEmail")
	public String findEmail(@RequestParam("email") String email,Model model) throws Exception {
		String result ="";
		
		int check = userService.findEmail(email);
		if(check == 1) {
			result = "duplication";
		}else if (check == 0) {
			result = "none";
		}else {
			result = "error";
		}
		return result;
	}
	
	/************************************************
	 * 8.비밀번호찾기 처리
	 * 요청 url : http://localhost:8080/findPw
	************************************************/
	@PostMapping("/findPw")
	public String findPw(@RequestParam("user_email") String user_email,Model model) throws Exception{
		
		String user_pw = mailService.createKey();
		
		UserVO pwUpdateVo= new UserVO();
		pwUpdateVo.setUser_email(user_email);
		pwUpdateVo.setUser_pw(user_pw);
		
		int result = userService.updatePw(pwUpdateVo);
		
		String message ="";
		
		if(result == 1) {
			mailService.sendEmail(mailService.findPwMessage(user_pw,user_email));
			message = "발급된 임시비밀번호를 전송하였습니다. 메일을 확인해주세요. ";
			model.addAttribute("message", message);
			model.addAttribute("url", "/");
		}else {
			message = "죄송합니다. 잠시후 다시 시도해주세요.";
			model.addAttribute("message", message);
			model.addAttribute("url", "/user/userFindpw");
		}
		return "client/login/userFindpw";
	}
	
	/************************************************
	 * 9.아이디 비밀번호 확인 (로그인)
	 * 요청 url : http://localhost:8080/user/checkIdPwd
	************************************************/
	@ResponseBody
	@RequestMapping("/user/checkIdPw")
	public int checkIdPw(@ModelAttribute UserVO vo, Model model) {
		
		int checkData = userService.checkIdPw(vo);
		model.addAttribute("checkData",checkData);
		return checkData;
	}

	/************************************************
	 * 10.로그인 처리
	 * 요청 url : http://localhost:8080/user/login
	************************************************/
	@PostMapping("/user/login")
	public String login(UserVO vo,Model model,RedirectAttributes ras) {
		UserVO loginUser = userService.login(vo);
		
		if(loginUser != null) {
			
			if(loginUser.getUser_status() == 0) {
				model.addAttribute("loginUser", loginUser);				
			}
			else if(loginUser.getUser_status() == 1){
				ras.addFlashAttribute("errorMsg", "탈퇴한 회원입니다.");
			}
			
		}else {
			ras.addFlashAttribute("errorMsg", "로그인 실패");
		}
		
		return "redirect:/";
	}
	
	/************************************************
	 * 11.카카오톡 로그인
	 * 요청 url : http://localhost:8080/user/kakaoLogin
	***********************************************/
	@RequestMapping(value = "/user/kakaoLogin", method = RequestMethod.GET)
    public String kakaoLogin(@RequestParam String code, HttpSession session,Model model,RedirectAttributes ras) throws IOException {
            
            //접속토큰 get
            String snsToken = kakaoService.getReturnAccessToken(code);
            
            //접속자 정보 get
            Map<String, Object> result = kakaoService.getUserInfo(snsToken);
            String user_email = (String) result.get("user_email");
            String user_pw = (String) result.get("user_pw");
            String user_name = (String) result.get("user_name");
            String user_img = (String) result.get("user_img");
            int user_type = (int) result.get("user_type");
            //새 객체,UserVO새거 하나를 만들어 놓고,
            UserVO loginUser = new UserVO();
            
            //로그인 하려는 이메일이 회원테이블에 없을 시 회원가입
            if (userService.SNSLogin(user_email) == null) {
                //새객체에 신규연동한 카카오계정의 정보를 담는다.
                loginUser.setUser_email(user_email);
                loginUser.setUser_pw(user_pw);
                loginUser.setUser_name(user_name);
                loginUser.setUser_img(user_img);
                loginUser.setUser_type(user_type);
                
                //새로 탄생한 UserVO를 테이블에 insert한다.
                userService.SNSInsert(loginUser);
                session.setAttribute("loginUser", loginUser);
                
                //추후 로그아웃을 위한 setAttribute
                session.setAttribute("snsToken", snsToken);
             
            }else if (userService.SNSLogin(user_email) != null) { //기존연동했을 경우
            	UserVO vo = userService.SNSLogin(user_email);
            	loginUser = userService.login(vo);
            	  session.setAttribute("loginUser", loginUser);
            	//추후 로그아웃을 위한 setAttribute
            	  session.setAttribute("snsToken", snsToken);
            }else {
            	ras.addFlashAttribute("errorMsg", "로그인 실패");
            }
            
        return "redirect:/";
    }
	
	
	
	/************************************************
	 * 12.네이버 로그인 화면
	 * 요청 url : http://localhost:8080/user/getNaverAuthUrl
	************************************************/
	
	// 네이버 로그인창 호출
	@RequestMapping(value = "/user/getNaverAuthUrl")
	public @ResponseBody String getNaverAuthUrl(HttpSession session) throws Exception {
	    String reqUrl = naverService.getAuthorizationUrl(session);
	    return reqUrl;
	}
	
	/************************************************
	 * 13.네이버 로그인
	 * 요청 url : http://localhost:8080/user/naverLogin
	************************************************/
	//네이버 로그인 처리
	 @RequestMapping(value = "/user/naverLogin",method = { RequestMethod.GET, RequestMethod.POST })
	 public String naverLogin(HttpServletRequest request, HttpServletResponse response,RedirectAttributes ras) throws Exception{
		 
		    HttpSession session = request.getSession();
		    String code = request.getParameter("code");
		    String state = request.getParameter("state");
		    String error = request.getParameter("error");

		    // 네이버 로그인창에서 취소버튼 눌렀을경우
		    if ( error != null ){
		        if(error.equals("access_denied")){
		            return "redirect:/";
		        }
		    }

		    OAuth2AccessToken fullToken;
		    fullToken = naverService.getAccessToken(session, code, state);
		    String snsToken = fullToken.getAccessToken();
		    String loginInfo = naverService.getUserProfile(session, fullToken);
		    
		    //JSON 형태로 변환
		    JSONParser jsonParser = new JSONParser();
		    JSONObject jsonobj = (JSONObject)jsonParser.parse(loginInfo);
		    JSONObject response_obj=(JSONObject)jsonobj.get("response");
		    
		    String user_email = (String)response_obj.get("email");
			String user_pw = (String)response_obj.get("id");
			String user_name = (String)response_obj.get("name");
			String user_img = (String)response_obj.get("profile_image");
		    
			UserVO loginUser = new UserVO();
			 if (userService.SNSLogin(user_email) == null) {
			 	loginUser.setUser_email(user_email);
				loginUser.setUser_pw(user_pw);
				loginUser.setUser_name(user_name);
				loginUser.setUser_img(user_img);
				loginUser.setUser_type(2);
				
				 //새로 탄생한 UserVO를 테이블에 insert한다.
	            userService.SNSInsert(loginUser);
	            session.setAttribute("loginUser", loginUser);
	            
			 }else if (userService.SNSLogin(user_email) != null) { //기존연동했을 경우
	            	UserVO vo = userService.SNSLogin(user_email);
	            	loginUser = userService.login(vo);
	            	session.setAttribute("loginUser", loginUser);
	            	 
	            	session.setAttribute("snsToken", snsToken);
	            	
	          }else {
	            	ras.addFlashAttribute("errorMsg", "로그인 실패");
	          }
		 
		 return "redirect:/"; 
	 }
	 
	 	/************************************************
		 * 14.로그아웃
		 * 요청 url : http://localhost:8080/user/logout
		*************************************************/
		@RequestMapping("/user/logout")
		public String logout(HttpSession session,Model model) {
			UserVO vo =(UserVO) model.getAttribute("loginUser");
			if(vo != null) {
				int user_type = vo.getUser_type();
				if(user_type == 0) { //이메일
					model.addAttribute("loginUser",null);
					session.invalidate();
				}else if(user_type == 1){ //카카오
					String access_Token = (String)session.getAttribute("snsToken");
					kakaoService.logout(access_Token);
					model.addAttribute("loginUser",null);
					session.invalidate();
				}else if(user_type == 2){ //네이버
					session.removeAttribute("snsToken");
					model.addAttribute("loginUser",null);
					session.invalidate();
				}
			}
			 return "redirect:/";  
		}
		
}
