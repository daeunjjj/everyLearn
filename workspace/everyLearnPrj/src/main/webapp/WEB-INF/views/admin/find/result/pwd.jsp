<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 - 비밀번호 찾기</title>
<link rel="stylesheet" href="/el/resources/css/admin/find/result/pwd.css">
<link rel="stylesheet" href="/el/resources/css/common/reset.css">
</head>
<body>
    <div class="container">
        <div class="main">
            <div class="logo-wrap">
                <img src="/el/resources/img/logo/el.png" alt="로고" width="100%" height="100%">
            </div>
            <div>
                <div class="find-wrap">
                    <div class="title">
                        <h1>비밀번호 변경</h1>
                        <p>변경할 비밀번호로 정확히 입력해 주세요.</p>
                    </div>
                    <div class="input-wrap">
                        <form action="">
                            <div class="pwd-area">
                                <label class="input-label">
                                    <span>비밀번호</span>
                                    <input type="password" name="pwd">
                                </label>
                                <p class="error-msg">숫자 8자이상</p>
                            </div>
                            <div class="pwd-area">
                                <label class="input-label">
                                    <span>비밀번호 확인</span>
                                    <input type="password" name="newPwd">
                                </label>
                                <p class="error-msg hidden">비밀번호가 일치하지 않습니다.</p>
                            </div>
                            <button>비밀번호 변경</button>
                        </form>
                    </div>
                </div>
            </div>

        </div>
    </div>
</body>
</html>