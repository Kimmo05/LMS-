<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>선호도 조사</title>
<script
  src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="./resources/js/statistics/prefer.js"></script>
</head>
<%@ include file="./header.jsp" %>
<body>
사용자 선호조사 페이지 
<form action="./prefer.do" method="post">
<select name="" id="">
	<option value=""></option>
</select>
<select name="more_time">
</select>
<select name="less_time">
</select>
<select name="more_date">
</select>
<select name="less_date">
</select>
</form>
</body>
</html>