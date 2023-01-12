package com.coding5.el.admin.mail.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.coding5.el.admin.mail.service.AdminMailService;
import com.coding5.el.admin.vo.AdminVo;
import com.coding5.el.common.file.FileUploader;
import com.coding5.el.common.page.PageVo;
import com.coding5.el.common.page.Pagination;
import com.coding5.el.common.vo.AttachVo;
import com.coding5.el.email.service.EmailService;
import com.coding5.el.email.vo.MailVo;

import lombok.extern.slf4j.Slf4j;

@RequestMapping("admin/mail")
@Controller
@Slf4j
public class AdminMailController {
	@Autowired
	public AdminMailController(AdminMailService adminMailService ,EmailService emailService) {
		this.emailService = emailService;
		this.adminMailService = adminMailService;
	}
	
	private final AdminMailService adminMailService;
	
	private final EmailService emailService;
	
	// 개별 메일 전송
		@GetMapping("send")
		public String mailSend() {
			return "admin/mail/send";
		}
		
		/**
		 *  개별 메일 전송
		 * @param vo
		 * @param redirect
		 * @param session
		 * @param attachVo
		 * @param multipartFile
		 * @return
		 */
		@PostMapping("send")
		public String mailSend(MailVo vo, RedirectAttributes redirect, HttpSession session, AttachVo attachVo, MultipartFile multipartFile) {
			log.info("메일 발송 화면>컨트롤러 vo ::: " + vo);
			log.info("메일 발송 화면 > 컨틀로러 attchVo" + multipartFile);
			// 세션에서 가져오기
			AdminVo loginAdmin = (AdminVo)session.getAttribute("loginAdmin");	
			
			vo.setFromAddress(loginAdmin.getId());
			vo.setAdminNo(loginAdmin.getNo());
			
			// 아래 메일만 이메일 전송하기
			if("everylearn352@gmail.com".equals(vo.getFromAddress())) {
				boolean result = emailService.mailSender(vo);		
				
				if(!result) {
					redirect.addFlashAttribute("resultMsg", "메일 전송 실패");
					return "redirect:/admin/mail/send";
				}
			}
			
			
			// db에 어테치 넣기 위해..
			List<AttachVo> voList = null;
			
			// 파일 없으면
			vo.setFileYn("N");
			
			// 파일 서버에 업로드
			if(!multipartFile.isEmpty()) {
				// 이미지 있으면
				vo.setFileYn("Y");
				voList = new ArrayList<>();
				
				for(int i = 0; i < vo.getMultipartFile().size(); i++) {
					
					attachVo = new AttachVo();
					
					log.info("이프문 통과");
					log.info("파일 잘 들어옴? " +vo.getMultipartFile().get(i));
					
					attachVo.setFileName(FileUploader.upload(session, vo.getMultipartFile().get(i)));
					
					voList.add(i, attachVo);
					
				}
			}
			
			
			int result = adminMailService.insertMail(vo, voList);
			
			if(result == 0) {
				redirect.addFlashAttribute("resultMsg", "디비 저장 실패");
				return "redirect:/admin/mail/send";
			}
			
			redirect.addFlashAttribute("resultMsg", "메일 전송 완료");
			return "redirect:/admin/mail/send/list?pno=1";
		}
		
		
		/**
		 *  보낸 메일 내역
		 * @param pno
		 * @param model
		 * @param mapSearch
		 * @param session
		 * @return
		 */
		@GetMapping("send/list")
		public String mailList(String pno, Model model, @RequestParam Map<String, String> mapSearch, HttpSession session) {
			
			AdminVo loginAdmin = (AdminVo)session.getAttribute("loginAdmin");
			log.info(loginAdmin.getPermission());
			// 마스터 관리자는 모든 내역 볼 수 있음 체크
			if(!"마스터".equals(loginAdmin.getPermission())) {
				mapSearch.put("adminNo", loginAdmin.getNo());				
			}
			
			// 카운트
			int listCount = adminMailService.selectMailCount(mapSearch);
			int currentPage = Integer.parseInt(pno);
			int pageLimit = 5;
			int boardLimit = 5;
			
			log.info("메일 리스트 개수 :::" + listCount);
			// 페이징
			PageVo pv = Pagination.getPageVo(listCount, currentPage, pageLimit, boardLimit);
			// 리스트 가져오기
			List<MailVo> voList = adminMailService.selectMailList(pv,mapSearch);
			
			log.info("메일 리스트 가져오기 :::" + voList);
			
			if(voList == null) {
				return "common/error";
			}
			
			model.addAttribute("mapSearch", mapSearch);
			model.addAttribute("pv", pv);
			model.addAttribute("voList", voList);
			
			return "admin/mail/list";
		}
		/**
		 * 메일 보낸내역 삭제
		 * @param arrNo
		 * @return
		 */
		@PostMapping("mail/delete")
		public String sendDelete(String[] arrNo , RedirectAttributes redirect) {
			
			log.info("no 잘 받아오나" + arrNo[0]);
			
			int result = adminMailService.deleteSendMail(arrNo);
			
			
			redirect.addFlashAttribute("resultMsg", "삭제되었습니다.");
			return "redirect:/admin/mail/send/list?pno=1";
		}
		
		//보낸내역 상세보기
		@GetMapping("send/detail")
		public String mailDetail(String no, Model model) {
			
			log.info("보낸내역 상세보기 - no ::: " + no);
			
			Map<String, Object> map = adminMailService.mailDetail(no);
			
			
			model.addAttribute("map", map);
			return "admin/mail/detail";
		}
		
		// 전체 메일 전송
		@GetMapping("all-send")
		public String mailAllSend() {
			return "admin/mail/all-send";
		}
		
		// 전체 메일 전송
		@PostMapping("all-send")
		public String mailAllSend(MailVo mailVo, HttpSession session, MultipartFile multipartFile, RedirectAttributes redirect) {
			//관리자 넘버 & 메일 넣어주기
			AdminVo loginAdmin = (AdminVo)session.getAttribute("loginAdmin");	
			
			mailVo.setFromAddress(loginAdmin.getId());
			mailVo.setAdminNo(loginAdmin.getNo());
			
			
			log.info("전체 메일 값 잘왔나요? mailVo ::: " + mailVo);
			
			log.info("isEmpty?"+!multipartFile.isEmpty());
			
			// db에 어테치 넣기 위해..
			List<AttachVo> voList = null;
			
			// 파일 없으면
			mailVo.setFileYn("N");
			String fileName = null;
			// 파일 서버에 업로드
			if(!multipartFile.isEmpty()) {
				// 이미지 있으면
				mailVo.setFileYn("Y");
				fileName = FileUploader.upload(session, multipartFile);
				
			}
			
			int result = adminMailService.insertAllSendMail(mailVo, fileName);
			
			if(result == 0) {
				redirect.addFlashAttribute("resultMsg", "디비 저장 실패");
				return "redirect:/admin/mail/send";
			}
			
			redirect.addFlashAttribute("resultMsg", "메일 전송 완료");
			return "redirect:/admin/mail/send/list?pno=1";
		}
		
}
