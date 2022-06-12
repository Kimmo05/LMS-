<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 등록과목 조회 화면</title>
</head>
<%@ include file="../header.jsp" %>
<body>
 
   <div class="page-body">
          <div class="container-fluid">
            <div class="page-header">
              <div class="row">
                <div class="col-sm-6">
                 <h3>내 과목 조회</h3>
                    <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="index.html"><i class="icofont icofont-ui-home"></i></a></li>
                    <li class="breadcrumb-item">마이페이지</li>
                    <li class="breadcrumb-item active">내가 등록한 과목 조회</li>
                  </ol>
                </div>
                <div class="col-sm-6">
  
                </div>
              </div>
            </div>
          </div>
          <!-- Container-fluid starts-->
          <div class="container-fluid">
            <div class="email-wrap bookmark-wrap">
              <div class="row">
                <div class="col-xl-3 xl-30">
                  <div class="email-sidebar"><a class="btn btn-primary email-aside-toggle" href="javascript:void(0)">contact filter    </a>
                    <div class="email-left-aside">
                      <div class="card">
                        <div class="card-body">
                        <!-- 왼쪽 바 -->
                          <div class="email-app-sidebar left-bookmark">
                            <div class="media">
                              <div class="media-size-email"><img class="me-3 rounded-circle" src="../assets/images/user/user.png" alt=""></div>
                              <div class="media-body">
                              <a href="user-profile.html">
                                  <h6 class="f-w-700">${info.name}</h6>
                                </a>
                                <p>${info.email}</p>
                              </div>
                            </div>
                            
                            <!-- 유저 정보 밑 부분 -->
                            <ul class="nav main-menu contact-options" role="tablist">
                              <li class="nav-item">
                                <button class="badge-light btn-block btn-mail w-100" type="button" onclick="./user_subjectInsertForm.do"><i class="me-2" data-feather="users"></i>내 과목 생성하기</button>
                                
                                
                                <!-- 내 과목 생성하기 누르면 생기는 모달 창 시작 -->
                                <div class="modal fade modal-bookmark" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                  <div class="modal-dialog modal-lg" role="document">
                                    <div class="modal-content">
                                      <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabel">과목 생성 폼</h5>
                                        <button class="btn-close" type="button" data-bs-dismiss="modal" aria-label="Close"></button>
                                      </div>
                                      
                                      <div class="modal-body">
                                        <form class="form-bookmark needs-validation" id="bookmark-form" novalidate="">
                                          <div class="row g-2">
                                            <div class="mb-3 col-md-12 mt-0">
                                              <label for="con-name">과목 명</label>
                                              <div class="row">
                                                <div class="col-sm-6">
                                                  <input class="form-control" id="con-name" type="text" required="" placeholder="First Name" autocomplete="off">
                                                </div>
                                                <div class="col-sm-6">   
                                                  <input class="form-control" id="con-last" type="text" required="" placeholder="Last Name" autocomplete="off">
                                                </div>
                                              </div>
                                            </div>
                                            <div class="mb-3 col-md-12 mt-0">
                                              <label for="con-mail">Email Address</label>
                                              <input class="form-control" id="con-mail" type="text" required="" autocomplete="off">
                                            </div>
                                            <div class="mb-3 col-md-12 my-0">
                                              <label for="con-phone">Phone</label>
                                              <div class="row">
                                                <div class="col-sm-6">
                                                  <input class="form-control" id="con-phone" type="number" required="" autocomplete="off">
                                                </div>
                                                <div class="col-sm-6">
                                                  <select class="form-control" id="con-select">
                                                    <option>Mobile</option>
                                                    <option>Work</option>
                                                    <option>Others</option>
                                                  </select>
                                                </div>
                                              </div>
                                            </div>
                                          </div>
                                          <input id="index_var" type="hidden" value="5">
                                          <button class="btn btn-secondary" type="submit" onclick="submitContact()">Save</button>
                                          <button class="btn btn-primary" type="button" data-bs-dismiss="modal">Cancel</button>
                                        </form>
                                      </div>
                                    </div>
                                  </div>
                                </div>
                               <!-- 내 과목 생성하기 누르면 생기는 모달 창 끝 -->
                              </li>
                              
                              
                              <!-- 하단 카테고리 상위메뉴 -->
                              <li class="nav-item"><span class="main-title"> 과목 </span></li>
                              <li><a id="pills-personal-tab" data-bs-toggle="pill" href="#pills-personal" role="tab" aria-controls="pills-personal" aria-selected="true"><span class="title">내가 등록한 과목</span></a></li>
                              <!-- 카테고리 추가 모달 시작 -->
                              <li>
                                <button class="btn btn-category" type="button" data-bs-toggle="modal" data-bs-target="#exampleModal1"><span class="title"> + 카테고리 추가하기 </span></button>
                                <div class="modal fade" id="exampleModal1" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel1" aria-hidden="true">
                                  <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                      <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabel1">Add Category</h5>
                                        <button class="btn-close" type="button" data-bs-dismiss="modal" aria-label="Close"></button>
                                      </div>
                                      <div class="modal-body">
                                        <form class="form-bookmark">
                                          <div class="row g-2">
                                            <div class="mb-3 col-md-12">
                                              <input class="form-control" type="text" required="" placeholder="Enter category name" autocomplete="off">
                                            </div>
                                          </div>
                                          <button class="btn btn-secondary" type="button">Save</button>
                                          <button class="btn btn-primary" type="button" data-bs-dismiss="modal">Cancel</button>
                                        </form>
                                      </div>
                                    </div>
                                  </div>
                                </div>
                              </li>
                              <!-- 카테고리 추가 모달 끝 -->
                              <li><a class="show" id="pills-organization-tab" data-bs-toggle="pill" href="#pills-organization" role="tab" aria-controls="pills-organization" aria-selected="false"><span class="title">반려된 과목</span></a></li>
                              <li><a class="show" id="pills-organization-tab" data-bs-toggle="pill" href="#pills-organization" role="tab" aria-controls="pills-organization" aria-selected="false"><span class="title"> 대기중 과목 </span></a></li>
                             
                            </ul>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                
                <!-- 오른쪽 바 -->
                <div class="col-xl-9 col-md-12 box-col-8 xl-70">
                  <div class="email-right-aside bookmark-tabcontent contacts-tabs">
                    <div class="card email-body radius-left">
                      <div class="ps-0">
                        <div class="tab-content">
                          <div class="tab-pane fade active show" id="pills-personal" role="tabpanel" aria-labelledby="pills-personal-tab">
                            
                            <div class="card mb-0">
                              <div class="card-header d-flex">
                                <h5>내가 등록한 과목</h5><span class="f-14 pull-right mt-0">5 Contacts</span>
                              </div>
                              <div class="card-body p-0">
                                <div class="row list-persons" id="addcon">
                                  <div class="col-xl-4 xl-50 col-md-5 box-col-6">
                                    
                                 <!-- 과목 간략 정보 보여주기 -->
                                 <div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
                                    <a class="contact-tab-0 nav-link active" id="v-pills-user-tab" data-bs-toggle="pill" onclick="activeDiv(0)" href="#v-pills-user" role="tab" aria-controls="v-pills-user" aria-selected="true">
                                        <div class="media"><img class="img-50 img-fluid m-r-20 rounded-circle update_img_0" src="../assets/images/user/2.png" alt="">
                                          <div class="media-body">
                                            <h6> <span class="first_name_0">${list.sub_title}</span><span class="last_name_0"> </span></h6>
                                            <p class="email_add_0">담당 강사</p><span><p class="email_add_1">등록일</p></span>
                                          </div>
                                        </div>
                                     </a>
                                     
                                     <a class="contact-tab-1 nav-link" id="v-pills-profile-tab" data-bs-toggle="pill" onclick="activeDiv(1)" href="#v-pills-profile" role="tab" aria-controls="v-pills-profile" aria-selected="false"> 
                                        <div class="media"><img class="img-50 img-fluid m-r-20 rounded-circle update_img_1" src="../assets/images/user/8.jpg" alt="">
                                          <div class="media-body">
                                            <h6> <span class="first_name_1">Comeren </span><span class="last_name_1">Diaz</span></h6>
                                            <p class="email_add_1">comeren@gmail.com</p>
                                          </div>
                                        </div>
                                     </a>
                      				</div>
                                  </div>
                                  
                                  
                                  <div class="col-xl-8 xl-50 col-md-7 box-col-6">
                                    <div class="tab-content" id="v-pills-tabContent">
                                      <div class="tab-pane contact-tab-0 tab-content-child fade show active" id="v-pills-user" role="tabpanel" aria-labelledby="v-pills-user-tab">
                                        <div class="profile-mail">
                                          <div class="media align-items-center"><img class="img-100 img-fluid m-r-20 rounded-circle update_img_0" src="../assets/images/user/2.png" alt="">
                                            <input class="updateimg" type="file" name="img" onchange="readURL(this,0)">
                                            <div class="media-body mt-0">
                                              <h5><span class="first_name_0">강사 명 </span><span class="last_name_0"> </span></h5>
                                              <p class="email_add_0">강사 정보</p>
                                              <ul>
                                                <li><a href="javascript:void(0)" onclick="editContact(0)">Edit</a></li>
                                                <li><a href="javascript:void(0)" onclick="deleteContact(0)">Delete</a></li>
                                                <li><a href="javascript:void(0)" onclick="history(0)">History</a></li>
                                                <li><a href="javascript:void(0)" onclick="printContact(0)" data-bs-toggle="modal" data-bs-target="#printModal">Print</a></li>
                                              </ul>
                                            </div>
                                          </div>
                                          
                                          <div class="email-general">
                                            <h6 class="mb-3">과목 소개</h6>
                                            <ul>
                                              <li>과목 명 <span class="font-primary first_name_0">과목명은 이렇습니다.</span></li>
                                              <li>카테고리 <span class="font-primary first_name_0">카테고리</span></li>
                                              <li>등록일<span class="font-primary"> <span class="birth_day_0">18</span><span class="birth_month_0 ms-1">May</span><span class="birth_year_0 ms-1">1994</span></span></li>
                                              <li>등록자 <span class="font-primary">${info.id}</span></li>
                                            </ul>
                                          </div>
                                        </div>
                                      </div>
                                      
                                      <div class="tab-pane contact-tab-1 tab-content-child fade" id="v-pills-profile" role="tabpanel" aria-labelledby="v-pills-profile-tab">
                                        <div class="profile-mail">
                                          <div class="media"><img class="img-100 img-fluid m-r-20 rounded-circle update_img_1" src="../assets/images/user/8.jpg" alt="">
                                            <input class="updateimg" type="file" name="img" onchange="readURL(this,1)">
                                            <div class="media-body mt-0">
                                              <h5><span class="first_name_1">Comeren </span><span class="last_name_1">Diaz</span></h5>
                                              <p class="email_add_1">comeren@gmail.com</p>
                                              <ul>
                                                <li><a href="javascript:void(0)" onclick="editContact(1)">Edit</a></li>
                                                <li><a href="javascript:void(0)" onclick="deleteContact(1)">Delete</a></li>
                                                <li><a href="javascript:void(0)" onclick="history(1)">History</a></li>
                                                <li><a href="javascript:void(0)" onclick="printContact(1)" data-bs-toggle="modal" data-bs-target="#printModal">Print</a></li>
                                              </ul>
                                            </div>
                                          </div>
                                          <div class="email-general">
                                            <h6 class="mb-3">General</h6>
                                            <ul>
                                              <li>Name <span class="font-primary first_name_1">Comeren</span></li>
                                              <li>Gender <span class="font-primary">Female</span></li>
                                              <li>Birthday<span class="font-primary"> <span class="birth_day_1">7</span><span class="birth_month_1 ms-1">Feb</span><span class="birth_year_1 ms-1">1995</span></span></li>
                                              <li>Personality<span class="font-primary personality_1">Cool</span></li>
                                              <li>City<span class="font-primary city_1">Delhi</span></li>
                                              <li>Mobile No<span class="font-primary mobile_num_1">+0 1800 55812</span></li>
                                              <li>Email Address <span class="font-primary email_add_1">comeren@gmail.com</span></li>
                                              <li>Website<span class="font-primary url_add_1">www.cometest@.com</span></li>
                                              <li>Interest<span class="font-primary interest_1">sports</span></li>
                                            </ul>
                                          </div>
                                        </div>
                                      </div>
                                    </div>
                                    
                                    <!-- 밑에 과목 간략 정보 보여주기 -->
                                    <div class="contact-editform">
                                      <form>
                                        <div class="row g-2">
                                       <div class="mb-3 col-md-12">
                                            <label>과목 설명</label>
                                            <div class="row">
                                              <div class="col-12">
                                                <div class="form-group">
                                                  <input class="form-control" type="text" placeholder="과목 설명">
                                                </div>
                                              </div>
                                            </div>
                                          </div>
                                          
                                          <div class="mt-0 mb-3 col-md-12">
                                            <label>태그</label>
                                            <input class="form-control" id="email_add" type="text" required="" autocomplete="off">
                                          </div>
                                        
                                        </div>
                                        <!-- 자세히 보기 누르면 모달 창이나 페이지 이동 -->
                                    <a class="ps-0 edit-information f-w-600" href="javascript:void(0)">자세히 보기</a>
                                        <button class="btn btn-secondary update-contact" type="button">Save</button>
                                        <button class="btn btn-primary" type="button" data-bs-dismiss="modal">Cancel</button>
                                      </form>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>
                          <div class="fade tab-pane" id="pills-organization" role="tabpanel" aria-labelledby="pills-organization">
                            <div class="card mb-0">
                              <div class="card-header d-flex">
                                <h5>Organization</h5><span class="f-14 pull-right mt-0">10 Contacts</span>
                              </div>
                              <div class="card-body p-0">
                                <div class="row list-persons">
                                  <div class="col-xl-4 xl-50 col-md-5 box-col-6">
                                    <div class="nav flex-column nav-pills" id="v-pills-tab1" role="tablist" aria-orientation="vertical"><a class="nav-link active" id="v-pills-iduser-tab" data-bs-toggle="pill" href="#v-pills-iduser" role="tab" aria-controls="v-pills-iduser" aria-selected="true">
                                        <div class="media"><img class="img-50 img-fluid m-r-20 rounded-circle" src="../assets/images/user/user.png" alt="">
                                          <div class="media-body">
                                            <h6>Mark jecno</h6>
                                            <p>markjecno@gmail.com</p>
                                          </div>
                                        </div></a><a class="nav-link" id="v-pills-iduser1-tab" data-bs-toggle="pill" href="#v-pills-iduser1" role="tab" aria-controls="v-pills-iduser1" aria-selected="false"> 
                                        <div class="media"><img class="img-50 img-fluid m-r-20 rounded-circle" src="../assets/images/user/3.jpg" alt="">
                                          <div class="media-body">
                                            <h6>Jason Borne</h6>
                                            <p>jasonb@gmail.com</p>
                                          </div>
                                        </div></a><a class="nav-link" id="v-pills-iduser2-tab" data-bs-toggle="pill" href="#v-pills-iduser2" role="tab" aria-controls="v-pills-iduser2" aria-selected="false">
                                        <div class="media"><img class="img-50 img-fluid m-r-20 rounded-circle" src="../assets/images/user/4.jpg" alt="">
                                          <div class="media-body">
                                            <h6>Sarah Loren</h6>
                                            <p>barnes@gmail.com</p>
                                          </div>
                                        </div></a><a class="nav-link" id="v-pills-iduser3-tab" data-bs-toggle="pill" href="#v-pills-iduser3" role="tab" aria-controls="v-pills-iduser3" aria-selected="false">
                                        <div class="media"><img class="img-50 img-fluid m-r-20 rounded-circle" src="../assets/images/user/10.jpg" alt="">
                                          <div class="media-body">
                                            <h6>Andew Jon</h6>
                                            <p>andrewj@gmail.com</p>
                                          </div>
                                        </div></a></div>
                                  </div>
                                  <div class="col-xl-8 xl-50 col-md-7 box-col-6">
                                    <div class="tab-content" id="v-pills-tabContent1">
                                      <div class="tab-pane fade show active" id="v-pills-iduser" role="tabpanel" aria-labelledby="v-pills-iduser-tab">
                                        <div class="profile-mail">
                                          <div class="media"><img class="img-100 img-fluid m-r-20 rounded-circle update_img_5" src="../assets/images/user/user.png" alt="">
                                            <div class="media-body mt-0">
                                              <h5><span class="first_name_5">Mark </span><span class="last_name_5">jecno</span></h5>
                                              <p class="email_add_5">markjecno@gmail.com</p>
                                              <ul>
                                                <li><a href="javascript:void(0)" onclick="printContact(5)" data-bs-toggle="modal" data-bs-target="#printModal">Print</a></li>
                                              </ul>
                                            </div>
                                          </div>
                                          <div class="email-general">
                                            <h6>General</h6>
                                            <p>Email Address: <span class="font-primary email_add_5">markjecno@gmail.com</span></p>
                                            <div class="gender">
                                              <h6>Personal</h6>
                                              <p>Gender: <span>Male</span></p>
                                            </div>
                                          </div>
                                        </div>
                                      </div>
                                      <div class="tab-pane fade" id="v-pills-iduser1" role="tabpanel" aria-labelledby="v-pills-iduser1-tab">
                                        <div class="profile-mail">
                                          <div class="media"><img class="img-100 img-fluid m-r-20 rounded-circle update_img_6" src="../assets/images/user/3.jpg" alt="">
                                            <div class="media-body mt-0">
                                              <h5><span class="first_name_6">Jason </span><span class="last_name_6">Borne</span></h5>
                                              <p class="email_add_6">jasonb@gmail.com</p>
                                              <ul>
                                                <li><a href="javascript:void(0)" onclick="printContact(6)" data-bs-toggle="modal" data-bs-target="#printModal">Print</a></li>
                                              </ul>
                                            </div>
                                          </div>
                                          <div class="email-general">
                                            <h6>General</h6>
                                            <p>Email Address: <span class="font-primary email_add_6">jasonb@gmail.com</span></p>
                                            <div class="gender">
                                              <h6>Personal</h6>
                                              <p>Gender: <span>Male</span></p>
                                            </div>
                                          </div>
                                        </div>
                                      </div>
                                      <div class="tab-pane fade" id="v-pills-iduser2" role="tabpanel" aria-labelledby="v-pills-iduser2-tab">
                                        <div class="profile-mail">
                                          <div class="media"><img class="img-100 img-fluid m-r-20 rounded-circle update_img_7" src="../assets/images/user/4.jpg" alt="">
                                            <div class="media-body mt-0">
                                              <h5> <span class="first_name_7">Sarah </span><span class="last_name_7">Loren</span></h5>
                                              <p class="email_add_7">barnes@gmail.com</p>
                                              <ul>
                                                <li><a href="javascript:void(0)" onclick="printContact(7)" data-bs-toggle="modal" data-bs-target="#printModal">Print</a></li>
                                              </ul>
                                            </div>
                                          </div>
                                          <div class="email-general">
                                            <h6>General</h6>
                                            <p>Email Address: <span class="font-primary email_add_7">barnes@gmail.com</span></p>
                                            <div class="gender">
                                              <h6>Personal</h6>
                                              <p>Gender: <span>Female</span></p>
                                            </div>
                                          </div>
                                        </div>
                                      </div>
                                      <div class="tab-pane fade" id="v-pills-iduser3" role="tabpanel" aria-labelledby="v-pills-iduser3-tab">
                                        <div class="profile-mail">
                                          <div class="media"><img class="img-100 img-fluid m-r-20 rounded-circle update_img_8" src="../assets/images/user/10.jpg" alt="">
                                            <div class="media-body mt-0">
                                              <h5> <span class="first_name_8">Andew </span><span class="last_name_8">Jon</span></h5>
                                              <p class="email_add_8">andrewj@gmail.com</p>
                                              <ul>
                                                <li><a href="javascript:void(0)" onclick="printContact(8)" data-bs-toggle="modal" data-bs-target="#printModal">Print</a></li>
                                              </ul>
                                            </div>
                                          </div>
                                          <div class="email-general">
                                            <h6>General</h6>
                                            <p>Email Address: <span class="font-primary email_add_8">andrewj@gmail.com</span></p>
                                            <div class="gender">
                                              <h6>Personal</h6>
                                              <p>Gender: <span>Female</span></p>
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
                          <div id="right-history">
                            <div class="modal-header p-l-20 p-r-20">
                              <h6 class="modal-title w-100">Contact History<span class="pull-right"><a class="closehistory" href="javascript:void(0)"><i class="icofont icofont-close"></i></a></span></h6>
                            </div>
                            <div class="history-details">
                              <div class="text-center"><i class="icofont icofont-ui-edit"></i>
                                <p>Contact has not been modified yet.</p>
                              </div>
                              <div class="media"><i class="icofont icofont-star me-3"></i>
                                <div class="media-body mt-0">
                                  <h6 class="mt-0">Contact Created</h6>
                                  <p class="mb-0">Contact is created via mail</p><span class="f-12">Sep 10, 2019 4:00</span>
                                </div>
                              </div>
                            </div>
                          </div>
                          <div class="modal fade modal-bookmark" id="printModal" tabindex="-1" role="dialog" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered" role="document">
                              <div class="modal-content">
                                <div class="modal-header">
                                  <h5 class="modal-title">Print preview</h5>
                                  <button class="btn-close" type="button" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body list-persons">
                                  <div class="profile-mail pt-0" id="DivIdToPrint">
                                    <div class="media"><img class="img-100 img-fluid m-r-20 rounded-circle" id="updateimg" src="../assets/images/user/2.png" alt="">
                                      <div class="media-body mt-0">
                                        <h5><span id="printname">Bucky </span><span id="printlast">Barnes</span></h5>
                                        <p id="printmail">barnes@gmail.com</p>
                                      </div>
                                    </div>
                                    <div class="email-general">
                                      <h6>General</h6>
                                      <p>Email Address: <span class="font-primary" id="mailadd">barnes@gmail.com   </span></p>
                                    </div>
                                  </div>
                                  <button class="btn btn-secondary" id="btnPrint" type="button" onclick="printDiv();">Print</button>
                                  <button class="btn btn-primary" type="button" data-bs-dismiss="modal">Cancel</button>
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
<%@include file="../footer.jsp" %>
</body>
</html>