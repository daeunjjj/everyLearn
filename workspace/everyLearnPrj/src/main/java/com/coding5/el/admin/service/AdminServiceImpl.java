package com.coding5.el.admin.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.coding5.el.admin.dao.AdminDao;
import com.coding5.el.admin.report.dao.AdminReportDao;
import com.coding5.el.admin.vo.AdminVo;
import com.coding5.el.alert.vo.AlertVo;
import com.coding5.el.chart.vo.ChartVo;
import com.coding5.el.common.page.PageVo;
import com.coding5.el.common.vo.SearchVo;
import com.coding5.el.corp.vo.CorpVo;
import com.coding5.el.corp.vo.EmploymentVo;
import com.coding5.el.lecture.vo.LectureVo;
import com.coding5.el.member.vo.MemberVo;
import com.coding5.el.member.vo.PointVo;
import com.coding5.el.report.vo.ReportVo;
import com.coding5.el.request.vo.RequestVo;
import com.coding5.el.teacher.vo.TeacherVo;

import lombok.extern.slf4j.Slf4j;
@Service
@Slf4j
public class AdminServiceImpl implements AdminService{
	
	@Autowired
	public AdminServiceImpl(AdminDao adminDao, AdminReportDao adminReportDao) {
		this.adminDao = adminDao;
		this.adminReportDao = adminReportDao;
	}	

	private final AdminDao adminDao;
	
	private final AdminReportDao adminReportDao;
	
	@Autowired
	private SqlSessionTemplate sst;

	@Autowired
	private BCryptPasswordEncoder pwdEnc;
	

	Map<String, Object> map = new HashMap<String, Object>();
	
	/**
	 * 로그인
	 */
	@Override
	public AdminVo login(AdminVo vo) {
		
		AdminVo dbAdmin = adminDao.selectOneAdminById(sst, vo.getId());
		
		if(dbAdmin == null) return null;

		
		String rawPassword = vo.getPwd();
		String encodedPassword = dbAdmin.getPwd();
		
		if(!pwdEnc.matches(rawPassword, encodedPassword)) return null;
		
		// 암호화 전 비번 넣어주기
		dbAdmin.setRawPwd(rawPassword);

		
		return dbAdmin;
		
	}
	
	/**
	 * 중복체크
	 */
	@Override
	public String dupCheck(AdminVo vo) {
		AdminVo adminMember = adminDao.selectOneAdminByVo(sst, vo);
		
		String result = "";
		
		if(adminMember != null) {
			return result;
		}
		
		return result = "able";
	}
	
	/**
	 * 관리자 등록
	 */
	@Override
	public int join(AdminVo vo) {
		
		// 암호화
		vo.encode(pwdEnc);
		
		return adminDao.insertAdminOne(sst,vo);
	}
	
	
	/**
	 * 관리자 내 정보 수정
	 */
	@Override
	public AdminVo myInfoModify(AdminVo vo) {
		
		// 비밀번호가 넣이 아니라면 암호화 진행
		if(vo.getPwd().length() != 0) {
			vo.encode(pwdEnc);	
		} 	
	
		// 정보 수정
		int result = adminDao.updateAdmin(sst, vo);
		
		if(result != 1) {
			return null;	
		}
		
		return adminDao.selectOneAdminByVo(sst, vo);
	}

	
	/**
	 * 관리자 총수
	 */
	@Override
	public int selectAdminCount(Map<String, String> mapSearch) {	
		
		return adminDao.selectAdminCount(sst,mapSearch);
	}
	
	/**
	 * 관리자 리스트 가져오기
	 */
	@Override
	public List<AdminVo> selectAdminList(PageVo pv, Map<String, String> mapSearch) {
		
		return adminDao.selectAdminList(sst,pv, mapSearch);
	}
	
	/**
	 * 관리자 상세조회
	 */
	@Override
	public AdminVo adminDetail(String no) {
		
		return adminDao.selectOneAdminByNo(sst,no);
	}
	
	/**
	 *	마스터 관리자 정보수정 
	 */
	@Override
	public int adminModify(AdminVo vo) {
			
		
		return adminDao.updateAdmin(sst, vo);
	}
	/**
	 * 학생 회원 수 조회
	 */
	@Override
	public int selectStudentCount(Map<String, String> mapSearch) {
		
		return adminDao.selectStudentCount(mapSearch, sst);
	
	}
	/**
	 * 학생 회원 리스트 조회
	 */
	@Override
	public List<MemberVo> selectStudentList(PageVo pv, Map<String, String> mapSearch) {
		return adminDao.selectStudentList(sst, pv, mapSearch);
	}
	
