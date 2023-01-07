package com.coding5.el.lecture.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.coding5.el.common.page.PageVo;
import com.coding5.el.common.page.Pagination;
import com.coding5.el.lecture.service.LectureService;
import com.coding5.el.lecture.vo.DetailClassVo;
import com.coding5.el.lecture.vo.LectureVo;
import com.coding5.el.lecture.vo.ReviewVo;
import com.coding5.el.member.vo.MemberVo;
import com.coding5.el.teacher.vo.TeacherVo;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("lecture")
public class LectureController {

	@Autowired
	private LectureService lectureService;

	// 강의 메인리스트
	@GetMapping("main")
	public String main(String pno, Model model) {
		
		// 카운트
		int listCount = lectureService.selectLectureCount();
		int currentPage = Integer.parseInt(pno);
		int pageLimit = 5;
		int boardLimit = 10;
		
		PageVo pv = Pagination.getPageVo(listCount, currentPage, pageLimit, boardLimit);

		List<LectureVo> list = lectureService.getList(pv);
		
		model.addAttribute("pv", pv);
		model.addAttribute("list", list);
		
		return "lecture/main";
	}

	/* 강의 메인리스트 - 카테고리 */

	// 강의 메인리스트 - 카테고리 드로잉
	@GetMapping("main/drawing")
	public String mainDrawing(String pno, Model model) {
		// 카운트
		int listCount = lectureService.selectLectureCount();
		int currentPage = Integer.parseInt(pno);
		int pageLimit = 5;
		int boardLimit = 10;
		
		PageVo pv = Pagination.getPageVo(listCount, currentPage, pageLimit, boardLimit);

		List<LectureVo> list = lectureService.getListDrawing(pv);
		
		model.addAttribute("pv", pv);
		model.addAttribute("list", list);
		
		return "lecture/main";
	
	}

	// 강의 메인리스트 - 카테고리 요리/베이킹
	@GetMapping("main/cook")
	public String mainCook(Model model) {
		List<LectureVo> list = lectureService.getListCook();
		model.addAttribute("list", list);
		return "lecture/main";
	}

	// 강의 메인리스트 - 카테고리 운동
	@GetMapping("main/workout")
	public String mainWorkout(Model model) {
		List<LectureVo> list = lectureService.getListWorkout();
		model.addAttribute("list", list);
		return "lecture/main";
	}

	// 강의 메인리스트 - 카테고리 음악
	@GetMapping("main/music")
	public String mainMusic(Model model) {
		List<LectureVo> list = lectureService.getListMusic();
		model.addAttribute("list", list);
		return "lecture/main";
	}

	// 강의 메인리스트 - 카테고리 it
	@GetMapping("main/itTech")
	public String mainItTech(Model model) {
		List<LectureVo> list = lectureService.getListItTech();
		model.addAttribute("list", list);
		return "lecture/main";
	}

	// 강의 메인리스트 - 카테고리 it
	@GetMapping("main/language")
	public String mainLanguage(Model model) {
		List<LectureVo> list = lectureService.getListLanguage();
		model.addAttribute("list", list);
		return "lecture/main";
	}

	// 강의 메인리스트 - 카테고리 finance
	@GetMapping("main/finance")
	public String mainFinance(Model model) {
		List<LectureVo> list = lectureService.getListFinance();
		model.addAttribute("list", list);
		return "lecture/main";
	}

	/*******************************************************/

	// 강의 메인리스트 - 검색
	@GetMapping("main/search")
	public String search(String keyword, Model model) {
		
		HashMap<String, String>map = new HashMap<>();
		map.put("keyword", keyword);
		
		List<LectureVo> list = lectureService.searchBoardList(map);
		
		model.addAttribute("list", list);
		return"lecture/main";
	}

