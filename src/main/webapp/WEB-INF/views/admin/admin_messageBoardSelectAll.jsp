<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="./admin_header.jsp" %>
<title>Insert title here</title>
<script type="text/javascript">
function changeCate(val){
	location.href="./classBoardSelectedAll.do?mes_cate="+val;
	console.log(val);
	var selected = $("#mes_cate option:selected").val();
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
                    <li class="breadcrumb-item"><a href="./adminMain.do">Home</a></li>
                    <li class="breadcrumb-item">쪽지 게시판</li>
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
                <h5>자료게시판</h5>
                <select class="form-select digits" id="mes_cate " name="mes_cate" style="width: 100px; float: right;" onchange="changeCate(this.options[selectedIndex].value)">
                	<option id="ask" value="질문" <c:if test="${cbo_cate == 'Q'}">selected="selected"</c:if>>질문</option>
                	<option id="req" value="문의" <c:if test="${cbo_cate == 'R'}">selected="selected"</c:if>>문의</option>
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
                      <td><input type="checkbox" name="chkAll" onclick="checkAlls(this.checked)"></td>
<!--                       <th scope="col">seq</th> -->
                      <th scope="col">송신자</th>
                      <th scope="col">내용</th>
                      <th scope="col">수신자</th>
                      <th scope="col">카테고리</th>
                      <th scope="col">등록일</th>
                    </tr>
                  </thead>
                  <tbody>
                  <c:forEach var="vo" items="${lists}"  varStatus="vs">
		              <tr>
<%-- 		              	 <td>${vo.cbo_seq}</td> --%>
		                 <td><input type="checkbox" name="chkVal"></td>
		                 <td>${vo.mes_sender}</td>
		                 <td>${vo.mes_recipient}</td>
		                 <td><a href="./MessageSelectDetail.do?cbo_seq=${vo.MES_SEQ}">${vo.mes_content}</a></td>
		                 <td>${vo.mes_cate}</td>
		                 <td>${vo.mes_regdate}</td>
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