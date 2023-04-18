package com.liclass.admin.management.clientmanagement.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.liclass.admin.management.clientmanagement.dao.ClientManagementDao;
import com.liclass.client.login.vo.UserVO;

import lombok.Setter;

@Service
public class ClientManagementServiceImpl implements ClientManagementService {

	@Setter(onMethod_ = @Autowired)
	private ClientManagementDao clientManagementDao;
	
	@Override
	public List<UserVO> clientList(UserVO uservo) {
		List<UserVO> userVO = clientManagementDao.clientList(uservo);
		return userVO;
	}

	@Override
	public int clientListCnt(UserVO uservo) {
		int result = clientManagementDao.clientListCnt(uservo);
		return result;
	}

	@Override
	public void outClient(long user_no) {
		clientManagementDao.outClient(user_no);		
	}

	//은아)탈퇴회원 DB 삭제처리
	@Override
	public int deleteDB(long user_no) {
		int result = clientManagementDao.deleteDB(user_no);
		return result;
	}
}
