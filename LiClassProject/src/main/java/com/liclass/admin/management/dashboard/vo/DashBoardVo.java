package com.liclass.admin.management.dashboard.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.HashMap;
import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class DashBoardVo {

    //유저 통계 12개의 필드(컬럼)
    private long user_no = 0;
    private String user_email = "";
    private String user_pw = "";
    private String user_name = "";
    private String user_tel = "";
    private String user_img = "";
    private int user_point = 0;
    private String user_regdate = "";
    private String user_update = "";
    private String user_unregdate = "";
    private int user_status = 0;
    private int user_type = 0;

    private int r_no = 0;
    private int ep_no = 0;
    private String c_title = "";
    private String r_date = "";
    private int r_price = 0;
    private int r_state = 0;

    private int r_cnt = 0;

    //결제 통계
    private int pay_price =0;
    private String pay_date = "";

    private List<DashBoardVo> dashBoardVoList;
    private HashMap<String, Integer> userState;

    private HashMap<String, Integer> userReserve;
}
