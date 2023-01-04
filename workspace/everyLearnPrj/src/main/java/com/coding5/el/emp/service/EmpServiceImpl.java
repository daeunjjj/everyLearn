package com.coding5.el.emp.service;

import java.util.List;
import java.util.ListIterator;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.coding5.el.common.page.PageVo;
import com.coding5.el.corp.vo.EmploymentVo;
import com.coding5.el.emp.dao.EmpDao;
import com.coding5.el.emp.vo.AwardVo;
import com.coding5.el.emp.vo.CareerVo;
import com.coding5.el.emp.vo.CertificateVo;
import com.coding5.el.emp.vo.EducationVo;
import com.coding5.el.emp.vo.JobPostVo;
import com.coding5.el.emp.vo.LanguageVo;
import com.coding5.el.emp.vo.ResumeAttatchVo;
import com.coding5.el.emp.vo.ResumeVo;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
@Transactional
public class EmpServiceImpl implements EmpService{
	
	@Autowired
	private SqlSessionTemplate sst;
	
	@Autowired
	private EmpDao dao;

	@Override
	public ResumeVo selectResume(String memberNo) {
		return dao.selectResumeOne(sst, memberNo);
	}

	@Override
	public List<EducationVo> selectEducation(ResumeVo vo) {
		return dao.selectEducation(sst, vo);
	}

	@Override
	public List<LanguageVo> selectLanguage(ResumeVo vo) {
		return dao.selectLanguage(sst, vo);
	}

	@Override
	public List<AwardVo> selectAward(ResumeVo vo) {
		return dao.selectAward(sst, vo);
	}

	@Override
	public List<CareerVo> selectCareer(ResumeVo vo) {
		return dao.selectCareer(sst, vo);
	}

	@Override
	public List<CertificateVo> selectCertificate(ResumeVo vo) {
		return dao.selectCertificate(sst, vo);
	}
	
	@Override
	public List<ResumeAttatchVo> selectAttach(ResumeVo vo) {
		return dao.selectAttach(sst, vo);
	}

	// 채용 공고 상세
	@Override
	public JobPostVo jobPostDetail(String no) {
		return dao.selectJobPostDetail(sst, no);
	}

	// 채용 메인 페이지 리스트
	@Override
	public List<JobPostVo> jobPostList(String no, PageVo pv) {
		return dao.selectJobPostList(sst, no, pv);
	}

	// 채용 공고 리스트 페이징
	@Override
	public int selectPostList() {
		return dao.selectPostList(sst);
	}

	// 이력서 작성하기
	@Override
	public int insertResume(String memberNo, ResumeVo rv, EducationVo ev, AwardVo av, CareerVo cv, CertificateVo cfv,
			LanguageVo lv) {
		
		rv.setMemberNo(memberNo);
		
		int rvResult = dao.updateResume(sst, rv);
		String resumeNo = dao.selectResumeSeqNo(sst);
		
		log.info(resumeNo);
		
		 ListIterator<EducationVo> evIterator = ev.getEvList().listIterator();
		 while(evIterator.hasNext()) {
			 evIterator.next().setResumeNo(resumeNo);
		 }
		 
		 ListIterator<AwardVo> avIterator = av.getAvList().listIterator();
		 while(avIterator.hasNext()) {
			 avIterator.next().setResumeNo(resumeNo);
		 }
		 
		 ListIterator<CareerVo> cvIterator = cv.getCvList().listIterator();
		 while(cvIterator.hasNext()) {
			 cvIterator.next().setResumeNo(resumeNo);
		 }
		 
		 ListIterator<CertificateVo> cfvIterator = cfv.getCfvList().listIterator();
		 while(cfvIterator.hasNext()) {
			 cfvIterator.next().setResumeNo(resumeNo);
		 }
		 
		 ListIterator<LanguageVo> lvIterator = lv.getLvList().listIterator();
		 while(lvIterator.hasNext()) {
			 lvIterator.next().setResumeNo(resumeNo);
		 }
		
		int evResult = dao.updateEducation(sst, ev.getEvList());
		int avResult = dao.updateAward(sst, av.getAvList());
		int cvResult = dao.updateCareer(sst, cv.getCvList());
		int cfvResult = dao.updateCertificate(sst, cfv.getCfvList());
		int lvResult = dao.updateLanguage(sst, lv.getLvList());
		
		return rvResult;
	}

}
