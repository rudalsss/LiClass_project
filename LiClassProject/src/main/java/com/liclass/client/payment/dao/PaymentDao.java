package com.liclass.client.payment.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.liclass.admin.management.center.vo.CenterVO;
import com.liclass.client.login.vo.UserVO;
import com.liclass.client.payment.vo.PaymentVO;
import com.liclass.client.payment.vo.RefundVO;
import com.liclass.client.reserve.vo.ReserveVO;

@Mapper
public interface PaymentDao {
   // 웅배
   // 회원아이디를 통해 회원 정보 가져오기
   public UserVO getUserInfo(long user_no);
   // 예약정보 가져오기
   public ReserveVO getReserveInfo(int r_no);

   
   // 결제 테이블 저장
   public int inserPayment(PaymentVO paymentVO);
   // 이메일로 회원아이디 가져오기
   public UserVO getUserId(String user_email);

   public int changeRerserveStatus(@Param("r_no") int r_no,@Param("r_state") int r_state);

   public PaymentVO getPaymentInfo(String merchant_uid);

   public int insertRefund(RefundVO refundVO);

   public int changePaymentStatus(String merchant_uid);
   
   public int reserveDelete(int r_no);
   
   public CenterVO getCenterInfo(int r_no);
   
   public void getPoint(@Param("user_no")long user_no,@Param("point")long point);
   
   public void changePoint(PaymentVO paymentVO);

   public void changePoint2(PaymentVO paymentInfo);
   
   public PaymentVO getWithdrawPay(int r_no);
   
   public int updWithdrawPay(PaymentVO paymentInfo);
}