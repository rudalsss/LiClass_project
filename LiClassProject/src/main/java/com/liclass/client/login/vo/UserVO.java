package com.liclass.client.login.vo;

import org.springframework.web.multipart.MultipartFile;

import com.liclass.common.vo.CommonVO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(callSuper = false)
public class UserVO extends CommonVO{ //은아
	
	//12개의 필드(컬럼)
	private long user_no =0;
	private String user_email ="";
	private String user_pw ="";
	private String user_name ="";
	private String user_tel ="";
	private String user_img ="";
	private int user_point =0;
	private String user_regdate ="";
	private String user_update ="";
	private String user_unregdate ="";
	private int user_status =0;
	private int user_type =0;
	
	//프로필사진
	private MultipartFile file;
}
