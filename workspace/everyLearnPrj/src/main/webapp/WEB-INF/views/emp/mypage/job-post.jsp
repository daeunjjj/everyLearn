<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <!DOCTYPE html>
  <html>
  <head>
    <meta charset="UTF-8">
    <title>채용 공고 등록</title>
    <link rel="stylesheet" href="/el/resources/css/emp/main.css">
    <link rel="stylesheet" href="/el/resources/css/common/reset.css">
    <link rel="stylesheet" href="/el/resources/css/common/font.css">
    <link rel="stylesheet" href="/el/resources/css/emp/mypage/job-post.css">
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
                <input type="text" placeholder="공고 제목" name="title" class="title" id="title" value="${ev.title}" onblur="validateTitle();" oninput="validate();">
                <div id="input-title" class="x-icon" style="display: none;">
									<div><img src="/el/resources/img/emp/x-icon.svg" alt=""></div>
									<span class="essential">필수입력 항목입니다.</span>
								</div>
              </header>
              <section class="jobDetail">
                <div class="items">
                  <label for="introduce">회사소개 *</label>
                  <textarea name="introduce" id="introduce" maxlength="4000" onblur="validateIntroduce();" oninput="validate();">${ev.introduce}</textarea>
                  <div id="input-introduce" class="x-icon" style="display: none;">
                    <div><img src="/el/resources/img/emp/x-icon.svg" alt=""></div>
                    <span class="essential">필수입력 항목입니다.</span>
                  </div>
                </div>
                <div class="items">
                  <label for="responsibility">주요업무</label>
                  <textarea name="responsibility" id="responsibility" maxlength="1000" onblur="validateResponsibility();" oninput="validate();">${ev.responsibility}</textarea>
                  <div id="input-responsibility" class="x-icon" style="display: none;">
                    <div><img src="/el/resources/img/emp/x-icon.svg" alt=""></div>
                    <span class="essential">필수입력 항목입니다.</span>
                  </div>
                </div>
                <div class="items">
                  <label for="qualification">자격요건</label>
                  <textarea name="qualification" id="qualification" maxlength="1000" onblur="validateQualification();" oninput="validate();">${ev.qualification}</textarea>
                  <div id="input-qualification" class="x-icon" style="display: none;">
                    <div><img src="/el/resources/img/emp/x-icon.svg" alt=""></div>
                    <span class="essential">필수입력 항목입니다.</span>
                  </div>
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
                      <div>
                        <input type="text" name="career" id="career" value="${ev.career}" onblur="validateCareer();" oninput="validate();">
                        <div id="input-career" class="x-icon" style="display: none;">
                          <div><img src="/el/resources/img/emp/x-icon.svg" alt=""></div>
                          <span class="essential">필수입력 항목입니다.</span>
                        </div>
                      </div>
                    </dl>
                  <dl>
                    <label>연봉</label>
                    <div>
                      <div class="min-sales">
                        <input type="text" name="salary" id="salary" class="number" value="${ev.salary}" onblur="validateSalary();" oninput="validate();"><span>만원</span>
                      </div>
                      <div id="input-salary" class="x-icon" style="display: none;">
                        <div><img src="/el/resources/img/emp/x-icon.svg" alt=""></div>
                        <span class="essential">필수입력 항목입니다.</span>
                      </div>
                    </div>
                  </dl>
                  <dl>
                    <label>직군</label>
                    <div>
                      <input type="text" name="sector" id="sector" value="${ev.sector}" onblur="validateSector();" oninput="validate();">
                      <div id="input-sector" class="x-icon" style="display: none;">
                        <div><img src="/el/resources/img/emp/x-icon.svg" alt=""></div>
                        <span class="essential">필수입력 항목입니다.</span>
                      </div>
                    </div>
                  </dl>
                  <dl>
                    <label>지역</label>
                    <div>
                      <input type="text" name="address" id="address" value="${ev.address}" onblur="validateAddress();" oninput="validate();">
                      <div id="input-address" class="x-icon" style="display: none;">
                        <div><img src="/el/resources/img/emp/x-icon.svg" alt=""></div>
                        <span class="essential">필수입력 항목입니다.</span>
                      </div>
                    </div>
                  </dl>
                  <dl>
                      <label>마감일</label>
                      <div>
                        <input type="date" id="date" name="deadline" class="close" value="${ev.deadline}" onblur="validateDate();" oninput="validate();">
                        <input type="checkbox" name="deadline" id="checkbox" value="채용 시 마감" onchange="checkDeadLine();"oninput="validate();"><label for="deadline">채용 시 마감</label>
                        <div id="input-date" class="x-icon" style="display: none;">
                          <div><img src="/el/resources/img/emp/x-icon.svg" alt=""></div>
                          <span class="essential">필수입력 항목입니다.</span>
                        </div>
                      </div>
                  </dl>
                    <button type="submit" class="submit-btn" id="submit-btn" disabled>제출하기</button>
            </aside>
          </div>
        </form>
      </main>

      <%@ include file="/WEB-INF/views/common/footer.jsp" %>


      <script src="/el/resources/js/emp/job-post.js"></script>
  </body>

  </html>