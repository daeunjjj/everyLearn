package com.coding5.el.emp.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

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

public interface EmpDao {

	// 이력서 조회 
	ResumeVo selectResumeOne(SqlSessionTemplate sst, String memberNo);

	List<EducationVo> selectEducation(SqlSessionTemplate sst, ResumeVo vo);

	List<LanguageVo> selectLanguage(SqlSessionTemplate sst, ResumeVo vo);

	List<AwardVo> selectAward(SqlSessionTemplate sst, ResumeVo vo);

	List<CareerVo> selectCareer(SqlSessionTemplate sst, ResumeVo vo);

	List<CertificateVo> selectCertificate(SqlSessionTemplate sst, ResumeVo vo);

	// 채용 공고 상세
	JobPostVo selectJobPostDetail(SqlSessionTemplate sst, String no);

	// 채용 메인 페이지 리스트
	List<JobPostVo> selectJobPostList(SqlSessionTemplate sst, String no, PageVo pv);

	// 채용 공고 리스트 페이징
	int selectPostList(SqlSessionTemplate sst);

	// 이력서 작성하기
	int updateResume(SqlSessionTemplate sst, ResumeVo rv);

	// 이력서 시퀀스 번호 받아오기
	String selectResumeSeqNo(SqlSessionTemplate sst, String memberNo);
	
	// 학력 작성하기
	int updateEducation(SqlSessionTemplate sst, List<EducationVo> evList);

	// 수상내역 작성하기
	int updateAward(SqlSessionTemplate sst, List<AwardVo> avList);

	// 경력 작성하기
	int updateCareer(SqlSessionTemplate sst, List<CareerVo> cvList);

	// 자격증 작성하기
	int updateCertificate(SqlSessionTemplate sst, List<CertificateVo> cfvList);

	// 언어 작성하기
	int updateLanguage(SqlSessionTemplate sst, List<LanguageVo> lvList);

	// 지원하기
	int insertApplyByMember(SqlSessionTemplate sst, ApplyVo vo);

	// 회원번호(지원하기)
	ApplyVo selectApply(SqlSessionTemplate sst, String applyNo);

	// 채용 공고 검색
	List<JobPostVo> selectSearchJobPostList(SqlSessionTemplate sst, Map<String, String> map, PageVo pv);

	// 채용 공고 검색 페이징
	int selectSearchListCnt(SqlSessionTemplate sst, String keyword);

	// sector 리스트
	List<JobPostVo> selectPostBySector(SqlSessionTemplate sst, String sector, PageVo pv);

	// sector 페이징
	int selectSectorPage(SqlSessionTemplate sst, String sector);

	// 학력 삭제
	void deleteEducation(SqlSessionTemplate sst, String resumeNo);

	// 수상내역 삭제
	void deleteAward(SqlSessionTemplate sst, String resumeNo);

	// 경력 삭제
	void deleteCareer(SqlSessionTemplate sst, String resumeNo);

	// 자격증 삭제
	void deleteCertificate(SqlSessionTemplate sst, String resumeNo);

	// 언어 삭제
	void deleteLanguage(SqlSessionTemplate sst, String resumeNo);

	// 입사지원 유무 확인
	int selectApplication(SqlSessionTemplate sst, ApplyVo av);

}
