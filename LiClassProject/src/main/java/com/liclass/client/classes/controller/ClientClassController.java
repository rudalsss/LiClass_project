package com.liclass.client.classes.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.ResponseBody;

import com.liclass.admin.management.center.service.CenterService;
import com.liclass.admin.management.center.vo.CenterVO;
import com.liclass.client.classes.service.ClientClassImgService;
import com.liclass.client.classes.service.ClientClassService;
import com.liclass.client.classes.vo.ClientClassImgVO;
import com.liclass.client.classes.vo.ClientClassVO;
import com.liclass.client.likes.service.LikesService;
import com.liclass.client.likes.vo.LikesVO;
import com.liclass.client.login.vo.UserVO;
import com.liclass.client.payment.service.PaymentService;
import com.liclass.client.review.service.ReviewService;
import com.liclass.client.review.vo.ReviewVO;
import com.liclass.common.vo.PageDTO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class ClientClassController { //은아,지민,경민
	
	@Setter(onMethod_ = @Autowired)
	private ClientClassService clientClassService;
	@Setter(onMethod_ = @Autowired)
	private ClientClassImgService clientClassImgService;
	@Setter(onMethod_ = @Autowired)
	private CenterService centerService;
	@Setter(onMethod_ = @Autowired)
	private LikesService likesService;
	@Setter(onMethod_ = @Autowired)
	private ReviewService reviewService;
	@Setter(onMethod_ = @Autowired)
	private PaymentService paymentService;
	
	/************************************************
	 * 클래스 전체조회
	 * 요청 url : http://localhost:8080/class/classList
	*************************************************/
	@GetMapping("/class/classList")
	public String classList(Model model) {
		List<ClientClassVO> classList =clientClassService.clientClassList();
		model.addAttribute("classList",classList);
		return "class/classList";
	}
	
	/************************************************
	 * 클래스 상세조회
	 * 요청 url : http://localhost:8080/class/classList
	 * @throws Exception 
	*************************************************/
	@GetMapping("/class/classDetail")
	public String classDetail(int c_no,Model model,HttpSession session, @ModelAttribute ReviewVO vo) throws Exception {
		ClientClassVO cvo = new ClientClassVO();
		cvo.setC_no(c_no);
		
		//로그인 계정
		UserVO loginUser = (UserVO)session.getAttribute("loginUser");
		model.addAttribute("loginUser",loginUser);
		
		//클래스 관심클래스 유무
		if(loginUser != null) {
			LikesVO lvo = new LikesVO();
			lvo.setUser_no(loginUser.getUser_no());
			lvo.setC_no(c_no);
			int checkResult = likesService.checkLikes(lvo);
			model.addAttribute("checkResult",checkResult);
			model.addAttribute("lvo",lvo);
		}
		
		//클래스 상세정보
		ClientClassVO clientClassDetail =  clientClassService.clientClassDetail(cvo);
		model.addAttribute("clientClassDetail",clientClassDetail);

		//클래스 전체이미지
		List<ClientClassImgVO> list = clientClassImgService.getImgs(c_no);
		model.addAttribute("imgList", list);
		
		//해당 클래스의 센터 상세정보
		CenterVO clientCenterDetail = centerService.clientCenterDetail(clientClassDetail.getCt_bizno());
		model.addAttribute("clientCenterDetail", clientCenterDetail);
		
		/** 후기 관련 코드 */
		// 전체 레코드 조회
		List<ReviewVO> reviewList = reviewService.reviewList(vo);
		model.addAttribute("reviewList" , reviewList);
		
		// 전체 레코드 수 구현
		int total = reviewService.reviewListCnt(vo);
		PageDTO test = new PageDTO(vo, total);
		// 페이징 처리
		model.addAttribute("pageMaker" ,test );
		log.info("test1 : "+test.getEndPage());
		log.info("test2 : "+ total);
		
		if(loginUser != null) {
			UserVO uservo = paymentService.getUserInfo(loginUser.getUser_no());
			model.addAttribute("uservo", uservo);
		}
		
		// vo.c_no 로 변경해주기
		double ratingAvg = reviewService.setRating(vo.getC_no());
		HashMap<String,Integer> tongRating = reviewService.tongRating(vo);

		
		model.addAttribute("tongRating", tongRating);
		model.addAttribute("ratingAvg", ratingAvg);
		
	
		return "class/classDetail";
	}
	
	/************************************************
	 * 클래스 대표사진 
	 * 요청 url : http://localhost:8080/class/getClassImg
	*************************************************/
	@ResponseBody
	@GetMapping("/class/getClassImg")
	public String getClassImg(ClientClassVO cvo) {

		//클래스 상세정보
		ClientClassVO recentClass = clientClassService.clientClassDetail(cvo);
		String c_img_file = recentClass.getC_img_file();
		
		return c_img_file;
	}
}
