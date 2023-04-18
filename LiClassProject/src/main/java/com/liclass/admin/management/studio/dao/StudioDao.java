package com.liclass.admin.management.studio.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.liclass.admin.management.studio.vo.StudioVO;
@Mapper
public interface StudioDao {
	public List<StudioVO> studioList(StudioVO svo); /* 검색 포함 리스트 */
	public List<StudioVO> clientStudioList(StudioVO svo);
	
	public int studioListCnt(StudioVO svo); /* studio 테이블의 전체 레코드 수 */
	public int studioInsert(StudioVO svo);
	public StudioVO studioDetail(StudioVO svo);
	
	public int studioUpdate(StudioVO svo);
	public int studioDelete(int s_no);
}
