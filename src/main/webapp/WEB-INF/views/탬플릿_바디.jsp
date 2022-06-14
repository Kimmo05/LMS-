<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>첫 페이지</title>
</head>
<%--다른 폴더 안에 들어가면 인클루드 된 파일 경로 앞에 .을 붙여야함--%>
<%@ include file="./header.jsp" %>
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
            </div>
          </div>
          <!-- Container-fluid Ends-->
        </div>

      </div>
    </div>



<%@include file="./footer.jsp" %>


  
</body>
</html>