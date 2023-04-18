package com.liclass.client.login.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.liclass.client.login.dao.UserDAO;
import com.liclass.client.login.vo.UserVO;

import lombok.Setter;

@Service
public class UserServiceImpl implements UserService { //은아

	@Setter(onMethod_ = @Autowired)
	private UserDAO userDao;
	
	@Override
	public int signup(UserVO vo) {
		int result = userDao.signup(vo);
		return result;
	}

	@Override
	public int checkEmail(String email) {
		int result = userDao.checkEmail(email);
		return result;
	}
	@Override
	public int findEmail(String email) {
		int result = userDao.findEmail(email);
		return result;
	}
	
	@Override
	public int updatePw(UserVO vo) {
		int result = userDao.updatePw(vo);
		return result;
	}
	
	@Override
	public int checkIdPw(UserVO vo) {
		int result = userDao.checkIdPw(vo);
		return result;
	}
	
	@Override
	public int checkPwExp(UserVO vo) {
		int result = userDao.checkPwExp(vo);
		return result;
	}
	@Override
	public UserVO login(UserVO vo) {
		UserVO uvo = userDao.login(vo);
		return uvo;
	}

	@Override
	public int SNSInsert(UserVO vo) {
		int result = userDao.SNSInsert(vo);
		return result;
	}

	@Override
	public UserVO SNSLogin(String user_email) {
		UserVO vo = userDao.SNSLogin(user_email);
		return vo;
	}

	@Override
	public int checkPw(UserVO vo) {
		int result = userDao.checkPw(vo);
		return result;
	}

	@Override
	public int update(UserVO vo) {
		int result = userDao.update(vo);
		return result;
	}

	@Override
	public int unregister(UserVO vo) {
		int result = userDao.unregister(vo);
		return result;
	}
	
}
