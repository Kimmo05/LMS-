<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="./admin_header.jsp" %>
<body>
<div class="page-body">
  <div class="container-fluid">
    <div class="page-header">
      <div class="row">
        <div class="col-sm-6">
          <h3>${result.mes_cate}</h3>
<%--           <input type="hidden" name="doc_originname" value="${doc_originname}" readonly="readonly"> --%>
          <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="./adminMain.do">Home</a></li>
            <li class="breadcrumb-item">쪽지 게시판</li>
            <li class="breadcrumb-item active">쪽지 게시판 상세보기</li>
          </ol>
        </div>
      </div>
    </div>
  </div>
  <!-- Container-fluid starts-->
  <div class="container-fluid">
    <div class="row">
      <div class="col-sm-12">
        <div class="blog-single">
          <div class="blog-box blog-details">
            <div class="card">
              <div class="card-body">
                <div class="blog-details">
                  <ul class="blog-social">
                    <li><i class="icofont icofont-user"></i></li>
                    <li>강사: ${result.mes_sender}</li>
                    <li><i class="icofont icofont-ui-chat"></i>등록일: ${result.mes_regdate}</li>
                  </ul>
                  <h3>${result.mes_recipient}</h3>
                  <div class="single-blog-content-top">
                    <p>${result.mes_content}</p>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <button style="float: right; margin-right: 30px; width: 132px;" type="button" class="btn btn-light" onclick="javascript:history.back(-1)">뒤로가기</button>
  <button style="float: right; margin-right: 30px; width: 132px;" type="button" class="btn btn-outline-primary" onclick="modify()">글 수정하기</button>
</div>
</body>
<%@include file="./admin_footer.jsp" %>
</html>