package com.liclass.admin.login.dao;

import com.liclass.admin.login.vo.AdminLoginVo;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AdminLoginDao {
    public AdminLoginVo loginProcess(AdminLoginVo login);

    public int changeAdminPwd(AdminLoginVo login);
}
