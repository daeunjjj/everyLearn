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
import com.coding5.el.admin.vo.AdminVo;
import com.coding5.el.common.page.PageVo;
import com.coding5.el.common.vo.SearchVo;
import com.coding5.el.corp.vo.CorpVo;
import com.coding5.el.lecture.vo.LectureVo;
import com.coding5.el.member.vo.MemberVo;
import com.coding5.el.member.vo.PointVo;
import com.coding5.el.teacher.vo.TeacherVo;
@Service
public class AdminServiceImpl implements AdminService{
	
	@Autowired
	public AdminServiceImpl(AdminDao adminDao) {
		this.adminDao = adminDao;
	}

	private final AdminDao adminDao;
	
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
	public int pointEdit(PointVo vo) {
		
		int insertResult = adminDao.insertPoint(sst, vo);
		
		int updateResult = 0;
		if(insertResult == 1) {
			updateResult = adminDao.updateStudent(sst,vo);
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
	public int teacherDelete(String no) {
		return adminDao.teacherDeleteByNo(sst,no);
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
	public int adminQuit(String no) {
		return adminDao.updateAdminQuityByNo(sst,no);
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

	
}
