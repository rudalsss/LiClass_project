package com.liclass.admin.img.vo;

import org.springframework.web.multipart.MultipartFile;

//import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

//이미지 하나를 처리하기 위한 것.
@Data
public class AdminClassImgVO {
	private int c_img_no						=0;		//이미지 번호
	private int c_no								=0;		//클래스 번호
	private String c_img_file				="";		//이미지 파일명
	private String thumb_file			="";		//썸네일 파일명

	private MultipartFile file;
}