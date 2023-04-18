package com.liclass.client.classes.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.liclass.client.classes.vo.ClientClassImgVO;

@Mapper
public interface ClientClassImgDAO {
	
	//은아) 클래스 전체이미지
	public List<ClientClassImgVO> getImgs(int c_no);
}
