package com.liclass.client.likes.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.liclass.client.likes.dao.LikesDAO;
import com.liclass.client.likes.vo.LikesVO;

import lombok.Setter;

@Service
public class LikesServiceImpl implements LikesService{ //은아
	@Setter(onMethod_ = @Autowired)
	private LikesDAO likesDao;
	
	//관심클래스 유무 확인
	@Override
	public int checkLikes(LikesVO vo) {
		int result = likesDao.checkLikes(vo);
		return result;
	}
	
	//관심클래스 추가
	@Override
	public int addLikes(LikesVO vo) {
		int result = likesDao.addLikes(vo);
		return result;
	}

	//관심클래스 삭제
	@Override
	public int delLikes(LikesVO vo) {
		int result = likesDao.delLikes(vo);
		return result;
	}

}
