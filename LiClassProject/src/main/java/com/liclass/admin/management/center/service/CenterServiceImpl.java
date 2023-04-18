package com.liclass.admin.management.center.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.liclass.admin.management.center.dao.CenterDAO;
import com.liclass.admin.management.center.vo.CenterVO;

import lombok.Setter;
@Service
public class CenterServiceImpl implements CenterService {
	@Setter(onMethod_ = @Autowired)
	private CenterDAO centerDao;

	// 센터글 목록 구현
		@Override
		public List<CenterVO> centerList(CenterVO cvo) {
			List<CenterVO> list = null;
			list = centerDao.centerList(cvo);
			return list;
		}

		// 센터글 전체 레코드 수 구현
		@Override
		public int centerListCnt(CenterVO cvo) {
			return centerDao.centerListCnt(cvo);
		}

		// 센터글 입력 구현
		@Override
		public int centerInsert(CenterVO cvo) throws Exception {
	int result = 0;
			
			/* 예외를 발생시킬 코드 작성 
			bvo.setB_num(0);
			if(bvo.getB_num() == 0){
			throw new IllegalArgumentException("0번 글은 등록할 수 없습니다.");
			} */
			
			result = centerDao.centerInsert(cvo);
			return result;
		}

		// 센터글 상세 구현
		@Override
		public CenterVO centerDetail2(CenterVO cvo) { 
			CenterVO detail = null;
			
			detail = centerDao.centerDetail2(cvo);
		
			return detail;
		}

		@Override
		public CenterVO updateForm(CenterVO cvo) {
			CenterVO updateData = null;
			
			updateData = centerDao.centerDetail2(cvo); 
			
			return updateData;
		}

		// 센터글 수정 구현
		@Override
		public int centerUpdate(CenterVO cvo) throws Exception {
			int result = 0;
			
			result = centerDao.centerUpdate(cvo);
			return result;
		}

		// 센터글 삭제 구현
		@Override
		public int centerDelete(CenterVO cvo) throws Exception {
			int result = 0;
			
			result = centerDao.centerDelete(cvo.getCt_bizno());
			return result;
		}
		
		//센터 전체 리스트(클래스등록에서 이용)
		@Override
		public List<CenterVO> centerlist2() {
			List<CenterVO> clist = null;
			clist = centerDao.centerlist2();
			return clist;
		}

		//은아)li_class의 ct_bizno로 센터 상세정보 조회
		@Override
		public CenterVO clientCenterDetail(String ct_bizno) {
			CenterVO clientCenterDetail = centerDao.clientCenterDetail(ct_bizno);
			return clientCenterDetail;
		}

}
