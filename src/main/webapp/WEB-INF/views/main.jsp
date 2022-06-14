<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!DOCTYPE html>
<html>
<head>
    <title>첫 페이지</title>
       <link rel="stylesheet" type="text/css" href="../assets/css/sweetalert2.css">
</head>
<%@ include file="./header.jsp" %>
<body>
<div class="page-body">
    <div class="container-fluid">
        <div class="page-header">
        </div>
    </div>
    <!-- Container-fluid starts-->
    <div class="container-fluid">
    <!-- 시큐리티 권한 가져오는 부분 삭제 금지 -->
     <sec:authorize access="isAuthenticated()">--%>
    	<sec:authentication property="Details" var="info" />
        <div class="row">
            <div class="col-sm-12">
                <div class="card">
                    <div class="card-header pb-0">
                        <%--                    <sec:authorize access="isAuthenticated()">--%>
                        <%--	<p>--%>
                        <%--		--%>
                        <%--		<sec:authentication property="principal"  var="id" /><br>--%>
                        <%--	    principal =>  시큐리티 세션 아아디 : ${id}<br>--%>
                        <%--		<sec:authentication property="Details" var="info" /><br>--%>
                        <%--		시큐리티 세션 .디테일 부분--%>
                        <%--		이름 : ${info.name}<br>--%>
                        <%--		이메일 : ${info.email} <br>--%>
                        <%--		생년월일 : ${info.birth}<br>--%>
                        <%--		프로필 : ${info.profile}<br>--%>
                        <%--		가입일 :   ${info.regdate}<br>--%>
                        <%--		은행 :   ${info.bank}<br>--%>
                        <%--		계좌번호 :   ${info.banknum }<br>--%>
                        <%--		회원상태 : ${info.delflag } <br>--%>
                        <%--		회원권한 : ${info.auth} <br>--%>
                        <%--		비밀번호 : <sec:authentication property="Credentials" /><br>--%>
                        <%--		시큐리티 세션 권한: <sec:authentication property="Authorities" /><br>--%>
                        <%--	</p>--%>
                        <%--</sec:authorize>--%>
                        <div class="row">
                            <div class="col-xl-4 xl-50 col-sm-6 box-col-6">
                                <div class="card">
                                    <div class="product-box learning-box">
                                        <div class="product-img"><img class="img-fluid top-radius-blog"
                                                                      src="./assets/images/faq/4.jpg" alt="">
                                            <div class="product-hover">
                                                <ul>
                                                    <li><a href="learning-detailed.html"><i class="icon-link"></i></a>
                                                    </li>
                                                    <li><a href="learning-detailed.html"><i class="icon-import"></i></a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="details-main"><a href="learning-detailed.html">
                                            <div class="bottom-details">
                                                <h6>UX Development.</h6>
                                            </div>
                                        </a>
                                            <p>Lorem Ipsum is simply dummy text of the printing and typesetting
                                                industry. Lorem Ipsum has.</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-4 xl-50 col-sm-6 box-col-6">
                                <div class="card">
                                    <div class="product-box learning-box">
                                        <div class="product-img"><img class="img-fluid top-radius-blog"
                                                                      src="./assets/images/faq/4.jpg" alt="">
                                            <div class="product-hover">
                                                <ul>
                                                    <li><a href="learning-detailed.html"><i class="icon-link"></i></a>
                                                    </li>
                                                    <li><a href="learning-detailed.html"><i class="icon-import"></i></a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="details-main"><a href="learning-detailed.html">
                                            <div class="bottom-details">
                                                <h6>UX Development.</h6>
                                            </div>
                                        </a>
                                            <p>Lorem Ipsum is simply dummy text of the printing and typesetting
                                                industry. Lorem Ipsum has.</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-4 xl-50 col-sm-6 box-col-6">
                                <div class="card">
                                    <div class="product-box learning-box">
                                        <div class="product-img"><img class="img-fluid top-radius-blog"
                                                                      src="./assets/images/faq/4.jpg" alt="">
                                            <div class="product-hover">
                                                <ul>
                                                    <li><a href="learning-detailed.html"><i class="icon-link"></i></a>
                                                    </li>
                                                    <li><a href="learning-detailed.html"><i class="icon-import"></i></a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="details-main"><a href="learning-detailed.html">
                                            <div class="bottom-details">
                                                <h6>UX Development.</h6>
                                            </div>
                                        </a>
                                            <p>Lorem Ipsum is simply dummy text of the printing and typesetting
                                                industry. Lorem Ipsum has.</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Container-fluid Ends-->
</div>
<!-- footer start-->
</div>
</div>
</sec:authorize>

<%@include file="./footer.jsp" %>
</div>
</div>
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