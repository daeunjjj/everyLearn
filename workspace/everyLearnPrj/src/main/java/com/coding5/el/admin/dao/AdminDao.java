package com.coding5.el.admin.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.coding5.el.admin.vo.AdminVo;
import com.coding5.el.chart.vo.ChartVo;
import com.coding5.el.common.page.PageVo;
import com.coding5.el.common.vo.SearchVo;
import com.coding5.el.corp.vo.CorpVo;
import com.coding5.el.corp.vo.EmploymentVo;
import com.coding5.el.lecture.vo.LectureVo;
import com.coding5.el.member.vo.MemberVo;
import com.coding5.el.member.vo.PointVo;
import com.coding5.el.request.vo.RequestVo;
import com.coding5.el.teacher.vo.TeacherVo;

public interface AdminDao {
	// 관리자 하나 가져오기
	public AdminVo selectOneAdminByVo(SqlSessionTemplate sst, AdminVo Vo);
	
	// 관리자 하나 등록
	public int insertAdminOne(SqlSessionTemplate sst, AdminVo vo);
	
	// 관리자 수정
	public int updateAdmin(SqlSessionTemplate sst, AdminVo vo);
	
	// 관리자 총 수
	public int selectAdminCount(SqlSessionTemplate sst, Map<String, String> mapSearch);
	
	// 관리자 리스트 가져오기
	public List<AdminVo> selectAdminList(SqlSessionTemplate sst, PageVo pv, Map<String, String> mapSearch);
	
	// 관리자 하나 넘버로 가져오기
	public AdminVo selectOneAdminByNo(SqlSessionTemplate sst, String no);
	
	// 마스터 관리자 아이디로 아이디 하나 가져오기
	public AdminVo selectOneAdminById(SqlSessionTemplate sst, String id);
	
	// 학생 회원 수 가져오기
	public int selectStudentCount(Map<String, String> mapSearch,SqlSessionTemplate sst);
	
	// 학생 회원 가져오기
	public List<MemberVo> selectStudentList(SqlSessionTemplate sst, PageVo pv, Map<String, String> mapSearch);
	
	// 학생 한명 넘버로 가져오기
	public MemberVo selectStudentOneByNo(SqlSessionTemplate sst, String no);
	
	// 포인트 리스트 가져오기
	public List<PointVo> selectPointListByNo(SqlSessionTemplate sst, String no);
	
	// 포인트 인서트
	public int insertPoint(SqlSessionTemplate sst, PointVo vo);
	
	// 학생회원 수정
	public int updateStudent(SqlSessionTemplate sst, PointVo vo);
	
	// 강사 수 조회
	public int selectTeacherCount(SqlSessionTemplate sst, SearchVo svo);
	
	// 강사 리스트 조회
	public List<TeacherVo> selectTeacherList(SqlSessionTemplate sst, PageVo pv, SearchVo svo);
	
	// 강사 승인 대기 수 조회
	public int selectTeacherStatusByN(SqlSessionTemplate sst);
    
	// 강사 한명 조회
	public TeacherVo selectTeacherDetailByNo(SqlSessionTemplate sst, String no);
	
	// 강의 조회
	public List<LectureVo> selectLectureList(SqlSessionTemplate sst, String no);
	
	// 강사 탈락
	public int teacherDeleteByNo(SqlSessionTemplate sst, String[] arrNo);
	
	// 강사 승인
	public int teacherApprovalByNo(SqlSessionTemplate sst, String no);
	
	// 폐강
	public int classDeleteByNo(SqlSessionTemplate sst, String cno);
	
	// 아이디 가져오기
	public List<AdminVo> selectAdminIdListByPhone(SqlSessionTemplate sst, String phone);
	
	// 탈퇴처리
	public int updateAdminQuityByNo(SqlSessionTemplate sst, String no);
	
	// 기업회원 수
	public int selectCorporateCount(SqlSessionTemplate sst, SearchVo svo);
	
	// 기업회원 리스트 조회
	public List<CorpVo> selectCorporateList(SqlSessionTemplate sst, PageVo pv, SearchVo svo);
	
	// 기업회원 승인 대기 수
	public int selectCorporateStatusByN(SqlSessionTemplate sst);

	// 기업회원디테일
	public CorpVo selectCorpDetailByNo(SqlSessionTemplate sst, String no);
	
	// 채용공고 조회
	public List<EmploymentVo> selectEmploymentList(SqlSessionTemplate sst, String no);
	
	// 학생회원 탈퇴
	public int studentQuit(SqlSessionTemplate sst, String[] arrNo);
	
	// 기업회원 탈퇴
	public int corporateQuit(SqlSessionTemplate sst, String[] arrNo);
	
	// 채용공고삭제
	public int empBoardDelete(SqlSessionTemplate sst, String eno);
	
	// 기업 거절, 취소
	public int corporateDelete(SqlSessionTemplate sst, String no);
	
	// 기업 승인
	public int corporateApproval(SqlSessionTemplate sst, String no);
	
	// 요청 리스트 가져오기
	public List<RequestVo> selectRequest(SqlSessionTemplate sst, Map<String, String> mapSearch,PageVo pv);
	
	// 요청 리스트 수 가져오기
	public int selectRequestConut(SqlSessionTemplate sst, Map<String, String> mapSearch);
	
	// 요청 확인 수
	public int selectRequestCheckN(SqlSessionTemplate sst);
	
	// 요청 관리자 확인
	public int requestCheckY(SqlSessionTemplate sst, String[] arrNo);
	
	// 질문가져오기
	public List<RequestVo> selectQuestion(SqlSessionTemplate sst);
	
	// 질문 수정
	public int requestUpsert(SqlSessionTemplate sst, RequestVo requestVo);
	
	// 질문 삭제
	public int questionDelete(SqlSessionTemplate sst, String no);

	public int selectReportHandleN(SqlSessionTemplate sst);

	public List<ChartVo> selectAgeChart(SqlSessionTemplate sst);
	

	
}
