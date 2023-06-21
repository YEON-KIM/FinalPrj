package com.dds.app.admin.dao;

import com.dds.app.admin.vo.AdminVo;
import com.dds.app.member.vo.MemberVo;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public class AdminDao {
    public AdminVo login(SqlSessionTemplate sst, AdminVo avo) {
        return sst.selectOne("admin.member.login", avo);
    }

    public MemberVo getMemberByNo(SqlSessionTemplate sst, String no) {
        return sst.selectOne("admin.member.getMemberByNo", no);
    }

    public List<MemberVo> getMemberList(SqlSessionTemplate sst) {

        return sst.selectList("admin.member.getMemberList");
    }

    public int deleteMember(SqlSessionTemplate sst, MemberVo vo) {

        return sst.update("admin.member.deleteMember", vo);
    }
}
