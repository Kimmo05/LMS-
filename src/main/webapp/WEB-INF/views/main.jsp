<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
    
<!DOCTYPE html>
<html>
<head>
<title>첫 페이지</title>
</head>
<%@ include file="./header.jsp" %>
<body>
  
        <div class="page-body">
          <div class="container-fluid">
            <div class="page-header">
              <div class="row">
                <div class="col-sm-6">
                  <h3>이름</h3>
                  <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="index.do">Home</a></li>
                    <li class="breadcrumb-item">중분류</li>
                    <li class="breadcrumb-item active">소분류</li>
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
            <div class="row">
              <div class="col-sm-12">
                <div class="card">
                  <div class="card-header pb-0">
                    <h5>메인 페이지</h5>
                    <sec:authorize access="isAuthenticated()">
	<p>
		
		<sec:authentication property="principal"  var="id" /><br>
	    principal =>  시큐리티 세션 아아디 : ${id}<br>
		<sec:authentication property="Details" var="info" /><br>
		시큐리티 세션 .디테일 부분
		이름 : ${info.name}<br>
		이메일 : ${info.email} <br>
		생년월일 : ${info.birth}<br>
		프로필 : ${info.profile}<br>
		가입일 :   ${info.regdate}<br>
		은행 :   ${info.bank}<br>
		계좌번호 :   ${info.banknum }<br>
		회원상태 : ${info.delflag } <br>
		회원권한 : ${info.auth} <br>
		비밀번호 : <sec:authentication property="Credentials" /><br>
		시큐리티 세션 권한: <sec:authentication property="Authorities" /><br>
	</p>
</sec:authorize>
                  </div>
                </div>
              </div>
            </div>
            
             <div class="container-fluid search-page">
            <div class="row">
              <div class="col-sm-12">
                <div class="card col-sm-12">
                  <div class="card-header pb-4">
                    <form class="search-form">
                      <div class="form-group m-2">
                        <label class="sr-only">Email</label>
                      </div>
                      <div class="form-group mb-0">
                        <div class="input-group"><span class="input-group-text"><i class="icon-search"></i></span>
                          <input class="form-control-plaintext" type="search" placeholder="Search..">
                        </div>
                      </div>
                    </form>
                  </div>
          </div>
          <!-- Container-fluid Ends-->
        </div>
 
      </div>
    </div>
</div>
</div>

<%@include file="./footer.jsp" %>


  
</body>
</html>