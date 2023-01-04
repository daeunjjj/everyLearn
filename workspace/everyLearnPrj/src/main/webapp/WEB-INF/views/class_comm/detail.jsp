<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>Insert title here</title>
        <link rel="stylesheet" href="/el/resources/css/class_comm/detail.css">
        <!-- Latest compiled and minified CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Latest compiled JavaScript -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <script src="/el/resources/js/class_comm/detail.js"></script>
        <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    </head>

    <body>
        <%@ include file="/WEB-INF/views/common/header.jsp" %>

            <main id="container">
                <br><br>
                <div id="contain-detail">
                    <div id="cate">
                        <label for="">
                            <h1>${detailVo.cateNo}</h1>
                        </label>
                    </div>
                    <div id="detail-wrap">
                    <div id="modify-grid">      
                        <div id="title-wrap">
                            <div id="title">
                             ${detailVo.title }
                            </div>
                            <div style="padding-bottom: 3px;">
                                
                                <img onclick="  postData(); new_window(); "
                                style="height: 15px; width: 18px; margin-bottom: 4px; margin-left: 5px;"
                                src="/el/resources/img/class-comm/warning2.png" alt="">


                                    <input type="hidden" name="blacklist" id="blacklistNo" value="${detailVo.writerNo}">
                                    <input type="hidden" name="accusor" id="accusor" value="${loginMember.memberNo}">
                                    
                                    <input type="hidden" name="cate_no" id="cate_no" value="1">
                                    <input type="hidden" name="board" id="board" value="${detailVo.classCommNo}">
                               
                                 
                                    <input type="hidden" name="blacklist" id="blacklist" value="${detailVo.writer}">
                                    <input type="hidden" name="refortTitle" id="refortTitle" value="${detailVo.title}">
                                    
                                    
                                    
                                    <div class="writer" id="writer">
                                        ${detailVo.writer}
                                    <input id="hidden-writer" type="hidden" value="${detailVo.writer}">
                                    </div>
                                    <div id="enrollDate">
                                        ${detailVo.enrollDate}
                                    </div>
                                </div>
                            </div>
                            <div id="modi_delete">
                                <div><img id="main-modify" src="/el/resources/img/member/edit.png" alt="" onclick="modify();"></div>
                                <div><img id="main-delete" src="/el/resources/img/member/delete.png" alt="" onclick="mainDelete();"></div>
                            </div>
                    </div>  
                    <!-- <div id="hidden-member">dfff</div> -->
                    <input type="hidden" name="hidden-member" id="hidden-member" value="${loginMember.memberNick}">
                    <input type="hidden" name="hidden-commNo" id="hidden-classCommNo" value="${detailVo.classCommNo}">
       


                        <div id="content">
                            <pre>${detailVo.content}</pre>
                        </div>
                    </div>
                    <div id="comment-top">댓글(3)</div>
                    <div style=" margin: 10px 10px;"></div>
                    <div id="comment-main">
                    <c:forEach items="${commentList}" var="comment">
                        <!-- 댓글반복문 -->
                        <div id="comment-wrap">
                            <img onclick="new_window();" style="height: 15px; width: 18px; margin-bottom: 4px; margin-left: 5px;"
                                src="/el/resources/img/class-comm/warning2.png" alt="">
                            <div id="writer">
                                ${comment.comWriter}
                            </div>
                            <div id="enrollDate">
                                ${comment.comEnrollDate}
                            </div>
                        </div>
                        <pre style="margin-bottom: 10px; margin-top: 5px;"> ${comment.comContent}</pre>
                        <!-- 댓글반복문 끝 -->
                    </c:forEach>

                    

          

                    </div>
                    <!-- <form method="post" action="/el/class/comment"> -->
                    <div id="comm-write">
                        <div id="comm-content">
                                <textarea id="data1" name="content" cols="60" rows="3" style="resize: none;"></textarea>
                                <!-- <input type="text" id="data1" name="content" cols="60" rows="3" style="resize: none;"></input> -->
                    
                 
                                <input id="memberNo" name="memberNo" type="hidden" value="${loginMember.memberNo}">
                                <input id="classCommNo"  name="classCommNo" type="hidden" value="${classCommNo}">
                                <!-- <input type="button" onclick="getValueInText();" value="버튼"> -->
                            </div>
                            <div id="div-btn">
                                <button type="button" id="btn-write" onclick="commentWrite();" value="작성">작성</button>
                            </div>
                  
                     
                    </div>


                </div>

                <script>
                    function jin(params) {
                        return true;
                    }
                </script>

<!-- <input type="text" Id="data1">
<input type="button" value="Send" onclick="getValueInText();"> -->
<script>



</script>
                
            </main>
            <%@ include file="/WEB-INF/views/common/footer.jsp" %>

    </body>



    </html>