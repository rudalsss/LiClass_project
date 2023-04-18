package com.liclass.client.classes.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.liclass.admin.management.center.vo.CenterVO;
import com.liclass.client.classes.vo.ClientClassVO;
@Service
public interface ClientClassService {
	
	//클래스 리스트
	public List<ClientClassVO> clientClassList();
	
	//은아) 클래스 상세조회
	public ClientClassVO clientClassDetail(ClientClassVO vo);
		
	//은아) 클래스 센터조회
	public CenterVO clientCenterDetail(String ct_bizno);
}
