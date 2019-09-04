package com.kh.flowerheal.common;

import lombok.Data;

@Data
public class Code {
	
	private String code; //코드값
	private String label; //라벨명
	
	public Code() {}
	public Code(String code, String label) {
		super();
		this.code = code;
		this.label = label;
	}
	
	
}
