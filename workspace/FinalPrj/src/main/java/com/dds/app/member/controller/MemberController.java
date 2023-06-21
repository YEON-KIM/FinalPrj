package com.dds.app.member.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dds.app.common.file.FileUploader;
import com.dds.app.member.service.MemberService;
import com.dds.app.member.vo.MemberVo;
import com.google.gson.Gson;

@Controller
@RequestMapping("member")
public class MemberController {
	
	//서비스 객체
	private final MemberService ms;
	
	//파이널 변수라 값 넣어주기
	@Autowired
	public MemberController(MemberService x) {
		this.ms = x;
	}
	
	//회원가입 화면
	@GetMapping("join")
	public String join() {
		return "member/join";
	}
	
	//회원가입
	@PostMapping("join")
	public String join(MemberVo vo , HttpServletRequest req , HttpSession session , Model model) throws Exception{
		
		String path = req.getServletContext().getRealPath("/resources/upload/member/");
		String changeName = FileUploader.changeUpload(vo.getProfile() , path);
		vo.setProfileName(changeName);
		
		
		int result = ms.join(vo);
		
		if(result != 1) {
			//에러메시지 전달
			model.addAttribute("errorMsg" , "회원가입 실패 ...");
			return "member/join";
		}
		
		session.setAttribute("alertMsg", "회원가입 성공!");
		return "redirect:/member/login";
	}
	
	//아이디 중복확인
		@RequestMapping("id-check")
		@ResponseBody
		public String idCheck(String id) {
			
			int result = ms.checkId(id);
			
			if(result > 0) {
				return "isDup";
			}else {
				return "notDup";
			}
			
		}
		
		
		@RequestMapping("nick-check")
		@ResponseBody
		public String nickCheck(String nick) {
			
			int result = ms.checkNick(nick);
			
			System.out.println(result);
			
			if(result > 0) {
				return "isDup";
			}else {
				return "notDup";
			}
			
		}
		
		@RequestMapping("phone-check")
		@ResponseBody
		public String phoneCheck(String phone) {
			
		    int result = ms.checkPhone(phone);
		    
		    
		    System.out.println(result);
		    if (result > 0) {
		    	return "isDup";
		    } else {
		        return "notDup";
		    }
		}

		
	@GetMapping("login")
	public String login() {
		return "member/login-form";
	}
		

	@PostMapping("login")
	public String login(MemberVo vo , HttpSession session) throws Exception {

	    // 서비스
	    MemberVo loginMember = ms.login(vo);

	    if(loginMember == null) {
	        session.setAttribute("alertMsg", "로그인 실패 ... ");
	        return "redirect:/member/login";
	    } else {
			System.out.println(loginMember);
	        session.removeAttribute("alertMsg");
	    }

	    // 화면
	    session.setAttribute("loginMember", loginMember);
	    return "redirect:/home";

	}


	
	//로그아웃
		@RequestMapping("logout")
		public String logout(HttpSession session) {
			session.invalidate();
			return "redirect:/home";
		}
	
	
  
	@GetMapping("edit")
	public String edit() {
		return "member/edit";
	}
	
	@PostMapping("edit")
	public String edit(MemberVo vo, HttpSession session, Model model) throws Exception {
		
		MemberVo updatedMember = ms.edit(vo);
		
		System.out.println(updatedMember);
		
		
		if(updatedMember == null) {
			model.addAttribute("errorMsg", "정보 수정 실패...ㅠㅠ");
			return "common/error-page";
		}
		session.setAttribute("loginMember", updatedMember);
		session.setAttribute("alertMsg", "정보 수정 성공!!!");
		return "redirect:/home";
		
	}
	
	
	
	@RequestMapping("edit_dreamboard")
	public String edit_draemboard() {
		return "edit_dreamboard";
	}
	
	
	
	
	
	

}