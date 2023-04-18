package com.liclass.client.mypage.controller;

import java.io.UnsupportedEncodingException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.mail.MessagingException;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.liclass.client.classes.service.ClientClassService;
import com.liclass.client.likes.service.LikesService;
import com.liclass.client.likes.vo.LikesVO;
import com.liclass.client.login.service.UserService;
import com.liclass.client.login.vo.UserVO;
import com.liclass.client.mypage.service.MypageService;
import com.liclass.client.payment.vo.PaymentVO;
import com.liclass.client.post.vo.PostVO;
import com.liclass.client.qnaboard.vo.ClientQnaBoardVO;
import com.liclass.client.review.vo.ReviewVO;
import com.liclass.common.file.UserFileUpload;
//import com.liclass.common.file.FileUploadUtil;
import com.liclass.common.vo.PageDTO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@SessionAttributes("loginUser")
public class MyPageController { //은아,웅배
	@Setter(onMethod_ = @Autowired)
	private UserService userService;
	@Setter(onMethod_ = @Autowired)
	private MypageService mypageService;
	@Setter(onMethod_ = @Autowired)
	private LikesService likesService;
	@Setter(onMethod_ = @Autowired)
	private ClientClassService clientClassService;
	@Setter(onMethod_ = @Autowired)
	private UserFileUpload fileUploadUtil;
	
	/************************************************
	 * 1. 마이페이지 첫 화면(회원정보 화면)
	 * 요청 url : http://localhost:8080/mypage
	************************************************/
	@RequestMapping("/mypage")
	public String mypage(UserVO vo,Model model,HttpSession session,PaymentVO pvo,ClientQnaBoardVO qvo,ReviewVO rvo,LikesVO lvo,PostVO postVo) {
		
		/* 은아 */
		//로그인 세션
		UserVO loginUser = (UserVO)session.getAttribute("loginUser");
		model.addAttribute("loginUser",loginUser);
		if(loginUser == null) {
			return "redirect:/";
		}
		
		//비밀번호 만료 알림
		int result = userService.checkPwExp(loginUser);
		log.info("checkPwExp : "+result);
		if(result>90) {
			model.addAttribute("pwOverExp", "Y");
		}
		
		//후기 조회
		rvo.setUser_no(loginUser.getUser_no());
		int reviewCnt = mypageService.myReviewCnt(rvo);
		model.addAttribute("reviewCnt",reviewCnt);
		List<ReviewVO> myReviewList = mypageService.myReviewList(rvo);
		model.addAttribute("myReviewList",myReviewList);
		
		//관심클래스 조회
		lvo.setUser_no(loginUser.getUser_no());
		int likesCnt = mypageService.myLikesCnt(lvo);
		model.addAttribute("likesCnt",likesCnt);
		List<LikesVO> myLikesList = mypageService.myLikesList(lvo);
		model.addAttribute("myLikesList",myLikesList);
				
		//문의 조회
		qvo.setUser_no(loginUser.getUser_no());
		int qnaCnt = mypageService.myQnaCnt(qvo); 
		model.addAttribute("qnaCnt",qnaCnt);
		List<ClientQnaBoardVO> myQnaList = mypageService.myQnaList(qvo);
		model.addAttribute("myQnaList",myQnaList);
		
		//클래스일지 조회
		postVo.setUser_no(loginUser.getUser_no());
		int postCnt = mypageService.myPostCnt(postVo); 
		model.addAttribute("postCnt",postCnt);
		List<PostVO> myPostList = mypageService.myPostList(postVo);
		model.addAttribute("myPostList",myPostList);
		
		
		/* 웅배 */
		pvo.setUser_no(loginUser.getUser_no());
		pvo.setAmount(5);
		List<Map<String, String>> pvo_paymentList = mypageService.paymentList(pvo);       
        model.addAttribute("pvo_paymentList", pvo_paymentList);
        // 전체 레코드수 구현 (payment)
        int total_payment = mypageService.paymentListCnt(pvo);
        //은아)0407 추가 - 마이페이지 뱃지 추가
        model.addAttribute("paymentCnt",total_payment);
        // 페이징 처리
        model.addAttribute("pageMaker", new PageDTO(pvo, total_payment));
        // 결제내역 이미지 가져오기
        //mypageService.getClassImg(6);
        //System.out.println(mypageService.getClassImg(Integer.parseInt(String.valueOf(pvo_paymentList.get(1).get("r_no")))));
        List<Map<String, String>> classImg = new ArrayList<>();
        for(int i = 0; i < pvo_paymentList.size(); i++) {
        	Map<String, String> doc = mypageService.getClassImg(Integer.parseInt(String.valueOf(pvo_paymentList.get(i).get("r_no"))));
        	classImg.add(doc);
        	//classImg.add(mypageService.getClassImg(Integer.parseInt(String.valueOf(pvo_paymentList.get(i).get("r_no")))));
        }
        System.out.println(classImg);
        model.addAttribute("classImg", classImg);
        
	      
		return "client/mypage/userMypage";
	}

