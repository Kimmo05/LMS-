<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>첫 페이지</title>
<script type="text/javascript" src="./resources/js/pay/changeStatus.js"></script>
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
                  <h3>환불대기/승인</h3>
                  <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="index.do">Home</a></li>
                    <li class="breadcrumb-item">결제관리</li>
                    <li class="breadcrumb-item active">환불대기/승인</li>
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
                    <h5><i class="fa fa-check-square-o"></i>&nbsp;&nbsp;Refund Approval</h5>
                    <span>회원들의 환불 신청목록을 확인하고 승인합니다.</span>
                    <hr>
                  </div>
                  <div class="card-body">
                     <h4>Refund application&nbsp;&nbsp;<small class="text-muted">환불신청</small></h4><br><br>
                     	<div class="figure text-end d-block">
		                    <select class="btn btn-primary" id="list" name="list" onchange="changeStatus()">
		                    <c:choose>
		                       <c:when test="${status eq '환불대기'}">
		                       	<option value="환불대기" selected>환불대기</option>
		                       	<option value="환불승인">환불승인</option>
		                       </c:when>
		                       <c:when test="${status eq '환불승인'}">
		                       	<option value="환불대기">환불대기</option>
		                       	<option value="환불승인" selected>환불승인</option>
		                       </c:when>
		                       <c:otherwise>
		                       	<option value="환불대기" selected>환불대기</option>
		                       	<option value="환불승인">환불승인</option>
		                       </c:otherwise>
		                    </c:choose>
				            </select>
		            	</div>
                     	<p class="txt-primary">- 결제번호 클릭 시 결제 상세정보와 환불사유 페이지로 이동합니다.</p>
                     	<div class="table-responsive">
                        <table class="table">
                          <thead class="table-primary">
                            <tr>
                              <th scope="col"><i class="fa fa-ticket"></i>&nbsp;결제번호</th>
                              <th scope="col"><i class="fa fa-user"></i>&nbsp;구매자</th>
                              <th scope="col"><i class="fa fa-check-circle-o"></i>&nbsp;결제상태</th>
                              <th scope="col"><i class="fa fa-calendar"></i>&nbsp;결제일자</th>
                              <th scope="col"><i class="fa fa-calendar"></i>&nbsp;환불일자</th>
                              <th scope="col"><i class="fa fa-check-square-o"></i>&nbsp;승인</th>
                            </tr>
                          </thead>
                          <tbody>
                          	<c:forEach var="vo" items="${lists}">
	                        	<tr>
	                              <td><a href="#">${vo.pay_num}</a></td>
	                              <td>${vo.pay_tra_buyer}</td>
	                              <td>
	                              	<c:if test="${vo.pay_status eq '환불대기'}"><span class="badge rounded-pill badge-secondary">환불대기</span></c:if>
	                              	<c:if test="${vo.pay_status eq '환불승인'}"><span class="badge rounded-pill badge-danger">환불승인</span></c:if>
	                              </td>
	                              <td>${vo.pay_date}</td>
	                              <td>${vo.pay_candate}</td>
	                              <td>
	                              	<c:if test="${vo.pay_status eq '환불대기'}"><button class="btn btn-primary btn-xs" type="button">승인하기</button></c:if>
	                              	<c:if test="${vo.pay_status eq '환불승인'}"><button class="btn btn-danger btn-xs disabled" type="button">승인됨</button></c:if>
	                              </td>
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