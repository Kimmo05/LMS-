<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
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
        </div>
    </div>
    <!-- Container-fluid starts-->
    <div class="container-fluid">
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
                                                                      src="./resources/images/main01.jpg" alt="">
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
                                                                      src="./resources/images/main02.jpg" alt="">
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
                                                                      src="./resources/images/main03.jpg" alt="">
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


<%@include file="./footer.jsp" %>


</body>
</html>