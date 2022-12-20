package com.coding5.el.teacher.file;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import com.coding5.el.teacher.vo.TeacherVo;

public class FileUploader {
	
	public static String upload(HttpServletRequest req, TeacherVo vo) {
		
		//최상단 경로
		String path = req.getSession().getServletContext().getRealPath("/resources/upload/imgTeacher/");
		String originName = vo.getImgTeacher().get(0).getOriginalFilename();
//		String ext(== 확장자) = originName.substring(뒤에서 세어본 점의 인덱스, 문자열 길이);
		String ext = originName.substring(originName.lastIndexOf("."), originName.length());
		
		String changeName = "imgTeacher_ " + System.nanoTime()+ ext;
		
		File target = new File(path + changeName);
		
		//profile.transferTo(타겟파일);
		//이것만 쓰면 타겟파일에 파일 저장할 수 있음!!
		try {
			vo.getImgTeacher().get(0).transferTo(target);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return changeName;
	}
	
	public static String upload2(HttpServletRequest req, TeacherVo vo) {
		
		//최상단 경로
		String path = req.getSession().getServletContext().getRealPath("/resources/upload/record/");
		String originName = vo.getRecord().get(0).getOriginalFilename();
//		String ext(== 확장자) = originName.substring(뒤에서 세어본 점의 인덱스, 문자열 길이);
		String ext = originName.substring(originName.lastIndexOf("."), originName.length());
		
		String changeName2 = "record_ " + System.nanoTime()+ ext;
		
		File target = new File(path + changeName2);
		
		//profile.transferTo(타겟파일);
		//이것만 쓰면 타겟파일에 파일 저장할 수 있음!!
		try {
			vo.getRecord().get(0).transferTo(target);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return changeName2;
	}
	
}
