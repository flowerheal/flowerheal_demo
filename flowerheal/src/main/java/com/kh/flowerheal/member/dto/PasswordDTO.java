package com.kh.flowerheal.member.dto;

import lombok.Data;

@Data
public class PasswordDTO {
	private String id;		//아이디
	private String nowPw;	//현재 비밀번호
	private String newPw; //변경할 비밀번호
}
