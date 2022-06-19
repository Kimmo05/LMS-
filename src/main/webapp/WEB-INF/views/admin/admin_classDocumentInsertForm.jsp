<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<title>Insert title here</title>
<%@ include file="./admin_header.jsp" %>
<!-- <script src="//cdn.ckeditor.com/4.18.0/standard/ckeditor.js"></script> -->
<!-- Plugins JS start-->
    <script src="../assets/js/editor/ckeditor/ckeditor.js"></script>
    <script src="../assets/js/editor/ckeditor/adapters/jquery.js"></script>
    <script src="../assets/js/editor/ckeditor/styles.js"></script>
    <script src="../assets/js/editor/ckeditor/ckeditor.custom.js"></script>
<body>
<script type="text/javascript">
function filechk(){
	var fileDir="확장자를 포함한 파일명";  
	if(fileDir.substring(fileDir.lastIndexOf(".")+1,fileDir.length).search("확장자명") == -1){
		alert("지정된 확장자의 파일만 업로드 가능합니다!");
		}
	}
</script>
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
                    <li class="breadcrumb-item">글 등록하기</li>
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
                    <h5>자료 등록</h5>
                  </div>
                  <form class="form theme-form" action="./classDocumentInsert.do" method="post" enctype="multipart/form-data">
                    <div class="card-body">
                    <div class="row">
                        <div class="col">
                          <div class="mb-3">
                            <label class="form-label" for="exampleFormControlInput1">파일 업로드 (pdf/jpg/png 파일만 업로드 가능)</label>
                            <input name="uploadFile" class="form-control" id="exampleFormControlInput1" type="file" accept=".pdf, .jpg, .png">
                          </div>
                        </div>
                      </div>
                      <div class="row">
                        <div class="col">
                          <div class="mb-3">
                            <label class="form-label" for="exampleFormControlInput1">제목</label>
                            <input name="cbo_title" class="form-control" id="exampleFormControlInput1" type="text" placeholder="제목을 입력해주세요">
                          </div>
                        </div>
                      </div>
<!--                       <div class="row"> -->
<!--                         <div class="col"> -->
<!--                           <div class="mb-3"> -->
<!--                             <label class="form-label" for="exampleInputPassword2">내용</label> -->
<!--                             <input name="cbo_content" class="form-control" id="exampleInputPassword2" type="text" placeholder="내용을 입력해주세요"> -->
<!--                           </div> -->
<!--                         </div> -->
<!--                       </div> -->
                      <div class="row">
                        <div class="col">
                          <div>
                            <label class="form-label" for="exampleFormControlTextarea4">과정 신청 상세내용</label>
                            <textarea name="cbo_content" class="form-control" id="exampleFormControlTextarea4" rows="3"></textarea>
                          </div>
                        </div>
                      </div>
                    </div>
					<hr>
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