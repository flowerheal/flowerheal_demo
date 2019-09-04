package com.kh.flowerheal.common;

public class PageCriteria {
	
	private int pageNumPerPage;			//한페이지에 보여줄 페이지수(상수 10)
	private int startPage;					//한페이지의 시작페이지
	private int endPage;						//한페이지의 종료페이지
	
	private int totalRec;						//전체 레코드수
	private int finalEndPage;				//최종 페이지
	
	private boolean prev;						//이전페이지
	private boolean next;						//다음페이지
	
	private RecordCriteria rc;			//한페이지에 보여줄레코드 수, 요청페이지

	public PageCriteria() {}
	public PageCriteria(RecordCriteria rc, int totalRec, int pageNumPerPage) {
		this.rc = rc;
		this.totalRec = totalRec;
		this.pageNumPerPage = pageNumPerPage;
		init();
	}
		
	private void init() {
		//1)endPage계산 :	올림(요청페이지/한페이지에 보여줄 페이지수) * 한페이지에 보여줄 페이지수
		this.endPage = (int)Math.ceil((this.rc.getReqPage() / 
				(double)this.pageNumPerPage)) * this.pageNumPerPage;
		
		//2)startPage계산 : 한페이지의 종료페이지 - 한페이지에 보여줄 페이지수 + 1
		this.startPage = this.endPage - this.pageNumPerPage + 1;
		
		//3)finalEndPage계산 : 올림(전체레코드수 / 한페이지에 보여줄 페이지수)
		this.finalEndPage = (int)Math.ceil((this.totalRec / (double)this.pageNumPerPage));
		if(this.endPage > this.finalEndPage) {
			endPage = finalEndPage;
		}
		
		//4)prev 계산 : 현재페이지의 시작페이지가 1이 아니면 버튼 보이기
		this.prev = this.startPage != 1 ? true : false;
		
		//5)next계산 : 현재페이지의 종료페이지 * 한페이지에 보여줄 레코드수가 전체 레코드수보다 작으면 다음 버튼 보이기
		this.next = this.endPage * this.rc.getNumPerPage() < this.totalRec ? true : false;

	}
	
	//파라미터 설정
	public String makeURL() {
		StringBuffer str = new StringBuffer();
		
		if(rc.getReqPage() !=0 ) {
			str.append("reqPage="+rc.getReqPage());
		}
		
		return str.toString();
	}
	
	//검색용 파라미터 설정
	public String makeSearchURL(int reqPage) {
		
		StringBuffer str = new StringBuffer();
		str.append("reqPage="+reqPage);
		
		return str.toString();
	}
	
	//검색어타입 읽어오기
	public String getSearchType() {
		String searchType = null;
		if(rc instanceof FindCriteria) {
			searchType = ((FindCriteria)rc).getSearchType();
		}			
		return searchType;
	}
	
	//검색어 읽어오기
	public String getKeyword() {
		String keyword = null;
		if(rc instanceof FindCriteria) {
			keyword = ((FindCriteria)rc).getKeyword();
		}			
		return keyword;
	}
	
	public int getPageNumPerPage() {
		return pageNumPerPage;
	}

	public void setPageNumPerPage(int pageNumPerPage) {
		this.pageNumPerPage = pageNumPerPage;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getTotalRec() {
		return totalRec;
	}

	public void setTotalRec(int totalRec) {
		this.totalRec = totalRec;
	}

	public int getFinalEndPage() {
		return finalEndPage;
	}

	public void setFinalEndPage(int finalEndPage) {
		this.finalEndPage = finalEndPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public RecordCriteria getRc() {
		return rc;
	}

	public void setRc(RecordCriteria rc) {
		this.rc = rc;
	}

	@Override
	public String toString() {
		return "PageCriteria [pageNumPerPage=" + pageNumPerPage + ", startPage=" + startPage + ", endPage=" + endPage
				+ ", totalRec=" + totalRec + ", finalEndPage=" + finalEndPage + ", prev=" + prev + ", next=" + next + ", rc="
				+ rc + "]";
	}
}
