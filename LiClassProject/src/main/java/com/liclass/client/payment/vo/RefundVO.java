package com.liclass.client.payment.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class RefundVO {
	private int refund_no;
	private String merchant_uid;
	private long user_no;
	private String refund_date;
	private int refund_price;
	private String refund_method;
	private int refund_status;
}