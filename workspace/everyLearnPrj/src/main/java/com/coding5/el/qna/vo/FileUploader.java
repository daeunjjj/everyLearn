package com.coding5.el.qna.vo;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;

public class FileUploader {
	
	public static String upload(HttpSession session, QnaVo vo) {
		// 이미지 넣어줄 경로
		String path = session.getServletContext().getRealPath("/resources/upload/");
		
		// 프로필 이름
		String originName = vo.getPhotoFile().getOriginalFilename();
		
		// 확장자만 가져오기
		String ext = originName.substring(originName.lastIndexOf("."), originName.length());
		
		// 이름 바꾸기
		String photoName = System.currentTimeMillis() + "_" + (Math.random()*99999+1) +ext;
		
		File target = new File(path + photoName);
		
		try {
			vo.getPhotoFile().transferTo(target);
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
		return photoName;
	}
}
