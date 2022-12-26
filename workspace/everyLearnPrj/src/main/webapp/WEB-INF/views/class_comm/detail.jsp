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
                        <div id="title-wrap">
                            <div id="title">
                             ${detailVo.title }
                            </div>
                            <div style="padding-bottom: 3px;">
                                
                                <img onclick=" new_window(); postData(); "
                                style="height: 15px; width: 18px; margin-bottom: 4px; margin-left: 5px;"
                                src="/el/resources/img/class-comm/warning2.png" alt="">


                                    <input type="hidden" name="blacklist" id="blacklistNo" value="${detailVo.writerNo}">
                                    <input type="hidden" name="accusor" id="accusor" value="${loginMember.memberNo}">
                                   
                                    
                                    <input type="hidden" name="cate_no" id="cate_no" value="1">
                                    <input type="hidden" name="board" id="board" value="${detailVo.classCommNo}">
                               
                                 
                                    <input type="hidden" name="blacklist" id="blacklist" value="${detailVo.writer}">
                                    <input type="hidden" name="refortTitle" id="refortTitle" value="${detailVo.title}">

                                    
                                
                                <div id="writer">
									${detailVo.writer}
                                </div>
                                <div id="enrollDate">
                                    ${detailVo.enrollDate}
                                </div>
                            </div>
                        </div>
                        <div id="content">
                            <pre>${detailVo.content}</pre>
                        </div>
                    </div>
                    <div id="comment-top">댓글(3)</div>
                    <div style=" margin: 10px 10px;"></div>
                    <div id="comment-main">
                        <!-- 댓글반복문 -->
                        <div id="comment-wrap">
                            <img onclick="new_window();" style="height: 15px; width: 18px; margin-bottom: 4px; margin-left: 5px;"
                                src="/el/resources/img/class-comm/warning2.png" alt="">
                            <div id="writer">
                                투자가답이다
                            </div>
                            <div id="enrollDate">
                                2022-12-22 12:22:34
                            </div>
                        </div>
                        <pre style="margin-bottom: 10px; margin-top: 5px;">
투자원금 3배 이상 보장합니다. 믿고 맡겨주세요. 제 주소 링크 들어오시면 됩니다. 초기자본 제한 없습니다 편안하게 상담</pre>
                        <!-- 댓글반복문 끝 -->
                        <div id="comment-wrap">
                            <img onclick="new_window();" id="re" style="height: 15px; width: 18px; margin-bottom: 4px; margin-left: 5px;"
                                src="/el/resources/img/class-comm/warning2.png" alt="">
                            <div id="writer">
                                투자가답이다
                            </div>
                            <div id="enrollDate">
                                2022-12-22 12:22:34
                            </div>
                        </div>
                        <pre style="margin-bottom: 10px; margin-top: 5px;">
투자원금 3배 이상 보장합니다. 믿고 맡겨주세요. 제 주소 링크 들어오시면 됩니다. 초기자본 제한 없습니다 편안하게 상담</pre>
                    </div>
                    <form method="post" action="/el/class/comment">
                    <div id="comm-write">
                        <div id="comm-content">
                                <textarea id="content" name="content" cols="60" rows="3" style="resize: none;"></textarea>
                                <input id="memberNo" name="memberNo" type="hidden" value="${loginMember.memberNo}">
                                <input id="classCommNo"  name="classCommNo" type="hidden" value="${detailVo.classCommNo}">
                            </div>
                            <div id="div-btn">
                                <button type="button" id="btn-write" onclick="commentEnroll()">작성</button>
                            </div>
                        </form>
                    </div>
				<form action="">
					<input type="hidden" value="">
				</form>

                </div>


            </main>
            <%@ include file="/WEB-INF/views/common/footer.jsp" %>

    </body>



    </html>