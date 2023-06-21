package com.dds.app.member.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dds.app.member.dao.MemberDao;
import com.dds.app.member.vo.MemberVo;
import com.dds.app.pay.vo.PayVo;

@Service
@Transactional
public class MemberService {

    @Autowired
    private final SqlSessionTemplate sst;
    private final MemberDao dao;
    private final BCryptPasswordEncoder enc;

    public MemberService(SqlSessionTemplate sst, MemberDao dao, BCryptPasswordEncoder enc) {
        this.sst = sst;
        this.dao = dao;
        this.enc = enc;
    }

    // 회원가입
    public int join(MemberVo vo) {
        String pwd = vo.getPassword();
        String encodedPwd = enc.encode(pwd);
        vo.setPassword(encodedPwd);

        
        return dao.join(sst, vo);
        
    }


    // 로그인
    public MemberVo login(MemberVo vo) throws Exception {
        MemberVo member = dao.getMember(sst, vo);
        
        if (member != null) {
            String userPwd = vo.getPassword();
            String dbPwd = member.getPassword();
            boolean result = enc.matches(userPwd, dbPwd);
            
            if (result) {
                return member; // 로그인 성공
            }
        }
        
        return null; // 로그인 실패
    }


    public MemberVo edit(MemberVo vo) throws Exception {

        String pwd = vo.getPassword();
        String encodedPwd = enc.encode(pwd);
        vo.setPassword(encodedPwd);

        int result = dao.edit(sst , vo);
        if(result != 1) {
            throw new Exception();
        }
        return dao.selectOneByNo(sst , vo);
    }
	// 이메일 중복확인
	public int checkId(String id) {
		return dao.checkId(sst, id);
	}

	public int checkNick(String nick) {
		
		return dao.checkNick(sst, nick);
	}

	public int checkPhone(String phone) {
	    return dao.checkPhone(sst, phone);
	}

	public List<PayVo> getPayList(String no) {
		return dao.getPayList(sst, no);
	}

	public PayVo getPay() {
		return dao.getPay(sst);
	}


}
