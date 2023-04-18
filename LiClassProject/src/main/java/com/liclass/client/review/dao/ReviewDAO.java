package com.liclass.client.review.dao;


import java.util.HashMap;
import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import com.liclass.client.review.vo.ReviewVO;

@Mapper
public interface ReviewDAO {

			
	 		// 검색,페이징처리 리스트 조회
			public List<ReviewVO> reviewList(ReviewVO vo);
			
			// 페이징 처리를 위한 레코드 개수
			public int reviewListCnt(ReviewVO vo);
			// 게시글 입력처리
			public int reviewInsert(ReviewVO vo);
			// 게시글 상세보기
			public ReviewVO reviewDetail(ReviewVO vo);
			// 게시글 수정처리
			public int reviewUpdate(ReviewVO vo); 
			// 게시글 삭제처리
			public int reviewDelete(int review_no);
			
			
			// 별점 평균 구하기
			public Double getRatingAverage(int c_no);

			// 별점 통계
			public HashMap<String, Integer> tongRating(ReviewVO vo);
			
			
			
			// 리뷰 상태 바꿔주기
			public void changeReviewStatus(int rno);

			// review Form 사진 띄우기
			public ReviewVO updateFormToRno(ReviewVO vo);

			public void changeReviewStatus2(int r_no);
			
			// 리뷰 이미지
			public String reviewImg(int r_no);
			
			//경민) 클래스 기준 리뷰 조회
			public List<ReviewVO> reviewOfclass(int c_no);
	
}