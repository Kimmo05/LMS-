<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>선호도 조사</title>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
    <script type="text/javascript" src="./resources/js/statistics/prefer.js"></script>
    <link rel="stylesheet" href="./resources/css/statistics/tag.css">
</head>
<body>
<h1>사용자 선호조사 페이지 </h1>
<form action="./prefer.do" method="post" id="preferForm">
    <p>선호과목<input id="searchBox">
    <p>
    <div id="selSub"></div>
    <br>
    <br>

    <p>선호 강의 시간
    <p>
        <select name="time">
            <option value="0-30">0시간~30시간</option>
            <option value="30-60">30시간~60시간</option>
            <option value="60-90">60시간~90시간</option>
            <option value="90-120">90시간~120시간</option>
        </select>
    <p>선호 강의 기간</p>
    <select name="date">
        <option value="1">1개월 이내</option>
        <option value="3">3개월 이내</option>
        <option value="6">6개월 이내</option>
        <option value="12">12개월 이내</option>
    </select>
    <button type="button" class="btn btn-primary" onclick="preferCheck()">확인</button>
    <button type="button" class="btn btn-light" onclick="javascript: history.back()">취소</button>
</form>
</body>
</html>