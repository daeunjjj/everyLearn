package com.coding5.el.member.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.Session;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.coding5.el.class_comm.vo.ClassCommVo;
import com.coding5.el.common.file.FileUploader;
import com.coding5.el.member.service.MemberService;
import com.coding5.el.member.vo.ClassListVo;
import com.coding5.el.member.vo.MemberVo;
import com.coding5.el.member.vo.PointVo;

import lombok.extern.slf4j.Slf4j;

@RequestMapping("member")
@Controller
@Slf4j
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	//학습진도율
	@GetMapping("memberProgress")
	public String memberProgress(String classNo, String mn,  Model model) {
		
		//강의 세부 목록
		List<ClassListVo> classDetailList = memberService.classDetailList(classNo);
		
		log.info("classDetailList" + classDetailList);
//		progressMap.put("classDetailList", classDetailList);
//		progressMap.put("mn", mn);
//		
//		//학습진도 강의 인서트
//		int myClassresult = memberService.insertMemberStudy(classDetailList, mn);
//		// 멤버넘버 데리고 가서 서비스에서 리스트 사이즈 만큼 반복문 돌림 -> 디에이오에  mn 이랑 디클넘 넘겨주기!
//		
		
		//강의 정보
		List<ClassListVo> classDetailInfoList = memberService.classDetailInfoList(classNo);
		
		
		model.addAttribute("classDetailList",classDetailList);
		model.addAttribute("classDetailInfoList",classDetailInfoList);
		
		
		return "lecture/mylist";
	}
	
	
	
	//내 강의 페이지
	@GetMapping("memberStudy")
	public String memberStudy() {
		return "member/member_study";
	}
	
	//내 강의 페이지
	@PostMapping("memberStudy")
	public String memberStudy(String memberNo, Model model) {
		
		//내 강의 조회
		List<ClassListVo> myClassList = memberService.myClassList(memberNo);
		log.info("강의없어?" + myClassList);
		
		if(myClassList.size() == 0 ) {
			model.addAttribute("info","n");
			return "member/member_study";
		}

		myClassList.get(0);
		//강의 정보 조회
		List<ClassListVo> myClassInfoList = memberService.myClassInfoList(myClassList);
		model.addAttribute("myClassInfoList",myClassInfoList);
		log.info("myClassInfoList 왜???:::" + myClassInfoList);
		
		
		return "member/member_study";
	}
	
	@GetMapping("point")
	public String point(String mpn, Model model) {
		
	
		List<PointVo> pointList = memberService.pointList(mpn);
		
		
		PointVo str = null;
		int point = 0;
		int sum = 0;
		for (int i=0; i<pointList.size(); i++) {
			str = pointList.get(i);
			PointVo dd = new PointVo();
			dd.setChange(str.getChange());
			 
			point = Integer.parseInt(dd.getChange());
			sum = 0;
			sum += point;
			
		}
		
		if(sum == 0 ) {
			sum = -1;
		}
		
		System.out.println("sum" + sum);
	
		model.addAttribute("sum", sum);
		
		
		
		log.info("pointList" + pointList);
		model.addAttribute("pointList",pointList);
		
		return "member/point";
	}
	
	
	@GetMapping("delete")
	public String delete() {
		return "member/memberDelete";
	}
	
	//비번 확인 에이젝스
	@PostMapping("deleteAjax")
	@ResponseBody
	public String delete(String memberNo, String password, HashMap<String , String> deleteInfo) {
		
		log.info(memberNo);
		
		deleteInfo.put("memberNo", memberNo);
		deleteInfo.put("password", password);
		
		//비밀번호 확인 
		String passwordCheck = memberService.passwordCheck(deleteInfo);
		log.info(passwordCheck);
		
		
		return passwordCheck;
	}
	
	//찐 회원탈퇴
	@PostMapping("delete")
	@ResponseBody
	public String delete(String memberNo, HttpSession session) {
		
		int deleteResult = memberService.deleteMember(memberNo);
		
		if(deleteResult == 1) {
			
			session.invalidate();
			return "ok";
		}else {
			return "error";
		}
		
		
	}
	
	
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
		
		return "redirect:/member/login";
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

            return "member/login";
        }


        if(loginMember != null && !loginMember.getMemberId().equals("error")) {

        	//강사 확인
        	String teacherCheck = memberService.teacherCheck(loginMember);
        	
        	if(teacherCheck != null) {
        		loginMember.setTeacherCheck(teacherCheck);
        	}
        	
            session.setAttribute("loginMember", loginMember);
            log.info("세션로그인멤버 :: " + loginMember);
            
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
		
		//강사체크
		String teacherCheck = memberService.teacherCheck(updateMember);
    	
    	if(teacherCheck != null) {
    		updateMember.setTeacherCheck(teacherCheck);
    	}
    	
        log.info("세션로그인멤버 :: " + loginMember);
		
		log.info("업데이트 : " + updateMember);
		loginMember.setProfileImgName(updateMember.getProfileImgName());
		session.setAttribute("loginMember", updateMember);
		
		
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
	


	

	
	@GetMapping("header")
	public String header() {
		return "common/headercopy";
	}
	
	
}
