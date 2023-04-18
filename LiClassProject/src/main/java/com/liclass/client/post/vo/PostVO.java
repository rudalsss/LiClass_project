package com.liclass.client.post.vo;

import org.springframework.web.multipart.MultipartFile;

import com.liclass.client.login.vo.UserVO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(callSuper = false)
public class PostVO extends UserVO{
	//9개의 필드(컬럼)
	private int post_no=0;
	private long user_no=0;
	private int c_no=0;
	private String post_title="";
	private String post_content="";
	private int post_likes=0;
	private String post_regdate="";
	private String post_update="";
	private String post_img="";
	private int post_status=0;
	
	//posting 이미지
	private MultipartFile file;
}
