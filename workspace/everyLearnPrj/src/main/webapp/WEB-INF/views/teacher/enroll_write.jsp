<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>Insert title here</title>
        <link rel="stylesheet" href="/el/resources/css/teacher/enroll_write.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <script type="text/javascript" src="/el/resources/js/teacher/enroll_write.js"></script>
    </head>

    <body>
        <%@ include file="/WEB-INF/views/common/header.jsp" %>

            <main id="container">
                <br><br>
                <h3>런문가 신청</h3>
                <br>
                <form action="/el/teacher/write" method="post" onsubmit="submitOk()" enctype="multipart/form-data">
                <div id="wrap-write">
                    <div id="wrap-img">
                        <div id='View_area'></div>
                            <div id="f">
                                <input type="file" class="form-control mt-3" name="imgTeacher" id="profile_pt"
                                    onchange="previewImage(this,'View_area')" style="margin-top: px;">
                            </div>
                    </div>
                    
                    
                    <select class="form-select" id="sel1" name="classCate">
                        <option>- 강의 카테고리 선택 -</option>
                        <option value="1">드로잉</option>
                        <option value="2">요리 / 베이킹</option>
                        <option value="3">운동</option>
                        <option value="4">음악</option>
                        <option value="5">IT</option>
                        <option value="6">언어</option>
                        <option value="7">금융 / 재테크</option>
                    </select>
                    <div class="container mt-3" style="height: 10px;">
                        <input type="text" class="form-control mt-3" name="shortIntro" id="form-control mt-3" style="height: 40px;"
                            placeholder="한 줄 소개(런문가 선정 후 강사소개 페이지에 포함됩니다.)">
                    </div>
                    <div id="wrap">
                        <div style="height: 40px;">
                            <button id="btn-enroll" type="button">이력서</button>
                        </div>
                        <div class="container mt-3">
                            <input type="file" class="form-control mt-3" id="record" name="record">
                        </div>
                    </div>    
                    <div class="mb-3 mt-3">
                        <textarea class="form-control" rows="5" id="comment" name="career" style="width: 672px; margin: auto;" placeholder="경력사항을 입력해주세요.(런문가 선정 후 강사소개 페이지에 포함됩니다.)"></textarea>
                    </div>
                    <div class="mb-3 mt-3">
                        <textarea class="form-control" rows="15" id="comment" name="introduce" style="width: 672px; margin: auto;" placeholder="자기소개 입력란입니다."></textarea>
                      </div>
                      <input type="hidden" value="${loginMember.memberNo}" name="memberNo">
                    </div>
                    <div id="btn-wrap">
                        <button type="submit" class="btn btn-primary" id="btn-enroll2">런문가신청</button>
                    </div>
                        

                </form>

				<script type="text/javascript">
					function submitOk() {
						return true;
					}
				</script>



            </main>
            <%@ include file="/WEB-INF/views/common/footer.jsp" %>

    </body>



    </html>