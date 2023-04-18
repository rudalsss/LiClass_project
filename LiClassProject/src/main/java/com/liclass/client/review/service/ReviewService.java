package com.liclass.client.review.service;

import java.util.HashMap;
import java.util.List;

import com.liclass.client.review.vo.ReviewVO;

public interface ReviewService {
	// 게시글 리스트	// 검색포함으로 바꿔 주어야 한다.
		public List<ReviewVO> reviewList(ReviewVO vo)  throws Exception;
		
		// 페이징 처리를 위한 페이지 개수
		public int reviewListCnt(ReviewVO vo);
		
		// 게시글 입력처리
		public int reviewInsert(ReviewVO vo) throws Exception;
		
		// 게시글 수정 화면
		public ReviewVO r_updateForm(ReviewVO vo) throws Exception;
		
		// 게시글 수정처리
		public int reviewUpdate(ReviewVO vo) throws Exception;

		// 게시글 상세보기
		public ReviewVO reviewDetail(ReviewVO vo) throws Exception;
		
		// 게시글 삭제처리
		public int reviewDelete(ReviewVO vo) throws Exception;
		
		
		// 별점 통계
		public double setRating(int c_no);
		
		// 별점 개수별 점수
		HashMap<String, Integer> tongRating(ReviewVO vo);
		
		
		
		

		public void changeReviewStatus(int rno);

		public ReviewVO updateFormToRno(ReviewVO detail);

		public void changeReviewStatus2(int r_no);
		
		public String reviewImg(int r_no);
		
		
		
		
}