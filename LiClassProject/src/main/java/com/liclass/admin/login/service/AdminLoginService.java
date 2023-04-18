package com.liclass.admin.login.service;

import com.liclass.admin.login.vo.AdminLoginVo;

public interface AdminLoginService {
    public AdminLoginVo loginProcess(AdminLoginVo login);

    public int changeAdminPwd(AdminLoginVo login);
}
