package com.liclass.admin.classes.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.liclass.admin.classes.vo.AdminClassVO;

@Mapper
public interface AdminClassDAO {
	public List<AdminClassVO> classList(AdminClassVO liclass);
	public int classListCnt(AdminClassVO liclass);
	public AdminClassVO classDetail(int c_no);
	public int classInsert(AdminClassVO liclass);
	public int classUpdate(AdminClassVO liclass);
	public int classDelete(int c_no);
	public Map<String, String> classDetail2(int c_no);
	
}
