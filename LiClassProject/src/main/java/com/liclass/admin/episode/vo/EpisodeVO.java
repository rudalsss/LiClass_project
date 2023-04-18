package com.liclass.admin.episode.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class EpisodeVO {
	private int ep_no					=0;	//회차번호
	private int c_no						=0;	//부모 클래스번호
	private String c_title				="";
	private int ep_price				=0;	//회차가격
	private String ep_date			="";	//회차일정
	private int ep_cnt					=0; //회차예약인원
	
	private String ep_state1 		=""; //회차 예약 상태 (예약 인원여유) => 예약여유 / 예약만석
	private String ep_state2 		=""; //회차 진행 상태 (회차 진행여부) => 모집중 / 진행종료
	
	private int c_maxcnt;
	private String c_endtime;
}
