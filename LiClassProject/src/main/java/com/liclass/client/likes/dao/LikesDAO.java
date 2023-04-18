package com.liclass.client.likes.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.liclass.client.likes.vo.LikesVO;

@Mapper
public interface LikesDAO { //은아

	//관심클래스 유무 확인
	public int checkLikes(LikesVO vo);
	
	//관심클래스 추가
	public int addLikes(LikesVO vo);
	
	//관심클래스 삭제
	public int delLikes(LikesVO vo);
	
	//경민) 클래스 기준 관심클래스 조회
	public List<LikesVO> likesOfClass(int c_no);
}
