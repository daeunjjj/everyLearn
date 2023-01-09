package com.coding5.el.member.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class TeacherMemberVo {
	
	//강사관련
	private String teacherNick;
	private String teacherNo;
	private String shortIntro;
	private String career;
	private String teaImgchangeName;
	
	//강의관련
	private String className;
	private String recomm;
	private String studentCnt;
	private String price;
	private String classNo;
	private String clImgChangeName;
	private String totalPrice;
	
	

	
	
	//강의관련
	

}
