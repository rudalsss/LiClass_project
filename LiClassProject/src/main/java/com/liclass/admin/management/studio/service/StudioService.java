package com.liclass.admin.management.studio.service;

import java.util.List;

import com.liclass.admin.management.center.vo.CenterVO;
import com.liclass.admin.management.studio.vo.StudioVO;

public interface StudioService {
	public List<StudioVO> studioList(StudioVO svo);/* 검색 포함 리스트 */
	public List<StudioVO> clientStudioList(StudioVO svo);
	
	public int studioListCnt(StudioVO svo);
	public int studioInsert(StudioVO svo) throws Exception;
	public StudioVO studioDetail(StudioVO svo);
	
	public StudioVO updateForm(StudioVO svo);
	public int studioUpdate(StudioVO svo) throws Exception ;
	public int studioDelete(StudioVO svo) throws Exception ;
	public List<CenterVO> centerNameList();
}
