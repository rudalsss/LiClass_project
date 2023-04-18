package com.liclass.admin.login.vo;

import lombok.Data;

@Data
public class AdminLoginVo {
    private int admin_no = 0;
    private String admin_id = "";
    private String admin_pw = "";
    private String admin_name = "";
    private String admin_email = "";
}
