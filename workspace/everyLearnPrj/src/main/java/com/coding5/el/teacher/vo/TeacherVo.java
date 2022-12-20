package com.coding5.el.teacher.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class TeacherVo {
	
	private String no;
	private String memberNo;
	private String classCate;
	private String career;
	private String shortIntro;
	private String introduce;
	private String enrollDate;
	private String modifyDate;
	private String statusYn;
	private String checkYn;
	private List<MultipartFile> imgTeacher;
	private List<MultipartFile> record;
	private String changeName;
	private String changeName2;
	
	//파일 : 강사 프로필
	public boolean isEmpty() {
		
		if (imgTeacher.get(0).isEmpty()) {return true;}
		if(imgTeacher == null) return true;
		if(imgTeacher.size() == 0) return true;
		
		return false;

	}
	
	//파일 : 강사 이력서
	public boolean isEmpty2() {
		
		if (record.get(0).isEmpty()) {return true;}
		if(record == null) return true;
		if(record.size() == 0) return true;
		
		return false;

	}
	
}
