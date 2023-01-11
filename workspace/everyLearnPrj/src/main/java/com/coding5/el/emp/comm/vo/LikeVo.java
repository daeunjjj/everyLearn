package com.coding5.el.emp.comm.vo;

import lombok.Data;

@Data
public class LikeVo {
	
	private String likeNo;		//시퀀스
	private String empCommNo;	//게시글 번호	
	private String memberNo;	//멤버 번호
	private String likeCheck;	//좋아요 여부 // 1 : 좋아요 취소  0 : 좋아요 디폴트 0
	
	
	
}