	/**
	 * 학생회원 no로 가져오기
	 * 학생회원 포인트 리스트 가져오기
	 */
	@Override
	public Map<String, Object> detailStudent(String no) {
		MemberVo vo = adminDao.selectStudentOneByNo(sst,no);
		List<PointVo> pointList = adminDao.selectPointListByNo(sst,no);
		
		map.put("studentVo", vo);
		map.put("pointList", pointList);
		return map;
	}
	

	/**
	 * 포인트 수정
	 * 포인트 테이블 insert
	 * 회원 테이블 수정
	 * 
	 */
	@Override
	@Transactional
	public int pointEdit(PointVo vo, AlertVo alertVo) {
		
		int insertResult = adminDao.insertPoint(sst, vo);
		
		int updateResult = 0;
		if(insertResult == 1) {
			updateResult = adminDao.updateStudent(sst,vo);
		}
		
		int alertResult = 0;
		if(insertResult * updateResult == 1) {
			alertResult = adminReportDao.insertAlert(sst,alertVo);
		}
		
		return insertResult * updateResult;
	}
	/**
	 * 강사회원 수
	 */
	@Override
	public int selectTeacherCount(SearchVo svo) {
		return adminDao.selectTeacherCount(sst,svo);
	}
	/**
	 * 강사리스트 조회
	 */
	@Override
	public Map<String, Object> selectTeacherList(PageVo pv, SearchVo svo) {
		List<TeacherVo> voList = adminDao.selectTeacherList(sst,pv,svo);
		
		if(voList == null) return null;
		
		int cnt = adminDao.selectTeacherStatusByN(sst);
		
		map.put("voList", voList);
		map.put("cnt", cnt);
		return map;
	}

	
	/**
	 * 강사 디테일 조회
	 * 강사 조회 후 승인된 강사면 강의 리스트 조회
	 */
	@Override
	public Map<String, Object> selectTeacherDetail(String no) {
		
		TeacherVo tvo = adminDao.selectTeacherDetailByNo(sst, no);
		
		List<LectureVo> voList = null; 
		
		if("Y".equals(tvo.getStatusYn())) {
			voList = adminDao.selectLectureList(sst,no);						
		}
		
		map.put("tvo", tvo);
		map.put("voList", voList);
		
		return map;
	}
	/**
	 * 강사 탈락
	 */
	@Override
	public int teacherDelete(String[] arrNo) {
		return adminDao.teacherDeleteByNo(sst,arrNo);
	}
	/**
	 * 강사 승인
	 */
	@Override
	public int teacherApproval(String no) {
		return adminDao.teacherApprovalByNo(sst,no);
	}
	/**
	 * 폐강
	 */
	@Override
	public int classDelete(String cno) {

		return adminDao.classDeleteByNo(sst,cno);
	}
	/**
	 * 아이디 가져오기
	 */
	@Override
	public List<AdminVo> selectAdminIdList(String phone) {
		return adminDao.selectAdminIdListByPhone(sst,phone);
	}
	/**
	 * 관리자 탈퇴처리
	 */
	@Override
	public int adminQuit(String[] arrNo) {
		return adminDao.updateAdminQuityByNo(sst,arrNo);
	}
	/**
	 * 기업 회원 수
	 */
	@Override
	public int selectCorporateCount(SearchVo svo) {
		return adminDao.selectCorporateCount(sst,svo);
	}
	/**
	 * 기업회원리스트
	 * 기업회원 승인대기 수 가져오기
	 */
	@Override
	public Map<String, Object> selectCorporateList(PageVo pv, SearchVo svo) {
		
		List<CorpVo> voList = adminDao.selectCorporateList(sst,pv, svo);
		
		if(voList == null) return null;
		
		int cnt = adminDao.selectCorporateStatusByN(sst);
		
		map.put("voList", voList);
		map.put("cnt", cnt);
		return map;
	}
	/**
	 * 기업회원 디테일조회
	 * 채용 조회
	 */
	@Override
	public Map<String, Object> selectCorpAndEmp(String no) {
		
		CorpVo corpMember = adminDao.selectCorpDetailByNo(sst,no);
		
		List<EmploymentVo> voList = null; 
		if("Y".equals(corpMember.getStatusYn())) {
			voList = adminDao.selectEmploymentList(sst,no);
		}
		
		map.put("voList", voList);
		map.put("corpMember", corpMember);
		return map;
	}
	/**
	 * 학생 탈퇴
	 */
	@Override
	public int studentQuit(String[] arrNo) {
		
		return adminDao.studentQuit(sst,arrNo);
	}
	
