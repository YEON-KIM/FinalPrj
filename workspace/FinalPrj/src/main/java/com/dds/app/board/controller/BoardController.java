package com.dds.app.board.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.dds.app.board.service.BoardService;
import com.dds.app.board.vo.BoardVo;
import com.dds.app.common.page.PageVo;
import com.dds.app.member.vo.MemberVo;

@Controller
@RequestMapping("board")
public class BoardController {
	
	private final BoardService bs;
	
	@Autowired
	public BoardController(BoardService bs) {
		this.bs = bs;
	}
	
	//목록조회
	@GetMapping("blist")
	public String getBoardList(@RequestParam(defaultValue = "1") int page,@RequestParam Map<String, String> searchMap ,Model model) {
		
		//데이터
		int listCount = bs.getCnt(searchMap);
		int currentPage = page;
		int pageLimit = 5;
		int boardLimit = 5;
		PageVo pv = new PageVo(listCount, currentPage, pageLimit, boardLimit);
		
		//서비스
		List<BoardVo> bvoList = bs.getBoardList(pv, searchMap);
		List<Map<String, String>> cvoList = bs.getCategoryList();
		//화면
		model.addAttribute("cvoList" , cvoList);
		model.addAttribute("searchMap" , searchMap);
		model.addAttribute("pv" , pv);
		model.addAttribute("bvoList" , bvoList);
		
			
		return "board/blist";
	}
	
	
	@GetMapping("bwrite")
	public String write() {
		return "board/bwrite";
	}
	
	
	//게시글 작성
	@PostMapping("bwrite")
	public String write(BoardVo vo , List<MultipartFile> f , HttpSession session , HttpServletRequest req) throws Exception {
		
		MemberVo loginMember = (MemberVo) session.getAttribute("loginMember");
		if( loginMember == null ) {
			throw new Exception("로그인 후 이용 가능합니다.");
		}
		
		
//		if (vo.getCategoryNo().equals("없음")) {
//			vo.setCategoryNo(null);
//			
//		}
		vo.setWriterNo(loginMember.getNo());

		int result = bs.write(vo);
		
		if (result != 1) {
			throw new Exception("게시글 작성 실패");
		}
		
		return "redirect:/board/blist";
	}
	
	//게시글 상세조회
	@GetMapping("bdetail")
	public String detail(String no, Model model) throws Exception {
		BoardVo vo = bs.getBoard(no);
		
		if (vo == null) {
			throw new Exception("게시글 상세 조회 실패");
		}
		
		model.addAttribute("bvo", vo);
		return "board/bdetail";
	}
	
	
	@GetMapping("bedit")
	public String edit() {
		return "board/bedit";
	}
	
	//게시글 수정하기
	@PostMapping("bedit")
	public String edit(BoardVo vo,  HttpSession session) throws Exception {
		MemberVo loginMember = (MemberVo) session.getAttribute("loginMember");
		if (loginMember == null) {
			throw new IllegalStateException("잘못된 접근입니다.");
		}
		String memberNo = loginMember.getNo();
		vo.setWriterNo(memberNo);
		
		
		
		
		int result = bs.updateBoard(vo);
		System.out.println(result);
		System.out.println(vo);
		if (result != 1) {
			throw new Exception("수정 실패...");
		}
		
		session.setAttribute("alertMsg", "수정 완료!");
		
		return "redirect:/board/bdetail?no=" +vo.getNo();
	}
	
	//삭제하기
	@GetMapping("bdelete")
	public String delete(BoardVo vo, HttpSession session) throws Exception {
		
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
		String writerNo = loginMember.getNo();
		
		vo.setWriterNo(writerNo);
		
		int result = bs.delete(vo);
		
		if (result != 1) {
			throw new Exception("삭제 실패");
		}
		
		session.setAttribute("alertMsg", "삭제 성공!");
		return "redirect:/board/blist";
		
	}

}
