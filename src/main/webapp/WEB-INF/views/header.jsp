<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="viho admin is super flexible, powerful, clean &amp; modern responsive bootstrap 4 admin template with unlimited possibilities.">
    <meta name="keywords" content="admin template, viho admin template, dashboard template, flat admin template, responsive admin template, web app">
    <meta name="author" content="pixelstrap">
    <link rel="icon" href="./assets/images/favicon.png" type="image/x-icon">
    <link rel="shortcut icon" href="./assets/images/favicon.png" type="image/x-icon">
    <title>제목 수정 바람</title>
    <!-- Google font-->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&amp;display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&amp;display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Rubik:ital,wght@0,400;0,500;0,600;0,700;0,800;0,900;1,300;1,400;1,500;1,600;1,700;1,800;1,900&amp;display=swap" rel="stylesheet">
    <!-- Font Awesome-->
    <link rel="stylesheet" type="text/css" href="../assets/css/fontawesome.css">
    <!-- ico-font-->
    <link rel="stylesheet" type="text/css" href="../assets/css/icofont.css">
    <!-- Themify icon-->
    <link rel="stylesheet" type="text/css" href="../assets/css/themify.css">
    <!-- Flag icon-->
    <link rel="stylesheet" type="text/css" href="../assets/css/flag-icon.css">
    <!-- Feather icon-->
    <link rel="stylesheet" type="text/css" href="../assets/css/feather-icon.css">
    <!-- Plugins css start-->
    <link rel="stylesheet" type="text/css" href="../assets/css/animate.css">
    <link rel="stylesheet" type="text/css" href="../assets/css/chartist.css">
    <link rel="stylesheet" type="text/css" href="../assets/css/date-picker.css">
    <link rel="stylesheet" type="text/css" href="../assets/css/prism.css">
    <link rel="stylesheet" type="text/css" href="../assets/css/vector-map.css">
    <!-- Plugins css Ends-->
    <!-- Bootstrap css-->
    <link rel="stylesheet" type="text/css" href="../assets/css/bootstrap.css">
    <!-- App css-->
    <link rel="stylesheet" type="text/css" href="../assets/css/style.css">
    <link id="color" rel="stylesheet" href="../assets/css/color-1.css" media="screen">
    <!-- Responsive css-->
    <link rel="stylesheet" type="text/css" href="../assets/css/responsive.css">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
