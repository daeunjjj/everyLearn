package com.coding5.el.emp.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

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

import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class EmpDaoImpl implements EmpDao {

	// 이력서 조회
	@Override
	public ResumeVo selectResumeOne(SqlSessionTemplate sst, String memberNo) {
		return sst.selectOne("resumeMapper.selectResumeOne", memberNo);
	}

	// 학력 조회
	@Override
	public List<EducationVo> selectEducation(SqlSessionTemplate sst, ResumeVo vo) {
		return sst.selectList("resumeMapper.selectEducation", vo);
	}

	// 언어 조회
	@Override
	public List<LanguageVo> selectLanguage(SqlSessionTemplate sst, ResumeVo vo) {
		return sst.selectList("resumeMapper.selectLanguage", vo);
	}

	// 수상내역 조회
	@Override
	public List<AwardVo> selectAward(SqlSessionTemplate sst, ResumeVo vo) {
		return sst.selectList("resumeMapper.selectAward", vo);
	}

	// 경력 조회
	@Override
	public List<CareerVo> selectCareer(SqlSessionTemplate sst, ResumeVo vo) {
		return sst.selectList("resumeMapper.selectCareer", vo);
	}

	// 자격증 조회
	@Override
	public List<CertificateVo> selectCertificate(SqlSessionTemplate sst, ResumeVo vo) {
		return sst.selectList("resumeMapper.selectCertificate", vo);
	}

	// 채용 공고 상세
	@Override
	public JobPostVo selectJobPostDetail(SqlSessionTemplate sst, String no) {
		return sst.selectOne("jobPostMapper.selectJobPostDetail", no);
	}

	// 채용 메인페이지 리스트
	@Override
	public List<JobPostVo> selectJobPostList(SqlSessionTemplate sst, String no, PageVo pv) {
		
		int offset = (pv.getCurrentPage()-1) * pv.getBoardLimit();
		int limit = pv.getBoardLimit();
		RowBounds rb = new RowBounds(offset,limit);
		
		return sst.selectList("jobPostMapper.selectJobPostList", no, rb);
	}

	// 채용 공고 리스트 페이징
	@Override
	public int selectPostList(SqlSessionTemplate sst) {
		return sst.selectOne("jobPostMapper.selectPostList");
	}

	// 이력서 작성하기
	@Override
	public int updateResume(SqlSessionTemplate sst, ResumeVo rv) {
		return sst.update("resumeMapper.updateResume", rv);
	}

	// 이력서 시퀀스 번호 가져오기
	@Override
	public String selectResumeSeqNo(SqlSessionTemplate sst, String memberNo) {
		return sst.selectOne("resumeMapper.selectResumeSeqNo", memberNo);
	}
	
	// 학력 작성하기
	@Override
	public int updateEducation(SqlSessionTemplate sst, List<EducationVo> evList) {
		return sst.update("resumeMapper.updateEducation", evList);
	}

	// 수상내역 작성하기
	@Override
	public int updateAward(SqlSessionTemplate sst, List<AwardVo> avList) {
		return sst.update("resumeMapper.updateAward", avList);
	}

	// 경력 작성하기
	@Override
	public int updateCareer(SqlSessionTemplate sst, List<CareerVo> cvList) {
		return sst.update("resumeMapper.updateCareer", cvList);
	}

	// 자격증 내역 작성하기
	@Override
	public int updateCertificate(SqlSessionTemplate sst, List<CertificateVo> cfvList) {
		return sst.update("resumeMapper.updateCertificate", cfvList);
	}

	// 언어 작성하기
	@Override
	public int updateLanguage(SqlSessionTemplate sst, List<LanguageVo> lvList) {
		return sst.update("resumeMapper.updateLanguage", lvList);
	}

	// 지원하기
	@Override
	public int insertApplyByMember(SqlSessionTemplate sst, ApplyVo vo) {
		return sst.insert("jobPostMapper.insertApplyByMember", vo);
	}

	// 회원번호 가져오기(지원)
	@Override
	public ApplyVo selectApply(SqlSessionTemplate sst, String applyNo) {
		return sst.selectOne("jobPostMapper.selectApply", applyNo);
	}

	// 채용 공고 검색
	@Override
	public List<JobPostVo> selectSearchJobPostList(SqlSessionTemplate sst, Map<String, String> map, PageVo pv) {
		
		int offset = (pv.getCurrentPage()-1) * pv.getBoardLimit();
		int limit = pv.getBoardLimit();
		RowBounds rb = new RowBounds(offset,limit);
		
		return sst.selectList("jobPostMapper.selectSearchJobPostList", map, rb);
	}

	// 채용 공고 검색 페이징
	@Override
	public int selectSearchListCnt(SqlSessionTemplate sst, String keyword) {
		return sst.selectOne("jobPostMapper.selectSearchListCnt", keyword);
	}

	// secotr 리스트
	@Override
	public List<JobPostVo> selectPostBySector(SqlSessionTemplate sst, String sector, PageVo pv) {
		
		int offset = (pv.getCurrentPage()-1) * pv.getBoardLimit();
		int limit = pv.getBoardLimit();
		RowBounds rb = new RowBounds(offset,limit);
		
		return sst.selectList("jobPostMapper.selectPostBySector", sector,  rb);
	}

	// sector 페이징
	@Override
	public int selectSectorPage(SqlSessionTemplate sst, String sector) {
		return sst.selectOne("jobPostMapper.selectSectorPage", sector);
	}

	// 학력 삭제
	@Override
	public void deleteEducation(SqlSessionTemplate sst, String resumeNo) {
		sst.delete("resumeMapper.deleteEducation", resumeNo);
	}

	// 수상내역 삭제
	@Override
	public void deleteAward(SqlSessionTemplate sst, String resumeNo) {
		sst.delete("resumeMapper.deleteAward", resumeNo);

	}

	// 경력 삭제
	@Override
	public void deleteCareer(SqlSessionTemplate sst, String resumeNo) {
		sst.delete("resumeMapper.deleteCareer", resumeNo);

	}

	// 자격증 삭제
	@Override
	public void deleteCertificate(SqlSessionTemplate sst, String resumeNo) {
		sst.delete("resumeMapper.deleteCertificate", resumeNo);

	}

	// 언어 삭제
	@Override
	public void deleteLanguage(SqlSessionTemplate sst, String resumeNo) {
		sst.delete("resumeMapper.deleteLanguage", resumeNo);

	}

	// 입사지원 유무 확인
	@Override
	public int selectApplication(SqlSessionTemplate sst, ApplyVo av) {
		return sst.selectOne("jobPostMapper.selectApplication", av);
	}


}
