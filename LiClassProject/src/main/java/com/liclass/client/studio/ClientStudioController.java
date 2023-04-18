package com.liclass.client.studio;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.liclass.admin.management.studio.service.StudioService;
import com.liclass.admin.management.studio.vo.StudioVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/studio/*")
@Slf4j
public class ClientStudioController {
	@Setter(onMethod_ = @Autowired)
	private StudioService studioService;
	
	/*
	 * // 글목록 구현하기(페이징 처리부분 제외 목록 조회) // 요청URL :
	 * http://localhost:8080/client/studio/studioList2
	 * 
	 * @RequestMapping(value="/studioList", method = RequestMethod.GET)
	 * //@GetMapping("/studioList") public String studioList(@ModelAttribute
	 * StudioVO svo, Model model) { log.info("studioList 호출 성공"); // 전체 레코드 조회
	 * List<StudioVO> studioList = studioService.studioList(svo);
	 * model.addAttribute("studioList", studioList);
	 * 
	 * // 전체 레코드수 구현 int total = studioService.studioListCnt(svo); // 페이징 처리
	 * model.addAttribute("pageMaker", new PageDTO(svo, total));
	 * 
	 * return "studio/studioList"; // /WEB-INF/views/client/studio/studioList.jsp }
	 */
	
	
	
	@GetMapping("/studioList")
	public String studioList(@ModelAttribute StudioVO svo, Model model) {
		log.info("studioList 호출 성공");
		// 전체 레코드 조회
		List<StudioVO> studioList = studioService.clientStudioList(svo);                                                                                                                                                          
		model.addAttribute("studioList", studioList);
		
		return "studio/studioList"; // /WEB-INF/views/client/studio/studioList.jsp
	}
	
	
	
	// 글 상세보기 구현
	// 요청URL : http://localhost:8080/client/studio/studioDetail2
	@RequestMapping(value="/studioDetail", method = RequestMethod.GET)
	public String studioDetail(@ModelAttribute StudioVO svo, Model model) {
		log.info("studioDetail 호출 성공");
		//log.info("svo = " + svo);
		
		StudioVO detail = studioService.studioDetail(svo);
		model.addAttribute("detail", detail);
		
		return "studio/studioDetail";
	}
	

}