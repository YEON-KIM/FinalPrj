package com.dds.app.product.reply.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.dds.app.member.vo.MemberVo;
import com.dds.app.product.reply.service.PReplyService;
import com.dds.app.product.reply.vo.PReplyVo;
import com.google.gson.Gson;

/**
 * 
 * @author 종찬
 *
 */
@RestController
@RequestMapping("product/reply")
public class PReplyController {
	
	private final Gson gson;
	private final PReplyService rs;
	
	@Autowired
	public PReplyController(PReplyService rs , Gson gson) {
		this.rs = rs;
		this.gson = gson;
	}

	/**
	 * 댓글 작성 메소드
	 * 
	 * @param vo 댓글 작성에 필요한 요소들
	 * @param session
	 * @return 성공했다는 메세지를 ajax통신을 통하여 return
	 */
	//댓글 작성
	@PostMapping("write")
	public String write(PReplyVo vo , HttpSession session) {
		
		MemberVo loginMember = (MemberVo) session.getAttribute("loginMember");
		
		if(loginMember == null) {
			return "unauthor";
		}
		
		String writerNo = loginMember.getNo();
		vo.setWriterNo(writerNo);

		System.out.println(vo);
		
		int result = rs.write(vo);
		
		if(result != 1) {
			return "fail";
		}
		
		return "ok";
	}
	
	/**
	 * 댓글 조회 메소드
	 * 
	 * @param pNo 댓글 다는 상품의 번호
	 * @return 댓글들을 ajax의 json(gson)방식을 통해 문자열을 return
	 */
	//댓글 목록 조회
	@GetMapping("list")
	public String list(String pNo) {
		
		//서비스
		List<PReplyVo> list = rs.getReplyList(pNo);
		
		String str = gson.toJson(list);
		
		//화면 == 문자열내보내기
		return str;
	}
	
	/**
	 * 댓글 삭제 메소드
	 * 
	 * @param rno 댓글 번호
	 * @param session
	 * @return 댓글 삭제 성공 여부를 return
	 * @throws Exception
	 */
	//댓글 삭제
	@DeleteMapping("delete")
	public String delete(String rno , HttpSession session) throws Exception {
		MemberVo loginMember = (MemberVo) session.getAttribute("loginMember");
		if(loginMember == null) {
			throw new Exception("로그인 plz");
		}
		String memberNo = loginMember.getNo();
		
		PReplyVo rvo = new PReplyVo();
		rvo.setNo(rno);
		rvo.setWriterNo(memberNo);
		
		int result = rs.delete(rvo);
		
		System.out.println("delete result : " + result);
		
		if(result == 1) {
			return "del-ok";
		}else {
			return "del-fail";
		}
	}
	
	/**
	 * 댓글 수정 메소드
	 * 
	 * @param vo 댓글 정보
	 * @param session
	 * @return 성공 여부를 return
	 */
	//댓글 수정
	@PostMapping("edit")
	public String edit(PReplyVo vo , HttpSession session) {
		
		//작성자 번호 셋팅
		MemberVo loginMember = (MemberVo) session.getAttribute("loginMember");
		if(loginMember == null) {
			throw new IllegalStateException("로그인 하고 오세요 ~~~");
		}
		vo.setWriterNo(loginMember.getNo());
		
		System.out.println(vo);
		
		//서비스
		int result = rs.edit(vo);
		
		//문자열 내보내기
		if(result == 1) {
			return "edit-ok";
		}else {
			return "edit-fail";
		}
	}
	
}
























