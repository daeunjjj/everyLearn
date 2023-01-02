package com.coding5.el.emp.service;

import java.util.List;

import com.coding5.el.corp.vo.EmploymentVo;
import com.coding5.el.emp.vo.AwardVo;
import com.coding5.el.emp.vo.CareerVo;
import com.coding5.el.emp.vo.CertificateVo;
import com.coding5.el.emp.vo.EducationVo;
import com.coding5.el.emp.vo.JobPostVo;
import com.coding5.el.emp.vo.LanguageVo;
import com.coding5.el.emp.vo.ResumeAttatchVo;
import com.coding5.el.emp.vo.ResumeVo;

public interface EmpService {

	ResumeVo selectResume(ResumeVo vo);

	List<EducationVo> selectEducation(ResumeVo vo);

	List<LanguageVo> selectLanguage(ResumeVo vo);

	List<AwardVo> selectAward(ResumeVo vo);

	List<CareerVo> selectCareer(ResumeVo vo);

	List<CertificateVo> selectCertificate(ResumeVo vo);

	List<ResumeAttatchVo> selectAttach(ResumeVo vo);

	// 채용 이력서
	int resumeWrite(ResumeVo vo, List<EducationVo> evList);

	// 채용 공고 상세
	JobPostVo jobPostDetail(String no);

	int resumeWrite(List<EducationVo> evList);

	// 채용 메인 페이지 리스트
	List<JobPostVo> jobPostList(String no);

}
// , List<LanguageVo> lvList, List<AwardVo> avList,
//List<CareerVo> cvList, List<CertificateVo> cfvList, List<ResumeAttatchVo> ravList