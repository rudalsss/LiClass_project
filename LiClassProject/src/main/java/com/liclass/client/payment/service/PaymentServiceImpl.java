package com.liclass.client.payment.service;

import java.math.BigDecimal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Service;

import com.liclass.admin.management.center.vo.CenterVO;
import com.liclass.client.login.vo.UserVO;
import com.liclass.client.payment.dao.PaymentDao;
import com.liclass.client.payment.vo.PaymentVO;
import com.liclass.client.payment.vo.RefundVO;
import com.liclass.client.reserve.vo.ReserveVO;
import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.request.CancelData;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

import lombok.Setter;

@Service
public class PaymentServiceImpl implements PaymentService{
   
   @Setter(onMethod_ = @Autowired)
   private PaymentDao paymentDao;
   
   //@SuppressWarnings("unchecked")
   @Override
   public int callback_receive(boolean success, String imp_uid, String error_msg, Integer pay_price) {
      System.out.println("callback_receive 서비스 호출 성공");
      int process_result = 0; // 0 = 결제성공, 1 = 결제실패, 2 = 결제취소
      // 응답 header 생성
      HttpHeaders responseHeaders = new HttpHeaders();
      responseHeaders.add("Content-Type", "application/json; charset=UTF-8");
      CancelData cancelData = new CancelData(imp_uid, success);
      
      try {
         if(success == true) {
            //db select (select amount from order_table where marchant_uid = ?)
            //STEP 5      
            String api_key = "6447060136783531";
            String api_secret = "QY3l9fXLrXtnNbu0XGvOZAgu3HitQO6Z73CfOu791LCqFjASsLPv4BsxyfGjAWs55DltXd3nzDjiZmbp";
            
            IamportClient ic = new IamportClient(api_key, api_secret);
            IamportResponse<Payment> response = ic.paymentByImpUid(imp_uid); // 두 개의 키로 토큰까지 얻어서 실제 결제금액을 가져와준다.
            
            BigDecimal iamport_amount = response.getResponse().getAmount(); 
            int api_amount = iamport_amount.intValue();
            
            //compare db amount and api_amount
            // db에서 가격을 가져왔다고 가정.=100
			if (pay_price.intValue() == api_amount) { 
               System.out.println("비교 성공");
               process_result = 0;
            }else {                         // 결제테이블에 저장(insert) - 결제상태는 = 결제실패 1, 예약상태 = 예약실패(update) 1
               System.out.println("비교 실패");
               ic.cancelPaymentByImpUid(cancelData); // 비교 가격이 다르기때문에 결제 취소
               process_result = 1;   
            }      
         }else {                            // 결제테이블에 저장(insert) - 결제상태는 = 결제취소 2, 예약상태 = 예약취소(update) 2
            System.out.println("error_msg : " + error_msg);
            process_result = 2;
         }
      }catch(Exception e) {                      // 결제테이블에 저장(insert) - 결제상태는 = 결제실패, 예약상태 = 예약실패(update)
         e.printStackTrace();
         // "관리자에게 문의해주세요" 넣기
         process_result = 2;   
      }
      return process_result;
   }
   
