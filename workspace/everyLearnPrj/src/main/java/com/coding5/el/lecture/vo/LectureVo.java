package com.coding5.el.lecture.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
public class LectureVo {

	
	private String no;
	private String teacherNo;
	private String category;
	private String className;
	private String classContent;
	private String recomm;
	private String studentCnt;
	private String price;
	private String enrollDate;
	private String modifyDate;
	private String deleteYn;
	private String classCnt;
	private String revAvg;
	private String reviewCnt;
	
	
	//세부강의
	private String detailno;
	private String classNo;
	private String chapter;
	private List<LectureVo> dcList;
	
	///파일
	private MultipartFile thumbFile;
	private MultipartFile logoFile;
	private String logo;
	private String thumb;
	
}
