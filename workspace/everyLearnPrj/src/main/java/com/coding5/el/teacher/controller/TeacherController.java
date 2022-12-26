package com.coding5.el.teacher.controller;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.coding5.el.member.vo.MemberVo;
import com.coding5.el.teacher.file.FileUploader;
import com.coding5.el.teacher.service.TeacherService;
import com.coding5.el.teacher.vo.TeacherVo;

@RequestMapping("teacher")
@Controller
public class TeacherController {
	
	@Autowired
	private TeacherService ts;

	
	//강사 등록
	@GetMapping("write")
	public String write() {
		return "teacher/enroll_write";
	}
	
	//강사 등록
	@PostMapping("write")
	public String write(TeacherVo vo, HttpServletRequest req, MemberVo mvo) {
		
		
		String changeName = "";
		if(!vo.isEmpty()) {
			changeName = FileUploader.upload(req, vo);
			
		}
		
		
		String changeName2 = "";
		if(!vo.isEmpty2()) {
			changeName2 = FileUploader.upload2(req, vo);
			
		}
		
		vo.setChangeName(changeName);
		vo.setChangeName2(changeName2);
		
		int result = ts.teacherEnroll(vo);
		
		
		vo.setNo(mvo.getMemberNo());
		
	
		int imgOk = ts.teacherImgEnroll(vo);
		
		
		if(result == 1 && imgOk == 1) {
			
			return "teacher/enroll_main";
			
		}else {
			return "common/error";
		}
		
	}
	
	
	@GetMapping("detail")
	public String detail() {
		return "teacher/detail";
	}
	
	
	
	@GetMapping("main")
	public String main() {
		return "teacher/enroll_main";
	}
	
	@GetMapping("info")
	public String info() {
		return "teacher/information";
	}
	
	@GetMapping("modify")
	public String modify() {
		return "teacher/career-modify";
	}
	
	
}
