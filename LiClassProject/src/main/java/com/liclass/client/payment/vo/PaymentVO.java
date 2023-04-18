package com.liclass.client.payment.vo;


import com.liclass.common.vo.CommonVO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
@EqualsAndHashCode(callSuper = false)
public class PaymentVO extends CommonVO{
	private String merchant_uid="";
	private int r_no=0;
	private long user_no=0;
	private String pay_pg="";
	private String pay_method="";
	private String pay_name="";
	private int pay_price=0;
	private String pay_buyer_name="";
	private String pay_buyer_tel="";
	private String pay_buyer_email="";
	private String pay_date="";
	private int pay_status=0;
	private int pay_point=0;
}
