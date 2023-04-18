package com.liclass.admin.login.controller;

import com.liclass.admin.login.service.AdminLoginService;
import com.liclass.admin.login.vo.AdminLoginVo;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@SessionAttributes("adminLogin")
@RequestMapping("/liadmin/*")
@Slf4j
public class AdminLoginController {

    @Setter(onMethod_ = @Autowired)
    private AdminLoginService adminLoginService;

    /********************************
     * 세션 객체를 받아오기 위한 메서드
     ********************************/
    @ModelAttribute
    public AdminLoginVo adminLogin() { return new AdminLoginVo();}

    /********************************
     * 관리자 로그인 화면 구현 메서드
     * 요청 URL : localhost:8090/liadmin/login
     ********************************/

    @GetMapping("/login")
    public String adminLoginForm(){

        return "admin/adminLoginForm";
    }


    /*****************************************
     * 로그인 처리 메서드
     *****************************************/
    @PostMapping("/login")
    public String loginProcess(AdminLoginVo login, Model model, RedirectAttributes ras){
        String url="";
        AdminLoginVo adminLogin = adminLoginService.loginProcess(login);

        if(adminLogin != null){
            model.addAttribute("adminLogin", adminLogin);
            log.info("성공");
            url = "/management/dashboard";

        } else{
            ras.addFlashAttribute("errorMsg", "아이디 혹은 비밀번호를 확인해 주세요.");
            log.info("실패");
            url = "/liadmin/login";

        }
        return "redirect:"+url;
    }

    /*************************************************************
     * 로그아웃 처리 메서드
     * setComplete() 메서드를 활용하여 세션을 할당 해지
     *************************************************************/
    @RequestMapping("/logout")
    public String logout(SessionStatus sessionStatus){
        sessionStatus.setComplete();
        return "redirect:/liadmin/login";
    }

    @RequestMapping("/adminAccount")
    public String adminAccount() {

        return "admin/management/adminAccount";
    }

    @RequestMapping(value = "/changeAdminPwd", method = RequestMethod.POST)
    public String changeAdminPwd(@ModelAttribute AdminLoginVo login, Model model){
        log.info("비밀번호 수정 메서드 호출");
        int result = 0;
        String url = null;

        result = adminLoginService.changeAdminPwd(login);
        if(result == 1){
            url = "/liadmin/login";

        } else{
            url = "/liadmin/adminAccount";
        }
        return "redirect:"+url;
    }
}
