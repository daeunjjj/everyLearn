<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 - 신고처리</title>
<link rel="stylesheet" href="/el/resources/css/admin/menu.css">
<link rel="stylesheet" href="/el/resources/css/admin/report/process.css">
<link rel="icon" type="image/png" sizes="16x16" href="/el/resources/img/logo/favicon-16x16.png">

</head>
<body>
	<div class="wrap">
        <%@include file="/WEB-INF/views/admin/menu.jsp" %>
        <main>
            <h1>신고처리</h1>
            <div id="line"></div>
            <div class="main-wrap">
                <h2>신고내역</h2>
                <div class="list-items-wrap">
                    <div class="list-items">
                        <div>번호</div>
                        <div>신고자</div>
                        <div>피신고자</div>
                        <div>신고사유</div>
                        <div>신고시간</div>
                        <div>보기</div>
                        <div>상태</div>
                    </div>


                   <div class="list-items list">
                        <div>${vo.no }</div>
						<div>
							<a href="/el/admin/member/student/detail?no=${vo.accusor}" target="_blank">
		                        ${vo.accusorId }
		                        <i class="bi bi-box-arrow-up-right"></i>						
							</a>
						</div>
						<div>
							<a href="/el/admin/member/student/detail?no=${vo.blacklist}" target="_blank">
		                        ${vo.blacklistId }
		                        <i class="bi bi-box-arrow-up-right"></i>						
							</a>
						</div>
                        <div>${vo.type }</div>
                        <div>${vo.reportDate}</div>
                        <div>
						<c:if test="${vo.cateNo eq '1'}">
							<a href="/el/class/detail?classCommNo=${vo.board }" target="_blank">
                                게시물
                                <i class="bi bi-box-arrow-up-right"></i>
                            </a>
						</c:if>
                        </div>
                        <div>미처리</div>
                   </div>
                </div>
                <div class="process-wrap">
                    <h2>신고작성</h2>
                    <div class="form-wrap">
                        <form action="/el/admin/report/process" method="post">
                            <input name="category" value="1" hidden>
                            <input name="no" value="${vo.no}" hidden>
                            <input name="blacklist" value="${vo.blacklist}" hidden>
                            <div class="input-wrap">
                                <div>
                                    처리방법
                                </div>
                                <div>
                                    <label>사유불충분<input type="radio" name="method" id="insufficient" value="1"></label>
                                	<label>회원정지<input type="radio" name="method" id="stop" value="2"></label>
                                </div>
                            </div>
                            <div class="input-wrap">
                                <div>
                                    <label for="blacklist">수신인</label>
                                </div>
                                <div>
                                    <select name="memberNo">
                                        <option value="none"></option>
                                        <option value="${vo.accusor}">신고자</option>
                                        <option value="${vo.blacklist}">피신고자</option>
                                    </select>
                                </div>
                            </div>
                            <div class="input-wrap">
                                <div class="message">
                                    <label for="message">회원메시지</label>
                                </div>
                                <div class="textarea-wrap">
                                    <textarea name="title" id="message"></textarea>
                                </div>
                            </div>
                            <div class="input-wrap input-date">
                                <div>
                                    <label for="start">시작일-만료일</label>
                                </div>
                                <div id="date-box" hidden>
                                    <input type="date" name="startDate" id="start">
                                    <span>-</span>
                                    <input type="date" name="finishDate" id="finish">
                                </div>
                                    
                            </div>
                            <div class="btn-area">
                                <button id="list-btn">목록</button>
                                <button>처리</button>
                            </div>
                        </form>
                    </div>
                </div>
        </main>
    </div>
    <script>

        const reportDate = '${vo.reportDate}';
        const type = '${vo.type}';

        const now = new Date();
        const start = new Date(now.setDate(now.getDate() + 1));

        $('#start').attr('min', start.toISOString().slice(0, 10));
        $('#start').val(start.toISOString().slice(0, 10));
        
        $('#finish').attr('min',start.toISOString().slice(0, 10));

        $(document).ready(function(){
            $("input[name='method']").change(function(){
                if($("#insufficient").is(":checked")){
                    $("#date-box").css('display', 'none');
                    $('#message').text("회원님께서 "+reportDate+" 시각에 신고하신 게시글이 사유불충분으로 신고가 반려되었습니다. 감사합니다.");
                    $('select[name="memberNo"]').val('${vo.accusor}').prop("selected",true);
                } else if($("#stop").is(":checked")){
                    $("#date-box").css('display', 'block');

                    $('#message').text("회원님께서 작성하신 게시글이 "+reportDate+" 시각에 "+ type+"으로 신고되어 회원님의 계정이 익일부터 7일간 정지되었음을 알립니다.");
                    $('select[name="memberNo"]').val('${vo.blacklist}').prop("selected",true);
                } 
            });
        });
    </script>
</body>
</html>