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
	
function modify(){
	location.href="./documentUpdate.do";
}
	
</script>
<div class="page-body">
          <div class="container-fluid">
            <div class="page-header">
              <div class="row">
                <div class="col-sm-6">
                  <h3>과정 자료 수정</h3>
                  <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="./adminMain.do">Home</a></li>
                    <li class="breadcrumb-item">과정 자료게시판</li>
                    <li class="breadcrumb-item">과정 자료 상세조회</li>
                    <li class="breadcrumb-item">글 수정하기</li>
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
                    <h5>자료 수정</h5>
                  </div>
                  <c:if test="${result.cbo_cate eq '자료'}">
                  <form class="form theme-form" action="./documentUpdate.do" method="post" enctype="multipart/form-data">
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
                      <button class="btn btn-primary" type="submit">수정</button>
                      <input class="btn btn-light" type="button" onclick="javascript:history.back(-1)" value="취소">
                    </div>
                  </form>
                  </c:if>
                   <c:if test="${result.cbo_cate eq '동영상'}">
                   <form class="form theme-form" action="./classVideoUpdate.do" method="post">
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
                      <button class="btn btn-primary" type="submit">수정</button>
                      <input class="btn btn-light" type="reset" value="취소">
                    </div>
                  </form>
                   </c:if>
                </div>
			</div>
		</div>
	</div>
</div>
</body>
<%@include file="./admin_footer.jsp" %>
</html>