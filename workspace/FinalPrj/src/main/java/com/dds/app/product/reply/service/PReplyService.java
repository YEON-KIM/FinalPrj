package com.dds.app.product.reply.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dds.app.product.reply.dao.PReplyDao;
import com.dds.app.product.reply.vo.PReplyVo;

@Service
@Transactional
public class PReplyService {
	
	private final PReplyDao dao;
	private final SqlSessionTemplate sst;
	
	@Autowired
	public PReplyService(PReplyDao dao, SqlSessionTemplate sst) {
		this.dao = dao;
		this.sst = sst;
	}

	public int write(PReplyVo vo) {
		return dao.write(sst , vo);
	}

	public List<PReplyVo> getReplyList(String pNo) {
		return dao.getReplyList(sst, pNo);
	}

	public int delete(PReplyVo rvo) {
		return dao.delete(sst , rvo);
	}

	public int edit(PReplyVo vo) {
		return dao.edit(sst, vo);
	}

}




















