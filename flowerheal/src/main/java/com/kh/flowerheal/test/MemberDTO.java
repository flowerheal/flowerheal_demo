package com.kh.flowerheal.test;

import javax.persistence.Entity;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import lombok.Data;

@Entity
@Data
public class MemberDTO {
	@NotNull
	@Size(min=3,max=10,message="ex)aaa@bbb.com")
	private String id; 				// 아이디(이메일)
		
	@NotNull
	@Size(min=4, max=10, message="닉네임은 4~10자리로 입력바랍니다.")
	private String nickname;  		// 별명
	
	@NotNull(message = "기본입력값")
	private String age;			// 나이
	
	private String region;			// 지역
	
}
