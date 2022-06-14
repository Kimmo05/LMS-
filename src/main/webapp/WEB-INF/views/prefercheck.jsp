<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>첫 페이지</title>
    <link rel="stylesheet" href="../resources/css/statistics/tag.css">
    <%@ include file="./header.jsp" %>
</head>
<%--다른 폴더 안에 들어가면 인클루드 된 파일 경로 앞에 .을 붙여야함--%>
<body>

<div class="page-body">
    <div class="container-fluid">
        <div class="page-header">
            <div class="row">
                <div class="col-sm-6">
                    <h3>사용자 선호 조사</h3>
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

                <form action="./prefer.do" method="post" id="preferForm">
                    <h4>선호과목</h4><br>
                        <input id="searchBox" class="input-txt-bx">
                        <div id="selSub" style="margin-bottom: 80px"></div>

                    <div class="mb-2">
                        <label class="col-form-label">선호 강의 시간</label>
                        <select name="time" class="form-control form-control-primary btn-square" id="time">
                            <option value="0">선택해주세요</option>
                            <option value="30-60">30시간~60시간</option>
                            <option value="60-90">60시간~90시간</option>
                            <option value="90-120">90시간~120시간</option>
                        </select>
                    </div>

                    <div class="mb-2">
                        <label class="col-form-label">선호 강의 기간</label>
                        <select name="date" class="form-control form-control-primary btn-square" id="date">
                            <option value="0">선택해주세요</option>
                            <option value="1">1개월 이내</option>
                            <option value="3">3개월 이내</option>
                            <option value="6">6개월 이내</option>
                            <option value="12">12개월 이내</option>
                        </select>
                    </div>
                    <br>

                        <br>
                        <br>
                        <button type="button" class="btn btn-primary" onclick="preferCheck()">확인</button>
                        <button type="button" class="btn btn-light" onclick="javascript: history.back()">취소</button>
                </form>
            </div>
        </div>
        <!-- Container-fluid Ends-->
    </div>

</div>
</div>


<%@include file="./footer.jsp" %>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
<script src="../resources/js/statistics/prefer.js"></script>


</body>
</html>