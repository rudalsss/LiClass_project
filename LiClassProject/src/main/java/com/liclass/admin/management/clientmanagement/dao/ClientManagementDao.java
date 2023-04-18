package com.liclass.admin.management.clientmanagement.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.liclass.client.login.vo.UserVO;

@Mapper
public interface ClientManagementDao {

	public List<UserVO> clientList(UserVO uservo);

	public int clientListCnt(UserVO uservo);

	public void outClient(long user_no);

	//은아)탈퇴회원 DB 삭제처리
	public int deleteDB(long user_no);
}
