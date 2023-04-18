package com.liclass.admin.classes.service;

import java.util.List;
import java.util.Map;

import com.liclass.admin.classes.vo.AdminClassVO;
import com.liclass.admin.img.vo.AdminClassImgVO;

public interface AdminClassService {
	public List<AdminClassVO> classList(AdminClassVO liclass);
	public int classListCnt(AdminClassVO liclass);
	public AdminClassVO classDetail(int c_no);
	public int classInsert(AdminClassVO licalss) throws Exception;
	public AdminClassVO updateForm(int c_no);
	public int classUpdate(AdminClassVO liclass);
	public int classDelete(AdminClassVO liclass) throws Exception;
	public Map<String, String> classDetail2(int c_no);
	
	//img list dao의 메서드를 이용할 service메서드 
	public int imgInsert(AdminClassImgVO vo) throws Exception;				//insert에서 같이 사용 + 수정시 개별사용
	public List<AdminClassImgVO> imgList(int c_no); 	//클래스의 img리스트를 조회(번호순)
	public int imgDel2(AdminClassImgVO vo) throws Exception;
	public int imgUpd(AdminClassImgVO vo) throws Exception;
	public int imgCnt(int c_no);
	
}
