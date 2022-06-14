<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
    
<!DOCTYPE html>
<html>
<head>
   <link rel="stylesheet" type="text/css" href="../assets/css/sweetalert2.css">
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
		
		<sec:authentication property="Details" var="info" /><br>
		<sec:authentication property="principal"  var="id" /><br>
	    principal =>  시큐리티 세션 아아디 : ${id}<br>
		시큐리티 세션 .디테일 부분
		이름 : ${info.name}<br>
		이메일 : ${info.email} <br>
		생년월일 : ${info.birth}<br>
		프로필 : ${info.profile}<br>
		경력: ${info.career}<br>
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
          </div>
          <!-- Container-fluid Ends-->
        </div>
        <!-- footer start-->
      
      



<%@include file="./footer.jsp" %>
<script type="text/javascript">
// window.onbeforeunload = function(e) {
//     var dialogText = 'Dialog text here';
//     e.returnValue = dialogText;
//     return dialogText;
// };
window.onload = function() {
	
	var auth   = '${info.auth}'
    var delflag   = '${info.delflag}'
	console.log(delflag , auth);
	if(auth == "ROLE_INSTROCTUR" && delflag =="P"){
		Swal.fire({
			  title: '경력 등록',
			  text: "서비스를 이용하시려면 경력등록이 필요합니다!",
			  icon: 'warning',
			  showCancelButton: true,
			  confirmButtonColor: '#3db39d',
			  cancelButtonColor: '#e4818b',
			  cancelButtonText: '취소',
			  confirmButtonText: '등록하기!'
			}).then((result) => {
			  if (result.value) {
				  window.location='./InsCareer.do';
			  
			  }
			})
			}else if(auth == "ROLE_INSTROCTUR" && delflag =="R"){
				Swal.fire({
					  title: '경력 등록 대기중',
					  text: "경력 등록 진행 중 입니다.!",
					  icon: 'warning',
					  showCancelButton: true,
					  confirmButtonColor: '#3db39d',
					  cancelButtonColor: '#e4818b',
					  cancelButtonText: '취소',
					  confirmButtonText: '등록하기!'
					}).then((result) => {
					  if (result.value) {
						  window.location='./myProfile.do';
					  
					  }
					})
			}else if(auth == "ROLE_INSTROCTUR" && delflag =="C"){
				Swal.fire({
					  title: '경력 승인 취소',
					  text: "경력 등록이 취소되었습니다. 다시 등록해주세요.!",
					  icon: 'warning',
					  showCancelButton: true,
					  confirmButtonColor: '#3db39d',
					  cancelButtonColor: '#e4818b',
					  cancelButtonText: '취소',
					  confirmButtonText: '등록하기!'
					}).then((result) => {
					  if (result.value) {
						  window.location='./InsCareer.do';
					  
					  }
					})
			}
			};
</script>
  	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>

</body>
</html>