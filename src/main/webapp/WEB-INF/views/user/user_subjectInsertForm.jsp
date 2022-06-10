<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일반회원 과목 등록 양식 페이지</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<%@ include file="../header.jsp"%>
<body>
	<div class="page-body">
		<div class="container-fluid">
			<div class="page-header">
				<div class="row">
					<div class="col-sm-6">
						<h3>Create Subject</h3>
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="index.html">Home</a></li>
							<li class="breadcrumb-item">Subject</li>
							<li class="breadcrumb-item active">Create Subject</li>
						</ol>
					</div>
				</div>
			</div>

			<div class="row project-cards">
				<div class="col-md-12 project-list">
					<div class="card">
						<div class="row">
							<div class="card-header pb-0">
								<h5>과목 등록</h5>
								<h6>등록할 과목/커리큘럼에 대한 정보를 입력해주세요!</h6>
							</div>
						</div>
					</div>

					<div class="col-sm-12">
						<div class="card">
							<form class="form theme-form" action="./subjectInsert.do" method="post">
								
								<div class="card-body">
									<div class="row">
										<div class="col">
											<div class="mb-3">
												<label>과목명</label> <input class="form-control" type="text"
													name="sub_title" placeholder="과목명 *">
											</div>
										</div>
									</div>
									<div>
										<div class="row">
											<div class="col">
												<div class="mb-3">
													<label>과목 설명</label>
												</div>
												<div>
													<label class="col">[ 예시 ]</label>
													<div class="mb-3">
														<div class="form-control-static">과목 설명 예시입니다.</div>
													</div>
												</div>
												<textarea class="form-control"
													id="exampleFormControlTextarea4" name="sub_content"
													rows="3"></textarea>
											</div>
										</div>
									</div>
								</div>

								<div class="card-body">
									<div class="row">
										<div class="col-sm-4">
											<div class="mb-3">
												<label>과목 버전</label> <input class="form-control" type="text"
													name="cur_version" placeholder="Enter Subject Version">
											</div>
											<div class="mb-3">
												<label>과목 카테고리</label> <select class="form-select"
													id="sub_cod_code" name="sub_cod_code"
													onchange="showCategory()">
													<option value="">------- 선택 -------</option>
													<option value="SUB101">JAVA</option>
													<option value="SUB102">C</option>
													<option value="SUB103">HTML</option>
													<option value="SUB104">PYTHON</option>
													<option value="SUB105">CSS</option>
													<option value="SUB106">LINUX</option>
													<option value="SUB107">C#</option>
													<option value="SUB108">JAVASCRIPT</option>
													<option value="SUB109">AI</option>
													<option value="SUB110">BIGDATA</option>
													<option value="SUB111">DEEPLEARNING</option>
													<option value="SUB112">VR</option>
													<option value="SUB113">AR</option>
													<option value="SUB114">EXCEL</option>
													<option value="SUB115">POWERPOINT</option>
													<option value="SUB116">KOTLIN</option>
													<option value="SUB117">SPRING</option>
													<option value="SUB118">기타</option>
													<option value="SUB119">형상관리</option>
													<option value="SUB120">DATABASE</option>
												</select>
											</div>
										</div>
										<div class="col-sm-4">
											<div class="mb-3">
												<label>과목 수강 시간</label> <input class="form-control"
													type="text" name="cur_time"
													placeholder="Enter Subject Time">
											</div>
										</div>
										<div class="col-sm-4">
											<div class="col">
												<label>과목 난이도</label> <select class="form-select"
													id="cur_level" name="cur_level" onchange="showLevel()">
													<option value="">------- 선택 -------</option>
													<option value="초급">초급</option>
													<option value="중급">중급</option>
													<option value="고급">고급</option>
												</select>
											</div>
										</div>
									</div>
								</div>
								
								<div class="card-body">
									<div class="row">
										<div class="col sm-4">
											<div class="mb-3">
												<label>커리큘럼 기타내용</label>
												<textarea class="form-control"
													id="exampleFormControlTextarea4" name="cur_detail" rows="3"></textarea>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col">
											<div class="mb-3">
												<label>커리큘럼 상세내용</label>
												<div class="form-control-static">과목에 대한 수강 요청사항 및
													수강생과의 약속을 적어주세요!</div>
												<textarea class="form-control"
													id="exampleFormControlTextarea4" name="cur_subcontent"
													rows="3"></textarea>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col">
											<div class="mb-3">
												<label>커리큘럼 임시파일</label>
												<textarea class="form-control"
													id="exampleFormControlTextarea4" name="cur_file" rows="3"></textarea>
											</div>
										</div>
									</div>
								</div>


								<%--                      <div class="row">
                        <div class="col">
                          <div class="mb-3">
                            <label>Upload project file</label>
                            <form class="dropzone" id="singleFileUpload" action="/upload.php">
                              <div class="dz-message needsclick"><i class="icon-cloud-up"></i>
                                <h6>Drop files here or click to upload.</h6><span class="note needsclick">(This is just a demo dropzone. Selected files are <strong>not</strong> actually uploaded.)</span>
                              </div>
                            </form>
                          </div>
                        </div>
                      </div> --%>
								<div class="row">
									<div class="col">
										<div class="text-end">
											<a href="./subjectList.do" style="align-content: right;"><input
												class="btn btn-light" type="button" value="뒤로가기"></a>
											<button class="btn btn-primary" type="submit" onclick="deleteOne()">등록하기</button>
										</div>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		//과목 난이도 선택하는 showLevel()
		function showLevel() {
			var level = document.getElementsByName("cur_level")[0];
			var idx = cur_level.selectedIndex;
			console.log("select한 난이도의 idx : ", idx);

			var levelvalue = cur_level.options[idx].value;
			var leveltext = cur_level.options[idx].textContent;
			console.log("선택한 난이도의 VALUE :", levelvalue);
			console.log("선택한 난이도의 TEXT :", leveltext);
		}

		//과목 카테고리 선택 하는 showCategory()
		//과목 카테고리 이름 선택 후 카테고리 코드 insert
		function showCategory() {
			var cate = document.getElementsByName("sub_cod_code")[0];
			var idx = sub_cod_code.selectedIndex;
			console.log("select한 카테고리의 idx : ", idx);

			var catevalue = sub_cod_code.options[idx].value;
			var catetext = sub_cod_code.options[idx].textContent;
			console.log("선택한 카테고리의 VALUE :", catevalue);
			console.log("선택한 카테고리 TEXT :", catetext);
		}
	</script>
	<%@ include file="../footer.jsp"%>
</body>
</html>