package com.liclass.client.reserve.service;

import java.util.List;

import com.liclass.client.reserve.vo.ReserveVO;

public interface ReserveService {
	public int reservInsert(ReserveVO rvo);
	public ReserveVO reservSelect(int r_no);
	public List<ReserveVO> reservListSelect(int ep_no);
	public int reservWithdraw(int r_no);
}	
