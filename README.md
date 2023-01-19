![CODING5](https://i.imgur.com/ggci7Mm.png "CODING5 Logo")

# 📢INTRODUCE
## 기획 의도 : 온라인 강의와 채용 서비스를 제공하는 자기 계발 재능 공유 플랫폼
기간 : 22/12/16 ~ 23/1/12 / 4주
<br>
팀원 : 이소은(조장), 배윤아(노션관리), 안연주(DB관리), 송해연(이슈관리), 조다은(형상관리)
<br>

## ⚙STACK

| Sort             | Name                                                                               |
| ---------------- | --------------------------------------------------------------                     |
| **_FrontEnd_**   | `HTML5` `CSS3` `JavaScript` `jQuery`  `Ajax` `Bootstrap`                           |
| **_DB, Server_** | `Oracle` `Tomcat`                                                                  |
| **_BackEnd_**    | `Java` `JSP` `MyBatis` `Spring`                                                    |
| **_Etc Tools_**  | `GitHub` `Visual Studio Code` `Notion` `Sourcetree` `eclipse` `ERD cloud` `Figma`  |

## 주요기능

#### 기업 회원
  회원가입, 로그인, 회원 탈퇴, 비밀번호 찾기, 로그아웃, 메일api
  기업 정보 등록, 수정, 저장, 파일 첨부, 기업 승인 요청
  채용공고 등록, 수정, 삭제, 조회 및 상세조회, 페이징
  지원자 현황 조회 및 지원자 이력서 조회, 페이징

#### 이력서(일반 회원)
   이력서 등록, 수정, 저장, 조회, 파일 첨부, 채용 공고 지원, 조회

#### 채용 페이지
  채용 메인페이지, 갤러리 리스트, 헤더, 푸터, 공고 상세조회, 공고 검색, 페이징
 
#### 강의
강의 등록, 세부 목차 등록, 강의 검색, 강의 조회, 수강평 CRUD, 강의 찜하기

#### 결제
장바구니에 담기, 장바구니 삭제, 장바구니에 담긴 강의 결제하기, 결제시 포인트 사용, 결제 금액 1% 포인트 적립

#### 일반 회원
회원가입, 로그인, 로그아웃, 아이디찾기, 회원정보 수정, 포인트 조회, 작성글 조회, 회원탈퇴, 마이페이지 메뉴바, 내 강의 조회, 내 강의 진도율

#### 강사 회원
강사 신청, 강사 정보(회원용), 강사 정보(강사용), 강사 정보 일부 수정

#### 강의 커뮤니티
게시글 작성, 질문답변 / 스터디 / 자유게시판 페이지 조회, 좋아요기능, 조회수 기능, 신고기능, 댓글 기능, 페이징처리, 검색기능,  게시글 삭제,  게시판 최신순/조회순 조회

#### 관리자

관리자 회원
관리자 등록, 로그인, 탈퇴, 아이디 찾기(문자api사용), 비밀번호 찾기(메일api사용), 로그아웃, 내 정보조회 및 수정, 관리자 목록 조회 검색 페이징, 관리자 상세조회 및 수정, 관리자 권한 체크

학생회원
학생 목록 조회, 검색, 페이징, 삭제, 상세조회, 포인트 조회 및 증감(수정)

강사회원
강사 목록 조회, 승인대기 조회, 검색 페이징 삭제, 상세조회, 이력서 다운로드 ,승인 및 거절, 강사 강의 목록 조회 및 삭제

기업회원
기업 목록 조회, 승인 대기 조회, 검색 페이징 삭제, 상세조회, 승인 및 거절, 기업 채용 공고 조회 및 삭제

통계
회원별 연령대 조회, 카테고리별 인기 강의 조회(chart.js 라이브러리 사용)

신고관리
신고 목록 조회, 상세 조회, 신고 및 피신고자 알림 보내기, 신고처리

메일
메일, 첨부파일 발송(메일api사용), 보낸 메일 조회, 상세 조회 및 삭제, 보낸 첨부파일 다운로드

요청(설문?)
일반회원 - 요청 보내기
관리자
질문 수정, 삭제, 추가, 일반회원이 보낸 요청 조회 확인 삭제

알림
일반회원 - 알림 조회, 알림 확인(체크)
관리자 - 알림 보내기

NOTICE
관리자 페이지 - 공지 리스트 조회, 작성, 수정, 체크박스로 삭제, 페이징

회원 페이지 - 공지 리스트 조회, 고객센터 헤더

FAQ
관리자 페이지 - FAQ  리스트 조회, 작성,  카테고리, 수정, 체크박스로 삭제, 페이징

회원 페이지 - 아코디언 리스트로 일반 회원 기업 회원 분리

QNA 게시판
관리자 페이지 - QNA  리스트 조회, 답변 작성,  카테고리, 수정, 체크박스로 삭제, 페이징

회원 페이지 - 비공개 글 설정, 리스트 조회, 본인 글만 조회 가능, 상태 조회( 답변 중, 답변 완료)

채용 커뮤니티 게시판
리스트 조회, 페이징, 카테고리, 회원만 작성, 수정, 삭제, 페이징, 좋아요, 댓글, 조회수


## 🔗DB MODELING

![CODING5](https://i.imgur.com/UrrmP7J.png "DBMODELING")
- https://www.erdcloud.com/d/7zdmyQNvEDwp7tem5
