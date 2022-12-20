package com.coding5.el.notice.vo;

import lombok.Data;

@Data
public class NoticeVo {
	
	private String no;			//공지번호
	private String admin;		//작성자
	private String title;		//제목
	private String content;		//내용
	private String enrollDate;	//작성일시
	private String modifyDate;	//수정일시
	private String deleteYn;	//삭제여부
	private String hit;			//조회수

}
