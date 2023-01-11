package com.coding5.el.member.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ClassListVo {
	
	private String classNo;
	private String score;
	private String content;
	private String enrollDate;
	private String className;
	
	
	//내 강의 & 진도율
	private String changeName;
	private String recomm;
	private String teacherNick;
	private String teacherNo;
	private String revAvg;
	
	//진도율
	private String detailNo;
	private String chapter;
	private String detailClassNo;
	private String mn;
	private String thumb;
	
	

	
	

}
