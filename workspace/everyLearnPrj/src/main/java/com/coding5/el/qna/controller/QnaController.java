package com.coding5.el.qna.controller;

import java.io.File;
import java.io.InputStream;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.coding5.el.admin.vo.AdminVo;
import com.coding5.el.common.file.FileUploader;
import com.coding5.el.member.vo.MemberVo;
import com.coding5.el.notice.vo.PageVo;
import com.coding5.el.qna.service.QnaService;
import com.coding5.el.qna.vo.QnaVo;

@Controller
@RequestMapping("qna")
public class QnaController {
	
	@Autowired QnaService qnaService;
	
	//QNA 리스트
	@GetMapping(value = {"/list/{page}", "/list"})
	public String list(Model model, @PathVariable(required=false) String page) throws Exception {
		if(page == null) page = "1";
		
		//페이징 객체 필요함
		int cntPerPage = 10; //한 페이지당 row10개씩 보여주기
		int pageBtnCnt = 5;	//한번에 보여줄 페이지버튼 개수
		int totalRow = qnaService.getQnaCommCnt();
		PageVo pageVo = new PageVo(page, cntPerPage, pageBtnCnt, totalRow);
		
		//리스트 조회
		List<QnaVo> list = qnaService.getQnaList(pageVo);
		model.addAttribute("list", list);
		model.addAttribute("page", pageVo);
		
		return "qna/list";
	}
	
	//QNA 사용자 글쓰기
	@GetMapping("memberWrite")
	public String write() throws Exception {
		
		return "qna/memberWrite";
	}

	@PostMapping("memberWrite")
	public String memberWrite(QnaVo vo, HttpSession session, Model model) throws Exception {
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
		vo.setMemberNo(loginMember.getMemberNo());	
		
		// qna 이미지 저장
		String thumbName = "";
		if(!vo.getThumbFile().isEmpty()) {
			thumbName = FileUploader.upload(session, vo.getThumbFile());
		}
		
		vo.setThumb(thumbName);
		
		int result = qnaService.memberWrite(vo);
		if(result > 0) {
			session.setAttribute("alertMsg", "문의글이 작성되었습니다.");
			return "redirect:/qna/list";
		}else {
			model.addAttribute("msg", "문의글 작성 실패되었습니다.");
			return "common/error";
		}
		
	}
	
	//QNA 관리자 답변 쓰기
	@GetMapping("adminWrite")
	public String adminWrite() throws Exception {
		return "qna/adminWrite";
	}
	
	@PostMapping("adminWrite")	//답변 update로
	public String adminWrite(QnaVo vo, HttpSession session, Model model) throws Exception {
		AdminVo loginAdmin = (AdminVo)session.getAttribute("loginAdmin");
		vo.setAdminNo(loginAdmin.getNo());
		
		// 답변 이미지 저장
		String thumbName = "";
		if(!vo.getThumbFile().isEmpty()) {
			thumbName = FileUploader.upload(session, vo.getThumbFile());
		}
		
		vo.setThumb(thumbName);
		
		int result = qnaService.adminWrite(vo);
		if(result > 0) {
			//답변 등록 된 순간에 답변 상태가 답변 Y로 update 되게 조회수처럼
			session.setAttribute("alertMsg", "답변이 등록되었습니다.");
			return "redirect:/qna/list";
		}else {
			model.addAttribute("msg", "답변 등록이 실패되었습니다.");
			return "common/error";
		}
		
	}
	
	
	
	//QNA 수정하기
	@GetMapping("edit")
	public String edit() {
		return "qna/edit";
	}
	
	//QNA 상세보기
	@GetMapping("detail")
	public String detail() {
		return "qna/detail";
	}
		
	
	@ResponseBody
	@RequestMapping(value = "/file-upload", method = RequestMethod.POST)
	public String fileUpload(
			@RequestParam("article_file") List<MultipartFile> multipartFile
			, HttpServletRequest request) {
		
		String strResult = "{ \"result\":\"FAIL\" }";
		String contextRoot = new HttpServletRequestWrapper(request).getRealPath("/");
		String fileRoot;
		try {
			// 파일이 있을때 탄다.
			if(multipartFile.size() > 0 && !multipartFile.get(0).getOriginalFilename().equals("")) {
				
				for(MultipartFile file:multipartFile) {
					fileRoot = contextRoot + "resources/upload/";
					System.out.println(fileRoot);
					
					String originalFileName = file.getOriginalFilename();	//오리지날 파일명
					String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//파일 확장자
					String savedFileName = UUID.randomUUID() + extension;	//저장될 파일 명
					
					File targetFile = new File(fileRoot + savedFileName);	
					try {
						InputStream fileStream = file.getInputStream();
						FileUtils.copyInputStreamToFile(fileStream, targetFile); //파일 저장
						
					} catch (Exception e) {
						//파일삭제
						FileUtils.deleteQuietly(targetFile);	//저장된 현재 파일 삭제
						e.printStackTrace();
						break;
					}
				}
				strResult = "{ \"result\":\"OK\" }";
			}
			// 파일 아무것도 첨부 안했을때 탄다.(게시판일때, 업로드 없이 글을 등록하는경우)
			else
				strResult = "{ \"result\":\"OK\" }";
		}catch(Exception e){
			e.printStackTrace();
		}
		return strResult;
	}
}
