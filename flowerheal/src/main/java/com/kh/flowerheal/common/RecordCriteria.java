package com.kh.flowerheal.common;

public class RecordCriteria {
	private int reqPage;			//요청 페이지
	private int numPerPage;		//한페이지에 보여줄 레코드수
	
	public RecordCriteria() {	}	//디폴트 생성자
	public RecordCriteria(int reqPage, int numPerPage) {
		this.reqPage = reqPage;
		this.numPerPage = numPerPage;
	}
	public int getReqPage() {
		return reqPage;
	}
	public void setReqPage(int reqPage) {
		this.reqPage = reqPage;
	}
	public int getNumPerPage() {
		return numPerPage;
	}
	public void setNumPerPage(int numPerPage) {
		this.numPerPage = numPerPage;
	}
	
	//case1) 시작레코드번호	= 종료레코드번호 - 한페이지에 보여줄 레코드 수 + 1
	//case2) 시작레고드번호 = (요청페이지-1) * 한페이지에 보여줄 레코드수 + 1
	public int getStartRecord() {
//		return this.getEndRecord() - this.numPerPage + 1;
		return (this.reqPage - 1) * this.numPerPage + 1;
	}
	
	//종료레코드번호	= 요청페이지 * 한페이지에 보여줄 레코드 수
	public int getEndRecord() {
		return this.reqPage * this.numPerPage;
	}
	
	@Override
	public String toString() {
		return "RecordCriteria [reqPage=" + reqPage + ", numPerPage=" + numPerPage + "]";
	}

	
	public static void main(String[] args) {
		RecordCriteria rc = new RecordCriteria(2, 10);
		System.out.println(rc.getStartRecord()+"-"+rc.getEndRecord());
	}
}
