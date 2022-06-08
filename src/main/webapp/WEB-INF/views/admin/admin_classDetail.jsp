<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<title>Insert title here</title>
<%@ include file="./admin_header.jsp" %>
<script type="text/javascript">
function vote(){
	location.href="./insApply.do";
}
</script>
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
          <div class="container-fluid">
            <div class="row">
              <div class="col-sm-12">
                <div class="blog-single">
                 <c:forEach items="${lists}" var="vo" varStatus="vs">
                  <i data-feather="list" style="float: left; padding-bottom: 8px;"></i><h6 style="border: 10px; border-radius: 5px;">&nbsp;과목 리스트 ${vs.count}</h6>
                  <div class="blog-box blog-details">
                    <div class="card">
                      <div class="card-body">
                        <div class="blog-details">
                		 <h6 style="color: teal; font-weight: bold;">과목 제목</h6>
                          <ul class="blog-social">
                            <li>${vo.sub_title}</li>
                          </ul>
                          	<div class="single-blog-content-top">
                          	<br>
                         	<h6 style="color: teal; font-weight: bold;">과목 내용</h6>
                            <p>${vo.sub_content}</p>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                 </c:forEach>
                </div>
              </div>
            </div>
          </div>
          <button style="float: right; margin-right: 30px; width: 132px;" type="button" class="btn btn-light" onclick="javascript:history.back(-1)">뒤로가기</button>
		  <button style="float: right; margin-right: 30px; width: 132px;" type="button" class="btn btn-outline-primary" onclick="vote()">투표하기</button>
          <a style="float: right; margin-right: 30px; width: 132px;" type="button" class="btn btn-outline-primary" href="./classBoardSelectedAll.do">자료게시판</a>
          <a style="float: right; margin-right: 30px; width: 132px;" type="button" class="btn btn-outline-primary" href="./classModifyForm.do?cla_num=${result.cla_num}">글 수정하기</a>
          <!-- Container-fluid Ends-->
        </div>
        <br>
        <br>
        <br>
</body>
<%@include file="./admin_footer.jsp" %>
</html>