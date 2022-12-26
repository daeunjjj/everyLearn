<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

	<%@ include file="/WEB-INF/views/common/emp-header.jsp"%>

	<main id="container">
		<div class="post">
      <header class="header">
        <div class="companyName">
          <div class="upload-img"><label class="img-label"><div><div class="img-wrapper"><input type="file" accept=".jpg,.jpeg,.png" class="img-input"><div class="img-uploader-cover"></div><div class="rallit-icon  css-12r39mb"><svg width="32" height="32" fill="none" viewBox="0 0 32 32" xmlns="http://www.w3.org/2000/svg"><path d="M.889 4.966a1.86 1.86 0 0 1 1.864-1.855H23.53c1.03 0 1.864.83 1.864 1.855v7.83a.794.794 0 0 1-.799.788.794.794 0 0 1-.799-.788v-7.83a.266.266 0 0 0-.266-.265H2.753a.266.266 0 0 0-.266.265v16.43c0 .146.12.264.266.264h3.125a.82.82 0 0 1 .14-.195l9.706-10.106a1.947 1.947 0 0 1 2.766-.035l3.394 3.357c.155.153.242.36.242.577 0 .73-.894 1.094-1.416.578l-3.39-3.354a.278.278 0 0 0-.396.005l-8.81 9.173h6.671a.8.8 0 0 1 .807.795.8.8 0 0 1-.806.795H2.753A1.86 1.86 0 0 1 .89 21.395V4.966z" fill="#c6cad0"></path><path fill-rule="evenodd" clip-rule="evenodd" d="M8.08 13.71a3.454 3.454 0 0 0 3.463-3.444A3.454 3.454 0 0 0 8.08 6.82a3.454 3.454 0 0 0-3.462 3.445A3.454 3.454 0 0 0 8.08 13.71zm0-1.59a1.86 1.86 0 0 0 1.865-1.854A1.86 1.86 0 0 0 8.08 8.41a1.86 1.86 0 0 0-1.864 1.855A1.86 1.86 0 0 0 8.08 12.12z" fill="#c6cad0"></path><path d="M25.18 16.246a.859.859 0 0 0-1.206 0 .835.835 0 0 0-.25.595v4.763h-4.83a.858.858 0 0 0-.602.246.834.834 0 0 0 0 1.189c.16.158.376.246.602.246h4.83v4.764c0 .222.09.436.25.594a.858.858 0 0 0 1.205 0 .835.835 0 0 0 .25-.595v-4.763h4.83a.858.858 0 0 0 .602-.246.834.834 0 0 0 0-1.189.858.858 0 0 0-.602-.246h-4.83v-4.763a.835.835 0 0 0-.25-.595z" fill="#c6cad0"></path></svg></div><p class="p">업로드할 이미지를 첨부해 주세요.</p><button class="upload-btn" type="button">이미지 업로드</button></div></div></label><span class="span">- 가로 600px, 세로 600px / 5MB이하<br>- 등록 가능 확장자: jpg, png , jpeg</span></div><input type="text" name="companyName">
        </div>
        <input type="text" name="title">
      </header>
      <section>

      </section>
    </div>
	</main>

	<%@ include file="/WEB-INF/views/common/footer.jsp"%>

</body>

</html>