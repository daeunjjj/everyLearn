package com.coding5.el.qna.vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class QnaVo {

	
	private String no;
	private String mno;
	private String memberNo;
	private String ano;
	private String adminNo;
	private String category;
	private String nick;
	private String aNick;
	private String title;
	private String content;
	private String wContent;
	private String answerYn;
	private String enrollDate;
	private String modifyDate;
	private String del;
	private String adminCheck;
	private String photoName;
	private String thumb;	//첨부파일

	private MultipartFile thumbFile;
	

	
	//파일 업로드
	public boolean isEmpty() {
		
		if (thumbFile.isEmpty()) {return true;}
		if(thumbFile == null) return true;
		if(thumbFile.getSize() == 0) return true;
		
		return false;

	}
	
}
