package com.liclass.admin.episode.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.liclass.admin.episode.dao.EpisodeDAO;
import com.liclass.admin.episode.vo.EpisodeVO;
import com.liclass.client.reserve.vo.ReserveVO;

import lombok.Setter;

@Service
public class EpisodeServiceImpl implements EpisodeService {

	@Setter(onMethod_=@Autowired )
	private EpisodeDAO episodeDAO;
	
	@Override
	public List<EpisodeVO> epList(int c_no) {
		List<EpisodeVO> list = null;
		list = episodeDAO.epList(c_no);
		return list;
	}

	@Override
	public int epInsert(EpisodeVO ep) {
		int result = episodeDAO.epInsert(ep);
		
		return result;
	}

	@Override
	public int chkDate(EpisodeVO ep) {
		int result = episodeDAO.chkDate(ep);
		return result;
	}

	/*
	@Override
	public int epDelete(int c_no) {
		int result = episodeDAO.epDelete(c_no);
		return result;
	}
	*/
	
	@Override
	public int epDel(int ep_no) {
		int result = episodeDAO.epDel(ep_no);
		return result;
	}
	
	@Override
	public int epCnt(int c_no) {
		int cnt = episodeDAO.epCnt(c_no);
		return cnt;
	}

	@Override
	public String[] epDateList(int c_no) {
		String[] epDateList = episodeDAO.epDateList(c_no);
		return epDateList; //클래스의 모든회차들의 날짜배열
	}

	@Override
	public List<EpisodeVO> epInfo(EpisodeVO ep) { //회차번호, 날짜를 가진 ep
		List<EpisodeVO> epListInDay = episodeDAO.epInfo(ep);
		for( EpisodeVO vo : epListInDay ) {
			//System.out.print("서비스단에서 시간 :: "+vo.getEp_date());
			if( vo.getEp_cnt() < vo.getC_maxcnt()  ) {
				vo.setEp_state1("예약여유");
			} else {
				vo.setEp_state1("예약만석");
			}
		}
		return epListInDay; //클래스, 날짜가 같고 시간이 다른 회차들
	}

	@Override
	public EpisodeVO reservInfo(int ep_no) {
		EpisodeVO ep = episodeDAO.reservInfo(ep_no);
		return ep;
	}

	@Override
	public int EpcntUpdate(ReserveVO rvo) {
		int result = episodeDAO.EpcntUpdate(rvo);
		return result;
	}

	@Override
	public int EpcntDel(ReserveVO rvo) {
		int result = episodeDAO.EpcntDel(rvo);
		return result;
	}

}
