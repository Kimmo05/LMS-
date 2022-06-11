<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>	
    <%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
    
<!DOCTYPE html>
<html>
<head>
 <link rel="stylesheet" type="text/css" href="./assets/css/dropzone.css">
     <link rel="stylesheet" type="text/css" href="../assets/css/date-picker.css">
<meta charset="UTF-8">
<title>일반회원 과목 등록 양식 페이지</title>
</head>
<%@ include file="../header.jsp" %>
<body>
         <div class="page-body">
          <div class="container-fluid">
            <div class="page-header">
              <div class="row">
                <div class="col-sm-6">
                  <h3>개인정보 수정</h3>
                    <sec:authentication property="Details" var="info" /><br>
                  <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="index.html">메인</a></li>
                    <li class="breadcrumb-item">회원</li>
                    <li class="breadcrumb-item active">개인정보 수정</li>
                  </ol>
                </div>
                <div class="col-sm-6">
                  <!-- Bookmark Start-->
                  <div class="bookmark">
                    <ul>
                      <li><a href="javascript:void(0)" data-container="body" data-bs-toggle="popover" data-placement="top" title="" data-original-title="Tables"><i data-feather="inbox"></i></a></li>
                      <li><a href="javascript:void(0)" data-container="body" data-bs-toggle="popover" data-placement="top" title="" data-original-title="Chat"><i data-feather="message-square"></i></a></li>
                      <li><a href="javascript:void(0)" data-container="body" data-bs-toggle="popover" data-placement="top" title="" data-original-title="Icons"><i data-feather="command"></i></a></li>
                      <li><a href="javascript:void(0)" data-container="body" data-bs-toggle="popover" data-placement="top" title="" data-original-title="Learning"><i data-feather="layers"></i></a></li>
                      <li><a href="javascript:void(0)"><i class="bookmark-search" data-feather="star"></i></a>
                        <form class="form-inline search-form">
                          <div class="form-group form-control-search">
                            <input type="text" placeholder="Search..">
                          </div>
                        </form>
                      </li>
                    </ul>
                  </div>
                  <!-- Bookmark Ends-->
                </div>
              </div>
            </div>
          </div>
          <!-- Container-fluid starts-->
          <div class="container-fluid">
            <div class="edit-profile">
              <div class="row">
                <div class="col-xl-4">
                  <div class="card">
                    <div class="card-header pb-0">
                      <h4 class="card-title mb-0">내 정보</h4>
                      <div class="card-options"><a class="card-options-collapse" href="#" data-bs-toggle="card-collapse"><i class="fe fe-chevron-up"></i></a><a class="card-options-remove" href="#" data-bs-toggle="card-remove"><i class="fe fe-x"></i></a></div>
                    </div>
                    <div class="card-body">
                      <form>
                        <div class="row mb-2">
                          <div class="profile-title">
                            <div class="media">                        <img class="img-70 rounded-circle" alt="" src="../assets/images/user/7.jpg">
                              <div class="media-body">
                                <h3 class="mb-1 f-20 txt-primary">${info.name}</h3>
                                <p class="f-12">${info.id}</p>
                              </div>
                            </div>
                          </div>
                        </div>
                         <div class="container-fluid">
            
          </div>
                       
                        <div class="mb-3">
                          <label class="form-label">이메일</label>
                          <input class="form-control" placeholder="${info.email}"  >
                        </div>
                        <div class="mb-3">
                          <label class="form-label">전화번호</label>
                         <input class="form-control" placeholder="${info.phone}"  >
                        </div>
                        <div class="mb-3">
                          <label class="form-label">생년월일</label>
                          <input class="form-control" placeholder="${info.birth }">
                        </div>
                         <sec:authorize access="hasAuthority('ROLE_INSTROCTUR')">
                        <div class="mb-3">
                          <label class="form-label">은행</label>
                          <input class="form-control" placeholder="${info.bank }">
                        </div>
                           <div class="mb-3">
                          <label class="form-label">계좌번호</label>
                          <input class="form-control" placeholder="${info.banknum }">
                        </div>
                         </sec:authorize><br>
                        
                      </form>
                    </div>
                  </div>
                </div>
                <div class="col-xl-8">
                  <form class="card needs-validation  was-validated" >
                    <div class="card-header pb-0">
                      <h4 class="card-title mb-0">내 정보 수정하기</h4>
                      <div class="card-options"><a class="card-options-collapse" href="#" data-bs-toggle="card-collapse"><i class="fe fe-chevron-up"></i></a><a class="card-options-remove" href="#" data-bs-toggle="card-remove"><i class="fe fe-x"></i></a></div>
                    </div>
                      <div class="card-body">
                       <div class="row">
                       <div class="col-sm-6 col-md-6">
                          <div class="mb-3">
                            <label class="form-label" for="validationCustom01">생년월일</label>
                                 <input class="form-control digits" type="date" value="${info.birth}" required="" id="validationCustom01">
                                <div class="valid-feedback">Looks good!</div>
                                  <div class="invalid-feedback">생년월일을 선택해주세요..</div>
                          </div>
                        </div>
                        
                        <div class="col-sm-6 col-md-6">
                          <div class="mb-3">
                            <label class="form-label" for="validationCustom02">전화번호</label>
                            <input class="form-control" type="text" id="validationCustom02" required="" value="${info.phone}">
                            <div class="valid-feedback">Looks good!</div>
                                  <div class="invalid-feedback">전화번호를 선택해주세요..</div>
                          </div>
                        </div>
                        <div class="col-md-12">
                          <div class="mb-3">
                            <label class="form-label" for="validationDefault01" >비밀번호</label>
                            <input class="form-control" id="validationDefault01" type="text" required=""  >
                               <div class="valid-feedback">Looks good!</div>
                            <div class="invalid-feedback">비밀번호를 입력해주세요</div>
                          </div>
                        </div>
                        <div class="col-md-12">
                          <div class="mb-3">
                            <label class="form-label">Email</label>
                            <input class="form-control" type="text" required="" value="${info.email}"  >
                          <div class="valid-feedback">Looks good!</div>
                            <div class="invalid-feedback">이메일을 입력해주세요</div>
                          </div>
                            
                        </div>
                        <sec:authorize access="hasAuthority('ROLE_INSTROCTUR')">
                        <div class="col-md-5">
                          <div class="mb-3">
                            <label class="form-label">은행</label>
                            <select class="form-control btn-square"  required="" aria-label="select example" >
                              <option value="">--은행 선택--</option>
                              <option  value="농협">농협</option>
                              <option  value="우리">우리</option>
                              <option  value="신한">신한</option>
                              <option  value="카카오">카카오</option>
                            </select>
                             <div class="valid-feedback">Looks good!</div>
                             <div class="invalid-feedback">은행을 선택해주세요</div>
                          </div>
                        </div>
                         <div class="col-sm-6 col-md-6">
                          <div class="mb-3">
                            <label class="form-label">계좌번호</label>
                            <input class="form-control" type="text" required="">
                          </div>
                           <div class="valid-feedback">Looks good!</div>
                           <div class="invalid-feedback">계좌번호를 입력해주세요</div>
                        </div>
                        </sec:authorize>
                        <div class="col-md-12">
                          <div>
                            <label class="form-label">프로필 변경</label>
                             <div>
                        <input class="form-control" type="file" aria-label="file example" required="" value="${info.profile}" >
                        <input class="form-control" type="text" aria-label="file example" required="" value="${info.profile}" >
                         <div class="valid-feedback">Looks good!</div>
                        <div class="invalid-feedback">Example invalid form file feedback</div>
                      </div>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="card-footer text-end">
                      <button class="btn btn-primary" type="submit">Update Profile</button>
                    </div>
                  </form>
                </div>
              </div>
            </div>
          </div>
          <!-- Container-fluid Ends-->
        </div>
        
  <!-- footer start-->
        <footer class="footer">
          <div class="container-fluid">
            <div class="row">
              <div class="col-md-6 footer-copyright">
                <p class="mb-0">Copyright 2021-22 © viho All rights reserved.</p>
              </div>
              <div class="col-md-6">
                <p class="pull-right mb-0">Hand crafted & made with <i class="fa fa-heart font-secondary"></i></p>
              </div>
            </div>
          </div>
        </footer>
      </div>
    </div>
    <!-- latest jquery-->
    <script src="./assets/js/jquery-3.5.1.min.js"></script>
    <!-- feather icon js-->
    <script src="./assets/js/icons/feather-icon/feather.min.js"></script>
    <script src="./assets/js/icons/feather-icon/feather-icon.js"></script>
    <!-- Sidebar jquery-->
    <script src="./assets/js/sidebar-menu.js"></script>
    <script src="./assets/js/config.js"></script>
    <!-- Bootstrap js-->
    <script src="./assets/js/bootstrap/popper.min.js"></script>
    <script src="./assets/js/bootstrap/bootstrap.min.js"></script>
      <script src="../assets/js/form-validation-custom.js"></script>
    <!-- Plugins JS start-->
    <script src="./assets/js/datepicker/date-picker/datepicker.js"></script>
    <script src="./assets/js/datepicker/date-picker/datepicker.en.js"></script>
    <script src="./assets/js/datepicker/date-picker/datepicker.custom.js"></script>
    <script src="./assets/js/dropzone/dropzone.js"></script>
    <script src="./assets/js/dropzone/dropzone-script.js"></script>
    <script src="./assets/js/tooltip-init.js"></script>
    <!-- Plugins JS Ends-->
    <!-- Theme js-->
    <script src="./assets/js/script.js"></script>
    <script src="./assets/js/theme-customizer/customizer.js"></script>
    <!-- login js-->
    <!-- Plugin used-->

</body>
</html>