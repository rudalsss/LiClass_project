package com.liclass.client.login.service;

import java.io.UnsupportedEncodingException;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.stereotype.Service;

import com.liclass.client.login.vo.UserVO;

@Service
public interface MailService { //은아
    
	// 메일 내용 작성 
    public MimeMessage creatMessage(String email) throws MessagingException, UnsupportedEncodingException;

    // 랜덤 인증코드 생성
    public String createKey();
    
    // 메일 발송
    public String sendSimpleMessage(String email) throws Exception;
    
    //가입완료 이메일
    public MimeMessage welcomeMessage(UserVO vo) throws MessagingException, UnsupportedEncodingException;
    
    //임시비밀번호 이메일
    public MimeMessage findPwMessage(String temPw,String email) throws MessagingException, UnsupportedEncodingException;
    
    //메일전송
    public void sendEmail(MimeMessage message);
}
