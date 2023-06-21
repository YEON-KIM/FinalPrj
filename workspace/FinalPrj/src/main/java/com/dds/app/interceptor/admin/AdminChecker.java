package com.dds.app.interceptor.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dds.app.admin.vo.AdminVo;
import com.dds.app.member.vo.MemberVo;
import org.springframework.web.servlet.HandlerInterceptor;

public class AdminChecker implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {

        HttpSession session = request.getSession();
        AdminVo loginAdmin = (AdminVo) session.getAttribute("loginAdmin");

        if(loginAdmin==null) {
            throw new IllegalStateException("로그인 해주세요");
        }

        String ADMIN = "admin@gmail.com";
        if(!ADMIN.contentEquals(loginAdmin.getId())){
            throw new IllegalStateException("서비스 준비중입니다");
        }

        return true;
    }
}