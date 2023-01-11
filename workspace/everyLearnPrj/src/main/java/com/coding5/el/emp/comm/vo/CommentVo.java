package com.coding5.el.emp.comm.vo;

import lombok.Data;

@Data
public class CommentVo {

	private String no;			// 댓글 시퀀스
	private String empCommNo;	// 게시글 번호
	private String mno;			// 글쓴이 번호
	private String nick;		// 글쓴이 닉네임(data 타입은 넘버)
	
	private String content;		// 댓글 내용
	private String enrollDate;	// 작성 날짜
	private String modifyDate;	// 수정 날짜
	private String deleteYn;	// 삭제 여부
	
	
}
