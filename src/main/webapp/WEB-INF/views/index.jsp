<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="UTF-8">
    <title>첫 페이지</title>
    <%@ include file="./commons/header.jsp" %>
</head>
<body>
      <!-- Page Body Start-->
       <div class="page-wrapper compact-wrapper" id="pageWrapper">
	
		<div class="page-body-wrapper horizontal-menu">
		<%@ include file="./commons/sidebar.jsp"  %>
        <div class="page-body">
            <div class="container-fluid">
                <div class="page-header">
                    <div class="row">
                        <div class="col-sm-6">
                            <h3>Layout Light</h3>
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="../ltr/index.html">Home</a></li>
                                <li class="breadcrumb-item">Starter Kit</li>
                                <li class="breadcrumb-item">Color Version</li>
                                <li class="breadcrumb-item active">Layout Light</li>
                            </ol>

                            <h1>테스트용 시작 메인 페이지</h1>
                            <a href="./adminMain.do">관리자 페이지로 이동하기</a><br>
                            <a href="./prefer.do">사용자 선호조사 페이지</a>
                            <a href="./home.do">결제 페이지로 이동하기</a><br>
                            <a href="./adminSelectPay.do">관리자 결제내역 전체조회</a><br>
                            <a href="./changeStatus.do">결제 상태 변경</a>
                            <hr>
                            이 선위로 아무거나 막 적어도 됩니다.
                        </div>
                        <div class="col-sm-6">

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@ include file="./commons/footer.jsp" %>
    </div>
</div>
</body>
</html>