package com.liclass.client.mypage.service;

import java.util.List;
import java.util.Map;

import com.liclass.client.likes.vo.LikesVO;
import com.liclass.client.login.vo.UserVO;
import com.liclass.client.payment.vo.PaymentVO;
import com.liclass.client.post.vo.PostVO;
import com.liclass.client.qnaboard.vo.ClientQnaBoardVO;
import com.liclass.client.review.vo.ReviewVO;

public interface MypageService { //은아,웅배
	
		/* 은아 */
		//1. 나의 관심클래스 조회
		public List<LikesVO> myLikesList(LikesVO vo);
		
		//2. 나의 관심클래스 삭제
		public int delLikes(UserVO vo);
		
		//3. 나의 관심클래스 갯수
		public int myLikesCnt(LikesVO vo);
				
		//4. 나의 후기 조회
		public List<ReviewVO> myReviewList(ReviewVO vo);
		
		//5. 나의 후기 갯수 
		public int myReviewCnt(ReviewVO vo);
				
		//6. 나의 문의 조회
		public List<ClientQnaBoardVO> myQnaList(ClientQnaBoardVO vo); 
		
		//7. 나의 문의 갯수 
		public int myQnaCnt(ClientQnaBoardVO vo);
		
		//8. 나의 문의 답변 조회
		public ClientQnaBoardVO myQnaAnswer(ClientQnaBoardVO vo);
		
		//9. 나의 클래스일지 조회
		public List<PostVO> myPostList(PostVO qvo);
		
		//10. 나의 클래스일지 갯수
		public int myPostCnt(PostVO vo);
		
		//11. 프로필사진 수정
		public int updateImg(UserVO vo)throws Exception;		
		
		/* 웅배파트 */
		// 결제내역
        public List<Map<String, String>> paymentList(PaymentVO paymentVO);
        // 전체 레코드수 구현
        public int paymentListCnt(PaymentVO paymentVO);

		public List<Map<String, String>> courseList(PaymentVO pvo);

		public Map<String, String> getClassImg(int r_no);


		

		
		
}
