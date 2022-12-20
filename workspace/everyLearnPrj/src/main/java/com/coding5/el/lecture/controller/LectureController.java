package com.coding5.el.lecture.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.coding5.el.lecture.service.LectureService;
import com.coding5.el.lecture.vo.DetailClassVo;
import com.coding5.el.lecture.vo.LectureVo;

@Controller
@RequestMapping("lecture")
public class LectureController {
	
	@Autowired
	private LectureService lectureService;
	
	
	//강의 메인리스트
	@GetMapping("main")
	public String main() {
		return "lecture/main";
	}
	
	//강의 메인리스트 - POST
	@PostMapping("main")
	public String main(LectureVo lvo) {
		
		
		return "lecture/main";
	}
	
	//강의 상세페이지
	@GetMapping("detail")
	public String detail() {
		return "lecture/lec_detail";
	}
	
	//강의 상세페이지 - 수강평
	@GetMapping("detail/review")
	public String review() {
		return "lecture/lec_review";
	}
	
	//본인이 결제한 강의 목차
	@GetMapping("mylist")
	public String mylist() {
		return "lecture/mylist";
	}
	
	//강의 내 질문과답변
	@GetMapping("qnalist")
	public String qnalist() {
		return "lecture/qnalist";
	}
	
	//질문과답변 작성
	@GetMapping("qnawrite")
	public String qnawrite() {
		return "lecture/qnawrite";
	}
	
	//질문과답변 상세페이지
	@GetMapping("qnadetail")
	public String qnadetail() {
		return "lecture/qnadetail";
	}
	
	//장바구니
	@GetMapping("cart")
	public String cart() {
		return "lecture/cart";
	}
	
	//결제완료
	@GetMapping("completePay")
	public String completePayment() {
		return "lecture/complete_payment";
	}
	
	//강의 등록
	@GetMapping("insert")
	public String insert() {
		return "lecture/insert";
	}
	
	//강의 등록 - post
	@PostMapping("insert")
	public String insert(LectureVo lvo, MultipartFile upfile, HttpSession session, Model model) {
		
		lvo.setTeacherNo((String)session.getAttribute("memberNo"));
		
		int result = lectureService.insertClassOne(lvo);
		
		if(result == 1) {
			session.setAttribute("alertMsg", "기본 정보 입력 완료.");
			return "redirect:/lecture/insert/detail";
		}else {
			model.addAttribute("errorMsg", " 게시글 등록에 실패하였습니다. ");
			return "common/errorPage";
		}
		
	}

	//강의 등록 - 세부(목차)
	@GetMapping("insert/detail")
	public String insertDetail() {
		return "lecture/insertDetail";
	}
	
	//강의 등록 - 세부(목차) - post
	@PostMapping("insert/detail")
	public String insertDetail(LectureVo lvo, DetailClassVo dcvo, List<DetailClassVo> dcList) {		
		
		
		
		int result = lectureService.insertClassDetail(lvo, dcvo, dcList);
		
		if(result == 1) {
			return "lecture/main";
		}else {
			return "common/errorPage";
		}
		
	
	}
}
