package com.dds.app.cs.dao;

import com.dds.app.common.file.FileVo;
import com.dds.app.common.page.PageVo;
import com.dds.app.cs.vo.CsVo;
import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class CsDao {
    public List<CsVo> getCsList(SqlSessionTemplate sst, PageVo pv, Map<String, String> searchMap) {
        int limit = pv.getBoardLimit();
        int offset = (pv.getCurrentPage()-1)*limit;
        RowBounds rb = new RowBounds(offset, limit);
        return sst.selectList("cs.getCsList", searchMap, rb);
    }

    public int getCnt(SqlSessionTemplate sst, Map<String, String> searchMap) {
        return sst.selectOne("cs.getCnt", searchMap);
    }

	public int write(SqlSessionTemplate sst, CsVo vo) {
		
		return sst.insert("cs.write", vo);
	}

	public int insertAttachment(SqlSessionTemplate sst, List<FileVo> fvoList) {
		
		return sst.insert("cs.insertAttachment", fvoList);
	}

	public CsVo getCs(SqlSessionTemplate sst, String no) {
		
		return sst.selectOne("cs.getCs", no);
	}


}
