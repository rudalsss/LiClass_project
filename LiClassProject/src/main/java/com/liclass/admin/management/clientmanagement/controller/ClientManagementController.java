package com.liclass.admin.management.clientmanagement.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.liclass.admin.management.clientmanagement.service.ClientManagementService;
import com.liclass.client.login.vo.UserVO;
import com.liclass.common.vo.PageDTO;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/clientmanagement/*")
@AllArgsConstructor
@Slf4j
public class ClientManagementController {
	
	@Setter(onMethod_ = @Autowired)
	private ClientManagementService clientManagementService;
	
	@RequestMapping("/clientList") 
	public String clientList(Model model, @ModelAttribute("data") UserVO uservo) {
		log.info("clientList() 메소드 호출 성공");
		
		List<UserVO> userVO = clientManagementService.clientList(uservo);
		model.addAttribute("userVO", userVO);
		
		// 전체 레코드수 구현
		int total = clientManagementService.clientListCnt(uservo);
		// 페이징 처리
		model.addAttribute("pageMaker", new PageDTO(uservo, total));
		
		return "admin/management/clientManagement/clientList"; 
	}
	
	@RequestMapping("/outClient")
	public String outClient(long user_no,RedirectAttributes ras) {
		log.info("outClient() 메소드 호출 성공");
		clientManagementService.outClient(user_no);
		
		return "redirect:/clientmanagement/clientList";
	}
	
	@ResponseBody
	@PostMapping("/deleteDB")
	public int deleteDB(long user_no) {
		int result = clientManagementService.deleteDB(user_no);
		
		return result;
	}
}