	//강의 세부조회
	@RequestMapping("detail")
	public ModelAndView detail (ModelAndView mv,int bno, HttpSession session) {
		
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");

		
		if (loginMember == null) {
			mv.setViewName("member/login");
		}else {
		
		String mno = loginMember.getMemberNo();
		 
		// 클릭시 조회수 증가
		int result = lectureService.increaseCount(bno);
		
		//찜 목록에 있는지 확인
		String bno1 = Integer.toString(bno);
		
		HashMap<String, String>map = new HashMap<>(); 
		map.put("bno1", bno1);
	 	map.put("mno", mno);

		int checkWish = lectureService.checkWish(map);

		//장바구니목록에 있는지 확인
		int checkCart = lectureService.checkCart(map);
		
		
		//구매 목록에 있는지 확인
		int checkBuy = lectureService.checkBuy(map);
		
		
		// 상세보기
		if(result>0) {
			LectureVo lvo = lectureService.classDetail(bno);
			
			
			mv.addObject("lvo",lvo)
			.addObject("mno", mno)
			.addObject("loginMember", loginMember)
			.addObject("checkWish", checkWish)
			.addObject("checkCart", checkCart)
			.addObject("checkBuy", checkBuy)
			//이 체크위시는 1이거나 0이어야 하는데...?
			
			  .setViewName("lecture/lec_detail");
		}else {
			mv.setViewName("common/errorPage");
		}
		}
		return mv;
		

	}

	

	// 강의 상세페이지 - 수강평
	
	  @GetMapping("detail/review") 
	  public String review(int bno, String pno, Model model, HttpSession session) {
		  
		// 카운트
		int listCount = lectureService.selectReviewCount(bno);
		int currentPage = Integer.parseInt(pno);
		int pageLimit = 5;
		int boardLimit = 3;
			
		PageVo pv = Pagination.getPageVo(listCount, currentPage, pageLimit, boardLimit);
		
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
		if(loginMember == null) {
			return "member/login";
		}else {
		String mno = loginMember.getMemberNo();
		
		List<ReviewVo> reviewList = lectureService.selectReview(bno, pv);
		
		//찜 목록에 있는지 확인
		String bno1 = Integer.toString(bno);
		
		HashMap<String, String>map = new HashMap<>(); 
		map.put("bno1", bno1);
	 	map.put("mno", mno);

		int checkWish = lectureService.checkWish(map);

		//장바구니목록에 있는지 확인
		int checkCart = lectureService.checkCart(map);
		
		//구매 목록에 있는지 확인
		int checkBuy = lectureService.checkBuy(map);
		
		LectureVo lvo = lectureService.classDetail(bno);
		
		model.addAttribute("pv", pv);
		model.addAttribute("bno", bno);
		model.addAttribute("lvo", lvo);
		model.addAttribute("mno", mno);
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("checkWish", checkWish);
		model.addAttribute("checkCart", checkCart);
		model.addAttribute("checkBuy", checkBuy);

		return "lecture/lec_review"; 
		}
	   }
	
	
	//수강평 작성
	  @PostMapping("detail/review") 
	  public String review(String bno, Model model, String writer, String content, String score) {
	
		HashMap<String, String>map = new HashMap<>();
		map.put("bno", bno);
		map.put("writer", writer);
		map.put("content", content);
		map.put("score", score);
		  
		 int reviewVo = lectureService.insertReview(map);		  
		  
		  return reviewVo>0? "redirect:?bno="+bno+"&pno=1" : "common/errorPage";
		  
	
	  }
	  
	  //수강평 수정 get
	  @GetMapping("detail/review/edit")
	  public String editReview(String bno, String rno, Model model) {
		  
		  //System.out.println("get rno : "+ rno);
		  model.addAttribute("rno", rno);
		  model.addAttribute("bno", bno);
		  
		  return "lecture/reviewEdit";
	  }
	  
	  //수강평 수정
	  @PostMapping("detail/review/edit")
	  public String editReview(String bno, Model model, String writer, String content, String score, String rno) {
		  //System.out.println("post rno : " + rno);
		  HashMap<String, String>map = new HashMap<>();
			map.put("bno", bno);
			map.put("rno", rno);
			map.put("content", content);
			map.put("score", score);
		  
			int reviewVo = lectureService.editReview(map);
			
			if(reviewVo == 1) {
		  return "redirect:/lecture/detail/review/?bno="+bno+"&pno=1";
			}else {
				return "common/error";
			}
	  }
	  
