package com.liclass.client.review.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.liclass.client.classes.dao.ClientClassImgDAO;
import com.liclass.client.review.dao.ReviewDAO;
import com.liclass.client.review.vo.ReviewVO;

import lombok.Setter;

@Service
public class ReviewServiceImpl implements ReviewService {
	@Setter(onMethod_ = @Autowired)
	private ReviewDAO reviewDao;
	@Setter(onMethod_ = @Autowired)
	private ClientClassImgDAO clientClassImgDAO;
	

	// 후기글 조회 
	@Override
	public List<ReviewVO> reviewList(ReviewVO vo) {
		List<ReviewVO> list = null;
		list = reviewDao.reviewList(vo);
		return list;
	}

	// 글입력 구현
	@Override
	public int reviewInsert(ReviewVO vo) throws Exception {
		int result = 0;
		result = reviewDao.reviewInsert(vo);

		setRating(vo.getC_no());

		return result;
	}

	// 글 상세보기
	@Override
	public ReviewVO reviewDetail(ReviewVO vo) throws Exception {

		ReviewVO detail = null;

		detail = reviewDao.reviewDetail(vo);

		if (detail != null) {
			detail.setReview_content(detail.getReview_content().toString().replaceAll("\n", "<br />"));
		}

		return detail;
	}

	// 글 수정 구현
	@Override
	public int reviewUpdate(ReviewVO vo) throws Exception {
		int result = 0;
		result = reviewDao.reviewUpdate(vo);

		setRating(vo.getC_no());

		return result;
	}

	// 글 수정 화면 구현
	@Override
	public ReviewVO r_updateForm(ReviewVO vo) throws Exception {
		ReviewVO updateData = null;
		updateData = reviewDao.reviewDetail(vo);

		return updateData;
	}

	// 글삭제 구현
	@Override
	public int reviewDelete(ReviewVO vo) {
		int result = 0;
		result = reviewDao.reviewDelete(vo.getReview_no());

		setRating(vo.getC_no());
		return result;
	}

	// 전체 레코드 수 구현
	@Override
	public int reviewListCnt(ReviewVO vo) {
		return reviewDao.reviewListCnt(vo);
	}

	// 별점 평균
	@Override
	public double setRating(int c_no) {

		Double ratingAvg = reviewDao.getRatingAverage(c_no);

		if (ratingAvg == null) {
			ratingAvg = 0.0;
		}

		ratingAvg = (double) (Math.round(ratingAvg * 10));
		ratingAvg = ratingAvg / 10;

		return ratingAvg;

	}

	// 별점 그룹화
	@Override
	public HashMap<String, Integer> tongRating(ReviewVO vo) {
		
		HashMap<String, Integer> ratingTotal = reviewDao.tongRating(vo);
		
		
		return ratingTotal;
	}

	
	
	@Override
	public void changeReviewStatus(int rno) {
		reviewDao.changeReviewStatus(rno);
	}

	@Override
	public ReviewVO updateFormToRno(ReviewVO detail) {
		ReviewVO result = reviewDao.updateFormToRno(detail);
		return result;
	}

	@Override
	public void changeReviewStatus2(int r_no) {
		reviewDao.changeReviewStatus2(r_no);	
	}

	@Override
	public String reviewImg(int r_no) {
		String result =  reviewDao.reviewImg(r_no);
		return result;
	}


	
	 

}
