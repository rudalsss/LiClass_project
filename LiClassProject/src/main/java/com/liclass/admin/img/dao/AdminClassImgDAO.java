package com.liclass.admin.img.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.liclass.admin.img.vo.AdminClassImgVO;

@Mapper
public interface AdminClassImgDAO {
	public int imgInsert(AdminClassImgVO vo);				//클래스 단위 등록
	public int imgDel(int c_no);								//클래스 단위 삭제
	public List<AdminClassImgVO> imgList(int c_no);	//클래스 단위 조회
	
	public int imgDel2(AdminClassImgVO vo);						//개별 삭제		
	public int imgUpd(AdminClassImgVO vo);					//개별 수정
	
	public int imgCnt(int c_no);
}
