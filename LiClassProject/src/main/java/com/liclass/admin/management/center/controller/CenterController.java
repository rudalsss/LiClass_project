package com.liclass.admin.management.center.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.liclass.admin.management.center.service.CenterService;
import com.liclass.admin.management.center.vo.CenterVO;
import com.liclass.common.vo.PageDTO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/management/center/*")
public class CenterController {
	
	@Setter(onMethod_ = @Autowired)
	private CenterService centerService;
	
	//	글목록 구현하기(페이징 처리부분 제외 목록 조회)
	// 요청URL : http://localhost:8080/center/centerList
	@RequestMapping(value="/centerList", method = RequestMethod.GET)
	//@GetMapping("/centerList")
	public String centerList(@ModelAttribute CenterVO cvo, Model model) {
		log.info("centerList 호출 성공");
		// 전체 레코드 조회
		List<CenterVO> centerList = centerService.centerList(cvo);                                                                                                                                                          
		model.addAttribute("centerList", centerList);
		
		// 전체 레코드수 구현
		int total = centerService.centerListCnt(cvo);
		// 페이징 처리
		model.addAttribute("pageMaker", new PageDTO(cvo, total));
		
		return "admin/management/center/centerList"; // /WEB-INF/views/admin/center/centerList.jsp
	}
	
	
	// 글쓰기 폼 출력하기
	@RequestMapping(value="/writeForm")
	public String writeForm() {
		log.info("writeForm 호출 성공");
		return "admin/management/center/writeForm"; //WEB-INF/views/admin/center/writeForm.jsp
	}
	
	
	// 글쓰기 구현하기
	@RequestMapping(value="/centerInsert", method = RequestMethod.POST)
	public String centerInsert(@ModelAttribute CenterVO cvo, Model model) throws Exception {
		log.info("centerInsert 호출 성공");
			
		int result = 0;
		String url = "";
			
		result = centerService.centerInsert(cvo);
		if(result == 1) {
			url = "/management/center/centerList";
		} else {
			url = "/management/center/writeForm";
		}
		return "redirect:"+url;
	}
		
	
	// 글 상세보기 구현
	@RequestMapping(value="/centerDetail", method = RequestMethod.GET)
	public String centerDetail(@ModelAttribute CenterVO cvo, Model model) {
		log.info("centerDetail 호출 성공");
		//log.info("cvo = " + cvo);
			
		CenterVO detail = centerService.centerDetail2(cvo);/* 0328은아 admin-center.xml과 겹쳐서 수정합니다. */
		model.addAttribute("detail", detail);
			
		return "admin/management/center/centerDetail";
	}
		
	
	// 글수정 폼 출력하기
	// @param  : ct_bizno
	// @return : CenterVO
	@RequestMapping(value="/updateForm")
	public String updateForm(@ModelAttribute CenterVO cvo, Model model) {
		log.info("updateForm 호출 성공");
		log.info("ct_bizno = " + cvo.getCt_bizno());
			
		CenterVO updateData = centerService.updateForm(cvo);
			
		model.addAttribute("updateData", updateData);
			
		return "admin/management/center/updateForm"; //WEB-INF/views/admin/center/updateForm.jsp
	}
	
	// 글수정 구현하기
	// @param : CenterVO
	//* 참고 : RedirectAttributes 객체는 리다이렉트 시점(return "redirect:/경로")에 
	// * 한번만 사용되는 데이터를 전송할 수 있는 addFlashAttribute()라는 기능을 지원한다. 
	// * addFlashAttribute() 메서드는 브라우저까지 전송되기는 하지만, URI상에는 보이지 않는 숨겨진 데이터의 형태로 전달된다.

	@RequestMapping(value="/centerUpdate", method = RequestMethod.POST)
	public String centerUpdate(@ModelAttribute CenterVO cvo/*, RedirectAttributes ras*/)throws Exception {
		log.info("centerUpdate 호출 성공");
		log.info("CenterVO" + cvo);
		
		int result = 0;
		String url = "";
			
		result = centerService.centerUpdate(cvo);
		//ras.addFlashAttribute("centerVO" ,cvo);
			
		if(result == 1) {
			//아래 url은 수정 후 상세 페이지로 이동
			url = "/management/center/centerDetail?Ct_bizno="+cvo.getCt_bizno();
			//url = "/board/boardDetail";
		} else {
			url = "/management/center/updateForm?Ct_bizno="+cvo.getCt_bizno();
			//url = "board/updateForm";
		}
			
		return "redirect:"+url;
	}
		
	//글삭제 구현하기
	@RequestMapping(value="/centerDelete")
	public String centerDelete(@ModelAttribute CenterVO cvo) throws Exception{
		log.info("centerDelete 호출 성공");
			
		//아래 변수에는 입력 성공에 대한 상태값 담습니다.(1 or 0)
		int result = 0;
		String url = "";
			
		//result = centerService.centerDelete(cvo.getCt_bizno());
		result = centerService.centerDelete(cvo);
			
		if(result == 1) {
			url = "/management/center/centerList";
		} else {
			url = "/management/center/centerDetail?Ct_bizno="+cvo.getCt_bizno();
		}
			
		return "redirect:"+url;
			
	}
	
	//클래스 관리에서 이용하는 센터리스트(이경민 추가)
	@ResponseBody
	@GetMapping( value="/centerlist2", produces = "application/json;charset=utf-8" )
	public List<CenterVO> centerlist2(){
		log.info("단순 센터 나열");
		List<CenterVO> list = null;
		list = centerService.centerlist2();
		return list;
	}
	
	
	
}
