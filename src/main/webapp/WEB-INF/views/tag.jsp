<%--
  Created by IntelliJ IDEA.
  User: JaeMan
  Date: 2022-06-08
  Time: 오후 4:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<html>
<head>
    <title>태그 페이지</title>


</head>
<%@include file="./header.jsp" %>
<body>
<div class="page-body">
    <div class="container-fluid">
        <div class="page-header">
            <div class="row">
                <div class="col-sm-6">
                    <h3>이름</h3>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="index.do">Home</a></li>
                        <li class="breadcrumb-item">중분류</li>
                        <li class="breadcrumb-item active">소분류</li>
                    </ol>
                </div>
            </div>
        </div>
        <!-- Container-fluid starts-->
        <div class="container-fluid">
            <div class="row">
                <h5>Content</h5>
                <h1>태그 검색 페이지</h1>
                <input id="searchBox">
                <hr>
                <table class="table table-hover">
                    <thead>
                    <tr>
                        <th scope="col">과정 강사</th>
                        <th scope="col">글 제목</th>
                        <th scope="col">카테고리</th>
                        <th scope="col">등록일</th>
                    </tr>
                    </thead>
                    <tbody id="searchResult">
                    <c:forEach var="vo" items="${lists}" varStatus="vs">
                        <tr>
                            <td>${vo.cbo_ins_id}</td>
                            <td><a href="./classBoardSelectDetail.do?cbo_seq=${vo.cbo_seq}">${vo.cbo_title}</a>
                            </td>
                            <td>${vo.cbo_cate}</td>
                            <td>${vo.cbo_regdate}</td>
                        </tr>
                    </c:forEach>

                    </tbody>
                </table>
            </div>
        </div>
        <!-- Container-fluid Ends-->
    </div>

</div>
</div>

<%@include file="./footer.jsp" %>
</body>

</html>
