package com.coding5.el.admin.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.coding5.el.admin.vo.AdminVo;
import com.coding5.el.chart.vo.ChartVo;
import com.coding5.el.common.page.PageVo;
import com.coding5.el.common.vo.SearchVo;
import com.coding5.el.email.vo.MailVo;
import com.coding5.el.member.vo.MemberVo;
import com.coding5.el.member.vo.PointVo;
import com.coding5.el.request.vo.RequestVo;
import com.coding5.el.teacher.vo.TeacherVo;

public interface AdminService {
	
	//로그인 
	public AdminVo login(AdminVo vo);
	
	// 중복 체크
	public String dupCheck(AdminVo vo);
	
	// 관리자등록
	public int join(AdminVo vo);
	
	// 관리자 내 정보 수정
	public AdminVo myInfoModify(AdminVo vo);
	
	// 관리자 총 수 조회
	public int selectAdminCount(Map<String, String> mapSearch);
	
	// 관리자 리스트 조회
	public List<AdminVo> selectAdminList(PageVo pv, Map<String, String> mapSearch);
	
	// 관리자 상세 조회
	public AdminVo adminDetail(String no);
	
	// 마스터 관리자 정보 수정
	public int adminModify(AdminVo vo);
	
	// 학생 멤버 수 조회
	public int selectStudentCount(Map<String, String> mapSearch);
	
	// 학생 회원 리스트 가져오기
	public List<MemberVo> selectStudentList(PageVo pv, Map<String, String> mapSearch);
	
	// 학생 회원 no로 가져오기
	public Map<String, Object> detailStudent(String no);
	
	
	// 포인트 수정
	public int pointEdit(PointVo vo);
	
	// 강사 회원 수 조회
	public int selectTeacherCount(SearchVo svo);
	
	// 강사 회원 리스트 조회
	public Map<String, Object> selectTeacherList(PageVo pv, SearchVo svo);
	
	
	// 강사 디테일 조회
	public Map<String, Object> selectTeacherDetail(String no);
	
	// 강사 박탈
	public int teacherDelete(String[] arrNo);
	
	// 강사 승인
	public int teacherApproval(String no);
	
	// 강의 삭제
	public int classDelete(String cno);
	
	// 아이디 가져오기
	public List<AdminVo> selectAdminIdList(String phone);
	
	// 관리자 탈퇴처리
	public int adminQuit(String no);
	
	// 기업회원 수
	public int selectCorporateCount(SearchVo svo);
	
	// 기업회원리스트가져오기
	public Map<String, Object> selectCorporateList(PageVo pv, SearchVo svo);
	
	// 기업회원 디테일 조회
	public Map<String, Object> selectCorpAndEmp(String no);
	
	// 학생 탈퇴
	public int studentQuit(String[] arrNo);
	
	// 기업회원탈퇴
	public int corporateQuit(String[] arrNo);
	
	//채용공고삭제
	public int empBoardDelete(String eno);
	
	// 기업 거절/승인취소
	public int corporateDelete(String no);
	
	// 기업승인
	public int corporateApproval(String no);
	
	// 요청들 가져오기
	public Map<String, Object> selectRequest(Map<String, String> mapSearch,PageVo pv);
	
	// 요청 리스트 수
	public int selectRequestConut(Map<String, String> mapSearch);
	
	// 요청 관리자 확인 완 
	public int requestCheck(String[] arrNo);
	
	// 질문 수정 가져오기
	public List<RequestVo> selectQuestion();
	
	// 질문 수정(찐)
	public int requestEdit(List<RequestVo> voList);
	
	// 질문 삭제
	public int questionDelete(String no);
	
	// 대쉬보드 알람가져오기
	public Map<String, Object> selectDashboardAlert();
	
	// 통계 연령대별
	public List<ChartVo> selectAgeChart();
	
	// 카테고리별 강의 베스트
	public List<ChartVo> selectClassChart(String cateNo);
	
	// 이메일 체크
	public AdminVo adminEmailCheck(String email);
	// 임시 비번 디비에 넣어주기
	public int updateTempPwd(AdminVo vo);
	
	// 메일 보낸 내역 디비에 저장
	public int insertMail(MailVo vo);
	

	

	

	
	
}
