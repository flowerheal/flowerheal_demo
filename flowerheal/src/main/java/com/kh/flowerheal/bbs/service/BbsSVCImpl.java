package com.kh.flowerheal.bbs.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.kh.flowerheal.bbs.dao.BbsDAO;
import com.kh.flowerheal.bbs.dto.BbsDTO;
import com.kh.flowerheal.common.FindCriteria;
import com.kh.flowerheal.common.PageCriteria;
import com.kh.flowerheal.common.RecordCriteria;

@Service
public class BbsSVCImpl implements BbsSVC {

	private static Logger logger = LoggerFactory.getLogger(BbsSVCImpl.class);
	
	@Inject
	@Qualifier("bbsDAOImplXML")
	BbsDAO bbsDAO;
	
	@Override
	public int write(BbsDTO bbsDTO) {
		return bbsDAO.write(bbsDTO);
	}

	@Override
	public int modify(BbsDTO bbsDTO) {

		return bbsDAO.modify(bbsDTO);
	}

	@Override
	public int delete(String bnum) {

		return bbsDAO.delete(bnum);
	}

	@Override
	public BbsDTO view(String bnum) {

		return bbsDAO.view(bnum);
	}

	@Override
	public List<BbsDTO> list() {

		return bbsDAO.list();
	}

	@Override
	public List<BbsDTO> list(int starRec, int endRec) {

		return bbsDAO.list(starRec, endRec);
	}

	@Override
	public List<BbsDTO> list(int starRec, int endRec, String searchType, String keyword) {

		return bbsDAO.list(starRec, endRec, searchType, keyword);
	}

	@Override
	public int reply(BbsDTO bbsDTO) {

		return bbsDAO.reply(bbsDTO);
	}

	@Override
	public int totalRec() {

		return bbsDAO.totalRec();
	}

	@Override
	public int searchTotalRec(String searchType, String keyword) {

		return bbsDAO.searchTotalRec(searchType, keyword);
	}

//	@Override
//	public void list(HttpServletRequest request, Model model) {
//		
//		final int NUM_PER_PAGE = 10;				//한페이지에 보여줄 레코드수
//		final int PAGENUM_PER_PAGE = 10; 	  //한페이지에 보여줄 페이지수
//		
//		int reqPage = 0;										//요청페이지
//		int totalRec = 0;										//전체레코드 수
//
//		String searchType = null;						//검색타입
//		String keyword    = null;						//검색어
//		
//		RecordCriteria rc = null;						//한페이지에 보여줄 레코드수 계산하는 클래스
//		PageCriteria pc = null;							//한페이지에 보여줄 페이징 계산하는 클래스
//		FindCriteria fc = null;							//PageCriteira + 검색타입, 검색어
//	
//		//요청 페이지를 클라이언트로부터 get방식으로 받아옮
//		if(request.getParameter("reqPage") == null || 
//			 request.getParameter("reqPage") == "") {
//			reqPage = 1;
//		}else {
//			reqPage = Integer.parseInt(request.getParameter("reqPage"));
//		}
//			
//		//검색 매개값 체크(searchType, keyword)
//		searchType = request.getParameter("searchType");
//		keyword    = request.getParameter("keyword");
//		
//		//case1) 검색조건 없는경우
//		if(keyword  == null || keyword.trim().isEmpty()) {
//			
//			//전체레코드수 계산해오기
//			totalRec = bbsDAO.totalRec();
//			rc = new RecordCriteria(reqPage, NUM_PER_PAGE);
//			pc = new PageCriteria(rc, totalRec, PAGENUM_PER_PAGE);
//			
//			List<BbsDTO> list = bbsDAO.list(rc.getStartRecord(),rc.getEndRecord());
//			
//			model.addAttribute("list", list);
//			model.addAttribute("pc", pc);
//		}else {	
//	  //case2) 검색조건 있는경우
//			totalRec = bbsDAO.searchTotalRec(searchType,keyword);
//			
//			rc = new FindCriteria(reqPage, NUM_PER_PAGE, searchType, keyword);
//			pc = new PageCriteria(rc, totalRec, PAGENUM_PER_PAGE);
//			
//			List<BbsDTO> list = bbsDAO.list(rc.getStartRecord(),rc.getEndRecord(),
//					                            searchType,keyword);
//			
//			model.addAttribute("list", list);
//			model.addAttribute("pc", pc);	
//		}				
//	}
	@Override
	public void list(String reqPage, String searchType, String keyword, Model model) {
		
		
		final int NUM_PER_PAGE = 10;				//한페이지에 보여줄 레코드수
		final int PAGENUM_PER_PAGE = 10; 	  //한페이지에 보여줄 페이지수
		
		int totalRec = 0;										//전체레코드 수
	
		RecordCriteria rc = null;						//한페이지에 보여줄 레코드수 계산하는 클래스
		PageCriteria pc = null;							//한페이지에 보여줄 페이징 계산하는 클래스
		FindCriteria fc = null;							//PageCriteira + 검색타입, 검색어
	
		int l_reqPage = 0;

		//요청 페이지정보가 없으면 1로 초기화 한다.
		if(reqPage  == null || reqPage.trim().isEmpty()) {
			l_reqPage = 1;
		}else {
			l_reqPage = Integer.parseInt(reqPage);
		}
				
		//case1) 검색조건 없는경우
		if(keyword  == null || keyword.trim().isEmpty()) {
			
			//전체레코드수 계산해오기
			totalRec = bbsDAO.totalRec();
			rc = new RecordCriteria(l_reqPage, NUM_PER_PAGE);
			pc = new PageCriteria(rc, totalRec, PAGENUM_PER_PAGE);
			List<BbsDTO> list = bbsDAO.list(rc.getStartRecord(),rc.getEndRecord());
			System.out.println(list);
			model.addAttribute("list", list);
			model.addAttribute("pc", pc);
		}else {	
	  //case2) 검색조건 있는경우
			totalRec = bbsDAO.searchTotalRec(searchType,keyword);
			
			rc = new FindCriteria(l_reqPage, NUM_PER_PAGE, searchType, keyword);
			pc = new PageCriteria(rc, totalRec, PAGENUM_PER_PAGE);
			
			List<BbsDTO> list = bbsDAO.list(rc.getStartRecord(),rc.getEndRecord(),
					                            searchType,keyword);
			
			model.addAttribute("list", list);
			model.addAttribute("pc", pc);	
		}			
	}		

}
















