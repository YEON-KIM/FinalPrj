package com.dds.app.admin.controller;


import com.dds.app.admin.service.AdminService;
import com.dds.app.admin.vo.AdminVo;
import com.dds.app.member.vo.MemberVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import java.lang.reflect.Member;
import java.util.List;

@Controller
@RequestMapping("admin/member")
public class AdminController {

    private final AdminService as;
    private final HttpSession session;

    @Autowired
    public AdminController(AdminService a, HttpSession session) {
        this.as = a;
        this.session = session;
    }

    @GetMapping("login")
    public String adminLogin(){
        return "admin/admin-login";

    }

    @PostMapping("login")
    public String login(AdminVo avo, HttpSession session) throws Exception {

        AdminVo loginAdmin = as.login(avo);

        if(loginAdmin != null){
            session.setAttribute("loginAdmin", loginAdmin);
            return "redirect:/admin/member/manage";

        }else{
            session.setAttribute("alertMsg", "로그인 실패...ㅠㅠ");
            System.out.println("관리자로그인 실패");
            return "redirect:/admin/login";
        }


    }
    @RequestMapping("logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/home";
    }

    //전체회원조회
    @GetMapping("list")
    public String list(Model model){
        //서비스
        List<MemberVo> list = as.getMemberList();
        model.addAttribute("voList", list);

        return "admin/list";

    }


    @GetMapping("manage")
    public String manage(){
        return "admin/adminManage";
    }

    //회원개인조회
    @GetMapping("one/{no}")
    public String getMemberByNo(@PathVariable String no, Model model){

        MemberVo vo = as.getMemberByNo(no);
        model.addAttribute("vo", vo);
        return "admin/member/detail";
    }

    @PostMapping("delete")
    public String deleteMember(@ModelAttribute("vo") MemberVo vo, RedirectAttributes ra) throws Exception {
        int result = as.deleteMember(vo);

        if (result != 1) {
            throw new Exception();
        }

        ra.addFlashAttribute("alertMsg", "삭제하기 성공!");
        return "redirect:/admin/member/list";
    }


}
