package com.liclass.client.classes.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@EqualsAndHashCode(callSuper = true)
@NoArgsConstructor
@AllArgsConstructor
public class ClientClassImgVO extends ClientClassVO {
	
	private int c_img_no=0;
	private int c_no=0;
	private String c_img_file="";
	private String thumbFile="";
	private String c_img_date="";
}
