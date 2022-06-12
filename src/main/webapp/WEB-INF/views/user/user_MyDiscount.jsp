<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>첫 페이지</title>
</head>
<%@ include file="../header.jsp" %>
<script type="text/javascript" src="../resources/js/pay/alert.js"></script>
<script type="text/javascript" src="../resources/js/pay/sweetalert.min.js"></script>
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
              <h5>${coulists}</h5>
              <h2>마일리지 ${mile}</h2>
              <h2>쿠폰 장수 ${count}</h2>
              <button class="btn btn-success sweet-8" type="button" onclick="_gaq.push(['_trackEvent', 'example', 'try', 'sweet-8']);" data-bs-original-title="" title="">Success</button>
            </div>
          </div>
          <!-- Container-fluid Ends-->
        </div>

      </div>
    </div>



<%@include file="../footer.jsp" %>


  
</body>
</html>