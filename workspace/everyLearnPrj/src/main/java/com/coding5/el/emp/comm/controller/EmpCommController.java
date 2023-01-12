package com.coding5.el.emp.comm.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.coding5.el.emp.comm.service.EmpCommService;
import com.coding5.el.emp.comm.vo.CommentVo;
import com.coding5.el.emp.comm.vo.EmpCommVo;
import com.coding5.el.emp.comm.vo.LikeVo;
import com.coding5.el.member.vo.MemberVo;
import com.coding5.el.notice.vo.PageVo;

import lombok.extern.slf4j.Slf4j;


@RequestMapping("emp-comm")
@Controller
@Slf4j
public class EmpCommController {
	
	@Autowired private EmpCommService empCommService;
	
	//채용 커뮤니티 리스트
	@GetMapping(value = {"/list/{page}", "/list"})
	public String list(Model model, @PathVariable(required=false) String page) throws Exception {
		if(page == null) page = "1";
		
		//페이징 객체 필요함
		int cntPerPage = 10; //한 페이지당 row10개씩 보여주기
		int pageBtnCnt = 5;	//한번에 보여줄 페이지버튼 개수
		int totalRow = empCommService.getEmpCommCnt();	//db에 있는 모든 row 개수
		PageVo pageVo = new PageVo(page, cntPerPage, pageBtnCnt, totalRow);
		
		//리스트 조회
		List<EmpCommVo> list = empCommService.getEmpCommList(pageVo);
		model.addAttribute("list", list);
		model.addAttribute("page", pageVo);
		
		return "emp-comm/list";
	}
	
	//채용 커뮤니티 글쓰기
	@GetMapping("write")
	public String write() {
		return "emp-comm/write";
	}
	
	@PostMapping("write")
	public String write(EmpCommVo vo, HttpSession session, Model model ) throws Exception {
		
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
		vo.setNick(loginMember.getMemberNo());
		
		int result = empCommService.write(vo);
		if(result > 0) {
			session.setAttribute("alertMsg", "게시글이 작성되었습니다.");
			return "redirect:/emp-comm/list";
		}else {
			model.addAttribute("msg", "게시글 작성 실패되었습니다.");
			return "common/error";
		}
		
	}
	
	//채용 커뮤니티 글 수정하기
	@GetMapping("edit")
	public String edit(@RequestParam("no")String no, Model model) throws Exception {
		model.addAttribute("n", empCommService.selectDetail(no));
		
		return "emp-comm/edit";
	}
	
	@PostMapping("edit")
	public String edit(EmpCommVo vo, HttpSession session, Model model) throws Exception {
		
		int result = empCommService.editEmpComm(vo);
		
		if(result > 0) { 	
			session.setAttribute("alertMsg", "수정 성공");	
			return "redirect:/emp-comm/detail?no=" + vo.getNo();
		}
		else { // 실패 => 에러페이지 포워딩	
			model.addAttribute("errorMsg", "수정 실패");	
			return "common/error";
		}
		
	}

	//채용 커뮤니티 상세조회
	@GetMapping("detail")
	public String detail(@RequestParam("no") String no,  Model model, HttpSession session, EmpCommVo vo) throws Exception {
		
		MemberVo loginMember = (MemberVo) session.getAttribute("loginMember");
		//String memberNo = null;
		
		
		/*
		 * try { memberNo = loginMember.getMemberNo(); } catch (Exception e) {
		 * e.printStackTrace(); }
		 */
		 
		
		int result = empCommService.increaseHit(no);
		
		LikeVo heart = new LikeVo();
		//heart.setEmpCommNo(no);
		//heart.setMemberNo(memberNo);
		
		if(result > 0) {			
			EmpCommVo n = empCommService.selectDetail(no);
			model.addAttribute("n", n);
			
			/*
			 * heart = empCommService.findHeart(no, memberNo); model.addAttribute("heart",
			 * heart);
			 */
			
			
			return "emp-comm/detail";
		} else {
			return "common/error";
		}
		
	}
	
	//좋아요 컨트롤러
	@PostMapping("heart")
	@ResponseBody
	public int heart(@ModelAttribute LikeVo heart) throws Exception {
		int result = empCommService.insertHeart(heart);
		return result;
	}
	
	
	//게시글 삭제
	@GetMapping("delete")
	public String delete(String no) throws Exception {
		empCommService.deleteEmpComm(no);
		return "redirect:/emp-comm/list";
	}
	
	//댓글 쓰기
	@GetMapping("/comment/write")
	public String insertComment() {
		return "emp-comm/detail";
	}
	
	@PostMapping("/comment/write")
	@ResponseBody
	public String insertComment(@RequestParam("no") String no, @RequestParam("nick") String nick ) throws Exception {
		CommentVo vo = new CommentVo();
		vo.setEmpCommNo(no);
		vo.setNick(nick);
		empCommService.insertComment(vo);
		
		return "redirect:/emp-comm/detail?no=" + no;				
	}

	//ajax 요청을 받는 '/getCommentList' 를 controller와 mapping
	@GetMapping("/getCommentList")
	@ResponseBody
	private List<CommentVo> getCommentList(@RequestParam("no") String no) throws Exception {
		CommentVo vo = new CommentVo();
		vo.setEmpCommNo(no);
		return empCommService.getCommentList(vo);
	}
	
	
}//class
