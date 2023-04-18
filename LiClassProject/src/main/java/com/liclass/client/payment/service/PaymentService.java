package com.liclass.client.payment.service;

import com.liclass.client.payment.vo.PaymentVO;
import com.liclass.client.payment.vo.RefundVO;
import com.liclass.client.reserve.vo.ReserveVO;
import com.liclass.admin.management.center.vo.CenterVO;
import com.liclass.client.login.vo.UserVO;

public interface PaymentService {
   
   public int callback_receive(boolean success, String imp_uid, String error_msg, Integer pay_price);

   public int getPrice(boolean success, String imp_uid, String error_msg);

   public int payCencel(String merchant_uid, int dbPrice);

   
   public UserVO getUserInfo(long user_no);
   public ReserveVO getPriceInfo(int r_no);

   
   public int inserPayment(PaymentVO paymentVO);

   public UserVO getUserId(String user_email);

   public int changeRerserveStatus(int r_no,int r_state);

   public PaymentVO getPaymentInfo(String merchant_uid);

   public int insertRefund(RefundVO refundVO);

   public int changePaymentStatus(String merchant_uid);

   public int reserveDelete(int r_no);

   public CenterVO getCenterInfo(int r_no);

   public void getPoint(long user_no,long point);

   public void changePoint(PaymentVO paymentVO);

   public void changePoint2(PaymentVO paymentInfo);

   public PaymentVO getWithdrawPay(int r_no);
   
   public int updWithdrawPay(PaymentVO paymentInfo);

}