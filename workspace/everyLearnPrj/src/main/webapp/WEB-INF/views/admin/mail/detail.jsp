<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에브리런 - 보낸내역</title>
<link rel="stylesheet" href="/el/resources/css/admin/menu.css">
<link rel="stylesheet" href="/el/resources/css/admin/mail/detail.css">
</head>
<body>
	<div class="wrap">
        <%@include file="/WEB-INF/views/admin/menu.jsp" %>
        <main>
            <h1>보낸내역</h1>
            <div class="main-wrap">
                <div class="mail-wrap">

                    <div class="input-area" >
                        <label>보낸사람</label>
                        <div class="sender-wrap">
                            <p>${map.mailVo.adminNo }</p>
                            <p>${map.mailVo.fromAddress }</p>
                            </div>
                        </div>
                    <div class="input-area" >
                        <label for="toAddress">받는사람</label>
                        <div class="receiver-wrap">
                            <p>${map.mailVo.toAddress }</p>
                        </div>
                    </div>
                    <div class="input-area">
                        <label for="title">제목</label>
                        <div>
                            <p>${map.mailVo.title}</p>
                        </div>
                    </div>
                    <div id="add-next"></div>
                    <div class="input-area content">
                        <label>내용</label>
                        <div  class="text-wrap">
                            <textarea id="content" name="content" readonly>${map.mailVo.content}</textarea>
                        </div>
                    </div>
                    <div class="input-area">
                        <label for="multipartFile">첨부파일</label>
                        <div class="attach-wrap" >
                            <div id="img-area">
                                <c:if test="${!empty map.attachList }">
                                    <c:forEach items="${map.attachList }" var="list">
                                            <a href="/el/resources/upload/${list.fileName }" download="${list.fileName}">
                                            <div id="img-box">
                                                <img src="/el/resources/upload/${list.fileName}" alt="">
                                            </div>
                                        </a>
                                    </c:forEach>
                                </c:if>
                            </div>
                        </div>
                    </div>
                    <div class="btn-area">
                        <form action="/el/admin/mail/mail/delete" method="POST" onsubmit="return deleteCheck();">
                            <input name="arrNo" value="${map.mailVo.no }" hidden>
                            <div class="mail-btn-area">
                                <button type="submit" id="mail-btn">삭제</button>
                            </div>
                        </form>

                    </div>

                </div>
            </div>
        </main>
    </div>
    <script>
        function deleteCheck(){
            if(!confirm("삭제하시겠습니까?")){
                return false;
            }

            return true;
        }
    </script>
</body>
</html>