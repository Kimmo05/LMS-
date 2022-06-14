<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="./admin_header.jsp" %>
<script type="text/javascript">
function download(val){
	location.href="./documentDownload.do?doc_originname="+val.value;
}

function del(val){
	location.href="./classBoardDocDelete.do?cbo_doc_seq="+val.value;
}

</script>
<body>
<div class="page-body">
  <div class="container-fluid">
    <div class="page-header">
      <div class="row">
        <div class="col-sm-6">
<%--           <input type="hidden" name="doc_originname" value="${doc_originname}" readonly="readonly"> --%>
          <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="./adminMain.do">Home</a></li>
            <li class="breadcrumb-item">과정 게시판</li>
            <li class="breadcrumb-item active">과정 게시판 상세</li>
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
                    <li>강사: ${result.cbo_ins_id}</li>
                    <li><i class="icofont icofont-ui-chat"></i>등록일: ${result.cbo_regdate}</li>
                  </ul>
                  <input type="hidden" name="cbo_doc_seq" value="${result.cbo_doc_seq}">
                  <c:if test="${result.cbo_cate eq '자료'}">
                  <button value="${doc_originname}" name="doc_originname" type="submit" style="float: right; margin-top: 15px;" class="btn btn-light" onclick="download(this)">다운로드</button>
                  </c:if>
                  <h3 style="margin-top: 20px;">${result.cbo_title}</h3>
                  <!-- 추후 ck에디터로 업데이트 예정 -->
                  <p style="float: right;">${result.cbo_youtubeadd}</p>
                  
                  <div class="single-blog-content-top">
                    <p>${result.cbo_content}</p>
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
  <button style="float: right; margin-right: 30px; width: 132px;" type="button" class="btn btn-outline-danger" value="${result.cbo_doc_seq}" onclick="del(this)">삭제하기</button>
<%--   <a style="float: right; margin-right: 30px; width: 132px;" type="button" class="btn btn-outline-primary" href="./classModifyForm.do?cla_num=${result.cla_num}">글 수정하기</a> --%>
</div>
</body>
<%@include file="./admin_footer.jsp" %>
</html>