	/**
	 * 기업회원 탈퇴
	 */
	@Override
	public int corporateQuit(String[] arrNo) {
		return adminDao.corporateQuit(sst,arrNo);
	}
	/**
	 * 채용공고삭제
	 */
	@Override
	public int empBoardDelete(String eno) {
		return adminDao.empBoardDelete(sst,eno);
	}
	/**
	 * 기업 거절/승인취소
	 */
	@Override
	public int corporateDelete(String no) {
		return adminDao.corporateDelete(sst, no);
	}
	/**
	 * 기업승인
	 */
	@Override
	public int corporateApproval(String no) {
		return adminDao.corporateApproval(sst, no);
	}
	
	/**
	 * 요청가져오기
	 */
	@Override
	public Map<String, Object> selectRequest(Map<String, String> mapSearch,PageVo pv) {
		
		List<RequestVo> voList = adminDao.selectRequest(sst,mapSearch,pv);
		
		if(voList == null) return null;
		
		int cnt = adminDao.selectRequestCheckN(sst);
		
		map.put("voList", voList);
		map.put("cnt", cnt);
		return map;
	}
	/**
	 * 요청 리스트 수
	 */
	@Override
	public int selectRequestConut(Map<String, String> mapSearch) {
		return adminDao.selectRequestConut(sst,mapSearch);
	}
	/**
	 * 요청 읽음으로 바꿈
	 */
	@Override
	public int requestCheck(String[] arrNo) {
		return adminDao.requestCheckY(sst,arrNo);
	}
	
	/**
	 * 질문가져오기
	 */
	@Override
	public List<RequestVo> selectQuestion() {
		// TODO Auto-generated method stub
		return adminDao.selectQuestion(sst);
	}
	/**
	 * 질문 수정
	 */
	@Override
	public int requestEdit(List<RequestVo> voList) {
		
		int result = 0;
		
		if(voList.get(0).getType() == null) {
			for(int i = 1; i < voList.size(); i++) {
				adminDao.requestUpsert(sst, voList.get(i));
			}
		} else {
			for(int i = 0; i < voList.size(); i++) {
				adminDao.requestUpsert(sst, voList.get(i));
			}
		}
		
		return result;
	}
	/**
	 * 질문 삭제
	 */
	@Override
	public int questionDelete(String no) {
		return adminDao.questionDelete(sst,no);
	}
	/**
	 * 대쉬보드 알림
	 */
	@Override
	public Map<String, Object> selectDashboardAlert() {
		
		int teacherRequstCnt = adminDao.selectTeacherStatusByN(sst);
		int corpRequestCnt = adminDao.selectCorporateStatusByN(sst);
		int requestCnt = adminDao.selectRequestCheckN(sst);
		int reportCnt = adminReportDao.selectReportHandleN(sst);
		
		map.put("teacherRequestCnt", teacherRequstCnt);
		map.put("corpRequestCnt", corpRequestCnt);
		map.put("requestCnt", requestCnt);
		map.put("reportCnt", reportCnt);
		
		return map;
	}
	/**
	 * 대시보드 연령대 별 그래프
	 */
	@Override
	public List<ChartVo> selectAgeChart() {

		return adminDao.selectAgeChart(sst);
	}
	/**
	 * 대시보드 카테고리 별 인기강의
	 */
	@Override
	public List<ChartVo> selectClassChart(String cateNo) {
		return adminDao.selectClassChart(sst,cateNo);
	}
	// 디비에 이메일 있는지 확인
	@Override
	public AdminVo adminEmailCheck(String email) {
		return adminDao.selectOneAdminById(sst, email);
	}
	
	// 임시 비번으로 업로드
	@Override
	public int updateTempPwd(AdminVo vo) {
		// 암호화
		vo.encode(pwdEnc);
		
		return adminDao.updateTempPwd(sst,vo);
		
	}

	@Override
	public int stopProcess(ReportVo vo) {
		return adminDao.stopProcess(sst, vo);
	}

	@Override
	public int sendAlert(AlertVo vo) {
		return adminReportDao.insertAlert(sst,vo);
	}




	
	


	
}
