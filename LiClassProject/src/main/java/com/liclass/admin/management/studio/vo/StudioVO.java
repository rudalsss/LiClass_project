package com.liclass.admin.management.studio.vo;

import org.springframework.web.multipart.MultipartFile;

import com.liclass.common.vo.CommonVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

/* equals와 hashCode 메소드 자동 생성 시 부모 클래스의 필드까지 감안할지 안 할지에 대해서 설정시
 * callSuper = true로 설정하면 부모 클래스 필드 값들도 동일 한지 체크하며, 
 * callSuper = false로 설정(기본값)하면 자신 클래스의 필드 값들만 고려한다*/
 
@Data
@EqualsAndHashCode(callSuper=false)
public class StudioVO extends CommonVO{
	
	/*s_no varchar2(15) not null, --스튜디오게시판 글번호
    ct_bizno varchar2(15) not null, --사업자등록번호
    s_title varchar2(100) not null, --스튜디오게시판 제목
    s_content varchar2(500) not null, --스튜디오게시판 내용
    s_date date default sysdate, --스튜디오게시판 작성일
    s_thumb varchar2(500) not null, --스튜디오게시판 썸네일
    s_file varchar2(500)  not null, --스튜디오게시판 파일명	*/
	
	
	
	private int s_no = 0; //스튜디오게시판 글번호
	private String ct_bizno = ""; //사업자등록번호
	private String ct_name = ""; //센터 이름
	private String s_title = ""; //스튜디오게시판 제목
	private String s_content =""; //스튜디오게시판 내용
	private String s_date; //스튜디오게시판 작성일
	
	private MultipartFile file;   //파일 업로드를 위한 필드
	private String s_thumb   =""; //스튜디오게시판 썸네일(실제서버에 저장할 썸네일 이미지 파일명)
	private String s_file    =""; //스튜디오게시판 파일명(실제서버에 저장할 파일명)
}
