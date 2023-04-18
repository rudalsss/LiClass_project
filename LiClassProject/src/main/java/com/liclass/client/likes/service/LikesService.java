package com.liclass.client.likes.service;

import com.liclass.client.likes.vo.LikesVO;

public interface LikesService { //은아
	
	//관심클래스 유무 확인
	public int checkLikes(LikesVO vo);
	
	//관심클래스 추가
	public int addLikes(LikesVO vo);
	
	//관심클래스 삭제
	public int delLikes(LikesVO vo);
}
