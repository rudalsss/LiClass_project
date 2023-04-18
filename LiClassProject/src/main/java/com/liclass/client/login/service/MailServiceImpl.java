package com.liclass.client.login.service;

import java.io.UnsupportedEncodingException;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.liclass.client.login.vo.UserVO;


@Service
public class MailServiceImpl implements MailService { //은아
	
	 	@Autowired
	    JavaMailSender emailSender; 

	    private String authoKey; 

	    //랜덤 인증코드 생성
	    @Override
	    public String createKey(){
	            int leftLimit = 48; 
	            int rightLimit = 122; 
	            int targetStringLength = 10;
	            Random random = new Random();
	            String key = random.ints(leftLimit, rightLimit + 1)
                        .limit(targetStringLength)
                        .collect(StringBuilder::new, StringBuilder::appendCodePoint, StringBuilder::append)
                        .toString();
	            System.out.println("생성된 랜덤 인증코드"+ key);
	            return key;
	    }
	    
	    //회원가입 인증메일 내용
	    @Override
	    public MimeMessage creatMessage(String email) throws MessagingException, UnsupportedEncodingException {
	        MimeMessage message = emailSender.createMimeMessage();

	        message.addRecipients(RecipientType.TO, email);
	        message.setSubject("[LiClass] 회원가입을 위한 이메일 인증코드 입니다");

	        String msg = "";
	        msg += "<div style='font-family:'Helvetica Neue',Arial,sans-serif;font-size:32px;font-weight:bold;line-height:1;text-align:center;color:#555;'>";
	        msg += "<h1 style='text-align:center;'>안녕하세요,LiClass 입니다.</h1>";
	        msg += "<br>";
	        msg += "<p style='text-align:center;'>아래 인증코드를 회원가입 페이지에 입력해주세요.</p>";
	        msg += "<br>";
	        msg += "<br>";
	        msg += "<div align='center'>";
	        msg += "<h3>회원가입 인증코드 입니다</h3>";
	        msg += "<div style='font-size:130%;'>";
	        msg += "<strong style='color:salmon'>" + authoKey + "</strong></div><br/>" ; // 메일에 인증번호 authoKey 넣기
	        msg += "<a href='http://localhost:8080/' target='_blank' style='border: none; border-radius: 5px; box-sizing: border-box; cursor: pointer; display: inline-block; font-size: 14px; font-weight: bold; margin: 20px 0px; padding: 12px 25px; text-decoration: none; text-transform: capitalize; background-color: grey; color: #ffffff;'>LiClass</a>" ; 
	        msg += "</div>";
	        msg += "</div>";

	        message.setText(msg, "utf-8", "html"); 
	        message.setFrom(new InternetAddress("kimeunazip@naver.com", "LiClass"));

	        return message;
	    }

	    //회원가입 인증메일 전송
	    @Override
	    public String sendSimpleMessage(String email) throws Exception {

	        authoKey = createKey(); //1.랜덤인증코드

	        MimeMessage message = creatMessage(email);//2.보낼이메일내용

	        try { 
	            emailSender.send(message);
	        } catch (Exception e) {
	            e.printStackTrace();
	            throw new IllegalArgumentException();
	        }

	        return authoKey; 
	    }
	    
	   
	    
	    //회원가입 완료메일 내용
		@Override
		public MimeMessage welcomeMessage(UserVO vo) throws MessagingException, UnsupportedEncodingException {

	        MimeMessage message = emailSender.createMimeMessage();

	        message.addRecipients(RecipientType.TO, vo.getUser_email());
	        message.setSubject("[LiClass] 회원가입을 환영합니다.");

	        String msg = "";
	        msg += "<div style='font-family:'Helvetica Neue',Arial,sans-serif;font-size:32px;font-weight:bold;line-height:1;text-align:center;color:#555;'>";
	        msg += "<h1 style='text-align:center;'>안녕하세요,LiClass 입니다</h1>";
	        msg += "<br>";
	        msg += "<p style='text-align:center;'>"+vo.getUser_name()+"님, LiClass의 회원이 되신 걸 환영합니다."+"</p>";
	        msg += "<br>";
	        msg += "<br>";
	        msg += "<div align='center' style='border:none; padding:10px 0px;'>";
	        msg += "<div style='font-size:130%'>";
	        msg += "<p>이제, 라이클래스와 함께 일상을 다양한 취미로 채워보아요.</p>";
	        msg += "<a href='http://localhost:8080/' target='_blank' style='border: none; border-radius: 5px; box-sizing: border-box; cursor: pointer; display: inline-block; font-size: 14px; font-weight: bold; margin: 20px 0px; padding: 12px 25px; text-decoration: none; text-transform: capitalize; background-color: grey; color: #ffffff;'>LiClass</a>" ; 
	        msg += "</div>";
	        msg += "</div>";

	        message.setText(msg, "utf-8", "html"); 
	        message.setFrom(new InternetAddress("kimeunazip@naver.com", "LiClass"));

	        return message;
		}
	    
		//비밀번호 찾기 (임시비밀번호 발급) 이메일 내용
		@Override
		public MimeMessage findPwMessage(String temPw,String email) throws MessagingException, UnsupportedEncodingException {

	        MimeMessage message = emailSender.createMimeMessage();

	        message.addRecipients(RecipientType.TO, email); 
	        message.setSubject("[LiClass] 임시비밀번호 발급메일입니다.");

	        String msg = "";
	        msg += "<div style='font-family:'Helvetica Neue',Arial,sans-serif;font-size:32px;font-weight:bold;line-height:1;text-align:center;color:#555;'>";
	        msg += "<h1 style='text-align:center;'>안녕하세요,LiClass 입니다</h1>";
	        msg += "<br>";
	        msg += "<p style='text-align:center;'> 회원님 계정의 임시비밀번호가 발급되었습니다.</p>";
	        msg += "<br>";
	        msg += "<br>";
	        msg += "<div align='center' padding:10px 0px;'>";
	        msg += "<div style='font-size:130%'>";
	        msg += "<h3>임시비밀번호 입니다</h3>";
	        msg += "<strong style='color:salmon'>" + temPw + "</strong></div><br/>" ;
	        msg += "<p>이제, 다시 새로운 하루를 만들고 숨겨진 나의 취향 탐색하러 가볼까요?</p>";
	        msg += "<a href='http://localhost:8080/' target='_blank' style='border: none; border-radius: 5px; box-sizing: border-box; cursor: pointer; display: inline-block; font-size: 14px; font-weight: bold; margin: 20px 0px; padding: 12px 25px; text-decoration: none; text-transform: capitalize; background-color: grey; color: #ffffff;'>LiClass</a>" ;
	        msg += "</div>";
	        msg += "</div>";

	        message.setText(msg, "utf-8", "html"); 
	        message.setFrom(new InternetAddress("kimeunazip@naver.com", "LiClass"));

	        return message;
		}

		//이메일 전송
		@Override
		public void sendEmail(MimeMessage message) {
			emailSender.send(message);
		}
}
