<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>결제 관리</title>
 <script type="text/javascript" src="./resources/js/pay/adminSelectPay.js"></script>
<style type="text/css">
	table{
		text-align:center;
	}
</style>
</head>
<%@ include file="admin_header.jsp" %>
<body>
  
        <div class="page-body">
          <div class="container-fluid">
            <div class="page-header">
              <div class="row">
                <div class="col-sm-6">
                  <h3>결제관리</h3>
                  <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="index.do">Home</a></li>
                    <li class="breadcrumb-item">결제관리</li>
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
                    <h5><i class="fa fa-barcode"></i>&nbsp;&nbsp;Payment Management</h5>
                    <span>전체 결제정보를 조회하고 관리합니다.</span>
                    <hr>
                    <div class="card-body">
                     <h4>Payment information&nbsp;&nbsp;<small class="text-muted">회원 결제정보</small></h4><br><br>
                     	<div class="figure text-end d-block">
		                    <select class="btn btn-primary" id="list" name="list" onchange="changeStatus()">
		                    <c:choose>
		                       <c:when test="${status eq '결제'}">
		                       	<option value="결제" selected>결제</option>
		                       	<option value="환불대기">환불대기</option>
		                       	<option value="환불승인">환불승인</option>
		                       </c:when>
		                       <c:when test="${status eq '환불대기'}">
		                       	<option value="결제">결제</option>
		                       	<option value="환불대기" selected>환불대기</option>
		                       	<option value="환불승인">환불승인</option>
		                       </c:when>
		                       <c:when test="${status eq '환불승인'}">
		                       	<option value="결제">결제</option>
		                       	<option value="환불대기">환불대기</option>
		                       	<option value="환불승인" selected>환불승인</option>
		                       </c:when>
		                       <c:otherwise>
		                        <option value="전체" selected>전체</option>
		                       	<option value="결제">결제</option>
		                       	<option value="환불대기">환불대기</option>
		                       	<option value="환불승인">환불승인</option>
		                       </c:otherwise>
		                    </c:choose>
				            </select>
		            	</div>
                     	<p class="txt-primary">- 결제번호 클릭 시 상세 페이지로 이동합니다.</p>
                     	<div class="table-responsive">
                        <table class="table">
                          <thead class="table-primary">
                            <tr>
                              <th scope="col"><i class="fa fa-ticket"></i>&nbsp;결제번호</th>
                              <th scope="col"><i class="fa fa-user"></i>&nbsp;구매자</th>
                              <th scope="col"><i class="fa fa-check-circle-o"></i>&nbsp;결제상태</th>
                              <th scope="col"><i class="fa fa-calendar"></i>&nbsp;결제일자</th>
                            </tr>
                          </thead>
                          <tbody>
                          	<c:forEach var="vo" items="${lists}">
	                        	<tr>
	                              <td><a href="#">${vo.pay_num}</a></td>
	                              <td>${vo.pay_tra_buyer}</td>
	                              <td>
	                              	<c:if test="${vo.pay_status eq '결제'}"><span class="badge rounded-pill badge-primary">결제</span></c:if>
	                              	<c:if test="${vo.pay_status eq '환불대기'}"><span class="badge rounded-pill badge-secondary">환불대기</span></c:if>
	                              	<c:if test="${vo.pay_status eq '환불승인'}"><span class="badge rounded-pill badge-danger">환불승인</span></c:if>
	                              </td>
	                              <td>${vo.pay_date}</td>
                            	</tr>  	
                          	</c:forEach>
                          </tbody>
                        </table>
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



<%@include file="./admin_footer.jsp" %>


  
</body>
</html>