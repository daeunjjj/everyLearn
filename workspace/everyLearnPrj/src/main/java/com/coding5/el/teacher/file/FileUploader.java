package com.coding5.el.teacher.file;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import com.coding5.el.teacher.vo.TeacherVo;

public class FileUploader {
	
	public static String upload(HttpServletRequest req, TeacherVo vo) {
		
		//�ֻ�� ���
		String path = req.getSession().getServletContext().getRealPath("/resources/upload/imgTeacher/");
		String originName = vo.getImgTeacher().get(0).getOriginalFilename();
		String ext = originName.substring(originName.lastIndexOf("."), originName.length());
		
		String changeName = "imgTeacher_ " + System.nanoTime()+ ext;
		
		File target = new File(path + changeName);

		try {
			vo.getImgTeacher().get(0).transferTo(target);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return changeName;
	}
	
	public static String upload2(HttpServletRequest req, TeacherVo vo) {
		
		//�ֻ�� ���
		String path = req.getSession().getServletContext().getRealPath("/resources/upload/record/");
		String originName = vo.getRecord().get(0).getOriginalFilename();
//		String ext(== Ȯ����) = originName.substring(�ڿ��� ��� ���� �ε���, ���ڿ� ����);
		String ext = originName.substring(originName.lastIndexOf("."), originName.length());
		
		String changeName2 = "record_ " + System.nanoTime()+ ext;
		
		File target = new File(path + changeName2);
		
		//profile.transferTo(Ÿ������);
		//�̰͸� ���� Ÿ�����Ͽ� ���� ������ �� ����!!
		try {
			vo.getRecord().get(0).transferTo(target);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return changeName2;
	}
	
}
