<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>

    <html>

    <head>
        <meta charset="UTF-8">
        <title>Insert title here</title>
        <link href="${pageContext.request.contextPath}/resources/css/member/modify.css" rel="stylesheet"
            type="text/css">
        <script src="/el/resources/js/member/modify.js"></script>
        
    </head>

    <body>
        <%@ include file="/WEB-INF/views/common/header.jsp" %>
    
            <main id="container">

                <div id="sidebar">
                    <%@ include file="/WEB-INF/views/member/member_sidebar.jsp"%>
                </div>

			

            <div id="contain">
                <div>
                    <div class="top-modify"><label for=""><h3>회원정보</h3></label></div>
                    <div class="top-modify"><label for="">* 회원정보 수정이 가능합니다.</label></div>
                </div>

                <div id="wrap-modify">

                    <form action="" id="modify-form">

                        <div id="wrap-img">
                            <div id='View_area'></div>
                                <div id="f">
                                    <input type="file" class="form-control mt-3" name="imgTeacher" id="profile_pt"
                                        onchange="previewImage(this,'View_area')" style="margin-left: 0px; height: 23px;">
                                </div>
                        </div>

                        <h4><label for="">아이디</label></h4>
                        <span class="modify-box" onclick="noModi()">
                            <div >${loginMember.memberId}</div>
                        </span>
                        <h4><label for="">비밀번호 수정</label></h4>
                        <span class="modify-box">
                            <input type="password" name="memberPwd1">
                        </span>
                        <span>
                            <pre>
    - 영문자(대소문자 구분)/숫자/특수문자 모두 사용
    - 8자~32자(공백 제외)
    - 3개이상 동일한 문자/숫자 사용 불가</pre>
                        </span>
                        <h4><label for="">비밀번호 확인</label></h4>
                        <span class="modify-box">
                            <input type="password" name="memberPwd2">

                        </span>
                        <h4><label for="">이름</label></h4>
                        <span class="modify-box">
                            <input type="text" name="memberName" placeholder="${loginMember.memberName }">
                        </span>
                        <h4><label for="">휴대폰 번호</label></h4>
                        <span class="modify-box">
                            <input type="tel" name="memberTel" placeholder="${loginMember.phone }">
                        </span>
                        <h4><label for="">이메일</label></h4>
                        <span class="modify-box">
                            <input type="email" name="memberEmail" placeholder="${loginMember.email }">
                        </span>
                        <h4><label for="">생년월일</label></h4>
                        <span class="modify-box">
                            <div>${loginMember.birth}</div>
                            <!-- <input type="text" name="memberBirth" placeholder="${loginMember.birth}"> -->
                        </span>
                        <h4><label for="">닉네임</label></h4>
                        <span class="modify-box">
                            <input type="text" name="memberNick" placeholder="${loginMember.memberNick }">
                            <button type="button" id="nick-double-check" onclick="nickDup()">중복확인</button>
                        </span>
                        <div id="btn-modify">
                            <button type="button" class="btnJoin">
                                <div class="text-modify">수정하기</div>
                            </button>
                            <button onclick="memberDelete()" type="button" class="btnJoin" id="delete">
                                <div class="text-modify" style="background-color: gray;">회원탈퇴</div>
                            </button>
                        </div>


                    </form>
                </div>
            </div>
            

        </main>
        <%@ include file="/WEB-INF/views/common/footer.jsp" %>
        
        </body>
        
        
        
        </html>