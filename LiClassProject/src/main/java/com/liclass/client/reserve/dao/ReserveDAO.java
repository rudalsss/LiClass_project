package com.liclass.client.reserve.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.liclass.client.reserve.vo.ReserveVO;

@Mapper
public interface ReserveDAO {
	public int reservInsert(ReserveVO rvo);
	public ReserveVO reservSelect(int r_no);
	public List<ReserveVO> reservListSelect(int ep_no);
	public int reservWithdraw(int r_no);
}
