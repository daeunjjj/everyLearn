package com.coding5.el.member.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class MemberVo {
	
	private String memberNo;
	private String memberId;
	private String memberPwd;
	private String memberName;
	private String birth;
	private String phone;
	private String MemberNick;
	private String email;
	private String enrollDate;
	private String modifyDate;
	private String point;
	private String reportYn;
	private String quitYn;
	private String teaStatusYn;
	private int teaStatusYnNo;
	private String memberPwd1;
	private MultipartFile profileImg;

	//파일 업로드
	public boolean isEmpty() {
		
		if (profileImg.isEmpty()) {return true;}
		if(profileImg == null) return true;
		if(profileImg.getSize() == 0) return true;
		
		return false;

	}
	

}
