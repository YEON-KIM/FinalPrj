package com.dds.app.cs.service;

import com.dds.app.common.file.FileVo;
import com.dds.app.common.page.PageVo;
import com.dds.app.cs.dao.CsDao;
import com.dds.app.cs.vo.CsVo;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;


@Service
@Transactional
public class CsService {

    private final CsDao dao;
    private final SqlSessionTemplate sst;

    public CsService(CsDao dao, SqlSessionTemplate sst){
        this.dao=dao;
        this.sst=sst;

    }
    public List<CsVo> getCsList(PageVo pv, Map<String, String> searchMap){
        return dao.getCsList(sst, pv, searchMap);
    }


    public int getCnt(Map<String, String> searchMap) {
        return dao.getCnt(sst, searchMap);
    }
    
	public int write(CsVo vo, List<FileVo> fvoList) throws Exception{
		int CsResult = dao.write(sst, vo);
		int attResult = 1;
		if (fvoList.size() > 0) {
			attResult = dao.insertAttachment(sst, fvoList);
		}
		return CsResult*attResult;
	}
	public CsVo getCs(String no) throws Exception{
		
		CsVo csvo = dao.getCs(sst, no);
		
		return csvo;
	}

}
