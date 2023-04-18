package com.liclass.admin.episode.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.liclass.admin.episode.service.EpisodeService;
import com.liclass.admin.episode.vo.EpisodeVO;
import com.liclass.client.login.vo.UserVO;
import com.liclass.client.payment.service.PaymentService;
import com.liclass.client.payment.vo.PaymentVO;
import com.liclass.client.payment.vo.RefundVO;
import com.liclass.client.reserve.service.ReserveService;
import com.liclass.client.reserve.vo.ReserveVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/admin/*")
@Slf4j
public class EpisodeController {
	
	@Setter(onMethod_=@Autowired )
	private EpisodeService episodeService;
	@Setter(onMethod_=@Autowired )
	private ReserveService reserveService;
	@Setter(onMethod_=@Autowired )
	private PaymentService paymentService;
	
	@ResponseBody
	@GetMapping( value="/episode/episodeList", produces = MediaType.APPLICATION_JSON_VALUE /*produces = "application/json;charset=utf-8"*/  )
	public List<EpisodeVO> episodeList( @RequestParam int c_no){
		log.info("episodeList 호출...");
		List<EpisodeVO> list = null;
		list = episodeService.epList(c_no);
		return list;
	}
	
	@GetMapping("/episode/writeForm")
	public String wirteForm( @ModelAttribute EpisodeVO vo  ) {
		log.info("회차등록폼 호출");
		return "admin/episode/episodeForm";
	}
	
	@PostMapping("/episode/insertEpisode")
	public String insertEpisode( @ModelAttribute EpisodeVO vo ) {
		log.info("회차등록합니다..");
		int result = episodeService.epInsert(vo);
		if(result==1) {
			return "redirect:/admin/class/classDetail?c_no="+vo.getC_no();
		} else {
			return "redirect:/admin/episode/writeForm?c_no="+vo.getC_no();
		}
	}
	
	@ResponseBody
	@PostMapping( value="/episode/dateChk", produces = "text/plain;charset=utf-8")
	public String dateChk( @ModelAttribute EpisodeVO vo ) {
		log.info("중복 시간대 확인합니다...");
		int result = episodeService.chkDate(vo);
		return (result==1) ? "중복발생" : "중복없음";
		}
	
	@PostMapping("/episode/deleteEpisode")
	public String deleteEpisode(@ModelAttribute EpisodeVO evo) {
		log.info("삭제합니다...");
		/*
		int result = episodeService.epDelete(vo.getEp_no());
		if(result==1) {
			return "redirect:/admin/class/classDetail?c_no="+vo.getC_no();
		} else {
			return "redirect:/admin/class/classDetail?c_no="+vo.getC_no();
		}
		*/
		int result = episodeService.epDel(evo.getEp_no()); //ep상태값 삭제로 변경
		if(result==1) { 																			//삭제로 상태값이 변경되면
			List<ReserveVO>list = reserveService.reservListSelect(evo.getEp_no()); //관련 예약내역을 받아온다.
			int refund_status = 4; 	//강제환불상태 값
			int refundresult; 	    //환불성공여부
			if(list.size()>0) {				//1개이상의 예약내역이 존재한다면
				for( ReserveVO rvo : list ) {
					reserveService.reservWithdraw(rvo.getR_no()); 														//예약상태바꾸기
					PaymentVO pvo = paymentService.getWithdrawPay(rvo.getR_no()); 				//예약의 결제데이터가져오기
					refundresult = paymentService.payCencel( pvo.getMerchant_uid(), pvo.getPay_price() ); //환불처리하기
					paymentService.updWithdrawPay(pvo); //결제상태바꾸기
					RefundVO refundVO = new RefundVO(); //환불데이터의 생성
					refundVO.setMerchant_uid(pvo.getMerchant_uid());
				    refundVO.setRefund_method(pvo.getPay_method());
				    refundVO.setRefund_price(pvo.getPay_price());
				    refundVO.setUser_no(pvo.getUser_no());
					if(refundresult==0) {
					    refundVO.setRefund_status(refund_status); 
					    int a = paymentService.insertRefund(refundVO); //성공 환불데이터 입력하기
					    paymentService.changePoint2(pvo); //환불에 이용한 포인트 반환
					    System.out.print(a+"개의 성공 환불데이터가 저장됨");
					} else {
					    refund_status = 1;
					    refundVO.setRefund_status(refund_status);
					    int a = paymentService.insertRefund(refundVO); //실패 환불데이터 입력하기
					    System.out.print(a+"개의 실패 환불데이터가 저장됨");
					}
				}
			}
			return "redirect:/admin/class/classDetail?c_no="+evo.getC_no();
		} else {
			return "redirect:/admin/class/classDetail?c_no="+evo.getC_no();
		}
	}
	
	@ResponseBody
	@GetMapping( value="/episode/countEpisode", produces = "text/plain;charset=utf-8" )
	public String countEpisode( @RequestParam int c_no ) {
		log.info("숫자셉니다..");
		int cnt = episodeService.epCnt(c_no);
		return (cnt>=1) ? "회차존재" : "회차없음";
	}
	
	/***************************예약화면에서 불러올 회차정보들**************************/
	@GetMapping("/episode/goReserve")
	public String goReserve( @RequestParam int c_no, HttpSession session, Model model ) {
		log.info("예약페이지로 넘어갑니다...");
		UserVO loginUser = (UserVO)session.getAttribute("loginUser");
	    model.addAttribute("loginUser",loginUser);
		return "reserve/reserve";
	}
	//클래스 디테일 controller에서 만들것임..
	
	@ResponseBody
	@GetMapping( value="/episode/epDateList", produces = "application/json;charset=utf-8" )
	public String[] epDateList( @RequestParam int c_no ) {
		log.info("클래스에서회차가 있는 날짜를 가져옵니다..");
		String[] epDateList = episodeService.epDateList(c_no);
		return epDateList;
	}
	
	@ResponseBody
	@PostMapping( value="/episode/epListOfDay", produces = "application/json;charset=utf-8" )
	public List<EpisodeVO> epListOfDay( @ModelAttribute EpisodeVO vo ){ //회차번호, 날짜를 가진 ep
		log.info("클래스에서 해당날짜의 회차리스트를 가져옵니다..");
		List<EpisodeVO> epDateList = episodeService.epInfo(vo);
		return epDateList;
	}
	
	@ResponseBody
	@GetMapping( value="/episode/epReserve", produces = "application/json;charset=utf-8" )
	public EpisodeVO epReserve( @RequestParam int ep_no ) {
		log.info("예약을 위한 회차정보를 불러옵니다..");
		EpisodeVO ep = episodeService.reservInfo(ep_no);
		return ep;
	}
	
}
	

