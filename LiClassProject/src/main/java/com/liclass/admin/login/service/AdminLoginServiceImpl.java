package com.liclass.admin.login.service;

import com.liclass.admin.login.dao.AdminLoginDao;
import com.liclass.admin.login.vo.AdminLoginVo;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminLoginServiceImpl implements AdminLoginService{
    @Setter(onMethod_ = @Autowired)
    private AdminLoginDao adminLoginDao;

    @Override
    public AdminLoginVo loginProcess(AdminLoginVo login){
        AdminLoginVo adminLogin = adminLoginDao.loginProcess(login);

        return adminLogin;
    }

    @Override
    public int changeAdminPwd(AdminLoginVo login) {
        int result = 0;

        result = adminLoginDao.changeAdminPwd(login);
        return result;
    }

}
