package com.liclass.admin.episode.service;

import java.util.List;

import com.liclass.admin.episode.vo.EpisodeVO;
import com.liclass.client.reserve.vo.ReserveVO;

public interface EpisodeService {
	public List<EpisodeVO> epList(int c_no);
	public int epInsert(EpisodeVO ep);
	public int chkDate(EpisodeVO ep);
	//public int epDelete(int c_no);
	public int epDel(int ep_no);
	public int epCnt(int c_no);
	
	//****프론트 화면에서 쓸 쿼리****//
	public String[] epDateList(int c_no);
	public List<EpisodeVO> epInfo(EpisodeVO ep);
	public EpisodeVO reservInfo(int ep_no);
	public int EpcntUpdate(ReserveVO rvo);
	public int EpcntDel(ReserveVO rvo);
}
