package com.liclass.admin.management.studio.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.liclass.admin.management.center.vo.CenterVO;
import com.liclass.admin.management.studio.service.StudioService;
import com.liclass.admin.management.studio.vo.StudioVO;
import com.liclass.common.vo.PageDTO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/management/studio/*")
@Slf4j
public class StudioController {
	@Setter(onMethod_ = @Autowired)
	private StudioService studioService;
	
//	글목록 구현하기(페이징 처리부분 제외 목록 조회)
	// 요청URL : http://localhost:8080/admin/studio/studioList
	@RequestMapping(value="/studioList", method = RequestMethod.GET)
	//@GetMapping("/studioList")
	public String studioList(@ModelAttribute StudioVO svo, Model model) {
		log.info("studioList 호출 성공");
		// 전체 레코드 조회
		List<StudioVO> studioList = studioService.studioList(svo);                                                                                                                                                          
		model.addAttribute("studioList", studioList);
		
		// 전체 레코드수 구현
		int total = studioService.studioListCnt(svo);
		// 페이징 처리
		model.addAttribute("pageMaker", new PageDTO(svo, total));
		
		return "admin/management/studio/studioList"; // /WEB-INF/views/admin/studio/studioList.jsp
	}
	
	// 글쓰기 폼 출력하기
	@RequestMapping(value="/writeForm")
	public String writeForm(Model model) {
		log.info("writeForm 호출 성공");
		List<CenterVO> centerNameList = studioService.centerNameList();
		model.addAttribute("centerNameList" ,centerNameList);
		return "admin/management/studio/writeForm"; //WEB-INF/views/admin/studio/writeForm.jsp
	}
	
	// 글쓰기 구현하기
	@RequestMapping(value="/studioInsert", method = RequestMethod.POST)
	public String studioInsert(@ModelAttribute StudioVO svo, Model model) throws Exception {
		log.info("studioInsert 호출 성공");
		
		int result = 0;
		String url = "";
		
		result = studioService.studioInsert(svo);
		if(result == 1) {
			url = "/management/studio/studioList";
		} else {
			url = "/management/studio/writeForm";
		}
		return "redirect:"+url;
	}
	
	// 글 상세보기 구현
	@RequestMapping(value="/studioDetail", method = RequestMethod.GET)
	public String studioDetail(@ModelAttribute StudioVO svo, Model model) {
		log.info("studioDetail 호출 성공");
		//log.info("svo = " + svo);
		
		StudioVO detail = studioService.studioDetail(svo);
		model.addAttribute("detail", detail);
		
		return "admin/management/studio/studioDetail";
	}
	
	
	// 글수정 폼 출력하기
		// @param  : s_no
		// @return : StudioVO
		@RequestMapping(value="/updateForm")
		public String updateForm(@ModelAttribute StudioVO svo, Model model) {
			log.info("updateForm 호출 성공");
			log.info("s_no = " + svo.getS_no());
			
			StudioVO updateData = studioService.updateForm(svo);
			model.addAttribute("updateData", updateData);
			List<CenterVO> centerNameList = studioService.centerNameList();
			model.addAttribute("centerNameList" ,centerNameList);
			
			return "admin/management/studio/updateForm"; //WEB-INF/views/admin/studio/updateForm.jsp
		}
		
		// 글수정 구현하기
		// @param : StudioVO
		//* 참고 : RedirectAttributes 객체는 리다이렉트 시점(return "redirect:/경로")에 
		// * 한번만 사용되는 데이터를 전송할 수 있는 addFlashAttribute()라는 기능을 지원한다. 
		// * addFlashAttribute() 메서드는 브라우저까지 전송되기는 하지만, URI상에는 보이지 않는 숨겨진 데이터의 형태로 전달된다.

		@RequestMapping(value="/studioUpdate", method = RequestMethod.POST)
		public String studioUpdate(@ModelAttribute StudioVO svo/*, RedirectAttributes ras*/)throws Exception {
			log.info("studioUpdate 호출 성공");
			log.info("StudioVO" + svo);
			
			int result = 0;
			String url = "";
			
			result = studioService.studioUpdate(svo);
			//ras.addFlashAttribute("studioVO" ,svo);
			
			if(result == 1) {
				//아래 url은 수정 후 상세 페이지로 이동
				url = "/management/studio/studioDetail?s_no="+svo.getS_no();
				//url = "/studio/studioDetail";
			} else {
				url = "/management/studio/updateForm?s_no="+svo.getS_no();
				//url = "/studio/updateForm";
			}
			
			return "redirect:"+url;
		}
		
		//글삭제 구현하기
		@RequestMapping(value="/studioDelete")
		public String studioDelete(@ModelAttribute StudioVO svo) throws Exception{
			log.info("studioDelete 호출 성공");
			
			//아래 변수에는 입력 성공에 대한 상태값 담습니다.(1 or 0)
			int result = 0;
			String url = "";
			
			//result = studioService.studioDelete(svo.getS_no());
			result = studioService.studioDelete(svo);
			
			if(result == 1) {
				url = "/management/studio/studioList";
			} else {
				url = "/management/studio/studioDetail?s_no="+svo.getS_no();
			}
			
			return "redirect:"+url;
			
		}

}
