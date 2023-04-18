package com.liclass.client.reserve.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class ReserveVO {
	private int r_no;
	private long user_no;
	private int ep_no;
	private String c_title;
	private String r_date;
	private String reg_date;
	private int r_state;
	private int r_price;
	private int r_cnt;
	private int review_status;
}
