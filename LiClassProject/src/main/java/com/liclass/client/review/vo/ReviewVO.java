package com.liclass.client.review.vo;

import com.liclass.common.vo.CommonVO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@EqualsAndHashCode(callSuper = false)
@Data
@AllArgsConstructor
@NoArgsConstructor
public class ReviewVO extends CommonVO{
	private int review_no			= 0;		// 리뷰 번호
	private String review_name 		= "";		// 리뷰 작성자명
	private String review_title 	= "";		// 리뷰 제목
	private String review_content 	= "";		// 리뷰 내용
	private String review_date 		= "";		// 리뷰 작성일
	private String review_update 	= "";		// 리뷰 수정일 
	private int review_status 		= 0;		// 리뷰 상태값(0: 정상, 1: 비정상)
	private int review_rating		= 0;		// 리뷰 별점
	private String review_recommend	= "";		// 리뷰 추천(yes/no)

	private String c_name = "";					// 클래스 명
	private int c_no = 0;						// 클래스 번호
	private long user_no = 0;					// 회원 번호

	private String user_img = "";				// 회원 프로필 사진
	private String user_name = "";

	private int r_no = 0;						// 회원 예약 번호

	private String class_img; 					//해당 리뷰의 클래스 이미지

	
}



