<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 등록과목 조회 화면</title>
</head>
<%@ include file="../header.jsp" %>
<body>
<div class="page-body">
		<div class="container-fluid">
			<div class="page-header">
				<div class="row">
					<div class="col-sm-6">
	                 <h3>내 과목 조회</h3>
	                    <ol class="breadcrumb">
	                    <li class="breadcrumb-item"><a href="./main.do"><i class="icofont icofont-ui-home"></i></a></li>
	                    <li class="breadcrumb-item">마이페이지</li>
	                    <li class="breadcrumb-item active">내가 등록한 과목 조회</li>
	                  </ol>
	                </div>
					</div>
					</div>
					</div>
				
					
					
					 <!-- Container-fluid starts-->
          <div class="container-fluid">
            <div class="email-wrap bookmark-wrap">
              <div class="row">
                <div class="col-xl-3 xl-30">
                  <div class="email-sidebar"><a class="btn btn-primary email-aside-toggle" href="javascript:void(0)">contact filter    </a>
                    <div class="email-left-aside">
                      <div class="card">
                        <div class="card-body">
                        <!-- 왼쪽 바 -->
                          <div class="email-app-sidebar left-bookmark">
                            <div class="media">
                              <div class="media-size-email"><img class="me-3 rounded-circle" src="../assets/images/user/user.png" alt=""></div>
                              <div class="media-body">
                              <a href="user-profile.html">
                                  <h6 class="f-w-700">${info.name}</h6>
                                </a>
                                <p>${info.email}</p>
                              </div>
                            </div>
                            <!-- 유저 정보 밑 부분 -->
                            <ul class="nav main-menu contact-options" role="tablist">
                              <li class="nav-item">
                                <a href="./user_subjectInsertForm.do"><button class="badge-light btn-block btn-mail w-100" type="button"><i class="me-2" data-feather="users"></i>내 과목 생성하기</button></a>
                                
                                
                                <!-- 내 과목 생성하기 누르면 생기는 모달 창 시작 -->
                                <div class="modal fade modal-bookmark" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                  <div class="modal-dialog modal-lg" role="document">
                                    <div class="modal-content">
                                      <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabel">과목 생성 폼</h5>
                                        <button class="btn-close" type="button" data-bs-dismiss="modal" aria-label="Close"></button>
                                      </div>
                                      
                                      <div class="modal-body">
                                        <form class="form-bookmark needs-validation" id="bookmark-form" novalidate="">
                                          <div class="row g-2">
                                            <div class="mb-3 col-md-12 mt-0">
                                              <label for="con-name">과목 명</label>
                                              <div class="row">
                                                <div class="col-sm-6">
                                                  <input class="form-control" id="con-name" type="text" required="" placeholder="First Name" autocomplete="off">
                                                </div>
                                                <div class="col-sm-6">   
                                                  <input class="form-control" id="con-last" type="text" required="" placeholder="Last Name" autocomplete="off">
                                                </div>
                                              </div>
                                            </div>
                                            <div class="mb-3 col-md-12 mt-0">
                                              <label for="con-mail">Email Address</label>
                                              <input class="form-control" id="con-mail" type="text" required="" autocomplete="off">
                                            </div>
                                            <div class="mb-3 col-md-12 my-0">
                                              <label for="con-phone">Phone</label>
                                              <div class="row">
                                                <div class="col-sm-6">
                                                  <input class="form-control" id="con-phone" type="number" required="" autocomplete="off">
                                                </div>
                                                <div class="col-sm-6">
                                                  <select class="form-control" id="con-select">
                                                    <option>Mobile</option>
                                                    <option>Work</option>
                                                    <option>Others</option>
                                                  </select>
                                                </div>
                                              </div>
                                            </div>
                                          </div>
                                          <input id="index_var" type="hidden" value="5">
                                          <button class="btn btn-secondary" type="submit" onclick="submitContact()">Save</button>
                                          <button class="btn btn-primary" type="button" data-bs-dismiss="modal">Cancel</button>
                                        </form>
                                      </div>
                                    </div>
                                  </div>
                                </div>
                                       <!-- 내 과목 생성하기 누르면 생기는 모달 창 끝 -->
                              </li>
                              
                              
                              <!-- 하단 카테고리 상위메뉴 -->
                              <li class="nav-item"><span class="main-title"> 과목 </span></li>
                              <li><a id="pills-personal-tab" data-bs-toggle="pill" href="#pills-personal" role="tab" aria-controls="pills-personal" aria-selected="true"><span class="title">내가 등록한 과목</span></a></li>
                              <!-- 카테고리 추가 모달 시작 -->
                              <li>
                                <button class="btn btn-category" type="button" data-bs-toggle="modal" data-bs-target="#exampleModal1"><span class="title"> + 카테고리 추가하기 </span></button>
                                <div class="modal fade" id="exampleModal1" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel1" aria-hidden="true">
                                  <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                      <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabel1">Add Category</h5>
                                        <button class="btn-close" type="button" data-bs-dismiss="modal" aria-label="Close"></button>
                                      </div>
                                      <div class="modal-body">
                                        <form class="form-bookmark">
                                          <div class="row g-2">
                                            <div class="mb-3 col-md-12">
                                              <input class="form-control" type="text" required="" placeholder="Enter category name" autocomplete="off">
                                            </div>
                                          </div>
                                          <button class="btn btn-secondary" type="button">Save</button>
                                          <button class="btn btn-primary" type="button" data-bs-dismiss="modal">Cancel</button>
                                        </form>
                                      </div>
                                    </div>
                                  </div>
                                </div>
                              </li>
                              <!-- 카테고리 추가 모달 끝 -->
                              <li><a class="show" id="pills-organization-tab" data-bs-toggle="pill" href="#pills-organization" role="tab" aria-controls="pills-organization" aria-selected="false"><span class="title">반려된 과목</span></a></li>
                              <li><a class="show" id="pills-organization-tab" data-bs-toggle="pill" href="#pills-organization" role="tab" aria-controls="pills-organization" aria-selected="false"><span class="title"> 대기중 과목 </span></a></li>
                             
                            </ul>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              
                <div class="col-xl-9 col-md-12 box-col-8 xl-70">
                  <div class="email-right-aside bookmark-tabcontent contacts-tabs">
                    <div class="card email-body radius-left">
                      <div class="ps-0">
                        <div class="tab-content">
                          <div class="tab-pane fade active show" id="pills-personal" role="tabpanel" aria-labelledby="pills-personal-tab">
                            
                            <div class="card mb-0">
                              <div class="card-header d-flex">
                                <h5>내가 등록한 과목</h5><span class="f-14 pull-right mt-0">5 Contacts</span>
                              </div>
               			 	</div>
              	<c:forEach var="sVo" items="${lists}"  varStatus="vs">	 
                  <div class="card">
                    <div class="card-header pb-0">
                      <h5 class="pull-left">${sVo.sub_title}</h5>
                    </div>
                    <div class="card-body">
                      <div class="tabbed-card">
                        <ul class="pull-right nav nav-pills nav-primary" id="pills-clrtab" role="tablist">
                          <li class="nav-item"><a class="nav-link active" id="pills-clrhome-tab" data-bs-toggle="pill" href="#pills-clrhome" role="tab" aria-controls="pills-clrhome" aria-selected="true"><i class="icofont icofont-ui-home"></i>Home</a></li>
                          <li class="nav-item"><a class="nav-link" id="pills-clrprofile-tab" data-bs-toggle="pill" href="#pills-clrprofile" role="tab" aria-controls="pills-clrprofile" aria-selected="false"><i class="icofont icofont-man-in-glasses"></i>Profile</a></li>
                          <li class="nav-item"><a class="nav-link" id="pills-clrcontact-tab" data-bs-toggle="pill" href="#pills-clrcontact" role="tab" aria-controls="pills-clrcontact" aria-selected="false"><i class="icofont icofont-contacts"></i>Contact</a></li>
                        </ul>
                        <div class="tab-content" id="pills-clrtabContent">
                          <div class="tab-pane fade show active" id="pills-clrhome" role="tabpanel" aria-labelledby="pills-clrhome-tab">
                            <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>
                          </div>
                          <div class="tab-pane fade" id="pills-clrprofile" role="tabpanel" aria-labelledby="pills-clrprofile-tab">
                            <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>
                          </div>
                          <div class="tab-pane fade" id="pills-clrcontact" role="tabpanel" aria-labelledby="pills-clrcontact-tab">
                            <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>	
                </c:forEach>
               			 	
                </div>
                </div>
                </div>
 <%-- <span><a class="ps-0 edit-information f-w-600" href="./user_subjectDetail.do?sub_num=${sVo.sub_num}">자세히 보기</a><span><a href="./user_subjectModifyForm.do?sub_num=${sVo.sub_num}">수정하러 가기</a></span></span> --%>
                  </div>
                
                
                
                	</div>
                	</div>
                	</div>
                	</div>
                	</div>
                	</div>
<%@include file="../footer.jsp" %>
</body>
</html>