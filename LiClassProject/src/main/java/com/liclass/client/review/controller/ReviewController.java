package com.liclass.client.review.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.liclass.client.review.service.ReviewService;
import com.liclass.client.review.vo.ReviewVO;
import com.liclass.common.vo.PageDTO;

import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
public class ReviewController {
	
	@Setter(onMethod_ = @Autowired)
	private ReviewService reviewService;

	/*******************************************
	 * 후기 목록 구현하기(페이징 처리 부분과 검색 제외 목록 조회)
	 * 요청 URL : http://localhost:8080/review/reviewList
	 * @throws Exception 
	 *******************************************/
	@RequestMapping(value = "/reviewList" , method = RequestMethod.GET)
	// @GetMapping("/boardList")
	public String reviewList(@ModelAttribute ReviewVO vo , Model model) throws Exception {
		log.info("reviewList 호출 성공");
		
		// 전체 레코드 조회
		List<ReviewVO> reviewList = reviewService.reviewList(vo);
		model.addAttribute("reviewList" , reviewList);
		
		
		// 전체 레코드 수 구현
		int total = reviewService.reviewListCnt(vo);
		// 페이징 처리
		model.addAttribute("pageMaker" , new PageDTO(vo, total));
		
		// vo.c_no 로 변경해주기
		double ratingAvg = reviewService.setRating(vo.getC_no());
		
		model.addAttribute("ratingAvg", ratingAvg);
		
		return "class/classDetail?c_no" + vo.getC_no();
		
	}
	
	
	
	/*******************************************
	 * 글쓰기 폼 출력하기
	 
	  @RequestMapping(value="/r_writeForm") public String r_writeForm() {
	  log.info("r_writeForm 호출 성공");
	  
	  return "review/r_writeForm"; }
	 *******************************************/
	
	/*******************************************
	 * 글쓰기 구현하기
	 * @throws Exception 
	 *******************************************/
	@PostMapping(value="/reviewInsert")
	//@PostMapping("/boardInsert")
	public String reviewInsert(@ModelAttribute ReviewVO vo,@RequestParam int cno,
			@RequestParam int rno, @RequestParam long userno,
			Model model) throws Exception {
		
		vo.setC_no(cno);
		vo.setR_no(rno);
		vo.setUser_no(userno);
		
		int result = 0;
		String url = "";
		
		result = reviewService.reviewInsert(vo);
		if(result == 1) {
			reviewService.changeReviewStatus(rno);
			url = "/courseHistory";
		} 
		return "redirect:" + url;
		
	}
	
	/********************************************
	* 글 상세보기 구현
	 * @throws Exception 
	*******************************************/
	@ResponseBody
	@PostMapping(value = "/reviewDetail" , produces=MediaType.APPLICATION_JSON_VALUE)
	public Map<String, Object> reviewDetail(@ModelAttribute ReviewVO vo , Model model) throws Exception {
		log.info("reviewDetail 호출 성공.................................................");
		
		System.out.println("datailvo="+vo);
		ReviewVO detail = reviewService.reviewDetail(vo);
		model.addAttribute("detail" , detail);
		log.info("detail : " + detail);
		
		String img = reviewService.reviewImg(vo.getR_no());
		System.out.println(img);
		model.addAttribute("img",img);
		Map<String, Object> data = new HashMap<>() ;
		data.put("review_content", detail.getReview_content());
		data.put("review_title", detail.getReview_title());
		data.put("review_rating", detail.getReview_rating());
		data.put("review_recommend", detail.getReview_recommend());
		data.put("review_no", detail.getReview_no());
		data.put("r_no", detail.getR_no());
		data.put("img", img);
		
		
		
		return data;
	}
	
	
	/*******************************************
	 * 글 수정 폼 출력하기
	 * @throws Exception 
		 *******************************************/	
	@ResponseBody
	@PostMapping(value = "/r_updateForm" , produces=MediaType.APPLICATION_JSON_VALUE)
	public Map<String, Object> r_updateForm(@ModelAttribute ReviewVO vo, Model model) throws Exception {
		ReviewVO updateData = reviewService.updateFormToRno(vo);
		model.addAttribute("updateData",updateData);

		
		String img = reviewService.reviewImg(vo.getR_no());
		
		model.addAttribute("img",img);
		Map<String, Object> data = new HashMap<>() ;
		data.put("review_content", updateData.getReview_content());
		data.put("review_title", updateData.getReview_title());
		data.put("review_rating", updateData.getReview_rating());
		data.put("review_recommend", updateData.getReview_recommend());
		data.put("review_no", updateData.getReview_no());
		data.put("r_no", updateData.getR_no());
		data.put("img", img);
		
		return data;	// /WEB-INF/views/review/r_updateForm.jsp 를 의미
	}

	

	
	
	/*******************************************
	 * 글 수정 구현하기
	 * 참고 : RedirectAttributes 객체는 리다이렉트 시점 (return "redirect:/경로")에
	 * 한 번만 사용되는 데이터를 전송할 수 있는 addFlashAttribute() 라는 기능을 지원한다.
	 * addFlashAttribute() 메서드는 브라우저까지 전송되기는 하지만, URL 상에는 보이지 않는 숨겨진 데이터의 형태로 전달된다.
	 ********************************************/
	@PostMapping(value = "/reviewUpdate")
	public String reviewUpdate(@ModelAttribute ReviewVO vo) throws Exception {
		log.info("reivewUpdate 기능호출 성공");
		log.info("reviewVO : " + vo);
		
		int result = 0;
		String url = "";
		
		result = reviewService.reviewUpdate(vo);
		
		// 업데이트 성공 시 이동할 페이지
		if(result == 1) {
			/*url = "/courseHistory?r_no=" + vo.getR_no();*/
			url = "/courseHistory";
			log.info("review url ::::::::::::::::::::::::; " + url);
		// 업데이트 실패 시 이동할 페이지(수정하자)
		} else {
			log.info("실패시 url : " + url);
			url =  "/r_updateForm?r_no="+vo.getR_no();

			log.info("업데이트 실패::::::::::::::::::::::::::::::::;;");

			
		
		} 

		return "redirect:"+ url;
	}

	
	/*******************************************
	 * 글 삭제 구현하기
	 *******************************************/
	@RequestMapping(value = "/reviewDelete")
	public String reviewDelete(@ModelAttribute ReviewVO vo) throws Exception{
		log.info("revieDelete 호출 성공");
		log.info("삭제할 후기글 번호: " + vo.getR_no());
		
		//아래 변수에는 입력 성공에 대한 상태값 담습니다.(1 or 0)
		int result = 0;
		String url = "";
		

		//result = boardService.boardDelete(bvo.getB_num());
		result = reviewService.reviewDelete(vo);
		if(result == 1){
			log.info("삭제성공");
			reviewService.changeReviewStatus2(vo.getR_no());
			url="/courseHistory?review_no=" + vo.getReview_no();
			
		}else{
			log.info("삭제실패");
			url="/courseHistory";
			
		}
		return "redirect:"+url;
	}
	
	
	
	
	
	
	
}
