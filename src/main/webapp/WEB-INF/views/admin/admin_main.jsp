<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>첫 페이지</title>
</head>
<%@ include file="./admin_header.jsp" %>
<body>
       <div class="page-body">
       <div class="card">
  <div class="row">
          <div class="container-fluid">
          <div class="col-sm-12">
                <div class="card">
            <div class="card-header pb-0">
              <div class="row">
        
                <div class="col-sm-6">
                  <h3>${info.name}(관리자)님 환영합니다.</h3>
                  <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                    <li class="breadcrumb-item active">관리자페이지</li>
                  </ol>
                </div>
                <div class="col-sm-6">
                </div>
              </div>
            </div>
          </div>
          </div>
          <!-- Container-fluid starts-->
          <div class="container-fluid faq-section">
            <div class="row">
              <div class="col-12">
                <div class="knowledgebase-bg"><img class="bg-img-cover bg-center" src="../resources/images/admin_page_faq.jpg" alt="looginpage"></div>
                <div class="knowledgebase-search">
                  <div>
                    <h3 style="color: white;">무엇을 도와드릴까요?</h3>
                    <form class="form-inline" action="#" method="get">
                      <div class="form-group w-100 mb-0"><i data-feather="search"></i>
                        <input class="form-control-plaintext w-100" type="text" placeholder="이곳에 입력해주세요!" title="">
                      </div>
                    </form>
                  </div>
                </div>
              </div>
              </div>
          <div class="container-fluid general-widget">
            <div class="row">
              <div class="row">
              <div class="col-sm-6 col-xl-3 col-lg-6">
                <div class="card o-hidden border-0">
                  <div class="bg-primary b-r-4 card-body">
                    <div class="media static-top-widget">
                      <div class="align-self-center text-center"><i data-feather="database"></i></div>
                      <div class="media-body"><span class="m-0">신규 과목</span>
                        <h4 class="mb-0 counter">121</h4><i class="icon-bg" data-feather="database"></i>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-sm-6 col-xl-3 col-lg-6">
                <div class="card o-hidden border-0">
                  <div class="bg-secondary b-r-4 card-body">
                    <div class="media static-top-widget">
                      <div class="align-self-center text-center"><i data-feather="shopping-bag"></i></div>
                      <div class="media-body"><span class="m-0">신규 과정</span>
                        <h4 class="mb-0 counter">27</h4><i class="icon-bg" data-feather="shopping-bag"></i>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-sm-6 col-xl-3 col-lg-6">
                <div class="card o-hidden border-0">
                  <div class="bg-primary b-r-4 card-body">
                    <div class="media static-top-widget">
                      <div class="align-self-center text-center"><i data-feather="message-circle"></i></div>
                      <div class="media-body"><span class="m-0">알림</span>
                        <h4 class="mb-0 counter">5</h4><i class="icon-bg" data-feather="message-circle"></i>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
             <div class="col-sm-6 col-xl-3 col-lg-6">
                <div class="card o-hidden border-0">
                  <div class="bg-primary b-r-4 card-body">
                    <div class="media static-top-widget">
                      <div class="align-self-center text-center"><i data-feather="user-plus"></i></div>
                      <div class="media-body"><span class="m-0">최근 가입 회원</span>
                        <h4 class="mb-0 counter">31</h4><i class="icon-bg" data-feather="user-plus"></i>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              </div>
              
				<div class="row">
					 <div class="col-xl-6 xl-100 box-col-12">
                <div class="card">
                  <div class="cal-date-widget card-body">
                    <div class="row">
                      <div class="col-xl-6 col-xs-12 col-md-6 col-sm-6">
                        <div class="cal-info text-center">
                          <div>
                            <h2>20</h2>
                            <div class="d-inline-block"><span class="b-r-dark pe-3">June</span><span class="ps-3">2022</span></div>
                            <p class="f-16"> </p>
                          </div>
                        </div>
                      </div>
                      <div class="col-xl-6 col-xs-12 col-md-6 col-sm-6">
                        <div class="cal-datepicker">
                          <div class="datepicker-here float-sm-end" data-language="en">           </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              
              <div class="col-lg-3">
                          <div class="card card-mb-faq">
                            <div class="card-header faq-header">
                              <h5 class="d-inline-block ps-0">서비스 전체보기</h5><span class="pull-right d-inline-block">See All</span>
                            </div>
                            <div sclass="card-body faq-body">
                              <div class="navigation-option">
                                <ul>
                                  <li><a href="javascript:void(0)"><i data-feather="globe"></i>이용안내</a></li>
                                  <li><a href="javascript:void(0)"><i data-feather="file-text"></i>과목안내</a><span class="badge badge-primary badge-pill pull-right">42</span></li>
                                  <li><a href="javascript:void(0)"><i data-feather="youtube"></i>과정안내</a><span class="badge badge-primary badge-pill pull-right">648</span></li>
                                  <li><a href="javascript:void(0)"><i data-feather="message-circle"></i>고객센터</a></li>
                                  <li><a href="javascript:void(0)"><i data-feather="mail"></i>FAQ</a></li>
                                </ul>
                              </div>
                            </div>
                          </div>
                        </div>
              <div class="col-lg-3">
                          <div class="card">
                            <div class="card-header faq-header">
                              <h5 class="d-inline-block ps-0">최근 이슈 사항</h5><span class="pull-right d-inline-block">See All</span>
                            </div>
                            <div class="card-body faq-body">
                              <div class="media updates-faq-main">
                                <div class="updates-faq"><i class="font-primary" data-feather="rotate-cw"></i></div>
                                <div class="media-body updates-bottom-time">
                                  <p><a href="javascript:void(0)">David Linner </a>requested money back for a double debit card charge</p>
                                  <p>10 minutes ago</p>
                                </div>
                              </div>
                              <div class="media updates-faq-main">
                                <div class="updates-faq"><i class="font-primary" data-feather="check"></i></div>
                                <div class="media-body updates-bottom-time">
                                  <p>Ticket #43683 has been closed by <a href="javascript:void(0)">Victoria Wilson</a></p>
                                  <p>Dec 7, 11:48</p>
                                </div>
                              </div>
                            </div>
                          </div>
                        </div>
				</div>       
				
				<div class="row">
			 <div class="col-xl-4 xl-50 col-lg-6 box-col-6">
                <div class="card bg-primary">
                  <div class="card-body">
                    <div class="media faq-widgets">
                      <div class="media-body">
                        <h5>관리자 입력사항</h5>
                        <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.</p>
                      </div><i data-feather="aperture"></i>
                    </div>
                  </div>
                </div>
              </div>
                  
                  <div class="col-xl-4 col-sm-6">
                        <div class="card ecommerce-widget pro-gress">
                          <div class="card-body support-ticket-font">
                            <div class="row">
                              <div class="col-5">
                                <h6>진행 중</h6>
                                <h4 class="total-num counter">2500</h4>
                              </div>
                              <div class="col-7">
                                <div class="text-md-end">
                                  <ul>
                                    <li>Profit<span class="product-stts txt-primary ms-2">8989<i class="icon-angle-up f-12"></i></span></li>
                                    <li>Loss<span class="product-stts txt-danger ms-2">2560<i class="icon-angle-down f-12"></i></span></li>
                                  </ul>
                                </div>
                              </div>
                            </div>
                            <div class="progress-showcase mt-4">
                              <div class="progress">
                                <div class="progress-bar bg-warning" role="progressbar" style="width: 70%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                  <div class="col-xl-4 col-sm-6">
                        <div class="card ecommerce-widget pro-gress">
                          <div class="card-body support-ticket-font">
                            <div class="row">
                              <div class="col-5">
                                <h6>삭제</h6>
                                <h4 class="total-num counter">2560</h4>
                              </div>
                              <div class="col-7">
                                <div class="text-md-end">
                                  <ul>
                                    <li>Profit<span class="product-stts txt-primary ms-2">8989<i class="icon-angle-up f-12"></i></span></li>
                                    <li>Loss<span class="product-stts txt-danger ms-2">2560<i class="icon-angle-down f-12"></i></span></li>
                                  </ul>
                                </div>
                              </div>
                            </div>
                            <div class="progress-showcase mt-4">
                              <div class="progress">
                                <div class="progress-bar bg-danger" role="progressbar" style="width: 70%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
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
              </div>
              
</div>


<%@include file="./admin_footer.jsp" %>


  
</body>
</html>