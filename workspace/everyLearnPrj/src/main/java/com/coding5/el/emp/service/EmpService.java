package com.coding5.el.emp.service;

import java.util.List;

import com.coding5.el.emp.vo.AwardVo;
import com.coding5.el.emp.vo.CareerVo;
import com.coding5.el.emp.vo.CertificateVo;
import com.coding5.el.emp.vo.EducationVo;
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

	int resumeWrite(ResumeVo vo, List<EducationVo> evList);

}
// , List<LanguageVo> lvList, List<AwardVo> avList,
//List<CareerVo> cvList, List<CertificateVo> cfvList, List<ResumeAttatchVo> ravList