<%@ page import="java.util.Random" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<title>Insert title here</title>
<%@ include file="./admin_header.jsp" %>
<body>

<script type="text/javascript">
function cla(val){
	location.href="./classListed.do?cla_status="+val;
}
</script>
<div class="page-body">
    <div class="container-fluid">
      <div class="page-header">
              <div class="col-md-6 p-0" style="float: right;">
                <div class="form-group mb-0 me-0"></div><a class="btn btn-primary" href="./classInsertForm.do" style="margin-top: 20px;"> <i data-feather="plus-square" style="float: left; padding: 1px 5px 4px;"> </i>  과정 등록하기</a>
              </div>
        <div class="row">
          <div class="col-sm-6">
            <h3>모든 과정</h3>
            <ol class="breadcrumb">
               <li class="breadcrumb-item"><a href="./adminMain.do"><i class="icofont icofont-ui-home"></i></a></li>
              <li class="breadcrumb-item active">모든 과정</li>
            </ol>
          </div>
        </div>
      </div>
    </div>
    <!-- Container-fluid starts-->
    <div class="container-fluid">
      <div class="row project-cards">
        <div class="col-md-12 project-list">
          <div class="card">
            <div class="row">
              <div class="col-md-6 p-0">
                  <i data-feather="info" style="color: gray; float: left; margin-top: 5px; margin-right: 7px;"></i>
                <ul class="nav nav-tabs border-tab" id="top-tab" role="tablist">
                  <li class="nav-item"><input spellcheck="false" class="nav-link active" name="cla_status" value="전체조회" id="top-home-tab" onclick="location.href='./classListForm.do'" style="font-size: 100%; width: 100%; max-width: 150px; cursor: pointer;"></li>
                  <li class="nav-item"><input spellcheck="false" class="nav-link active" name="cla_status" value="모집중" id="top-home-tab" onclick="cla(this.value)"style="font-size: 100%; width: 100%; max-width: 150px; cursor: pointer;"></li>
                  <li class="nav-item"><input spellcheck="false" class="nav-link active" name="cla_status" value="승인중" id="top-home-tab" onclick="cla(this.value)" style="font-size: 100%;  width: 100%; max-width: 150px; cursor: pointer;"></li>
                  <li class="nav-item"><input spellcheck="false" class="nav-link active" name="cla_status" value="투표중" id="top-home-tab" onclick="cla(this.value)" style="font-size: 100%;  width: 100%; max-width: 150px; cursor: pointer;"></li>
                  <li class="nav-item"><input spellcheck="false" class="nav-link active" name="cla_status" value="개강전" id="top-home-tab" onclick="cla(this.value)" style="font-size: 100%;  width: 100%; max-width: 150px; cursor: pointer;"></li>
                  <li class="nav-item"><input spellcheck="false" class="nav-link active" name="cla_status" value="강의중" id="top-home-tab" onclick="cla(this.value)" style="font-size: 100%;  width: 100%; max-width: 150px; cursor: pointer;"></li>
                  <li class="nav-item"><input spellcheck="false" class="nav-link active" name="cla_status" value="종강" id="top-home-tab" onclick="cla(this.value)" style="font-size: 100%;  width: 100%; max-width: 150px; cursor: pointer;"></li>
                </ul>

              </div>
            </div>
          </div>
        </div>
        <div class="col-sm-12">
          <div class="card">
            <div class="card-body">
              <div class="tab-content" id="top-tabContent">
                <div class="tab-pane fade show active" id="top-home" role="tabpanel" aria-labelledby="top-home-tab">
                  <div class="row">
       			 <c:forEach items="${lists}" var="vo">
                    <div class="col-xxl-4 col-lg-6" id="${vo.cla_status}">
                      <div class="project-box">
                      <c:if test="${vo.cla_status eq '모집중'}">
                      <span class="badge badge-primary">${vo.cla_status}</span>
                      </c:if>
                      <c:if test="${vo.cla_status eq '승인중'}">
                      <span class="badge badge-danger">${vo.cla_status}</span>
                      </c:if>
                      <c:if test="${vo.cla_status eq '투표중'}">
                      <span class="badge badge-danger">${vo.cla_status}</span>
                      </c:if>
                      <c:if test="${vo.cla_status eq '개강전'}">
                      <span class="badge badge-secondary">${vo.cla_status}</span>
                      </c:if>
                      <c:if test="${vo.cla_status eq '강의중'}">
                      <span class="badge badge-secondary">${vo.cla_status}</span>
                      </c:if>
                      <c:if test="${vo.cla_status eq '종강'}">
                      <span class="badge badge-danger">${vo.cla_status}</span>
                      </c:if>
                        <h6>
                        <a href="./classSelectDetail.do?cla_num=${vo.cla_num}" style="color: #0B614B;">${vo.cla_title}</a></h6>
                        <div class="media"><img class="img-20 me-2 rounded-circle" src="../assets/images/user/3.jpg" alt="" data-original-title="" title="">
                          <div class="media-body">
                            <p>과정 시작일 : ${vo.cla_startdate}</p>
                          </div>
                        </div>
                        <p>${vo.cla_content}</p>
                        <div class="row details">
                          <div class="col-6"><span>정원</span></div>
                          <div class="col-6 font-primary">${vo.cla_maxpeo}</div>
                          <div class="col-6"> <span>일일 수업시간</span></div>
                          <div class="col-6 font-primary">${vo.cla_dailytime}</div>
                          <div class="col-6"> <span>총 수업시간</span></div>
                          <div class="col-6 font-primary">${vo.cla_totaltime}</div>
                        </div>
                        <div class="customers">
                          <ul>
                            <li class="d-inline-block"><img class="img-30 rounded-circle" src="../assets/images/user/3.jpg" alt="" data-original-title="" title=""></li>
                            <li class="d-inline-block"><img class="img-30 rounded-circle" src="../assets/images/user/5.jpg" alt="" data-original-title="" title=""></li>
                            <li class="d-inline-block"><img class="img-30 rounded-circle" src="../assets/images/user/1.jpg" alt="" data-original-title="" title=""></li>
                            <li class="d-inline-block ms-2">
                              <h5 style="color: teal;">${vo.cla_price} ₩</h5>
                            </li>
                          </ul>
                        </div>
                    <%!
                           String[] color = {"primary","secondary","danger","dark","info","warning","success","light"};

                           public String ranColor(int n){
                               return color[n];
                           }

                       %>
                       <div class="customers">
                           <ul>
                               <li class="d-inline-block ms-2">
<%--                                   <h5 style="color: teal;">${vo.cla_price} ₩</h5> --%>
                               </li>
                               <li style="text-align: right;padding-left: 15px">
                                   <c:forEach items="${vo.cla_tags}" var="tag">
                                           <span class="badge round-badge-<%out.print(ranColor((int)(Math.random()*8)));%>"
                                                 style="position: relative; ">${tag}</span>
                                   </c:forEach>
                               </li>
                           </ul>
                      </div>
                      </div>
                    </div>
           		  </c:forEach>
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
</body>
<%@include file="./admin_footer.jsp" %>
</html>