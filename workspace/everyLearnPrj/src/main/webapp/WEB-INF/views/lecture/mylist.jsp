
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>everyLearn</title>
<script src="https://kit.fontawesome.com/0c7f523053.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="/el/resources/css/lecture/mylist.css" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="/el/resources/js/member/mylist.js"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
</head>
<body>

	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	
	<main id="container">
	
	
	<div class="wrap">
		<div class= "lec-intro">
			<div id="lec-pic"><img id="lec-pic-Img" src="/el/resources/img/teacher/ex.png"></div>
			<div id="lec-int">
            <div>
                <div id="lec-cate">${classDetailInfoList[0].className}</div>
                <div id="lec-name">${classDetailInfoList[0].className}</div>
    
                <div id="lec-teacher"><i class="fa-regular fa-user"></i>${classDetailInfoList[0].teacherNick}</div>
                <div class="container" style="margin: 0px; padding: 0; width: 309px; margin-top: 40px;">
                    <h4>학습진도율</h4>
                    <div class="progress">
                        <div class="progress-bar progress-bar-success progress-bar-striped" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width:40%">
                            40%
                        </div>
                    </div>
                    
                </div>
            </div>
        </div>
		</div>

		<div class="lec-index-wrap">
        
        
        <div class="lec-index-top">
            <div>목차</div>
            <div style="text-align: center;">강의명</div>
            <div>수강여부</div>
        </div>
        <c:forEach items="${classDetailList}" var="classDetail">
        <div class="lec-index" style="text-align: center;">
            <div>${classDetail.detailNo}강</div>
            
                <div id="chapter" onclick="updateY();" style="text-align: center;">${classDetail.chapter}</div>
                <input type="hidden" id="detailClassNo" name="detailClassNo" value="${classDetail.detailClassNo}">
                <div>수강완료</div>
                <!-- <div id="ddd">
                    ${classDetail.detailClassNo}
                </div> -->
                
        </div>
        </c:forEach>

    </div>

</div>
	
	</main>
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	
</body>
</html>
