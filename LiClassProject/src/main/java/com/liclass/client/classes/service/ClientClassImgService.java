package com.liclass.client.classes.service;

import java.util.List;

import com.liclass.client.classes.vo.ClientClassImgVO;

public interface ClientClassImgService {
	
	//은아) 클래스의 전체이미지
	public List<ClientClassImgVO> getImgs(int c_no);
}
