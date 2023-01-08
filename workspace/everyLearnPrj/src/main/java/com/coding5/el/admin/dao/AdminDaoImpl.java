package com.coding5.el.admin.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.coding5.el.admin.vo.AdminVo;
import com.coding5.el.chart.vo.ChartVo;
import com.coding5.el.common.page.PageVo;
import com.coding5.el.common.page.Pagination;
import com.coding5.el.common.vo.SearchVo;
import com.coding5.el.corp.vo.CorpVo;
import com.coding5.el.corp.vo.EmploymentVo;
import com.coding5.el.email.vo.MailVo;
import com.coding5.el.emp.comm.vo.AttachVo;
import com.coding5.el.lecture.vo.LectureVo;
import com.coding5.el.member.vo.MemberVo;
import com.coding5.el.member.vo.PointVo;
import com.coding5.el.request.vo.RequestVo;
import com.coding5.el.teacher.vo.TeacherVo;

import lombok.extern.slf4j.Slf4j;
@Repository
@Slf4j
public class AdminDaoImpl implements AdminDao{

	@Override
	public AdminVo selectOneAdminByVo(SqlSessionTemplate sst, AdminVo vo) {
		// 관리자 아이디 하나 가져오기
		return sst.selectOne("adminMapper.selectOneAdminByVo",vo);
	}

	@Override
	public int insertAdminOne(SqlSessionTemplate sst, AdminVo vo) {
		// 관리자 아이디 하나 인서트
		return sst.insert("adminMapper.insertAdminOne",vo);
	}

	@Override
	public int updateAdmin(SqlSessionTemplate sst, AdminVo vo) {
		// 관리자 내 정보 업데이트
		return sst.update("adminMapper.updateAdmin",vo);
	}

	@Override
	public int selectAdminCount(SqlSessionTemplate sst, Map<String, String> mapSearch) {
		// 관리자 총 수
		return sst.selectOne("adminMapper.selectAdminConut",mapSearch);
	}

	@Override
	public List<AdminVo> selectAdminList(SqlSessionTemplate sst, PageVo pv,  Map<String, String> mapSearch) {
		// 관리자 리스트 가져오기
		RowBounds rb = Pagination.getRowBounds(pv);
		
		return sst.selectList("adminMapper.selectAdminList",mapSearch,rb);
	}

	@Override
	public AdminVo selectOneAdminByNo(SqlSessionTemplate sst, String no) {
		// 관리자 상세정보
		return sst.selectOne("adminMapper.selectOneAdminByNo",no);
	}

	@Override
	public AdminVo selectOneAdminById(SqlSessionTemplate sst, String id) {
		// 마스터 관리자 아이디 하나 가져오기
		return sst.selectOne("adminMapper.selectOneAdminById", id);
	}

	@Override
	public int selectStudentCount( Map<String, String> mapSearch,SqlSessionTemplate sst) {
		// 학생 회원 수 가져오기
		return sst.selectOne("adminMapper.selectStudentCount",mapSearch);
	}

	@Override
	public List<MemberVo> selectStudentList(SqlSessionTemplate sst, PageVo pv,  Map<String, String> mapSearch) {
		// 학생회원 리스트 가져오기
		RowBounds rb = Pagination.getRowBounds(pv);
		
		return sst.selectList("adminMapper.selectStudentList", mapSearch, rb);
	}

	@Override
	public MemberVo selectStudentOneByNo(SqlSessionTemplate sst, String no) {
		// 학생회원 넘버로 가져오기
		return sst.selectOne("adminMapper.selectStudentOneByNo",no);
	}

	@Override
	public List<PointVo> selectPointListByNo(SqlSessionTemplate sst, String no) {
		// 포인트 리스트 가져오기
		return sst.selectList("adminMapper.selectPointListByNo",no);
	}

	@Override
	public int insertPoint(SqlSessionTemplate sst, PointVo vo) {
		// 포인트 내역 인서트
		return sst.insert("adminMapper.insertPoint",vo);
	}

	@Override
	public int updateStudent(SqlSessionTemplate sst, PointVo vo) {
		// 학생회원 포인트 업뎃
		return sst.update("adminMapper.updateStudent",vo);
	}

	@Override
	public int selectTeacherCount(SqlSessionTemplate sst, SearchVo svo) {
		// 강사 수 조회
		return sst.selectOne("adminMapper.selectTeacherCount",svo);
	}

	@Override
	public List<TeacherVo> selectTeacherList(SqlSessionTemplate sst, PageVo pv, SearchVo svo) {
		// 강사 리스트 조회
		RowBounds rb = Pagination.getRowBounds(pv);
		
		return sst.selectList("adminMapper.selectTeacherList", svo, rb);
	}

	@Override
	public int selectTeacherStatusByN(SqlSessionTemplate sst) {
		// 강사 승인 대기 수
		return sst.selectOne("adminMapper.selectTeacherStatusByN");
	}

	@Override
	public TeacherVo selectTeacherDetailByNo(SqlSessionTemplate sst, String no) {
		// 강사 조회
		return sst.selectOne("adminMapper.selectTeacherDetailByNo", no);
	}

	@Override
	public List<LectureVo> selectLectureList(SqlSessionTemplate sst, String no) {
		// 강의 조회
		return sst.selectList("adminMapper.selectLectureList",no);
	}

