package com.kh.flowerheal.member.dto;

import java.sql.Timestamp;

import javax.persistence.Entity;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import lombok.Data;

@Entity
@Data
public class MemberDTO {
	@NotNull
	@Pattern(regexp="^\\w+@\\w+\\.\\w+(\\.\\w)?$",message="ex)aaa@bbb.com")
	private String id; 				// 아이디(이메일)
	
	@NotNull
	@Size(min=6, max=10,message="비밀번호는 6~10자리로 입력바랍니다.")
	private String pw; 				// 비밀번호
	

	/* @Pattern(regexp="^(02|010)-\\d{3,4}-\\d{4}$",message="ex)010-1234-1234") */
	private String tel;			  	// 전화번호
	
	@NotNull
	@Size(min=2, max=10, message="이름은 2~10자리로 입력바랍니다.")
	private String name;  		// 별명
	
	private String title;			// member or manager
	
	//주소DTO
	private String address;        //주소 form 태크
	private String zipNo;			// 우편번호
	private String roadAddrPart1;	// 도로명 주소 1
	private String addrDetail;			// 상세주소
	
	//private String birth;			// 생년월일
	private Timestamp cdate;				// 생성일자
	private Timestamp udate;				// 수정일자
	
}
