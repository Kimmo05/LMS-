<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<title>Insert title here</title>
<%@ include file="./admin_header.jsp" %>

<body>
	 <!-- Page Sidebar Ends-->
        <div class="page-body">
          <div class="container-fluid">
            <div class="page-header">
              <div class="row">
                <div class="col-sm-6">
                  <h3>${result.cla_title}</h3>
                  <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="./adminMain.do">Home</a></li>
                    <li class="breadcrumb-item">모든 과정</li>
                    <li class="breadcrumb-item active">과정 상세</li>
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
                            <li>${result.cla_startdate}</li>
                            <li><i class="icofont icofont-user"></i></li>
                            <li><i class="icofont icofont-thumbs-up"></i>${result.cla_like}</li>
                            <li><i class="icofont icofont-ui-chat"></i>${result.cla_status}</li>
                          </ul>
                          <h4>
                            ${result.cla_title}
                          </h4>
                          <div class="single-blog-content-top">
                            <p>${result.cla_content}</p>
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
<!--           <button style="float: right; margin-right: 30px; width: 132px;" type="button" class="btn btn-outline-primary" onclick="modify()">글 수정하기</button> -->
          <a style="float: right; margin-right: 30px; width: 132px;" type="button" class="btn btn-outline-primary" href="./classBoardSelectedAll.do">과정 자료게시판</a>
          <a style="float: right; margin-right: 30px; width: 132px;" type="button" class="btn btn-outline-primary" href="./classModifyForm.do?cla_num=${result.cla_num}">글 수정하기</a>
          <!-- Container-fluid Ends-->
        </div>
</body>
<%@include file="./admin_footer.jsp" %>
</html>