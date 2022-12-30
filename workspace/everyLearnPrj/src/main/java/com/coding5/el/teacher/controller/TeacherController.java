package com.coding5.el.teacher.controller;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.coding5.el.member.vo.MemberVo;
import com.coding5.el.teacher.file.FileUploader;
import com.coding5.el.teacher.service.TeacherService;
import com.coding5.el.teacher.vo.TeacherVo;

import lombok.extern.slf4j.Slf4j;

@Slf4j
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
			System.out.println(changeName);
		}
		
		
		String changeName2 = "";
		if(!vo.isEmpty2()) {
			changeName2 = FileUploader.upload2(req, vo);
			System.out.println(changeName2);
		}
		
		vo.setChangeName(changeName);
		vo.setChangeName2(changeName2);
		
		vo.setNo(mvo.getMemberNo());
		
		int result = ts.teacherEnroll(vo);
		
		
		log.info("티쳐no" + vo.getNo());
		
		vo.setTeacherNo(vo.getNo());
	
		int imgOk = ts.teacherImgEnroll(vo);
		log.info("imgOk" + imgOk);
		log.info("result" + result);
		
		if(result == 1 && imgOk == 1) {
			
			return "teacher/enroll_main";
			
		}else {
			return "common/error";
		}
		
	}
	
	
	@GetMapping("detail")
	public String detail(String teacherNick, Model model) {
		
		List<TeacherVo> teacherDetailList = ts.teacherDetail(teacherNick);
		
		log.info("티쳐 디테일 ::" + teacherDetailList);
		
		TeacherVo vo = new TeacherVo();
		
		vo.setTeacherNick(teacherNick);
		
		model.addAttribute("teacherDetailList", teacherDetailList);
		model.addAttribute("teacherNick",teacherNick);
		
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
