package com.coding5.el.qna.vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class QnaVo {

	
	private String no;
	private String memberNo;
	private String category;
	private String title;
	private String content;
	private String answerYn;
	private String enrollDate;
	private String modifyDate;
	private String del;
	private String adminCheck;
	private String photoName;
	
	private MultipartFile photoFile;

	
	public boolean isEmpty() {
		
		if(photoFile.isEmpty()) {return true;}
		if(photoFile == null) {return true;}
		if(photoFile.getSize() == 0) {return true;}
		
		return false;
	}
	
}
