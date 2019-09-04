package com.kh.flowerheal.common;

public class FindCriteria extends RecordCriteria {
	private String searchType;		//검색어타입
	private String keyword;				//검색어
	
	public FindCriteria() {
		super();
	}
	public FindCriteria(int reqPage, int numPerPage) {
		super(reqPage, numPerPage);
	}
	public FindCriteria(int reqPage, int numPerPage, String searchType, String keyword) {
		this(reqPage,numPerPage);
		this.searchType = searchType;
		this.keyword = keyword;
	}
	
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	@Override
	public String toString() {
		return "FindCriteria [searchType=" + searchType + ", keyword=" + keyword + "]";
	}

}
