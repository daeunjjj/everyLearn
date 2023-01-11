package com.coding5.el.notice.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class NoticeVo {
	
	private String no;			//글 번호
	private String title;		//제목
	private String content;		//내용	
	private String admin;		//작성자
	private String hit;			//조회수
	private String enrollDate;	//작성 날짜
	private String modifyDate;	//수정 날짜
	private String del;			//삭제
	private String thumb;	//첨부파일
	
	private MultipartFile thumbFile;
	
	//관리자 닉네임
	private String adminNick;
	
	
	//파일 업로드
	public boolean isEmpty() {
		
		if (thumbFile.isEmpty()) {return true;}
		if(thumbFile == null) return true;
		if(thumbFile.getSize() == 0) return true;
		
		return false;

	}

}
