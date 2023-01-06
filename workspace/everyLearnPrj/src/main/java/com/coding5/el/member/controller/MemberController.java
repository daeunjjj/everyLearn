package com.coding5.el.member.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.coding5.el.member.service.MemberService;
import com.coding5.el.member.vo.ClassListVo;
import com.coding5.el.member.vo.MemberVo;
import com.coding5.el.admin.vo.AdminVo;
import com.coding5.el.class_comm.vo.ClassCommVo;
import com.coding5.el.common.file.FileUploader;

import lombok.extern.slf4j.Slf4j;

@RequestMapping("member")
@Controller
@Slf4j
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	//작성글조회(수강평)
	@GetMapping("writeListClass")
	public String writeListClass(String mNo, Model model) {
		
		
		List<ClassListVo> classReviewList = memberService.classReviewList(mNo);
		log.info("클래스리스트"+ classReviewList);
		
		model.addAttribute("classReviewList",classReviewList);
		
		
		return "member/writeList";
	}
	
	
	
	//작성글 조회(강의커뮤)
	@GetMapping("writeList")
	public String writeList(String memberNo, Model model) {
		
		List<ClassCommVo> commWriteList =  memberService.commWrite_List(memberNo);
		model.addAttribute("commWriteList", commWriteList);
		log.info("" + commWriteList);
		
		return "member/writeList";
		
	}
	
	
	
	@GetMapping("memberStudy")
	public String memberStudy() {
		return "member/member_study";
	}
	
	@GetMapping("memberStudyDetail")
	public String memberStudyDetail() {
		return "member/member_studyDetail";
	}
	
	
	//회원가입(화면)
	@GetMapping("join")
	public String join() {
		return "member/join";
	}
	
	//회원가입
	@PostMapping("join")
	public String join(MemberVo vo) {
		
		memberService.join(vo);
		
		return "member/login";
	}
	
	//아이디 중복확인(ajax)
	@PostMapping("idDup")
	@ResponseBody
	public String idDup(String memberId){
		
		String result = memberService.idDup(memberId);
		
		if( result != null ){
			return "1";
		}else {
			return "-1";
		}
		
		
	}
	
	//닉네임 중복확인(ajax)
	@PostMapping("nickDup")
	@ResponseBody
	public String nickDup(String memberNick){
		
		String result = memberService.nickDup(memberNick);
		
		if( result != null ){
			//중복된 닉네임
			return "1";
		}else {
			return "-1";
		}
		
		
	}
	
	
	//로그인(화면)
	@GetMapping("login")
	public String login() {
		return "member/login";
	}
	

	
	
	@PostMapping("login")
    public String login(MemberVo vo, HttpSession session, @RequestParam(value="type", defaultValue = "main" ) String type) {

        MemberVo loginMember = memberService.login(vo);

//        log.info(loginMember.getTeaStatusYn());
        log.info("로그인 멤버 : " + loginMember);


        if(loginMember==null) {
            log.info("null 로그인 멤버 : " + loginMember);
            session.setAttribute("error", "아이디와 비밀번호를 다시 한 번 확인해주세요.");
            return "member/login";
        }


        if(loginMember != null && !loginMember.getMemberId().equals("error")) {

            session.setAttribute("loginMember", loginMember);

        }
        log.info(type);
        if(type.equals("emp")){
            return "redirect:/emp/main";
        }

        return "redirect:/main";



    }
	
	
	//회원수정(화면)
	@GetMapping("modify")
	public String modify() {
		return "member/modify";
	}
	
	//회원수정
	@PostMapping("modify")
	public String modify(MemberVo vo, HttpSession session) {
		log.info("수정!"+vo);
		
		/*
		 * NO
			TEACHER_NO
			ORIGIN_NAME
			CHANGE_NAME
		 */
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");		
		vo.setMemberNo(loginMember.getMemberNo());
		log.info("loginMember!"+ loginMember);
		
		String changeName = "";
		
		if(!vo.getProfileImg().isEmpty()) {
			changeName = FileUploader.upload(session, vo.getProfileImg());
		}
		
		vo.setProfileImgName(changeName);
		
		MemberVo updateMember =  memberService.updateMember(vo);
		log.info("업데이트 : " + updateMember);
		session.setAttribute("loginMember", updateMember);
		loginMember.setProfileImgName(updateMember.getProfileImgName());
		
		
		if(updateMember == null) {
			return "common/error";
		}
		
		return "redirect:/main";
	}
	
	//아이디 찾기(화면)
	@GetMapping("idFind")
	public String idFind() {
		return "member/id_find";
	}
	
	//아이디 찾기 확인
	@PostMapping("idFindAjax")
	@ResponseBody
	public String idFindAjax(String memberName, String memberEmail) {
		MemberVo vo = new MemberVo();
		vo.setMemberName(memberName);
		vo.setEmail(memberEmail);
		
		String result = memberService.idFind(vo);
		
		return result;
	}
	
	//아이디 찾기 성공
	@GetMapping("successIdFind")
	public String successIdFind(String findId, Model model) {
		
		model.addAttribute("findId", findId);
		
		return "member/success_id_find";
	}
	
	//로그아웃(메인으로 가게 다시 수정)
	@GetMapping("logout")
	public String logout(HttpSession session) {
		
		session.invalidate();
		
		return "redirect:/main";
	}
	
	@GetMapping("pwFind")
	public String pwFind() {
		return "member/pw_find";
	}
	

	@GetMapping("successPwdFind")
	public String successPwdFind() {
		return "member/success_pwd_find";
	}
	
	@GetMapping("changePwd")
	public String changePwd() {
		return "member/change_pwd";
	}
	
	@GetMapping("alert")
	public String alert() {
		return "member/member_alert";
	}
	
	@GetMapping("sidebar")
	public String sidebar() {
		return "member/member_sidebar";
	}
	
	@GetMapping("point")
	public String point() {
		return "member/point";
	}
	

	
	@GetMapping("delete")
	public String delete() {
		return "member/memberDelete";
	}
	
	@GetMapping("header")
	public String header() {
		return "common/headercopy";
	}
	
	
}