   // 가격 얻어오
   @Override
   public int getPrice(boolean success, String imp_uid, String error_msg) {
      // 응답 header 생성
      HttpHeaders responseHeaders = new HttpHeaders();
      responseHeaders.add("Content-Type", "application/json; charset=UTF-8");
      int api_amount = 0;
      try {
         if(success == true) {   
            String api_key = "6447060136783531";
            String api_secret = "QY3l9fXLrXtnNbu0XGvOZAgu3HitQO6Z73CfOu791LCqFjASsLPv4BsxyfGjAWs55DltXd3nzDjiZmbp";
                  
            IamportClient ic = new IamportClient(api_key, api_secret);
            IamportResponse<Payment> response = ic.paymentByImpUid(imp_uid); // 두 개의 키로 토큰까지 얻어서 실제 결제금액을 가져와준다.
            
            BigDecimal iamport_amount = response.getResponse().getAmount(); 
            api_amount = iamport_amount.intValue();   
         }else {                            // 결제테이블에 저장(insert) - 결제상태는 = 결제취소 2, 예약상태 = 예약취소(update) 2
            System.out.println("error_msg : " + error_msg);
         }
      }catch(Exception e) {                      // 결제테이블에 저장(insert) - 결제상태는 = 결제실패, 예약상태 = 예약실패(update)
         e.printStackTrace();                  // "관리자에게 문의해주세요" 넣기
      }
      return api_amount;
   }

   
   // 결제 테이블에 저장
   @Override
   public int inserPayment(PaymentVO paymentVO) {
      int result = paymentDao.inserPayment(paymentVO);
      return result;
   }
   // 이메일로 회원아이디 가져오기
   @Override
   public UserVO getUserId(String user_email) {
      UserVO result = paymentDao.getUserId(user_email);
      return result;
   }
   
   
   
   
   // 환불하기
   @Override
   public int payCencel(String merchant_uid, int dbPrice) {
      System.out.println("payCencel 서비스 호출 성공");
      int process_result = 0; // 0 = 환불성공, 1 = 환불실패
      // 응답 header 생성
      HttpHeaders responseHeaders = new HttpHeaders();
      responseHeaders.add("Content-Type", "application/json; charset=UTF-8");
      CancelData cancelData = new CancelData(merchant_uid, true);
      
      try {
         //db select (select amount from order_table where marchant_uid = ?)
         //STEP 5      
         String api_key = "6447060136783531";
         String api_secret = "QY3l9fXLrXtnNbu0XGvOZAgu3HitQO6Z73CfOu791LCqFjASsLPv4BsxyfGjAWs55DltXd3nzDjiZmbp";
                  
         IamportClient ic = new IamportClient(api_key, api_secret);
         IamportResponse<Payment> paymentStatus = ic.paymentByImpUid(merchant_uid);
         //IamportResponse<Payment> result = ic.cancelPaymentByImpUid(cancelData); 
         
         BigDecimal iamport_amount = paymentStatus.getResponse().getAmount(); 
         int api_amount = iamport_amount.intValue();
         
         //BigDecimal iamport_amount1 = result.getResponse().getCancelAmount();
         //int api_amount = iamport_amount1.intValue();
         
         //compare db amount and api_amount
         // db에서 가격을 가져왔다고 가정.=100
         if(dbPrice == api_amount) {          // 결제테이블에 저장(update) - 결제상태 = 환불 3, 예약상태 = 예약취소(update) 2, 환불테이블에 저장(insert) - 환불상태 = 1
            System.out.println("성공");
            ic.cancelPaymentByImpUid(cancelData); 
            process_result = 0;   
         }else {                      // 환불테이블에 저장(insert) - 환불상태 = 2
            System.out.println("실패");
            process_result = 1;   
         }         
            
      }catch(Exception e) { 
         e.printStackTrace();
         process_result = 1;
      }
            
      return process_result;
      
   }
   
   @Override
   public PaymentVO getPaymentInfo(String merchant_uid) {
      PaymentVO dbPrice = paymentDao.getPaymentInfo(merchant_uid);
      return dbPrice;
   }
   
   @Override
   public int insertRefund(RefundVO refundVO) {
      int result = paymentDao.insertRefund(refundVO);
      return result;
   }
   
   @Override
   public int changePaymentStatus(String merchant_uid) {
      int result = paymentDao.changePaymentStatus(merchant_uid);
      return result;
   }
   
   

   // 각각 필요한 정보를 테이블에서 가져오기
   @Override
   public UserVO getUserInfo(long user_no){
      UserVO uvo = paymentDao.getUserInfo(user_no);
      return uvo;
   }
   @Override
   public ReserveVO getPriceInfo(int r_no) {
      ReserveVO rvo = paymentDao.getReserveInfo(r_no);
      return rvo;
   }
   
   // 에약상태 수정하기
   @Override
   public int changeRerserveStatus(int r_no,int r_state) {
      int result = paymentDao.changeRerserveStatus(r_no,r_state);
      return result;
   }

	@Override
	public int reserveDelete(int r_no) {
		int result = paymentDao.reserveDelete(r_no);
		return result;
	}

	@Override
	public CenterVO getCenterInfo(int r_no) {
		CenterVO cvo = paymentDao.getCenterInfo(r_no);
		return cvo;
	}

	@Override
	public void getPoint(long user_no,long point) {
		paymentDao.getPoint(user_no,point);
	}

	@Override
	public void changePoint(PaymentVO paymentVO) {
		paymentDao.changePoint(paymentVO);
	}

	@Override
	public void changePoint2(PaymentVO paymentInfo) {
		paymentDao.changePoint2(paymentInfo);
	}

	@Override
	public PaymentVO getWithdrawPay(int r_no) {
		PaymentVO pvo = paymentDao.getWithdrawPay(r_no);
		return pvo;
	}

	@Override
	public int updWithdrawPay(PaymentVO paymentInfo) {
		int result = paymentDao.updWithdrawPay(paymentInfo);
		return result;
	}
   
}