	/************************************************
	 * 2.회원정보 수정화면
	 * 요청 url : http://localhost:8080/mypage/updateForm
	************************************************/
	@GetMapping("/mypage/updateForm")
	public String updateForm(Model model) {
		return "client/mypage/updateForm";
	}
	
	/************************************************
	 * 3.기존비밀번호 확인
	 * 요청 url : http://localhost:8080/checkPw
	************************************************/
	@ResponseBody
	@PostMapping("/checkPw")
	public int checkPw(UserVO vo, Model model) {
		int checkData = userService.checkPw(vo);
		model.addAttribute("checkData",checkData);
		return checkData;
	}
	
	/************************************************
	 * 4.회원정보 수정 처리
	 * 요청 url : http://localhost:8080/mypage/update
	 * @throws MessagingException 
	 * @throws UnsupportedEncodingException 
	************************************************/
	@PostMapping(value ="/mypage/update")
	public String update(@ModelAttribute UserVO vo,Model model){
		UserVO loginUser = (UserVO) model.getAttribute("loginUser");
		LocalDate now = LocalDate.now();
		String today = now.toString();
		String originPw = loginUser.getUser_pw();
		String message ="";
		if(vo != null) { 
			String newPw = vo.getUser_pw();
			loginUser.setUser_name(vo.getUser_name());
			loginUser.setUser_pw(newPw);
			loginUser.setUser_tel(vo.getUser_tel());
			
			if(!originPw.equals(newPw)) {//비밀번호만 수정했을때 수정일자변경
				loginUser.setUser_update(today);
			}
			
			int result = userService.update(loginUser);
			if(result == 1) {
				message = vo.getUser_name()+"님, 새로운 정보로 수정되었습니다.";
				model.addAttribute("loginUser", loginUser);
				model.addAttribute("message", message);
			}else {
				message = "죄송합니다. 잠시후 다시 시도해주세요.";
				model.addAttribute("message", message);
				model.addAttribute("url", "/mypage/updateForm");
			}
		}
		
		return "redirect:/mypage";
	}
	
	/************************************************
	 * 5.프로필사진 수정
	 * 요청 url : http://localhost:8080/mypage/imgUpdate
	 * @throws MessagingException 
	 * @throws UnsupportedEncodingException 
	************************************************/
	@PostMapping(value ="/mypage/imgUpdate")
	public String imgUpdate(@RequestParam("file") MultipartFile file, HttpSession session,Model model)throws Exception{
		
		UserVO loginUser = (UserVO)session.getAttribute("loginUser");
		
		String originImg = loginUser.getUser_img();
		if(file != null) {
			
			//1. 기존 프로필 사진을 서버에서 지운다.
			if(originImg != "default-profile.png") {
				UserFileUpload.fileDelete(originImg);
			}
			
			//2. 새로 등록한 파일
			loginUser.setFile(file);
			
			if(loginUser.getFile().getSize() > 0) {
				String user_img = UserFileUpload.fileUpload(loginUser.getFile(),String.valueOf(loginUser.getUser_no()));
				loginUser.setUser_img(user_img);
			}
			
			mypageService.updateImg(loginUser);
		}else {
			//3. 기본이미지로 변경
			loginUser.setUser_img("default-profile.png");
		}
		
		
		return "redirect:/mypage";
	}
	
	/************************************************
	 * 6.프로필사진 수정 (기본이미지로 변경)
	 * 요청 url : http://localhost:8080/mypage/delImg
	 * @throws MessagingException 
	 * @throws UnsupportedEncodingException 
	************************************************/
	@GetMapping(value ="/mypage/delImg")
	public String delImg(HttpSession session,Model model)throws Exception{
		
		UserVO loginUser = (UserVO)session.getAttribute("loginUser");
		
		String profile = loginUser.getUser_img();
		//1. 기존 프로필 사진을 서버에서 지운다.
		if(profile != "default-profile.png") {
			UserFileUpload.fileDelete(profile);
		}
		loginUser.setUser_img("default-profile.png");
		mypageService.updateImg(loginUser);
		
		return "redirect:/mypage";
	}
	
	
	/************************************************
	 * 7.회원정보 탈퇴 화면
	 * 요청 url : http://localhost:8080/mypage/unregisterForm
	************************************************/
	@PostMapping("/mypage/unregisterForm")
	public String unregisterForm() {
		return "client/mypage/unregisterForm";
	}
	
	/************************************************
	 * 8.회원정보 탈퇴 처리
	 * 요청 url : http://localhost:8080/unregister
	************************************************/
	@PostMapping("/unregister")
	public String unregister(@ModelAttribute UserVO vo,Model model,HttpSession session) {
		
		String message ="";
		int result = userService.unregister(vo);
		
		if(result == 1) {
			message = "탈퇴되었습니다. 그동안 LiClass를 이용해주셔서 감사합니다. 다음에 다시 만나요. ";
			model.addAttribute("loginUser",null);
			session.invalidate();
			model.addAttribute("message", message);
			model.addAttribute("url", "/");
		}else {
			message = "죄송합니다. 잠시후 다시 시도해주세요.";
			model.addAttribute("message", message);
			model.addAttribute("url", "/mypage/unregisterForm");
		}
		return "client/mypage/unregisterForm";
	}
	

