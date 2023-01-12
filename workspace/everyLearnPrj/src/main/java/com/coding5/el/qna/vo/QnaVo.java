package com.coding5.el.qna.vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class QnaVo {

	
	private String no;			//게시글 번호
	private String mno;
	private String memberNo;	//회원 번호
	private String ano;			
	private String adminNo;		//관리자 번호
	private String category;	//카테고리
	private String nick;		//회원 닉네임
	private String aNick;		//관리자 닉네임
	private String title;		//질문 제목
	private String content;		//질문 내용
	private String answer;		//관리자 답변
	private String answerYn;	//답변 여부
	private String enrollDate;
	private String modifyDate;
	private String del;
	private String adminCheck;
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
