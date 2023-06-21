package com.dds.app.member.vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class MemberVo {

	
	private String no;				//자동
	
	private String id;				//카카오이메일을 아이디로 사용
	private String password;		//정규식 필요
	private String nick;			//카카오톡 제공(닉네임)
	private String gender;			//카카오톡 제공(성별)
	private String name;			//입력요구(실명)
	private String jumin;			//주민번호(API 붙여보자)
	private String phone;			//입력요구(폰번호)
	private String address;			//입력요구(주소, API 붙여보자)
	private String enroll_date;		//자동
	private String quit_yn;			//자동
	private String con_yn;			//자동
	private MultipartFile profile;
	private String profileName;
	private String pr;				//추가 (230522, 자기소개)
	
}
