package com.dds.app.chat.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.dds.app.chat.service.ChatService;
import com.dds.app.chat.vo.ChatBoardVo;
import com.dds.app.chat.vo.ChatVo;
import com.dds.app.common.page.PageVo;
import com.dds.app.member.vo.MemberVo;

@Controller
@RequestMapping("chat")
public class ChatController {

	private final ChatService cs;

	@Autowired
	public ChatController(ChatService cs) {
		this.cs = cs;
	}

	/**
	 * 채팅게시판 목록 조회
	 * 
	 * @param model
	 * @param page
	 * @return 채팅게시판 목록 경로
	 * 
	 * @author 강호
	 */
	@GetMapping("list")
	public String ChatBoardList(Model model ,@RequestParam(defaultValue = "1") int page) {

		//페이징 처리
		int listCount = cs.getChatListCnt();
		int currentPage = page;
		int pageLimit = 5;
		int boardLimit = 10;

		PageVo pv = new PageVo(listCount, currentPage, pageLimit, boardLimit);
		List<ChatBoardVo> cvoList = cs.getChatBoardList(pv);

		//Page VO , ChatBoard
		model.addAttribute("pv", pv);
		model.addAttribute("cvoList", cvoList);
		return "chat/chatBoardList";
	}

	/**
	 * 채팅게시판 작성 화면
	 * 
	 * @param session
	 * @param model
	 * @return 채팅게시판 작성 화면 경로
	 * 
	 * @author 강호
	 */
	@GetMapping("write")
	public String write(HttpSession session , Model model) {

		MemberVo loginMember = (MemberVo) session.getAttribute("loginMember");
		if(loginMember == null) {
			model.addAttribute("errorMsg" , "작성 실패...");
			return "common/chatBoardList";
		}
		return "chat/chatBoardWrite";
	}

	/**
	 * 채팅게시판 작성
	 * 
	 * @param vo
	 * @param session
	 * @return 채팅게시판 작성 경로
	 * @throws Exception
	 * 
	 * @author 강호
	 */
	@PostMapping("write")
	public String write(ChatBoardVo vo , HttpSession session) throws Exception {

		//로그인 한 회원만 가능
		MemberVo loginMember = (MemberVo) session.getAttribute("loginMember");
		if( loginMember == null ) {
			throw new Exception("로그인 후 이용해주세요.");
		}

		vo.setWriterNo(loginMember.getNo());
		int result = cs.write(vo);

		if(result == 1) {
			session.setAttribute("alertMsg", "작성 성공!!!");
		}else {
			session.setAttribute("alertMsg", "작성 실패...");
		}

		return "redirect:/chat/list";
	}

	/**
	 * 채팅게시판 상세조회
	 * 
	 * @param num
	 * @param model
	 * @return 채팅게시판 상세조회 경로
	 * @throws Exception
	 * 
	 * @author 강호
	 */
	@GetMapping("detail")
	public String detail(String num , Model model) throws Exception {

		ChatBoardVo vo = cs.getChat(num);

		if(vo == null) {
			model.addAttribute("errorMsg", "조회 실패...");
			return "common/error-page";
		}

		List<ChatVo> chatVo = cs.getChatList();
		model.addAttribute("chatVo" , chatVo);

		model.addAttribute("vo" , vo);
		return "chat/chatBoardDetail";
	}

	/**
	 * 채팅게시판 수정
	 * 
	 * @param vo
	 * @param model
	 * @param session
	 * @return 채팅게시판 수정 경로
	 * 
	 * @author 강호
	 */
	@PostMapping("edit")
	public String edit(ChatBoardVo vo , Model model , HttpSession session) {
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
		String id = null;
		if(loginMember != null) {
			id = loginMember.getId();
		}



		int result = cs.edit(vo);

		if(result != 1) {
			model.addAttribute("errorMsg", "수정하기 실패 ...");
			return "common/error-page";
		}

		session.setAttribute("alertMsg", "수정하기 성공!!!");
		return "redirect:/chat/detail?num=" + vo.getNo();
	}

	/**
	 * 채팅게시판 삭제
	 * 
	 * @param num
	 * @return 채팅게시판 삭제 경로
	 * @throws Exception
	 * 
	 * @author 강호
	 */
	@GetMapping("delete")
	public String delete(String num) throws Exception {
		int result = cs.delete(num);

		if(result != 1) {
			throw new Exception("삭제 실패 ...");
		}
		return "redirect:/chat/list?page=1";
	}

	/**
	 * 채팅방 생성
	 * 
	 * @param session
	 * @return 채팅방 경로
	 */
	@GetMapping("room")
	public String Chat(HttpSession session) {
		return "chat/room";
	}

	



}//class








