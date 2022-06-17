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
          <div class="container-fluid">
            <div class="page-header">
              <div class="row">
                <div class="col-sm-6">
                  <h3>${info.name}(관리자)님 환영합니다.</h3>
                  <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                    <li class="breadcrumb-item active">관리자페이지</li>
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
          <div class="container-fluid general-widget">
            <div class="row">
              <div class="row">
              <div class="col-sm-6 col-xl-3 col-lg-6">
                <div class="card o-hidden border-0">
                  <div class="bg-primary b-r-4 card-body">
                    <div class="media static-top-widget">
                      <div class="align-self-center text-center"><i data-feather="database"></i></div>
                      <div class="media-body"><span class="m-0">Earnings</span>
                        <h4 class="mb-0 counter">6659</h4><i class="icon-bg" data-feather="database"></i>
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
                      <div class="media-body"><span class="m-0">Products</span>
                        <h4 class="mb-0 counter">9856</h4><i class="icon-bg" data-feather="shopping-bag"></i>
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
                      <div class="media-body"><span class="m-0">Messages</span>
                        <h4 class="mb-0 counter">893</h4><i class="icon-bg" data-feather="message-circle"></i>
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
                      <div class="media-body"><span class="m-0">New Use</span>
                        <h4 class="mb-0 counter">4531</h4><i class="icon-bg" data-feather="user-plus"></i>
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
                            <p class="f-16">There is no minimum donation, any sum is appreciated</p>
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
				</div>       
				
				<div class="row">
			 <div class="col-xl-4 xl-50 col-lg-6 box-col-6">
                <div class="card bg-primary">
                  <div class="card-body">
                    <div class="media faq-widgets">
                      <div class="media-body">
                        <h5>Knowledgebase</h5>
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
                                <h6>Running</h6>
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
                                <h6>Cancle</h6>
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
              



<%@include file="./admin_footer.jsp" %>


  
</body>
</html>