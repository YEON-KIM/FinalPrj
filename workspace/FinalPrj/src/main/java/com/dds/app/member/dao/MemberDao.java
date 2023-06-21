package com.dds.app.member.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.dds.app.member.vo.MemberVo;
import com.dds.app.pay.vo.PayVo;

@Repository
public class MemberDao {

	//회원가입
	public int join(SqlSessionTemplate sst, MemberVo vo) {
		return sst.insert("member.join" , vo);
	}
	
//	//이메일 중복확인	(이메일을 아이디로 사용하기로 결정해서 주석처리)
//	public int checkEmail(SqlSessionTemplate sst, String email) {
//		return sst.selectOne("member.checkEmail" , email);
//	}

//	public MemberVo login(SqlSessionTemplate sst, MemberVo vo) {
//		
//		return sst.selectOne("member.login", vo);
//	}

	public MemberVo getMember(SqlSessionTemplate sst, MemberVo vo) {
		
		return sst.selectOne("member.login", vo);
	}

	public int checkId(SqlSessionTemplate sst, String id) {
		
		return sst.selectOne("member.checkId", id);
	}

	public int edit(SqlSessionTemplate sst, MemberVo vo) {
		System.out.println(vo);
		return sst.update("member.edit" , vo);
	}

	public MemberVo selectOneByNo(SqlSessionTemplate sst, MemberVo vo) {
		
		return sst.selectOne("member.getMember", vo);
	}

	public int checkNick(SqlSessionTemplate sst, String nick) {
		return sst.selectOne("member.checkNick", nick);
	}

	public int checkPhone(SqlSessionTemplate sst, String phone) {
		
		return sst.selectOne("member.checkPhone", phone);
	}

	public List<PayVo> getPayList(SqlSessionTemplate sst, String no) {
		return sst.selectList("member.getPayList", no);
	}

	public PayVo getPay(SqlSessionTemplate sst) {
		return sst.selectOne("member.getPay");
	}

}
