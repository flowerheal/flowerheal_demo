package com.kh.flowerheal.bbs.dto;

import java.sql.Timestamp;

import javax.persistence.Entity;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Entity
@Data
public class RbbsDTO {
	private int rnum;					//댓글번호
	private int bnum;					//최초 원글
	
	private String rid;				//댓글작성자 아이디
	private String rnickname;	//댓글작성자 별칭
	@JsonFormat(pattern = "yyyy-MM-dd h:mm a", timezone = "Asia/Seoul")
	private Timestamp rcdate;	//댓글작성일시
	@JsonFormat(pattern = "yyyy-MM-dd h:mm a", timezone = "Asia/Seoul")
	private Timestamp rudate; //댓글수정일시
	@NotNull
	@Size(min=1,max=100, message="댓글은 100자까지 입력 가능합니다.")
	private String rcontent;	//댓글내용
	private int rgood;				//선호
	private int rbad;					//비선호
	private int rgroup;				//댓글그룹
	private int rstep;				//댓글단계
	private int rindent;			//댓글들여쓰기

}