	  //수강평 삭제
	  @PostMapping("detail/review/delete")
	  public String deleteReview(String reviewNo, String bno, Model model, HttpSession session) {
		  int deleteReview = lectureService.deleteReview(reviewNo);
		  //System.out.println("delete :: " + deleteReview);
		  
		  if (deleteReview == 1) {
			  model.addAttribute("bno", bno);
			  session.setAttribute("alertMsg", " 게시글이 성공적으로 삭제되었습니다. ");
			  return"redirect:/lecture/detail/review?bno="+bno+"&pno=1";
		  }else {
			  return "common/error";
		  }
	  }
	  
	  
	// 본인이 결제한 강의 목차
	@GetMapping("mylist")
	public String mylist(Model Model, HttpSession session ) {
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
		if(loginMember == null) {
			return "member/login";
		}else {
			String mno = loginMember.getMemberNo();
			
			HashMap<String, String>map = new HashMap<>();
			map.put("mno", mno); // 사실 이것도 필요 없잖아?
			
			
		}
		
		return "lecture/mylist";
	}

	// 강의 내 질문과답변
	@GetMapping("qnalist")
	public String qnalist() {
		return "lecture/qnalist";
	}

	// 질문과답변 작성
	@GetMapping("qnawrite")
	public String qnawrite() {
		return "lecture/qnawrite";
	}

	// 질문과답변 상세페이지
	@GetMapping("qnadetail")
	public String qnadetail() {
		return "lecture/qnadetail";
	}

	/*
	 * // 장바구니
	 * 
	 * @GetMapping("cart") public String cart() { return "lecture/cart"; }
	 * 
	 * //장바구니 (찐)
	 * 
	 * @PostMapping("cart") public String Cart(int bno, Model model) {
	 * 
	 * int result = lectureService.insertCart(bno);
	 * 
	 * if(result == 1) { return "lecture/cart"; } else { return "common/error"; }
	 * 
	 * 
	 * }
	 */

	// 결제완료
	@GetMapping("complete_payment")
	public String completePayment() {
		return "lecture/complete_payment";
	}

	// 강의 등록 ///일단 멤버로
	@GetMapping("insert")
	public String insert(HttpSession session, Model model) {
		
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
		
		if(loginMember == null) {
			return "member/login";
		}else {
			String mno = loginMember.getMemberNo();
			log.info(mno);
			
			model.addAttribute(loginMember);
			model.addAttribute("mno", mno);
			return "lecture/insert";
		}
	}

	// 강의 등록 - post
	@PostMapping("insert")
	public String insert(LectureVo lvo, MultipartFile upfile, HttpSession session, Model model) {
		//lvo.setTeacherNo((String) session.getAttribute("memberNo"));

		int result = lectureService.insertClassOne(lvo);
		int bno = lectureService.selectBno();

		if (result == 1) {
			session.setAttribute("alertMsg", "기본 정보 입력 완료.");
			//model.addAttribute(lvo);
			model.addAttribute("bno" , bno);
			return "redirect:/lecture/insert/detail";
		} else {
			model.addAttribute("errorMsg", " 게시글 등록에 실패하였습니다. ");
			return "common/errorPage";
		}

	}

	// 강의 등록 - 세부(목차)
	@GetMapping("insert/detail")
	public String insertDetail(LectureVo lvo, String bno, Model model) {
		
		
		
		  System.out.println("---------------------controller bno");
		  System.out.println(bno); 
		  model.addAttribute("bno", bno);
		 
		return "lecture/insertDetail";
		
	}

	// 강의 등록 - 세부(목차) - post
	@PostMapping("insert/detail")
	public String insertDetail(String[] no , String[] chapter , String bno , Model model) {
		
		List<LectureVo> list = new ArrayList<LectureVo>();
		
		for (int i = 0; i < no.length; i++) {
			LectureVo lvo = new LectureVo();
			lvo.setDetailno(no[i]);
			lvo.setChapter(chapter[i]);
			lvo.setClassNo(bno);
			list.add(lvo);
		}
				
		int result = lectureService.insertClassDetail(list);
		
		System.out.println("insert all 결과 : " + result);

		if (result > 0) {
			return "redirect:/lecture/main?pno=1";
		} else {
			return "common/errorPage";
		}

	}
	
	
	//강의 찜하기
	@PostMapping("wish")
	public String wish(int bno) {
		return "redirect:?pno=1";
	}
	
	
	
}
