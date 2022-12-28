<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에브리런 - 학생회원</title>
<link rel="stylesheet" href="/el/resources/css/admin/menu.css">
<link rel="stylesheet" href="/el/resources/css/admin/member/student/detail.css">

</head>
<body>
	<div class="wrap">
        <%@include file="/WEB-INF/views/admin/menu.jsp" %>
        <main>
            <h1>학생회원정보</h1>
            <div id="line"></div>
            <div class="main-wrap">
                    <div class="info-wrap">
                        <div class="info-items">
                            <div class="title-wrap" id="profile-wrap">
                                <label for="profile">프로필</label>
                            </div>
                            <div class="input-wrap">
                                <img src="/el/resources/img/admin/admin.png" alt="관리자사진" width="150px" height="200px">
                            </div>
                        <!--
                            <div id="input-file"><input type="file"></div>
                        -->    
                        </div>
                        <div class="info-items">
                            <div class="title-wrap">
                                <label for="id">아이디</label>
                            </div>
                            <div class="input-wrap">
                                <input type="text" name="id" value="${map.studentVo.memberId}" readonly>
                            </div>
                        </div>

                        <div class="info-items">
                            <div class="title-wrap">
                                <label for="name">이름</label>
                            </div>
                            <div class="input-wrap">
                                <input type="text" name="name" id="name" value="${map.studentVo.memberName }" readonly>
                            </div>
                        </div>
                        <div class="info-items">
                            <div class="title-wrap">
                                <label for="nick">닉네임</label>
                            </div>
                            <div class="input-wrap">
                                <input type="text" name="nick" value="${map.studentVo.memberNick }" readonly>
                            </div>
                        </div>
                        <div class="info-items">
                            <div class="title-wrap">
                                <label for="phone">전화번호</label>
                            </div>
                            <div class="input-wrap">
                                <input type="text" name="phone" value="${map.studentVo.phone}" readonly>
                            </div>
                        </div>
                        <div class="info-items">
                            <div class="title-wrap">
                                <label for="email">이메일</label>
                            </div>
                            <div class="input-wrap">
                                <input type="text" name="email" value="${map.studentVo.email }" readonly>
                            </div>
                        </div>
                        <div class="info-items">
                            <div class="title-wrap">
                                <label for="enrollDate">가입날짜</label>
                            </div>
                            <div class="input-wrap">
                                <input type="text" name="enrollDate" value="${map.studentVo.enrollDate }" readonly>
                            </div>
                        </div>
                        <div class="info-items">
                            <div class="title-wrap">
                                <label for="birth">생년월일</label>
                            </div>
                            <div class="input-wrap">
                                <input type="text" name="birth" value="${map.studentVo.birth }" readonly>
                            </div>
                        </div>
                        <div class="info-items">
                            <div class="title-wrap">
                                <label for="quitYn">탈퇴여부</label>
                            </div>
                            <div class="input-wrap">
                                <input type="text" name="quitYn" id="quitYn" value="${map.studentVo.quitYn }" readonly>
                            </div>
                        </div>
                        <div class="info-items">
                            <div class="title-wrap">
                                <label for="reportYn">상태</label>
                            </div>
                            <div class="input-wrap">
                                <input type="text" name="reportYn" id="reportYn" value="${map.studentVo.reportYn }" readonly>
                            </div>
                        </div>
                    </div>
                    <div class="btn-area">
                        <div>
                            <button id="stop-btn">정지</button>
                        </div>
                    </div>
                <h3>포인트</h3>
                <div class="point-box">
                    <form action="/el/admin/member/student/point-edit" method="post" onsubmit="return pwdCheck();">
                        <input name="memberNo" value="${map.studentVo.memberNo}" hidden>
                        <div>포인트 지급/차감</div>
                        <div class="point-top">
                            <div>
                                <select name="history" id="history">
                                    <option value="3">차감</option>
                                    <option value="4">이벤트</option>
                                </select>
                            </div>
                            <div>
                                <input type="text" name="change" placeholder="포인트를 입력해주세요.">
                            </div>
                            <div>
                                <input id="pwd-check" type="password" placeholder="관리자 비밀빈호를 입력해주세요.">
                            </div>
                            <div>
                                <button type="submit">확인</button>
                            </div>
                        </div>
                    </form>
                    <div class="point-bottom">
                        <div class="list-title list">
                            <div>일자</div>
                            <div>사유</div>
                            <div>증감</div>
                            <div>총액 : ${map.studentVo.point}</div>
                        </div>
					 <c:forEach items="${map.pointList}"  var="list">
                            <div class="list-content list">
                            <div>${list.enrollDate }</div>
                            <div>${list.history }</div>
                            <div>${list.change }</div>
                        </div>
                     </c:forEach>
                     <c:if test="${empty map.pointList}">
						<p id="empty-box">내역이 없습니다.</p>
                     </c:if>

                    </div>
                </div>


            </div>
        </main>
    </div>
    <script>
         function pwdCheck() {
            const loginPwd = '${loginAdmin.rawPwd}';
            const inputPwd = $('#pwd-check').val();
            console.log(loginPwd);
            console.log(inputPwd);
            if(loginPwd != inputPwd) {
                return false;
            }    
            return true;
        }
    </script>
</body>
</html>