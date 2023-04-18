package com.liclass.client.login.dao;

import org.apache.ibatis.annotations.Mapper;

import com.liclass.client.login.vo.UserVO;

@Mapper
public interface UserDAO { //은아
	
		//회원가입
		public int signup(UserVO vo);
		
		//중복이메일확인
		public int checkEmail(String email);
		
		//비밀번호 찾기할때 기존가입자 이메일 확인
		public int findEmail(String email);
				
		//비밀번호찾기(임시비밀번호로 수정)
		public int updatePw(UserVO vo);

		//아이디 비밀번호 확인
		public int checkIdPw(UserVO vo);
		
		//비밀번호 만료기간 확인
		public int checkPwExp(UserVO vo);
		
		//로그인 처리
		public UserVO login(UserVO vo);
		
		//SNS계정을 회원테이블에 넣기(신규연동)
		public int SNSInsert(UserVO vo);
		
		//SNS 기존연동 여부 확인
		public UserVO SNSLogin(String user_email);
		
		//비밀번호 확인
		public int checkPw(UserVO vo);
		
		//회원정보 수정처리
		public int update(UserVO vo);
		
		//회원탈퇴처리
		public int unregister(UserVO vo);
}