</head>
<body>
  <!-- Loader starts-->
    <div class="loader-wrapper">
      <div class="theme-loader">    
        <div class="loader-p"></div>
      </div>
    </div>
    <!-- Loader ends-->
    <div class="page-wrapper" id="pageWrapper">
      <!-- Page Header Start-->
      <div class="page-main-header">
        <div class="main-header-right row m-0">
        <div class="main-header-left">
             <sec:authorize access="isAnonymous()">
          
            <div class="logo-wrapper"><a href="./main.do"><img class="img-fluid" src="../resources/images/logo.png" alt=""></a></div>
            <div class="dark-logo-wrapper"><a href="./main.do"><img class="img-fluid" src="../assets/images/logo/dark-logo.png" alt=""></a></div>
            <div class="toggle-sidebar"><i class="status_toggle middle" data-feather="align-center" id="sidebar-toggle"></i></div>
          		</sec:authorize>
          		<sec:authorize access="isAuthenticated()">

          		<div class="logo-wrapper"><a href="./main.do"><img class="img-fluid" src="../resources/images/logo.png" alt=""></a></div>
            <div class="dark-logo-wrapper"><a href="./main.do"><img class="img-fluid" src="../assets/images/logo/dark-logo.png" alt=""></a></div>

            <div class="toggle-sidebar"><i class="status_toggle middle" data-feather="align-center" id="sidebar-toggle"></i></div>
          		</sec:authorize>
          		
          </div>
          <div class="left-menu-header col">
            <ul>
              <li>
                  <form class="form-inline search-form">
                      <div class="search-bg"><i class="fa fa-search"></i>
                          <input class="form-control-plaintext" placeholder="Search here...">
                      </div>
                  </form><span class="d-sm-none mobile-search search-bg"><i class="fa fa-search"></i></span>
              </li>
            </ul>
          </div>
          <div class="nav-right col pull-right right-menu p-0">
            <ul class="nav-menus">
              <sec:authentication property="Authorities" var="auth" />
               <sec:authorize access="isAnonymous()">
 				<li class="onhover-dropdown p-0">
                <button class="btn btn-primary-light" type="button"><a href="./loginPage.do"><i data-feather="log-in"></i>Log in</a></button>
              	</li>
				</sec:authorize>
               <sec:authorize access="isAuthenticated()">
				<li class="onhover-dropdown p-0">
                 <button class="btn btn-primary-light" type="button"><a href="./logout.do"><i data-feather="log-out"></i>Log out</a></button>
              	</li>
				</sec:authorize>
            </ul>
          </div>
          <div class="d-lg-none mobile-toggle pull-right w-auto"><i data-feather="more-horizontal"></i></div>
        </div>
      </div>
      <!-- Page Header Ends                              -->
      <!-- Page Body Start-->
      <div class="page-body-wrapper horizontal-menu">
        <!-- Page Sidebar Start-->
        <header class="main-nav">
         <sec:authorize access="isAuthenticated()"> 
          <div class="sidebar-user text-center"><a class="setting-primary" href="./editProfile.do"><i data-feather="settings"></i></a><img class="img-90 rounded-circle" src="../assets/images/dashboard/1.png" alt="">
            <div class="badge-bottom"><span class="badge badge-primary">
            
            <c:if test = "${auth eq '[ROLE_USER]'}">일반회원 </c:if>
            <c:if test = "${auth eq '[ROLE_INSTROCTUR]'}">강사 </c:if>
            <c:if test = "${auth eq '[ROLE_ADMIN]'}">관리자 </c:if>
            </span></div><a href="user-profile.html">
             <sec:authentication property="Details" var="info" />
             <sec:authentication property="principal"  var="id" />
              <h6 class="mt-3 f-14 f-w-600">${info.name}</h6></a>
            <p class="mb-0 font-roboto">${id}<br>${info.email}</p>
            <ul>
              <li><span><span class="counter"></span>k</span>
                <p>정보1</p>
              </li>
              <li><span>수치2</span>
                <p>정보2</p>
              </li>
              <li><span><span class="counter"></span>k</span>
                <p>정보3 </p>
              </li>
            </ul><br>
            <div>
            <a href="./myProfile.do" type="button" class="btn btn-outline-light txt-dark">마이 페이지</a> 
            </div>
          </div>
         </sec:authorize>
          <nav>
            <div class="main-navbar">
              <div class="left-arrow" id="left-arrow"><i data-feather="arrow-left"></i></div>
              <div id="mainnav">           
                <ul class="nav-menu custom-scrollbar">
                  <li class="back-btn">
                    <div class="mobile-back text-end"><span>Back</span><i class="fa fa-angle-right ps-2" aria-hidden="true"></i></div>
                  </li>
                   <c:if test = "${auth eq '[ROLE_ADMIN]'}">
                    <li class="sidebar-main-title">
                    <div>
                            <button class="btn btn-primary btn-lg" type="button"><a href="./adminPage.do"><i data-feather="log-out"></i>관리자 페이지</a></button> 
                    </div>
                  </li>
                 </c:if>
                  <li class="sidebar-main-title">
                    <div>
                      <h6>General </h6>
                    </div>
                  </li>
                  <li class="dropdown"><a class="nav-link menu-title" href="javascript:void(0)"><i data-feather="home"></i><span>회원관리</span></a>
                    <ul class="nav-submenu menu-content">
                      <li><a href="./index.do">메뉴1</a></li>
                      <li><a href="./index.do">메뉴2</a></li>
                    </ul>
                  </li>
                  <li class="dropdown"><a class="nav-link menu-title" href="javascript:void(0)"><i data-feather="airplay"></i><span>과목</span></a>
                    <ul class="nav-submenu menu-content">
                      <li><a href="./user_subjectInsertForm.do">내 과목 만들기</a></li>
                      <li><a href="./user_subjectList.do">전체과목 보러가기</a></li>
                      <li><a href="./usersubject.do">과목 조회 연습용</a></li>
                      <li><a href="./uploadForm.do">과목 파일업로드</a></li>
                    </ul>
                  </li>
                  <li class="dropdown"><a class="nav-link menu-title" href="javascript:void(0)"><i data-feather="layout"></i><span>과정관리</span></a>
                    <ul class="nav-submenu menu-content">
                      <li><a href="./classListForm.do">과정 리스트</a></li>
                      <li><a href="./index.do">메뉴2</a></li>
                    </ul>
                  </li>
                  <li class="dropdown"><a class="nav-link menu-title" href="javascript:void(0)"><i data-feather="box"></i><span>결제관리</span></a>
                    <ul class="nav-submenu menu-content">
                      <li><a href="./pay.do">결제하기</a></li>
                      <li><a href="./user_Mypay.do">결제조회</a></li>
                      <li><a href="./user_MyDiscount.do">내 마일리지,쿠폰</a></li>
                    </ul>
                  </li>
                  <li class="dropdown"><a class="nav-link menu-title" href="javascript:void(0)"><i data-feather="folder-plus"></i><span>통계</span></a>
                    <ul class="nav-submenu menu-content">
                      <li><a href="./tag.do">태그</a></li>
                      <li><a href="./myLikelist.do">내 좋아요 목록</a></li>
                      <li><a href="./prefer.do">선호조사</a></li>
                      <li><a href="./classCheckList.do">과정 평가</a></li>
                    </ul>
                  </li>
                 
                  <li><a class="nav-link menu-title link-nav" href="support-ticket.html"><i data-feather="headphones"></i><span>고객 문의사항</span></a></li>
                </ul>
              </div>
              <div class="right-arrow" id="right-arrow"><i data-feather="arrow-right"></i></div>
            </div>
          </nav>
        </header>
        <!-- Page Sidebar Ends-->
</body>
</html>