	/************************************************
	 * 9.나의 수강내역 조회
	 * 요청 url : http://localhost:8080/courseHistory
	************************************************/
	
	@RequestMapping("/courseHistory")
	public String courseHistory(Model model, PaymentVO pvo,HttpSession session) {
		// 수강내역
		UserVO loginUser = (UserVO)session.getAttribute("loginUser");
		pvo.setUser_no(loginUser.getUser_no());
        List<Map<String, String>> pvo_courseList = mypageService.courseList(pvo);
	    model.addAttribute("pvo_courseList", pvo_courseList);
	    
	    List<Map<String, String>> classImg = new ArrayList<>();
        for(int i = 0; i < pvo_courseList.size(); i++) {
        	Map<String, String> doc = mypageService.getClassImg(Integer.parseInt(String.valueOf(pvo_courseList.get(i).get("r_no"))));
        	classImg.add(doc);
        }
        System.out.println(classImg);
        model.addAttribute("classImg", classImg);
	    
	    
	    return "courseHistory";
	}
	
	/************************************************
	 * 10.나의 관심클래스 삭제
	 * 요청 url : http://localhost:8080/mypage/delLikes
	************************************************/
	@GetMapping("/mypage/delLikes")
	public String delLikes(int c_no,Model model,HttpSession session) {
		UserVO loginUser = (UserVO)session.getAttribute("loginUser");
		LikesVO lvo = new LikesVO();
		lvo.setUser_no(loginUser.getUser_no());
		lvo.setC_no(c_no);
		
		likesService.delLikes(lvo);
		
		return "redirect:/mypage/myLikesHistory";
	}
	
	/************************************************
	 * 11.나의 후기
	 * 요청 url : http://localhost:8080/mypage/myReviewHistory
	************************************************/
	@GetMapping("/mypage/myReviewHistory")
	public String myReviewHistory(ReviewVO rvo,Model model,HttpSession session) {
			
			UserVO loginUser = (UserVO)session.getAttribute("loginUser");
			rvo.setUser_no(loginUser.getUser_no());
			List<ReviewVO> myReviewList = mypageService.myReviewList(rvo);
			model.addAttribute("myReviewList",myReviewList);
		
		return "client/mypage/myReviewHistory";
	}
	
	/************************************************
	 * 12.나의 관심클래스
	 * 요청 url : http://localhost:8080/mypage/myLikesHistory
	************************************************/
	@GetMapping("/mypage/myLikesHistory")
	public String myLikesHistory(LikesVO lvo,Model model,HttpSession session) {
			
			UserVO loginUser = (UserVO)session.getAttribute("loginUser");
			lvo.setUser_no(loginUser.getUser_no());
			
			List<LikesVO> myLikesList = mypageService.myLikesList(lvo);
			model.addAttribute("myLikesList",myLikesList);
			
		return "client/mypage/myLikesHistory";
	}
	
	
	/************************************************
	 * 13.나의 문의
	 * 요청 url : http://localhost:8080/mypage/myQnAHistory
	************************************************/
	@GetMapping("/mypage/myQnAHistory")
	public String myQnAHistory(ClientQnaBoardVO qvo,Model model,HttpSession session) {
			
		    UserVO loginUser = (UserVO)session.getAttribute("loginUser");
		    qvo.setUser_no(loginUser.getUser_no());
			List<ClientQnaBoardVO> myQnaList = mypageService.myQnaList(qvo);
			model.addAttribute("myQnaList",myQnaList);
			
		return "client/mypage/myQnAHistory";
	}
	
	/************************************************
	 * 14.나의 문의 답변 조회
	 * 요청 url : http://localhost:8080/mypage/myQnAHistory
	************************************************/
	@ResponseBody
	@GetMapping("/myQnaAnswer")
	public int myQnaAnswer(ClientQnaBoardVO qvo,Model model,HttpSession session) {
			
			UserVO loginUser = (UserVO)session.getAttribute("loginUser");
		    qvo.setUser_no(loginUser.getUser_no());
			ClientQnaBoardVO myQnaAnswer = mypageService.myQnaAnswer(qvo);
			
		return myQnaAnswer.getQna_no();
	}
	
	/************************************************
	 * 14.나의 클래스일지
	 * 요청 url : http://localhost:8080/mypage/myPost
	************************************************/
	@GetMapping("/mypage/myPost")
	public String myPost(PostVO postVo,Model model,HttpSession session) {
		
		UserVO loginUser = (UserVO)session.getAttribute("loginUser");
		postVo.setUser_no(loginUser.getUser_no());
		List<PostVO> myPostList = mypageService.myPostList(postVo);
		model.addAttribute("myPostList",myPostList);
		return "client/mypage/myPost";
	}
	
	/************************************************
	 * 15.클래스 일지 입력화면
	 * 요청 url : http://localhost:8080/mypage/postingForm
	************************************************/
	@GetMapping("/mypage/posting")
	public String postingForm(Model model,HttpSession session) {
		UserVO loginUser = (UserVO)session.getAttribute("loginUser");
		if(loginUser == null) {
			return "/";
		}
		return "client/mypage/postingForm";
	}
}
