package com.coding5.el.emp.service;

import java.util.List;
import java.util.ListIterator;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.coding5.el.common.page.PageVo;
import com.coding5.el.corp.vo.EmploymentVo;
import com.coding5.el.emp.dao.EmpDao;
import com.coding5.el.emp.vo.ApplyVo;
import com.coding5.el.emp.vo.AwardVo;
import com.coding5.el.emp.vo.CareerVo;
import com.coding5.el.emp.vo.CertificateVo;
import com.coding5.el.emp.vo.EducationVo;
import com.coding5.el.emp.vo.JobPostVo;
import com.coding5.el.emp.vo.LanguageVo;
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

	// 이력서 조회하기
	@Override
	public ResumeVo selectResume(String memberNo) {
		return dao.selectResumeOne(sst, memberNo);
	}

	// 학력 조회하기
	@Override
	public List<EducationVo> selectEducation(ResumeVo vo) {
		return dao.selectEducation(sst, vo);
	}

	// 언어 조회하기
	@Override
	public List<LanguageVo> selectLanguage(ResumeVo vo) {
		return dao.selectLanguage(sst, vo);
	}

	// 수상내역 조회하기
	@Override
	public List<AwardVo> selectAward(ResumeVo vo) {
		return dao.selectAward(sst, vo);
	}
	
	// 경력 조회하기
	@Override
	public List<CareerVo> selectCareer(ResumeVo vo) {
		return dao.selectCareer(sst, vo);
	}

	// 자격증 조회하기
	@Override
	public List<CertificateVo> selectCertificate(ResumeVo vo) {
		return dao.selectCertificate(sst, vo);
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
		
		// 이력서에 회원번호를 넣어주기
		rv.setMemberNo(memberNo);
		
		// 이력서 작성하기(없으면 INSERT하고 있으면 UPDATE해줌)
		int rvResult = dao.updateResume(sst, rv);

		// 이력서의 시퀀스 번호 조회해오기
		String resumeNo = dao.selectResumeSeqNo(sst, memberNo);
		
		// 이력서 번호로 학력을 조회해서 삭제해주기
		dao.deleteEducation(sst, resumeNo);
		
		// 입력된 학력이 있으면
		if(ev.getEvList() != null && ev.getEvList().size() != 0) {
			// 학력을 반복하기 위해서 Iterator 가져오기
			ListIterator<EducationVo> evIterator = ev.getEvList().listIterator();
			// Iterator를 반복하면서
			while(evIterator.hasNext()) {
				// 다음 학력이 있으면 학력에 이력서 번호를 넣어준다.
				evIterator.next().setResumeNo(resumeNo);
			}
			// 학력을 넣어주기
			int evResult = dao.updateEducation(sst, ev.getEvList());
		}
		// 이하 동문
		dao.deleteAward(sst, resumeNo);
		if(av.getAvList() != null && av.getAvList().size() != 0) {
			ListIterator<AwardVo> avIterator = av.getAvList().listIterator();
			while(avIterator.hasNext()) {
				avIterator.next().setResumeNo(resumeNo);
			}
			int avResult = dao.updateAward(sst, av.getAvList());
		}
		
		dao.deleteCareer(sst, resumeNo);
		if(cv.getCvList() != null && cv.getCvList().size() != 0) {
			ListIterator<CareerVo> cvIterator = cv.getCvList().listIterator();
			while(cvIterator.hasNext()) {
				cvIterator.next().setResumeNo(resumeNo);
			}
			int cvResult = dao.updateCareer(sst, cv.getCvList());
		}
		
		dao.deleteCertificate(sst, resumeNo);
		if(cfv.getCfvList() != null && cfv.getCfvList().size() != 0) {
			 
			ListIterator<CertificateVo> cfvIterator = cfv.getCfvList().listIterator();
			while(cfvIterator.hasNext()) {
				cfvIterator.next().setResumeNo(resumeNo);
			}
			int cfvResult = dao.updateCertificate(sst, cfv.getCfvList());
		}
		
		dao.deleteLanguage(sst, resumeNo);
		if(lv.getLvList() != null && lv.getLvList().size() != 0) { 
			ListIterator<LanguageVo> lvIterator = lv.getLvList().listIterator();
			while(lvIterator.hasNext()) {
				lvIterator.next().setResumeNo(resumeNo);
			}
			int lvResult = dao.updateLanguage(sst, lv.getLvList());
		}
		
		return rvResult;
	}

	// 지원하기
	@Override
	public int apply(ApplyVo vo) {
		return dao.insertApplyByMember(sst, vo);
	}

	// 회원 번호 가져오기(지원)
	@Override
	public ApplyVo selectApply(String applyNo) {
		return dao.selectApply(sst, applyNo);
	}

	// 채용 공고 검색
	@Override
	public List<JobPostVo> searchJobPostList(Map<String, String> map, PageVo pv) {
		return dao.selectSearchJobPostList(sst, map, pv);
	}

	// 채용 공고 검색 페이징
	@Override
	public int searchListCnt(String keyword) {
		return dao.selectSearchListCnt(sst, keyword);
	}

	// sector 리스트
	@Override
	public List<JobPostVo> postBySector(String sector, PageVo pv) {
		
		switch(sector) {
		
		case "it": sector = "1"; 
			break;
			
		case "management": sector = "2"; 
			break;
			
		case "design": sector = "3"; 
			break;
			
		case "marketing": sector = "4"; 
			break;
			
		case "education": sector = "5"; 
			break;
		
		}
		
		return dao.selectPostBySector(sst, sector, pv);
	}

	// sector 페이징
	@Override
	public int selectSectorPage(String sector) {
		
		switch(sector) {
		
		case "it": sector = "1"; 
			break;
			
		case "management": sector = "2"; 
			break;
			
		case "design": sector = "3"; 
			break;
			
		case "marketing": sector = "4"; 
			break;
			
		case "education": sector = "5"; 
			break;
		
		}
		
		return dao.selectSectorPage(sst, sector);
	}

	// 입사지원 유무 확인
	@Override
	public int selectApplication(ApplyVo av) {
		return dao.selectApplication(sst, av);
	}

}
