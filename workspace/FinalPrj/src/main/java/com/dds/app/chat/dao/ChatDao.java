package com.dds.app.chat.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.dds.app.chat.vo.ChatBoardVo;
import com.dds.app.chat.vo.ChatVo;
import com.dds.app.common.page.PageVo;

@Repository
public class ChatDao {

	public List<ChatBoardVo> getChatBoardList(SqlSessionTemplate sst , PageVo pv) {
		int limit = pv.getBoardLimit(); 
		int offset = (pv.getCurrentPage()-1) * limit;
		RowBounds rb = new RowBounds(offset , limit);
		return sst.selectList("chat.getChatBoardList" , null , rb );
	}

	public int write(SqlSessionTemplate sst, ChatBoardVo vo) {
		return sst.insert("chat.write" , vo);
	}

	public ChatBoardVo getChat(SqlSessionTemplate sst, String num) {
		return sst.selectOne("chat.getChat" , num);
	}

	public int edit(SqlSessionTemplate sst, ChatBoardVo vo) {
		return sst.update("chat.edit" , vo);
	}

	public int delete(SqlSessionTemplate sst, String num) {
		return sst.update("chat.delete" , num);
	}

	public int getChatListCnt(SqlSessionTemplate sst) {
		return sst.selectOne("chat.getChatListCnt");
	}

	public int increaseHit(SqlSessionTemplate sst, String num) {
		return sst.update("chat.increaseHit" , num);
	}

	
		
	public void saveChatMessage(SqlSessionTemplate sst, /* String recipient, */ String sender, String message) {
        Map<String, Object> params = new HashMap<>();
        params.put("sender", sender);
		/* params.put("recipient", recipient); */
        
        params.put("message", message);

        sst.insert("chat.insertChatMessage", params);
    }

	public List<ChatVo> getChatList(SqlSessionTemplate sst) {
		return sst.selectList("chat.getChatList");
	}

}//class















