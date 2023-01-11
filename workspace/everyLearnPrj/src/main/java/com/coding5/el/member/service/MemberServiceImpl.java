package com.coding5.el.member.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.coding5.el.class_comm.vo.ClassCommVo;
import com.coding5.el.member.dao.MemberDao;
import com.coding5.el.member.vo.ClassListVo;
import com.coding5.el.member.vo.MemberVo;
import com.coding5.el.member.vo.PointVo;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	private SqlSessionTemplate sst;
	
	@Autowired
	private BCryptPasswordEncoder enc;
	
	@Autowired
	private MemberDao memberDao;
	
	//회원가입
	@Override
	public int join(MemberVo vo) {
		
		//암호화
		String pwd = vo.getMemberPwd();
		String newPwd = enc.encode(pwd);
		vo.setMemberPwd(newPwd);
		
		return memberDao.insertMember(sst, vo);
	}

	//로그인
	@Override
	public MemberVo login(MemberVo vo) {
		
		MemberVo loginMember = memberDao.selectMemberOne(sst, vo);
		
		if(loginMember == null) {
			
			log.info("널일때 x" + loginMember);
			
			return loginMember;
		}
		
		log.info("서비스에서 실행 됨?" + loginMember);
		//암호화
		String memberPwd = vo.getMemberPwd();
		String encMemberPwd = loginMember.getMemberPwd();
		boolean isMatch = enc.matches(memberPwd, encMemberPwd);
		
		if(isMatch) {
			log.info("서비스  오케이 : " + loginMember );
			return loginMember;
		}else {
//			loginMember.setMemberId("1");
			log.info("서비스  null : " + isMatch );
			return null;
		}
		
	}

	//아이디 중복
	@Override
	public String idDup(String memberId) {
		String IdDup = memberDao.selectIdDup(sst, memberId);
		if(IdDup != "") {
			return IdDup;
		}else {
			return "null";
		}
		
	}

	//닉네임  중복
	@Override
	public String nickDup(String memberNick) {
		String nickDup = memberDao.selectNickDup(sst, memberNick);
		return nickDup;
	}


	@Override
	public String idFind(MemberVo findVo) {
		return memberDao.idFindAjax(sst, findVo);
	}

	@Override
	public MemberVo updateMember(MemberVo vo) {
		
		//암호화
		String pwd = vo.getMemberPwd();
		String newPwd = enc.encode(pwd);
		vo.setMemberPwd(newPwd);
		
		int result = memberDao.updateMember(sst, vo);
		
		if(result != 1) {
			return null;
		}
		
		
		return memberDao.selectMemberOne(sst, vo);
	}

	//커뮤  내 작성글 조회
	@Override
	public List<ClassCommVo> commWrite_List(String memberNo) {
		return memberDao.selectCommWriteList(sst,memberNo);
	}

	//수강평 작성글 조회
	@Override
	public List<ClassListVo> classReviewList(String mNo) {
		return memberDao.selectClassReviewList(sst, mNo);
	}

	//회원삭제 비번확인
	@Override
	public String passwordCheck(HashMap<String, String> deleteInfo) {
		
		 String encPassword1 = memberDao.selectEncPassword(sst, deleteInfo);
		
		String memberPwd =  deleteInfo.get("password");
		String encMemberPwd = encPassword1;
		boolean isMatch = enc.matches(memberPwd, encMemberPwd);
		
		if(isMatch) {
			log.info("서비스  오케이 : " + encMemberPwd );
			return "success";
		}else {
			
			return "error";
		}
		
	}

	//회원 탈퇴
	@Override
	public int deleteMember(String memberNo) {
		return memberDao.updateDeleteMember(sst, memberNo);
	}

	//강사여부체크
	@Override
	public String teacherCheck(MemberVo loginMember) {
		String teacherCheck = memberDao.selectTeacherCheck(sst, loginMember);
		
		if(teacherCheck == null) {
			teacherCheck = "no";
		}
		
		return teacherCheck;
	}

	//포인트 리스트
	@Override
	public List<PointVo> pointList(String mpn) {
		return memberDao.selectPointList(sst, mpn);
	}

	//내 강의 조회
	@Override
	public List<ClassListVo> myClassList(String memberNo) {
		return memberDao.selectMyClassList(sst, memberNo);
	}

	//내 강의 정보 조회
	@Override
	public List<ClassListVo> myClassInfoList(List<ClassListVo> myClassList) {
			
		log.info("서비스 반복 전 myClassList.get()::" + myClassList.get(0));
	    List<ClassListVo> myClassInfoList = new ArrayList<ClassListVo>();
		for(int i = 0; i<myClassList.size(); i++) {
			ClassListVo vo = new ClassListVo();
			vo = memberDao.selectmyClassInfoList(sst, myClassList.get(i));
			
			myClassInfoList.add(vo);
		}
		
		return myClassInfoList;
	}

	//강의 세부리스트
	@Override
	public List<ClassListVo> classDetailList(String classNo) {
		return memberDao.selectClassDetailList(sst, classNo);
	}

	//학습률 강의 정보
	@Override
	public List<ClassListVo> classDetailInfoList(String classNo) {
		return memberDao.selectClassDetailInfoList(sst, classNo);
	}

	//마이 스터디 인서트
	@Override
	public int insertMemberStudy(String mn,List<ClassListVo> classDetailList) {
		//서비스에서 멤버넘버 처리해야 함!!!!!!!!

		return 1;
		
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//강사인포
//	@Override
//	public TeacherMemberVo teacherInfo(String memberNo) {
//		return memberDao.selectTeacherInfo(sst, memberNo);
//	}
//
//	//강사 > 강의리스트
//	@Override
//	public List<TeacherMemberVo> teacherClassList(String memberNo) {
//		return memberDao.selectClassList(sst, memberNo);
//	}


	
	
}
