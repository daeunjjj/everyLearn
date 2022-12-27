package com.coding5.el.emp.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.coding5.el.emp.vo.AwardVo;
import com.coding5.el.emp.vo.CareerVo;
import com.coding5.el.emp.vo.CertificateVo;
import com.coding5.el.emp.vo.EducationVo;
import com.coding5.el.emp.vo.JobPostVo;
import com.coding5.el.emp.vo.LanguageVo;
import com.coding5.el.emp.vo.ResumeAttatchVo;
import com.coding5.el.emp.vo.ResumeVo;

@Repository
public class EmpDaoImpl implements EmpDao {

	@Override
	public ResumeVo selectResumeOne(SqlSessionTemplate sst, ResumeVo vo) {
		return sst.selectOne("resumeMapper.selectResumeOne", vo);
	}

	@Override
	public List<EducationVo> selectEducation(SqlSessionTemplate sst, ResumeVo vo) {
		return sst.selectList("resumeMapper.selectEducation", vo);
	}

	@Override
	public List<LanguageVo> selectLanguage(SqlSessionTemplate sst, ResumeVo vo) {
		return sst.selectList("resumeMapper.selectLanguage", vo);
	}

	@Override
	public List<AwardVo> selectAward(SqlSessionTemplate sst, ResumeVo vo) {
		return sst.selectList("resumeMapper.selectAward", vo);
	}

	@Override
	public List<CareerVo> selectCareer(SqlSessionTemplate sst, ResumeVo vo) {
		return sst.selectList("resumeMapper.selectCareer", vo);
	}

	@Override
	public List<CertificateVo> selectCertificate(SqlSessionTemplate sst, ResumeVo vo) {
		return sst.selectList("resumeMapper.selectCertificate", vo);
	}

	@Override
	public List<ResumeAttatchVo> selectAttach(SqlSessionTemplate sst, ResumeVo vo) {
		return sst.selectList("resumeMapper.selectAttach", vo);
	}

	// 이력서 작성하기
	@Override
	public int insertEducation(SqlSessionTemplate sst, List<EducationVo> evList) {
		return sst.insert("resumeMapper.insertEducation", evList);
	}

	// 채용 공고 상세
	@Override
	public JobPostVo selectJobPostDetail(SqlSessionTemplate sst, String no) {
		return sst.selectOne("jobPostMapper.selectJobPostDetail", no);
	}


}
