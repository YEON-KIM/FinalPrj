package com.dds.app.chat.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dds.app.common.page.PageVo;
import com.dds.app.chat.dao.ChatDao;
import com.dds.app.chat.vo.ChatBoardVo;
import com.dds.app.chat.vo.ChatVo;

@Service
@Transactional
public class ChatService {
	
	private final ChatDao dao;
	private final SqlSessionTemplate sst;
	
	@Autowired
	public ChatService(ChatDao dao , SqlSessionTemplate sst) {
		this.dao = dao;
		this.sst = sst;
	}

	public List<ChatBoardVo> getChatBoardList(PageVo pv) {
		return dao.getChatBoardList(sst , pv);
	}

	public int write(ChatBoardVo vo) {
		return dao.write(sst , vo);
	}

	public ChatBoardVo getChat(String num) throws Exception {
		int result = dao.increaseHit(sst , num);
		
		if(result != 1) {
			throw new Exception();
		}
		
		return dao.getChat(sst , num);
	}

	public int edit(ChatBoardVo vo) {
		return dao.edit(sst , vo);
	}

	public int delete(String num) {
		return dao.delete(sst , num);
	}

	public int getChatListCnt() {
		return dao.getChatListCnt(sst);
	}

	public List<ChatVo> getChatList() {
		return dao.getChatList(sst);
	}

}





















