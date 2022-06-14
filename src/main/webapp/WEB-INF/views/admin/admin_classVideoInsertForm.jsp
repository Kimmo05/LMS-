<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<title>Insert title here</title>
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
                    <li class="breadcrumb-item">과정 전체조회</li>
                    <li class="breadcrumb-item">과정 상세조회</li>
                    <li class="breadcrumb-item">과정 자료게시판</li>
                    <li class="breadcrumb-item">동영상 자료 등록하기</li>
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
                    <h5>동영상 등록</h5>
                  </div>
                  <form class="form theme-form" action="./documentVideoInsert.do" method="post">
                    <div class="card-body">
                      <div class="row">
                        <div class="col">
                          <div class="mb-3">
                            <label class="form-label" for="exampleFormControlInput1">제목</label>
                            <input name="title" class="form-control" id="exampleFormControlInput1" type="text" placeholder="제목을 입력해주세요">
                          </div>
                        </div>
                      </div>
                      <div class="row">
                        <div class="col">
                          <div class="mb-3">
                            <label class="form-label" for="exampleFormControlInput1">동영상 주소</label>
                            <input name="videoAdd" class="form-control" id="exampleFormControlInput1" type="text" placeholder="제목을 입력해주세요">
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
<%@include file="./admin_footer.jsp" %>
</html>