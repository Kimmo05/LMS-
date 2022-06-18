<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="./admin_header.jsp" %>
<title>Insert title here</title>
<script type="text/javascript">
function changeCate(val){
	location.href="./classBoardSelectedAll.do?cbo_cate="+val;
	console.log(val);
	var selected = $("#cbo_cate option:selected").val();
	console.log(selected);
	
}

function insertForm(val){
	var selected = $("#cbo_cate option:selected").val();
	console.log(selected);
	
	if(selected == '동영상' || selected == null){
		location.href="./classVideoInsertForm.do";
	}else{
		location.href="./classDocumentInsertForm.do";
	}
}

</script>
<body>
<!-- page-wrapper Start-->
<div class="page-wrapper" id="pageWrapper">
  <!-- Page Body Start-->
  <div class="page-body-wrapper horizontal-menu">
	<div class="page-body">
	<div class="container-fluid">
            <div class="page-header">
              <div class="row">
                <div class="col-sm-6">
                  <h3>과정 등록</h3>
                  <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="index.html"><i class="icofont icofont-ui-home"></i></a></li>
                    <li class="breadcrumb-item">과정 전체조회</li>
                    <li class="breadcrumb-item">과정 상세조회</li>
                    <li class="breadcrumb-item">과정 자료게시판</li>
                  </ol>
                </div>
                <div class="col-sm-6">
                </div>
              </div>
            </div>
          </div>
      <!-- Container-fluid starts-->
      <div class="container-fluid">
        <div class="row">
          <div class="col-sm-12">
            <div class="card">
              <div class="card-header">
                <c:if test="${cbo_cate eq '동영상' or cbo_cate eq null}">
                	<h5>동영상 자료 게시판</h5>
              	</c:if>
              	<c:if test="${cbo_cate eq '자료'}">
               	 	<h5>파일 자료 게시판</h5>
              	</c:if>
                <select class="form-select digits" id="cbo_cate" name="cbo_cate" style="width: 100px; float: right;" onchange="changeCate(this.options[selectedIndex].value)">
                	<option id="video" value="동영상" <c:if test="${cbo_cate == '동영상'}">selected="selected"</c:if>>동영상</option>
                	<option id="doc" value="자료" <c:if test="${cbo_cate == '자료'}">selected="selected"</c:if>>자료</option>
                </select>
                <input id="insertFrom" style="float: right; margin-right: 30px;" class="btn btn-primary" onclick="insertForm()" value="글 등록하기">
<!--                  <div> -->
<!--              <a href="./subjectInsertForm.do" style="align-content: right;"><input class="btn btn-primary" type="button" value="과목 등록"></a> -->
<!--                    </div> -->
              </div>
              <div class="table-responsive">
                <table class="table table-hover">
                  <thead>
                    <tr>
<!--                       <td><input type="checkbox" name="chkAll" onclick="checkAlls(this.checked)"></td> -->
<!--                       <th scope="col">seq</th> -->
                      <th scope="col">과정 강사</th>
                      <th scope="col">글 제목</th>
                      <th scope="col">카테고리</th>
                      <th scope="col">등록일</th>
                    </tr>
                  </thead>
                  <tbody>
                  <c:forEach var="vo" items="${lists}"  varStatus="vs">
		              <tr>
<%-- 		              	 <td>${vo.cbo_seq}</td> --%>
<!-- 		                 <td><input type="checkbox" name="chkVal"></td> -->
		                 <td>${vo.cbo_ins_id}</td>
		                 <td><a href="./classBoardSelectDetail.do?cbo_seq=${vo.cbo_seq}">${vo.cbo_title}</a></td>
		                 <td>${vo.cbo_cate}</td>
		                 <td>${vo.cbo_regdate}</td>
		              </tr>
		           </c:forEach>
                    
                  </tbody>
                </table>
              </div>
            </div>
          </div>
      </div>
   </div>
</div>
</div>
</div>

</body>
<%@include file="./admin_footer.jsp" %>
</html>