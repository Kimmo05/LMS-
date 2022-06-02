<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%@ include file="./admin_header.jsp" %>
<body>
<div class="page-body">
          <div class="container-fluid">
            <div class="page-header">
              <div class="row">
                <div class="col-sm-6">
                  <h3>과정 등록</h3>
                  <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="./adminMain.do">Home</a></li>
                    <li class="breadcrumb-item">과정 전체</li>
                    <li class="breadcrumb-item">과정 등록</li>
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
                  <div class="card-header pb-0">
                    <h5>과정 신청서</h5>
                  </div>
                  <form class="form theme-form" action="./classInsert.do" method="post">
                    <div class="card-body">
                      <div class="row">
                        <div class="col">
                          <div class="mb-3">
                            <label class="form-label" for="exampleFormControlInput1">과정 신청 제목</label>
                            <input name="title" class="form-control" id="exampleFormControlInput1" type="text" placeholder="신청할 과목의 제목을 입력해주세요">
                          </div>
                        </div>
                      </div>
<!--                       <div class="row"> -->
<!--                         <div class="col"> -->
<!--                           <div class="mb-3"> -->
<!--                             <label class="form-label" for="exampleInputPassword2">Password</label> -->
<!--                             <input class="form-control" id="exampleInputPassword2" type="password" placeholder="Password"> -->
<!--                           </div> -->
<!--                         </div> -->
<!--                       </div> -->
                      <div class="row">
                        <div class="col">
                          <div class="mb-3">
                            <label class="form-label" for="exampleFormControlSelect9">과목 목록</label>
                            <select class="form-select digits" id="exampleFormControlSelect9" name="sub" onchange="selectBoxChange(this.value)">
                              <option>과목을 선택해주세요</option>
                            <c:forEach items="${lists}" var="vo">
                              <option>${vo.sub_num}</option>
                              <option disabled="disabled">${vo.sub_title}</option>
                            </c:forEach>
                            </select>
                            <br>
                            <label class="form-label" for="exampleFormControlInput1">선택한 과목</label>
                            <input readonly="readonly" class="form-control" type="text" id="changeInput" name="subList">
                            <br>
                            <label class="form-label" for="exampleFormControlInput1">추가된 과목</label>
                            <span id="subListed"></span>
                          </div>
                        </div>
                      </div>
                      <div class="row">
                        <div class="col">
                          <div>
                            <label class="form-label" for="exampleFormControlTextarea4">과정 신청 상세내용</label>
                            <textarea name="content" class="form-control" id="exampleFormControlTextarea4" rows="3"></textarea>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="card-footer text-end">
                      <button class="btn btn-primary" type="submit" onclick="deleteOne()">신청</button>
                      <input class="btn btn-light" type="reset" value="취소">
                    </div>
                  </form>
                </div>
			</div>
		</div>
	</div>
</div>
</body>
<script type="text/javascript">
var selectBoxChange = function(value){
	console.log("값변경테스트: " + value);
	$("#changeInput").val(value);
	$("#changeInput").clone().appendTo("#subListed");
}



function deleteOne(){
	$("#changeInput:first").remove();
}


</script>
<%@include file="./admin_footer.jsp" %>
</html>