package com.dds.app.product.reply.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.dds.app.product.reply.vo.PReplyVo;

@Repository
public class PReplyDao {

	public int write(SqlSessionTemplate sst, PReplyVo vo) {
		return sst.insert("productReply.write" , vo);
	}

	public List<PReplyVo> getReplyList(SqlSessionTemplate sst, String pNo) {
		return sst.selectList("productReply.getReplyList" , pNo);
	}

	public int delete(SqlSessionTemplate sst, PReplyVo rvo) {
		return sst.update("productReply.delete" , rvo);
	}

	public int edit(SqlSessionTemplate sst, PReplyVo vo) {
		return sst.update("productReply.edit" , vo);
	}

}








