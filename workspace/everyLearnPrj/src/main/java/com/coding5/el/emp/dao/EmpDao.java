package com.coding5.el.emp.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.coding5.el.emp.vo.AwardVo;
import com.coding5.el.emp.vo.CareerVo;
import com.coding5.el.emp.vo.CertificateVo;
import com.coding5.el.emp.vo.EducationVo;
import com.coding5.el.emp.vo.JobPostVo;
import com.coding5.el.emp.vo.LanguageVo;
import com.coding5.el.emp.vo.ResumeAttatchVo;
import com.coding5.el.emp.vo.ResumeVo;

public interface EmpDao {

	ResumeVo selectResumeOne(SqlSessionTemplate sst, ResumeVo vo);

	List<EducationVo> selectEducation(SqlSessionTemplate sst, ResumeVo vo);

	List<LanguageVo> selectLanguage(SqlSessionTemplate sst, ResumeVo vo);

	List<AwardVo> selectAward(SqlSessionTemplate sst, ResumeVo vo);

	List<CareerVo> selectCareer(SqlSessionTemplate sst, ResumeVo vo);

	List<CertificateVo> selectCertificate(SqlSessionTemplate sst, ResumeVo vo);

	List<ResumeAttatchVo> selectAttach(SqlSessionTemplate sst, ResumeVo vo);

	// 이력서 작성하기
	int insertEducation(SqlSessionTemplate sst, List<EducationVo> evList);

	// 채용 공고 상세
	JobPostVo selectJobPostDetail(SqlSessionTemplate sst, String no);

}
