package com.coding5.el.class_comm.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.coding5.el.class_comm.service.ClassCommService;
import com.coding5.el.class_comm.vo.ClassCommVo;
import com.coding5.el.class_comm.vo.CommentVo;
import com.coding5.el.common.page.PageVo;
import com.coding5.el.common.page.Pagination;
import com.google.gson.Gson;

import lombok.extern.slf4j.Slf4j;

@Slf4j
//@RequestMapping("class")
@RequestMapping(value = "class", produces = "application/text; charset=utf8")
@Controller
public class ClassCommController {
	
	@Autowired
	private ClassCommService ccs;
	
	//게시글 삭제 (에이젝스)
	@PostMapping("deleteAjax")
	public String deleteAjax(String classCommNo) {
		
		int result = ccs.deleteWrite(classCommNo);
		
		log.info("result ::" + result);
		
		
		return "class_comm/qna";
	}

	//게시글 등록(화면)
	@GetMapping("write")
	public String write() {
		return "class_comm/comm_write";
	}
	
	//게시글 등록
	@PostMapping("write")
	public String write(ClassCommVo vo) {
		
		int result = ccs.write(vo);
		
		if(result != 1) {
			return "common/error";
		}
		
		return "redirect:/class/qna";
	}
	
	//질답 화면
	@GetMapping("qna")
	public String qna(Model model) {
		
		List<ClassCommVo> qnaList = ccs.qnaList();
		log.info("큐앤에이 리스트" + qnaList);
		model.addAttribute("qnaList", qnaList);
//		log.info("qnaList" + qnaList);
		
		if(qnaList == null) {
			return "common/error";
		}
		
		return "class_comm/qna";
	}
	
	//질문과 답변
	@PostMapping("qna")
	public String qna() {
		

		
		return "class_comm/qna";
	}
	
	//게시글 상세(화면)
	@GetMapping("detail")
	public String detail(String classCommNo, Model model) {
		
		
		ClassCommVo detailVo = ccs.detailVo(classCommNo);
		model.addAttribute("detailVo", detailVo);
		
		log.info("디테일브이오" + detailVo);
		
		//댓글 정보 조회
		List<CommentVo> commentList = ccs.commentList(classCommNo);
		log.info("댓글리스트" + commentList);
		model.addAttribute("commentList", commentList);
		model.addAttribute("classCommNo", classCommNo);
		
		
		
		
		return "class_comm/detail";
	}
	
	//댓글 에이젝스

	@PostMapping("commentAjax")
	@ResponseBody
	public String comment(String content, String memberNo, String classCommNo) {
		
		//댓글 인서트
		CommentVo vo = new CommentVo();
		vo.setComContent(content);
		vo.setComWriterNo(memberNo);
		vo.setComCommentNo(classCommNo);
		
		int result = ccs.writeComment(vo);
		log.info("vo ::" + vo);
		
		//댓글 셀렉트
//		List<CommentVo> commentOne = ccs.commemtOne(vo);
		List<CommentVo> commentList = ccs.commentList(classCommNo);
		
		Gson gson = new Gson();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("commentList", commentList);
		String commentListString = gson.toJson(commentList);
		
		log.info("commentOneString ::" + commentListString);
		
		
		return commentListString;
		
	}
	
	//신고(화면) >> 아직 작동 잘 안 됨!
	@GetMapping("report")
	public String report(String blacklist, String refortTitle, Model model) {
		
		log.info("블랙리스트" + blacklist);
		log.info("글 제목" + refortTitle);

	    Gson gson = new Gson();
	    HashMap<String, Object> map = new HashMap<String, Object>();
	    
	    // key-value 형태로 맵에 저장
	    map.put("blacklist", blacklist);
	    
	    model.addAttribute("reportMap", map);
	   
//	   // 맵을 JSON Object를 바꾸고 다시 문자열로 바꿈
//	    String jsonString = gson.toJson(map);
		
		return "class_comm/report_write";
		
	}
	

	
	//신고
	@PostMapping("reportInfo")
	@ResponseBody
	public String reportInfo(String blacklistNo, String accusor, String board, Model model) {
		
		ClassCommVo vo = new ClassCommVo();
		vo.setBlacklistNo(blacklistNo);
		vo.setAccusor(accusor);
		vo.setBoard(board);
		
		log.info("이건 인포" + vo);
		
		model.addAttribute("vo",vo);
		
		
		return "class_comm/report_write";
	}
	
	//신고
	@PostMapping("report")
	public String report(String blacklistNo, String accusor, String board, String cate_no ) {
		

		
		log.info("신고 :: "+blacklistNo);

		
		
//		log.info("신고"+vo);
		
//		int result = ccs.report(vo);
		
		return "main";
	}
	


	
	//스터디
	@GetMapping("study")
	public String study(String orderBy, String pNo,  Model model) {
		
		//데이터 꺼내기
		if(pNo == null) {
			pNo = "1";
		}
		
		String commCateNo = "2";
		
		//PageVo 객체 만들기
		int listCount = ccs.selectCnt(commCateNo);
		int currentPage =  Integer.parseInt(pNo);
		int pageLimit = 5;
		int boardLimit = 3;
		
		PageVo pv = Pagination.getPageVo(listCount, currentPage, pageLimit, boardLimit);
		
		List<ClassCommVo> studyList = ccs.studyList(orderBy, pv);
		log.info("리스트" + studyList);
		log.info("pv :: " + pv);
		model.addAttribute("studyList", studyList);
		model.addAttribute("pv", pv);
		
		if(studyList == null) {
			return "common/error";
		}
		return "class_comm/study";
	}
	
	//자유게시판
	@GetMapping("free")
	public String free(String orderBy, Model model) {
		
		List<ClassCommVo> freeList = ccs.freeList(orderBy);
//		log.info("리스트" + studyList);
		model.addAttribute("freeList", freeList);
		if(freeList == null) {
			return "common/error";
		}
		
		return "class_comm/free";
	}
	
	


	
	//사이드바
	@GetMapping("sidebar")
	public String sidebar() {
		return "class_comm/sidebar";
	}
	
	
}
