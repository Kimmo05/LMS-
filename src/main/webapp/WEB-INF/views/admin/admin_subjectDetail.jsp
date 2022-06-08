<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 과목 상세조회 화면</title>
</head>
<%@ include file="./admin_header.jsp" %>
<body>
          <div class="page-header">
              <div class="row">
                <div class="col-sm-6">
                  <h3>Create Subject</h3>
                  <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                    <li class="breadcrumb-item">관리자</li>
                    <li class="breadcrumb-item">과목</li>
                    <li class="breadcrumb-item active">과목 상세보기</li>
                  </ol>
                </div>

              </div>
            </div>
          
            <div class="row">
              <div class="col-sm-12">
                <div class="blog-single">
                  <div class="blog-box blog-details">
                    <div class="banner-wrraper"><img class="img-fluid w-100 bg-img-cover" src="./assets/images/blog/blog-single.jpg" alt="blog-main"></div>
                    <div class="card">
                      <div class="card-body">
                        <div class="blog-details">
                          <ul class="blog-social">
                            <li>${results.sub_num}</li>
                            <li><i class="icofont icofont-user"></i>${results.cod_name}</li>
                            <li><i class="icofont icofont-user"></i>${results.sub_reg_id}</li>
                            <c:if test="${results.sub_ins != null}">
                            <li><i class="icofont icofont-user"></i>${results.sub_ins}</li>
                            </c:if>
                             <c:if test="${results.sub_ins == null}">
                            <li><i class="icofont icofont-user"></i>담당 강사 미정</li>
                            </c:if>
                          </ul>
                          <h4>
                          </h4>
                          <div class="single-blog-content-top">
                          <p>과목 설명</p>
                          <p>${results.sub_content}</p>
                          <p>${results.sub_tag}${results.cod_tag }</p>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="card comment-box">
                    <div class="card-body">
                      <h4>${results.sub_title} 의 커리큘럼                               </h4>
                      <ul>
                        <li>
                          <div class="media align-self-center"><img class="align-self-center" src="./assets/images/blog/comment.jpg" alt="Generic placeholder image">
                            <div class="media-body">
                              <div class="row">
                                <div class="col-md-4">
                                    <h6 class="mt-0">${results.cur_detail}<span></span></h6></a></div>
                                <div class="col-md-8">
                                  <ul class="comment-social">
                                    <li><i class="icofont icofont-thumbs-up"></i>${results.cur_version}</li>
                                    <li><i class="icofont icofont-ui-chat"></i>${results.cur_time}</li>
                                    <li><i class="icofont icofont-ui-chat"></i>${results.cur_level}</li>
                                    <li><i class="icofont icofont-ui-chat"></i>${results.sub_score}</li>
                                    <li><i class="icofont icofont-ui-chat"></i>${results.sub_status}</li>
                                  </ul>
                                </div>
                              </div>
                            
                            </div>
                          </div>
                        </li>
                    </ul>
                    </div>
                      <div class="card-body">
                      <h4>${results.sub_title} 의 요청사항!                               </h4>
                      <ul>
                        <li>
                          <div class="media align-self-center"><img class="align-self-center" src="./assets/images/blog/comment.jpg" alt="Generic placeholder image">
                            <div class="media-body">
                              <div class="row">
                                <div class="col-md-4">
                                    <h6 class="mt-0">${results.cur_subcontent}<span></span></h6></a></div>

                              </div>
                            </div>
                          </div>
                        </li>
                    </ul>
                    </div>
                  </div>
                  
                                    <div class="card comment-box">
                    <div class="card-body">
                      <h4>반려 사유</h4>
                      <ul>
                        <li>
                          <div class="media align-self-center"><img class="align-self-center" src="./assets/images/blog/comment.jpg" alt="Generic placeholder image">
                            <div class="media-body">
                              <div class="row">
                                <div class="col-md-4">
                                    <h6 class="mt-0">${results.sub_rejection}<span></span></h6></a></div>

                              </div>
                            
                            </div>
                          </div>
                        </li>
                    </ul>
                    </div>
                  </div>
                  
                </div>
              </div>
            </div>
</body>
<%@include file="./admin_footer.jsp" %>
</html>