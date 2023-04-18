package com.liclass.client.likes.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.liclass.client.classes.service.ClientClassService;
import com.liclass.client.likes.service.LikesService;
import com.liclass.client.likes.vo.LikesVO;

import lombok.Setter;

@Controller
public class LikesController { //은아
	
	@Setter(onMethod_ = @Autowired)
	private LikesService likesService;
	@Setter(onMethod_ = @Autowired)
	private ClientClassService clientClassService;
	
	/************************************************
	 * 1.관심클래스 유무 확인
	 * 요청 url : http://localhost:8080/like
	************************************************/
	@ResponseBody
	@PostMapping("/like")
	public int like(long user_no,int c_no) {
		int checkResult = 0;
		if(user_no != 0) {
			LikesVO vo = new LikesVO();
			vo.setUser_no(user_no);
			vo.setC_no(c_no);
			checkResult = likesService.checkLikes(vo);
		}
		return checkResult;
	}
	
	/************************************************
	 * 2.관심클래스 추가 처리
	 * 요청 url : http://localhost:8080/addLikes
	************************************************/
	@ResponseBody
	@PostMapping("/addLikes")
	public int addLikes(int c_no,String user_no,HttpSession session) {
		long userno = Long.parseLong(user_no);
		LikesVO lvo = new LikesVO();
		lvo.setC_no(c_no);
		lvo.setUser_no(userno);
		int result = likesService.addLikes(lvo);
		// 0: 입력실패 1 : 입력성공
		return result;
	}
	
	/************************************************
	 * 3.관심클래스 삭제 처리
	 * 요청 url : http://localhost:8080/delLikes
	************************************************/
	@ResponseBody
	@PostMapping("/delLikes")
	public int delLikes(LikesVO lvo,HttpSession session) {
		int result;
		result = likesService.delLikes(lvo);
		// 0: 삭제실패 1 : 삭제성공
		return result;
	}
}
