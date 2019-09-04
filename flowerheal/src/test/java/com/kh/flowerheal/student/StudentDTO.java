package com.kh.flowerheal.student;

import lombok.Data;

@Data
class StudentDTO{
	private String id;
	private String name;
	private int kor;
	private int eng;
	private int math;
}