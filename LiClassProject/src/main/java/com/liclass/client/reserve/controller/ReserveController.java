package com.liclass.client.reserve.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.liclass.admin.episode.service.EpisodeService;
import com.liclass.client.login.vo.UserVO;
import com.liclass.client.payment.service.PaymentService;
import com.liclass.client.reserve.service.ReserveService;
import com.liclass.client.reserve.vo.ReserveVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/client/*")
@Slf4j
public class ReserveController {
	
	@Setter(onMethod_=@Autowired)
	private ReserveService reserveService;
	
	@Setter(onMethod_=@Autowired)
	private PaymentService paymentService;
	
	@Setter(onMethod_=@Autowired )
	private EpisodeService episodeService;
	
	@PostMapping("/reserve/makeReserve")
	public String makeReserve( @ModelAttribute ReserveVO rvo,@RequestParam(required = false, defaultValue = "0") int usepoint, 
								RedirectAttributes ras, Model model ) {
		log.info("예약시작합니다...");
		log.info("넘어온 포인트 = "+usepoint);
		int result = reserveService.reservInsert(rvo); 
		log.info(result+"라네..");
		if(result==1) {
			log.info("예약성공");
			ReserveVO reserve = reserveService.reservSelect(rvo.getR_no());
			UserVO uvo = paymentService.getUserInfo(reserve.getUser_no());
			model.addAttribute("uvo", uvo);
			model.addAttribute("rvo", reserve);
			model.addAttribute("usepoint", usepoint);
			return "payment"; //결제 화면
		} else {
			log.info("예약실패");
			ras.addFlashAttribute("errorMsg", "예약실패");
			return "redirect:/class/classDetail";
		}
	}
	
}
