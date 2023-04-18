package com.liclass.admin.management.center.vo;

import com.liclass.common.vo.CommonVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

/* equals와 hashCode 메소드 자동 생성 시 부모 클래스의 필드까지 감안할지 안 할지에 대해서 설정시
 * callSuper = true로 설정하면 부모 클래스 필드 값들도 동일 한지 체크하며, 
 * callSuper = false로 설정(기본값)하면 자신 클래스의 필드 값들만 고려한다*/
 
@Data
@EqualsAndHashCode(callSuper=false)
public class CenterVO extends CommonVO{
	   private String ct_bizno; //사업자등록번호
	   private String ct_name = ""; //센터명
	   private String ct_opbiz_ym = ""; //센터개업년월
	   private String ct_intro =""; //센터 소개
	   private String ct_mainart; //센터 주요작품
	   private int ct_zipno = 0; //센터 우편번호
	   private String ct_addr = ""; //센터 주소
	   private String ct_detail_addr = ""; //센터 상세주소
	   private String ct_tel = ""; //센터 대표전화
	   private String ct_hmpg_addr; //센터 홈페이지주소
	   private String ct_date =""; //센터 등록일
}
