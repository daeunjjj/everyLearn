package com.coding5.el.common.page;

import lombok.Data;

@Data
public class PageVo {
	private int listCount;
	private int currentPage; 
	private int pageLimit;   
	private int boardLimit;
	
	private int maxPage;
	private int startPage;
	private int endPage;
}
