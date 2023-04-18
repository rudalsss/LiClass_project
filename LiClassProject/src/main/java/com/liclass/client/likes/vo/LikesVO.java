package com.liclass.client.likes.vo;

import com.liclass.common.vo.CommonVO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(callSuper = false)
public class LikesVO extends CommonVO{ //은아
	
		//4개의 필드(컬럼)
		private int like_no=0;
		private String like_regdate="";
		private long user_no=0;
		private int c_no=0;
		
}
