<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <!DOCTYPE html>
  <html>
  <head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link rel="stylesheet" href="/el/resources/css/emp/main.css">
    <link rel="stylesheet" href="/el/resources/css/common/reset.css">
    <link rel="stylesheet" href="/el/resources/css/common/font.css">
    <link rel="stylesheet" href="/el/resources/css/emp/mypage/job-post.css">
    <link rel="icon" type="image/png" sizes="16x16" href="/el/resources/img/logo/favicon-16x16.png">
  </head>

  <body>

    <%@ include file="/WEB-INF/views/common/emp-header.jsp" %>

      <main id="container">
      	<c:if test="${not empty ev}">
      	<form action="/el/corp/edit-position" method="POST">
      	</c:if>
      	<c:if test="${empty ev}">
        <form action="/el/corp/register-position" method="POST">
      	</c:if>
        <input type="hidden" name="no" value="${ev.no}">
          <div class="jobContent">
            <div class="post">
              <header class="header">
                <select name="category" class="category">
                  <option value="1">IT직군</option>
                  <option value="2">경영/사무</option>
                  <option value="3">디자인</option>
                  <option value="4">마케팅</option>
                  <option value="5">교육</option>
                </select>
                <input type="text" placeholder="공고 제목" name="title" class="title" value="${ev.title}">
              </header>
              <section class="jobDetail">
                <div class="items">
                  <label for="introduce">회사소개</label>
                  <textarea name="introduce" id="" maxlength="4000">${ev.introduce}</textarea>
                </div>
                <div class="items">
                  <label for="responsibility">주요업무</label>
                  <textarea name="responsibility" id="" maxlength="1000">${ev.responsibility}</textarea>
                </div>
                <div class="items">
                  <label for="qualification">자격요건</label>
                  <textarea name="qualification" id="" maxlength="1000">${ev.qualification}</textarea>
                </div>
                <div class="items">
                  <label for="preferential">우대사항</label>
                  <textarea name="preferential" id="" maxlength="1000">${ev.preferential}</textarea>
                </div>
                <div class="items">
                  <label for="benefits">혜택 및 복지</label>
                  <textarea name="benefits" id="" maxlength="1000">${ev.benefits}</textarea>
                </div>
              </section>
            </div>
            <aside class="aside">
                  <dl>
                      <label>경력</label>
                      <input type="text" name="career" value="${ev.career}">
                  </dl>
                  <dl>
                      <label>연봉</label>
                      <div class="min-sales">
                        <input type="text" name="salary" class="number" value="${ev.salary}"><span>만원</span>
                      </div>
                  </dl>
                  <dl>
                    <label>직군</label>
                    <input type="text" name="sector" value="${ev.sector}">
                  </dl>
                  <dl>
                    <label>지역</label>
                    <input type="text" name="address" value="${ev.address}">
                  </dl>
                  <dl>
                      <label>마감일</label>
                      <input type="date" name="deadline" class="close" value="${ev.deadline}">
                      <input type="checkbox" name="deadline" value="999999"><label for="deadline">채용 시 마감</label>
                  </dl>
                    <button type="submit" class="submit-btn">제출하기</button>
            </aside>
          </div>
        </form>
      </main>

      <%@ include file="/WEB-INF/views/common/footer.jsp" %>

      <script src="/el/resources/js/emp/job-post.js"></script>
  </body>

  </html>