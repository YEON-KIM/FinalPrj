package com.dds.app.admin.service;

import com.dds.app.admin.dao.AdminDao;
import com.dds.app.admin.vo.AdminVo;
import com.dds.app.member.vo.MemberVo;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class AdminService {

    @Autowired
    private final SqlSessionTemplate sst;

    private final AdminDao dao;

    public AdminService(SqlSessionTemplate sst, AdminDao dao){
        this.sst = sst;
        this.dao = dao;

    }

    public AdminVo login(AdminVo avo) throws Exception{
        return dao.login(sst, avo);

    }

    public MemberVo getMemberByNo(String no) {
        return dao.getMemberByNo(sst, no);
    }

    public List<MemberVo> getMemberList() {

        return dao.getMemberList(sst);
    }

    public int deleteMember(MemberVo vo) {
        return dao.deleteMember(sst, vo);
    }
}
