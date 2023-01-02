package com.coding5.el.corp.service;

import java.time.LocalDate;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.coding5.el.common.page.PageVo;
import com.coding5.el.corp.dao.CorpDao;
import com.coding5.el.corp.vo.CorpVo;
import com.coding5.el.corp.vo.EmploymentVo;
import com.coding5.el.emp.vo.JobPostVo;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class CorpServiceImpl implements CorpService {

	@Autowired
	private BCryptPasswordEncoder enc;
	
	@Autowired
	private SqlSessionTemplate sst;
	
	@Autowired
	private CorpDao dao;
	
	// 회원가입
	@Override
	public int join(CorpVo vo) {
		
		// 비밀번호 암호화
		String pwd = vo.getPwd();
		String newPwd = enc.encode(pwd);
		vo.setPwd(newPwd);
		
		return dao.insertCorpMember(sst, vo);
	}
	
	// 아이디 중복체크
	@Override
	public String checkId(String id) {
		
		CorpVo vo = dao.checkId(sst, id);
		
		if(vo != null) {
			return "dup";
		}
		
		return "okId";
	}

	// 로그인
	@Override
	public CorpVo login(CorpVo vo) {
		
		CorpVo loginCorpMember = dao.selectOneCorpMember(sst, vo.getId());
		
		if(loginCorpMember == null) {
			return null;
		}
		
		String pwd = vo.getPwd();
		String newPwd = loginCorpMember.getPwd();
		
		if(!enc.matches(pwd, newPwd)) {
			return null;
		}
		
		loginCorpMember.setPrePwd(pwd);
		
		return loginCorpMember;
	}

	// 기업 마이페이지(회사정보 화면)
	@Override
	public CorpVo selectMypage(CorpVo vo) {
		return dao.selectOneCorpInfo(sst, vo);
	}
	
	// 기업 마이페이지(회사정보 수정)
	@Override
	public int updateCorpInfo(CorpVo vo) {
		return dao.updateCorpInfo(sst, vo);
	}

	// 기업 채용 공고 만들기
	@Override
	public int insertJobPost(EmploymentVo vo) {
		return dao.insertJobPost(sst, vo);
	}

	// 채용중 페이징
	@Override
	public int selectHiringCnt(String corpNo) {
		return dao.selectHiringCnt(sst, corpNo);
	}

	// 채용중 페이지 리스트
	@Override
	public List<EmploymentVo> getList(PageVo pv, String corpNo) {
		
		List<EmploymentVo> list = dao.selectHiringList(sst, pv, corpNo);
		// 현재 날짜
		LocalDate now = LocalDate.now();
		
		for(int i = 0; i < list.size(); i++) {
			EmploymentVo item = list.get(i);
			String deadline = item.getDeadline();
			if(now.toString().compareTo(deadline) > 0) {
				// 채용 마감
				item.setStatus("채용마감");
			}else {
				item.setStatus("채용중");
			}
			
			String enrollDate = item.getEnrollDate();
			String sliced = enrollDate.substring(0, 10);
			item.setEnrollDate(sliced);
		}
		
		return list;
	}

	// 채용 공고 지우기
	@Override
	public int deleteJobPost(String no) {
		return dao.updateJobPost(sst, no);
	}

	// 채용 마감 페이징
	@Override
	public int selectDeadlineCnt(String corpNo) {
		return dao.selectDeadlineCnt(sst, corpNo);
	}

	// 채용 마감 리스트
	@Override
	public List<EmploymentVo> getDeadlineList(PageVo pv, String corpNo) {
		
		List<EmploymentVo> list = dao.getDeadlineList(sst, pv, corpNo);
		// 현재 날짜
		LocalDate now = LocalDate.now();
		
		for(int i = 0; i < list.size(); i++) {
			EmploymentVo item = list.get(i);
			String deadline = item.getDeadline();
			if(now.toString().compareTo(deadline) > 0) {
				// 채용 마감
				item.setStatus("채용마감");
			}else {
				item.setStatus("채용중");
			}
			
			String enrollDate = item.getEnrollDate();
			String sliced = enrollDate.substring(0, 10);
			item.setEnrollDate(sliced);
		}
		
		return list;
	}

	// 채용 전체보기 페이징
	@Override
	public int selectTotalCnt(String corpNo) {
		return dao.selectTotalCnt(sst, corpNo);
	}

	// 채용 전체보기 리스트
	@Override
	public List<EmploymentVo> getTotalList(PageVo pv, String corpNo) {
		List<EmploymentVo> list = dao.getTotalList(sst, pv, corpNo);
		// 현재 날짜
		LocalDate now = LocalDate.now();
		
		for(int i = 0; i < list.size(); i++) {
			EmploymentVo item = list.get(i);
			String deadline = item.getDeadline();
			if(now.toString().compareTo(deadline) > 0) {
				// 채용 마감
				item.setStatus("채용마감");
			}else {
				item.setStatus("채용중");
			}
			
			String enrollDate = item.getEnrollDate();
			String sliced = enrollDate.substring(0, 10);
			item.setEnrollDate(sliced);
		}
		
		return list;
	}

	// 공고 세부조회
	@Override
	public JobPostVo selectJobPost(CorpVo corpMember, String no) {
		
		JobPostVo item = dao.selectJobPost(sst, no);
		
		if(item.getCorpNo().equals(corpMember.getNo())) {
			return item;
		}else {
			return null;
		}
		
	}

	// 공고 조회하기(기업용)
	@Override
	public EmploymentVo selectEmployment(CorpVo corpMember, String no) {
		
		EmploymentVo item = dao.selectEmployment(sst, no);
		
		// 공고의 기업 회원 번호와 로그인 된 기업 회원 번호가 같은지 확인
		if(item.getCorpNo().equals(corpMember.getNo())) {
			return item;
		}else {
			return null;
		}
	}

	// 채용 공고 수정
	@Override
	public int editJobPost(EmploymentVo vo, CorpVo corpMember) {
		vo.setCorpNo(corpMember.getNo());
		return dao.updateEmployment(sst, vo);
	}

	// 회원탈퇴
	@Override
	public int quitCorpMember(CorpVo vo) {
		
		log.info(vo.toString());
		
		return dao.updateCorpMember(sst, vo);
	}



}