	@Override
	public int teacherDeleteByNo(SqlSessionTemplate sst, String[] arrNo) {
		// 강사 탈락
		return sst.update("adminMapper.teacherDeleteByNo",arrNo);
	}

	@Override
	public int teacherApprovalByNo(SqlSessionTemplate sst, String no) {
		// 강사 승인
		return sst.update("adminMapper.teacherApprovalByNo",no);
	}

	@Override
	public int classDeleteByNo(SqlSessionTemplate sst, String cno) {
		// 폐강
		return sst.update("adminMapper.classDeleteByNo",cno);
	}

	@Override
	public List<AdminVo> selectAdminIdListByPhone(SqlSessionTemplate sst, String phone) {
		// 아이디 가져오기
		return sst.selectList("adminMapper.selectAdminIdListByPhone", phone);
	}

	@Override
	public int updateAdminQuityByNo(SqlSessionTemplate sst, String no) {
		// 탈퇴처리
		return sst.update("adminMapper.updateAdminQuityByNo",no);
	}

	@Override
	public int selectCorporateCount(SqlSessionTemplate sst, SearchVo svo) {
		// 기업회원 수
		return sst.selectOne("adminMapper.selectCorporateCount",svo);
	}

	@Override
	public List<CorpVo> selectCorporateList(SqlSessionTemplate sst, PageVo pv, SearchVo svo) {
		// 기업회원리스트
		RowBounds rb = Pagination.getRowBounds(pv);
		
		return sst.selectList("adminMapper.selectCorporateList",svo,rb);
	}

	@Override
	public int selectCorporateStatusByN(SqlSessionTemplate sst) {
		// 기업회원 승인대기 수
		return sst.selectOne("adminMapper.selectCorporateStatusByN");
	}

	@Override
	public CorpVo selectCorpDetailByNo(SqlSessionTemplate sst, String no) {
		// 기업회원디테일
		return sst.selectOne("adminMapper.selectCorpDetailByNo",no);
	}

	@Override
	public List<EmploymentVo> selectEmploymentList(SqlSessionTemplate sst, String no) {
		// 채용공고 리스트들 조회
		return sst.selectList("adminMapper.selectEmploymentList",no);
	}

	@Override
	public int studentQuit(SqlSessionTemplate sst, String[] arrNo) {
		// 학생탈퇴
		return sst.update("adminMapper.studentQuit",arrNo);
	}

	@Override
	public int corporateQuit(SqlSessionTemplate sst, String[] arrNo) {
		// 기업회원탈퇴
		return sst.update("adminMapper.corporateQuit",arrNo);
	}

	@Override
	public int empBoardDelete(SqlSessionTemplate sst, String eno) {
		// 채용공고
		return sst.update("adminMapper.empBoardDelete", eno);
	}

	@Override
	public int corporateDelete(SqlSessionTemplate sst, String no) {
		// 기업 거절 / 취소
		return sst.update("adminMapper.corporateDelete", no);
	}

	@Override
	public int corporateApproval(SqlSessionTemplate sst, String no) {
		// 기업승인
		return sst.update("adminMapper.corporateApproval", no);
	}

	@Override
	public List<RequestVo> selectRequest(SqlSessionTemplate sst, Map<String, String> mapSearch, PageVo pv) {
		// 요청 가져오기
		RowBounds rb = Pagination.getRowBounds(pv);
		return sst.selectList("requestMapper.selectRequest",mapSearch,rb);
	}

	@Override
	public int selectRequestConut(SqlSessionTemplate sst, Map<String, String> mapSearch) {
		// 요청 게시글 수
		return sst.selectOne("requestMapper.selectRequestCount",mapSearch);
	}

	@Override
	public int selectRequestCheckN(SqlSessionTemplate sst) {
		// 요청 체크 안한 수
		return sst.selectOne("requestMapper.selectRequestCheckN");
	}

	@Override
	public int requestCheckY(SqlSessionTemplate sst, String[] arrNo) {
		// 관리자 확인 완
		return sst.update("requestMapper.requestCheckY", arrNo);
	}

	@Override
	public List<RequestVo> selectQuestion(SqlSessionTemplate sst) {
		// 질문가져오기
		return sst.selectList("requestMapper.selectQuestion");
	}

	@Override
	public int requestUpsert(SqlSessionTemplate sst, RequestVo requestVo) {
		// 질문수정
		return sst.update("requestMapper.requestUpsert", requestVo);
	}

	@Override
	public int questionDelete(SqlSessionTemplate sst, String no) {
		// 질문삭제
		return sst.delete("requestMapper.questionDelete",no);
	}


	@Override
	public List<ChartVo> selectAgeChart(SqlSessionTemplate sst) {
		// 연령대별 회원수
		return sst.selectList("adminMapper.selectAgeChart");
	}

	@Override
	public List<ChartVo> selectClassChart(SqlSessionTemplate sst, String cateNo) {
		// 카테고리별 인기강의
		return sst.selectList("adminMapper.selectClassChart",cateNo);
	}

	@Override
	public int updateTempPwd(SqlSessionTemplate sst, AdminVo vo) {
		// 임시 비번 넣어주기
		return sst.update("adminMapper.updateTempPwd",vo);
	}


	


}
