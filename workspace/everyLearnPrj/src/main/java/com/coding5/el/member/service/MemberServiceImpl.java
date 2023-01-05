package com.coding5.el.member.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.coding5.el.class_comm.vo.ClassCommVo;
import com.coding5.el.member.dao.MemberDao;
import com.coding5.el.member.vo.ClassListVo;
import com.coding5.el.member.vo.MemberVo;

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
			loginMember.setMemberId("1");
			log.info("서비스  null : " + loginMember );
			return loginMember;
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


	
	
}
