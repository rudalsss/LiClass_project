package com.liclass;

import java.util.Properties;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;

@Configuration
public class MailConfig { //은아
	
	    @Bean
	    public JavaMailSender NaverMailService(){
		 
	        JavaMailSenderImpl javaMailSender = new JavaMailSenderImpl();

	        javaMailSender.setHost("smtp.naver.com"); 
	        javaMailSender.setUsername("kimeunazip"); 
	        javaMailSender.setPassword("Asdf1234"); 

	        javaMailSender.setPort(465);

	        javaMailSender.setJavaMailProperties(getMailProperties()); 

	        return javaMailSender;
	    }

	    private Properties getMailProperties(){
	        Properties properties = new Properties();
	        properties.setProperty("mail.transport.protocol", "smtp"); 
	        properties.setProperty("mail.smtp.auth", "true"); 
	        properties.setProperty("mail.smtp.starttls.enable", "true"); 
	        properties.setProperty("mail.debug", "true");
	        properties.setProperty("mail.smtp.ssl.trust", "smtp.naver.com"); 
	        properties.setProperty("mail.smtp.ssl.enable", "true"); 
	        
	        return properties;
	    }
	    
}
