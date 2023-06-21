package com.dds.app.cs.controller;

import com.dds.app.common.file.FileUploader;
import com.dds.app.common.file.FileVo;
import com.dds.app.common.page.PageVo;
import com.dds.app.cs.service.CsService;
import com.dds.app.cs.vo.CsVo;
import com.dds.app.member.vo.MemberVo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Slf4j
@Controller
@RequestMapping("cs")
public class CsController {
	private final CsService cs;

	@Autowired
	public CsController(CsService cs) {
		this.cs = cs;
	}


	@GetMapping("list")
	public String getCsList(@RequestParam(defaultValue = "1") int page, @RequestParam Map<String, String> searchMap, Model model) {

		int listCount = cs.getCnt(searchMap);
		int currentPage = page;
		int pageLimit = 5;
		int boardLimit = 10;
		PageVo pv = new PageVo(listCount, currentPage, pageLimit, boardLimit);

		List<CsVo> csVoList = cs.getCsList(pv, searchMap);

		model.addAttribute("searchMap", searchMap);
		model.addAttribute("pv", pv);
		model.addAttribute("csVoList", csVoList);
		
		
		
		return "cs/list";
	}


	
	
	@GetMapping("write")
	public String join() {
	
		return "cs/write";
	}
	
	@PostMapping("write")
	public String write(@SessionAttribute("loginMember") MemberVo loginMember, CsVo vo, List<MultipartFile> f, HttpSession session, HttpServletRequest req) throws Exception{
		
		
		System.out.println(loginMember);
		
		if(loginMember == null) {
			throw new Exception("로그인 후 이용 가능합니다.");
			
		}
		
		String path = req.getServletContext().getRealPath("/resources/upload/cs/");
		List<String> changeNameList = FileUploader.upload(f, path);
		List<String> originNameList = FileUploader.getOriginNameList(f);
		
		//데이터 준비 (이름 리스트)
		List<FileVo> fvoList = new ArrayList<FileVo>();
		if(changeNameList != null) {
			int size = changeNameList.size();
			for (int i = 0; i < size; i++) {
				FileVo fvo = new FileVo();
				fvo.setOriginName(originNameList.get(i));
				fvo.setChangeName(changeNameList.get(i));
				fvoList.add(fvo);
			}
		}
		
		if("없음".equals(vo.getCategory())){
			vo.setCategory(null);
		}
		vo.setWriter(loginMember.getNick());
		
		int result = cs.write(vo, fvoList);
		if( result <= 0 ) {
			throw new Exception("게시글 작성 실패...ㅠㅠ");
		}
		return "redirect:/cs/list";
		
	}
	
	@GetMapping("detail")
	public String detail(String no, Model model)throws Exception {
		CsVo vo = cs.getCs(no);
		if(vo == null) {
			throw new Exception("게시글을 불러올 수 없습니다.");
		}
		model.addAttribute("csvo", vo);
		return "cs/detail";
	}

	
}
