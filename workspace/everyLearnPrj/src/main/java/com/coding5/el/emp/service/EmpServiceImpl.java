package com.coding5.el.emp.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.coding5.el.emp.dao.EmpDao;
import com.coding5.el.emp.vo.AwardVo;
import com.coding5.el.emp.vo.CareerVo;
import com.coding5.el.emp.vo.CertificateVo;
import com.coding5.el.emp.vo.EducationVo;
import com.coding5.el.emp.vo.JobPostVo;
import com.coding5.el.emp.vo.LanguageVo;
import com.coding5.el.emp.vo.ResumeAttatchVo;
import com.coding5.el.emp.vo.ResumeVo;

@Service
public class EmpServiceImpl implements EmpService{
	
	@Autowired
	private SqlSessionTemplate sst;
	
	@Autowired
	private EmpDao dao;

	@Override
	public ResumeVo selectResume(ResumeVo vo) {
		return dao.selectResumeOne(sst, vo);
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

	// 이력서 작성하기
	@Override
	public int resumeWrite(ResumeVo vo, List<EducationVo> evList) {
		
		int education = dao.insertEducation(sst, evList);
		
		return education;
	}
	// , List<LanguageVo> lvList, List<AwardVo> avList,
//	List<CareerVo> cvList, List<CertificateVo> cfvList, List<ResumeAttatchVo> ravList

	// 채용 공고 상세
	@Override
	public JobPostVo jobPostDetail(String no) {
		return dao.selectJobPostDetail(sst, no);
	}

	@Override
	public int resumeWrite(List<EducationVo> evList) {
		// TODO Auto-generated method stub
		return 0;
	}

}
