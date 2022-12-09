<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<aside class="menu-bar">
    <nav>
        <div class="top">
            <a href="">
                <img src="/el/resources/img/admin/white-logo.png" alt="로고" width="150" height="150">
            </a>
            <div>
                <a href="/el/admin/info">
                    <i class="bi bi-house-door"></i>
                    관리자
                </a>
            </div>
        </div>
        <div class="menu-middle">
            <ul>
                <li class="nav-items" id="dashboard">
                    <a href="/el/admin/dashboard">
                        <span>대시보드</span>
                        <i class="bi bi-chevron-compact-right"></i>
                    </a>
                </li>
                <li class="nav-items" id="member">
                    <a href="/el/admin/member/student/list">
                        <span>회원관리</span>
                        <i class="bi bi-chevron-compact-right"></i>
                    </a>
                    <div class="hidden-box" id="member-cate">
                        <div class="detail-wrap">
                            <ul>
                                <li class="detail-cate" id="student">
                                    <a href="/el/admin/member/student/list">학생회원</a>
                                </li>
                                <li class="detail-cate" id="teacher">
                                    <a href="/el/admin/member/teacher/list">강사회원</a>
                                </li>
                                <li class="detail-cate" id="corporate">
                                    <a href="/el/admin/member/corporate/list">기업회원</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </li>
                <li class="nav-items">
                    <a href="">
                        <span>강의관리</span>
                        <i class="bi bi-chevron-compact-right"></i>
                    </a>
                </li>
                <li class="nav-items">
                    <a href="">
                        <span>결제관리</span>
                        <i class="bi bi-chevron-compact-right"></i>
                    </a>
                </li>
                <li class="nav-items" id="report">
                    <a href="/el/admin/report/list">
                        <span>신고관리</span>
                        <i class="bi bi-chevron-compact-right"></i>
                    </a>
                </li>
                <li class="nav-items">
                    <a href="">
                        <span>통계</span>
                        <i class="bi bi-chevron-compact-right"></i>
                    </a>
                </li>
                <li class="nav-items" id="admin">
                    <a href="/el/admin/master/list">
                        <span>관리자관리</span>
                        <i class="bi bi-chevron-compact-right"></i>
                    </a>
                    <div class="hidden-box" id="admin-cate">
                        <div class="detail-wrap">
                            <ul>
                                <li class="detail-cate" id="admin-list">
                                    <a href="/el/admin/master/list">관리자조회</a>
                                </li>
                                <li class="detail-cate" id="admin-add">
                                    <a href="/el/admin/master/join">관리자등록</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </li>
                
            </ul>
        </div>
        <div class="menu-bottom">
            <a href="">
                <span>로그아웃</span>
                <i class="bi bi-box-arrow-right"></i>
            </a>
        </div>
    </nav>
</aside>