package com.liclass.client.classes.vo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class ClientClassVO {

	private int c_no				=0;		//클래스 번호
	private String ct_bizno 		="";		//사업자 등록번호(센터)
	private String c_title 			="";		//클래스 제목
	private String c_content		="";		//클래스 소개글
	private String c_category		=""; 		//클래스 카테고리 ( 0.공예, 1.요리, 2.미술, 3.플라워, 4.뷰티, 5.체험및기타 )
	private String c_level 			="";		//클래스 난이도
	private String c_area 			= ""; 		//클래스 지역
	private int c_luv				=0; 		//클래스 관심수
	private int c_leadtime        	=0;
	private int c_maxcnt 			=0;			//클래스 최대인원
	private int c_mincnt 			= 0;		//클래스 최소인원
	private String c_date			="";		//클래스 등록일자
	private int c_state				=0;      	//클래스 상태 ( 0:등록완료,예약가능 / 1:삭제,예약불가 )
	
	private String c_img_file 		="";		// li_class_img에서 가져온 클래스이미지파일
	
	//사진저장을 위함
	private List<MultipartFile> fileList = null; 
	//private MultipartFile fileList;
	
	public ClientClassVO(){
		fileList = new ArrayList<>();
	}
	
}
