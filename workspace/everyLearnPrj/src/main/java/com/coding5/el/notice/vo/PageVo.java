package com.coding5.el.notice.vo;

import lombok.Data;

@Data
public class PageVo {
	
	//알고 있어야 하는 값
	private int currentPage;	//현재 페이지
	private int cntPerPage;	//페이지당 볼 수 있는 row 개수
	private int pageBtnCnt;	//한번에 보여주는 페이지버튼 개수
	private int totalRow;	//테이블의 전체 row 개수

	//위를 바탕으로 구하는 
	private int startRow;	//디비가서 조회할 rownum
	private int endRow;	//디비가서 조회할 rownum
	
	private int startPage;	//시작 페이지
	private int endPage;	//마지막 페이지
	private int lastPage;	//db의 row 기준으로 마지막 페이지는 몇페이지인지
	
	public PageVo(String currentPageStr, int cntPerPage, int pageBtnCnt, int totalRow) {
		int currentPage = Integer.parseInt(currentPageStr);
		this.currentPage = currentPage;
		this.cntPerPage = cntPerPage;
		this.pageBtnCnt = pageBtnCnt;
		this.totalRow = totalRow;
		calc(currentPage, cntPerPage, pageBtnCnt, totalRow);
	}
	
	private void calc(int currentPage, int cntPerPage, int pageBtnCnt, int totalRow) {
		//나머지 5개의 값 세팅
		this.setEndRow(this.getCurrentPage() * this.getCntPerPage());
		this.setStartRow(this.getEndRow() - this.getCntPerPage() + 1);
		
		int lastPage = this.getTotalRow() / this.getCntPerPage();
		if(this.getTotalRow() % this.getCntPerPage() > 0) {
			lastPage++;
		}
		this.setLastPage(lastPage);
		
		int endPage = this.getCurrentPage() / this.getPageBtnCnt();
		if(this.getCurrentPage() % this.getPageBtnCnt() > 0) {
			endPage++;
		}
		
		if(endPage > lastPage) {
			endPage = lastPage;
		}
		
		this.setEndPage(endPage * this.getPageBtnCnt());
		
		this.setStartPage(this.getEndPage() - this.getPageBtnCnt() + 1);
	}

}
