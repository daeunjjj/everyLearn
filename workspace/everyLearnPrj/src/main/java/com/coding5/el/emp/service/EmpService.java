package com.coding5.el.emp.service;

import java.util.List;

import com.coding5.el.common.page.PageVo;
import com.coding5.el.corp.vo.EmploymentVo;
import com.coding5.el.emp.vo.ApplyVo;
import com.coding5.el.emp.vo.AwardVo;
import com.coding5.el.emp.vo.CareerVo;
import com.coding5.el.emp.vo.CertificateVo;
import com.coding5.el.emp.vo.EducationVo;
import com.coding5.el.emp.vo.JobPostVo;
import com.coding5.el.emp.vo.LanguageVo;
import com.coding5.el.emp.vo.ResumeVo;

public interface EmpService {

	// 이력서 조회 화면
	ResumeVo selectResume(String memberNo);

	List<EducationVo> selectEducation(ResumeVo vo);

	List<LanguageVo> selectLanguage(ResumeVo vo);

	List<AwardVo> selectAward(ResumeVo vo);

	List<CareerVo> selectCareer(ResumeVo vo);

	List<CertificateVo> selectCertificate(ResumeVo vo);


	// 채용 공고 상세
	JobPostVo jobPostDetail(String no);

	// 채용 메인 페이지 리스트
	List<JobPostVo> jobPostList(String no, PageVo pv);

	// 채용 공고 리스트 페이징
	int selectPostList();

	// 이력서 입력
	int insertResume(String memberNo, ResumeVo rv, EducationVo ev, AwardVo av, CareerVo cv, CertificateVo cfv, LanguageVo lv);
	
	// 지원하기
	int apply(ApplyVo vo);

}
