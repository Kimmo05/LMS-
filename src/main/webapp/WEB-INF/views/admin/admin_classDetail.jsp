<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<title>Insert title here</title>
<%@ include file="./admin_header.jsp" %>
<script type="text/javascript">
function voteBoxInsert(){
	location.href="./voteBoxInsert.do";
}
function chkBox(){
	var sub_num = $("input:checkbox[name='chk']:checked");
	console.log(sub_num.length);
	if(sub_num.length > 0){
		document.getElementById("frm").action = "./updateVote.do";
	}else{
		alert("삭제 오류", "한개 이상의 글을 선택하세요");
		return false;
	}
}

function vote(val){
	location.href="./updateVote.do?sub_num="+val;
}

function makeBox(){
	var sub_num = $("input:checkbox[name='chk']:checked");
	console.log(sub_num.length);
	if(sub_num.length > 0){
		document.getElementById("frm").action = "./voteBoxInsert.do";
	}else{
		alert("삭제 오류", "한개 이상의 글을 선택하세요");
		return false;
	}
}

function insVote(){
	var ins = $("input:checkbox[name='chk']:checked");
	console.log(ins.length);
	if(ins.length > 0){
		document.getElementById("frm").action = "./updateVote.do";
	}else{
		alert("삭제 오류", "한개 이상의 글을 선택하세요");
		return false;
	}
}




</script>
<body>
	 <!-- Page Sidebar Ends-->
        <div class="page-body">
          <div class="container-fluid">
            <div class="page-header">
              <div class="row">
                <div class="col-sm-6">
                  <input type="hidden" value="${result.cla_num}" id="claid">
                  <h3>${result.cla_title}</h3>
                  <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="./adminMain.do">Home</a></li>
                    <li class="breadcrumb-item">모든 과정</li>
                    <li class="breadcrumb-item active">과정 상세</li>
                  </ol>
                </div>
              </div>
            </div>
          </div>
          <!-- Container-fluid starts-->
          <div class="container-fluid">
            <div class="row">
              <div class="col-sm-12">
                <div class="blog-single">
                  <div class="blog-box blog-details">
                    <div class="card">
                      <div class="card-body">
                        <div class="blog-details">
                          <ul class="blog-social">
                            <li>${result.cla_startdate}</li>
                            <li><i class="icofont icofont-user"></i></li>
                            <li id="likeBtn" style="cursor: pointer;"><i class="icofont icofont-thumbs-up" ></i><span id="likeCnt">${result.cla_like}</span></li>
                            <li><i class="icofont icofont-ui-chat"></i>${result.cla_status}</li>
                          </ul>
                          <h4>
                            ${result.cla_title}
                          </h4>
                          <div class="single-blog-content-top">
                            <p>${result.cla_content}</p>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <form action="#" method="post" id="frm" onsubmit="return insVote()">
          <button style="float: right; margin-right: 30px; width: 132px;" type="submit" class="btn btn-outline-primary">지원하기</button>
          <div class="container-fluid">
            <div class="row">
              <div class="col-sm-12">
                <div class="blog-single">
                 <c:forEach items="${lists}" var="vo" varStatus="vs">
                 <input type="hidden" name="sub_num" value="${vo.sub_num}">
                 <input type="checkbox" name="chkOne" style="float: left; margin-left: 13px;">
                  <i data-feather="list" style="float: left; padding-bottom: 8px;"></i><h6 style="border: 10px; border-radius: 5px;">&nbsp;과목 리스트 ${vs.count}</h6>
                  <div class="blog-box blog-details">
                    <div class="card">
                      <div class="card-body">
                        <div class="blog-details">
                		 <h6 style="color: teal; font-weight: bold;">과목 제목</h6>
                          <ul class="blog-social">
                            <li>${vo.sub_title}</li>
                          </ul>
                          	<div class="single-blog-content-top">
                          	<br>
                         	<h6 style="color: teal; font-weight: bold;">과목 내용</h6>
                            <p>${vo.sub_content}</p>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                 </c:forEach>
                </div>
              </div>
            </div>
          </div>
          </form>
<%--           <c:forEach items="insList" var="vo"> --%>
<%--           ${vo.ins_id} --%>
<%--           </c:forEach> --%>
<%--           <c:if test="${insLists != 'null'}"> --%>
<%--                  <c:forEach var="va" items="${insList}"> --%>
<!--           <form action="#" method="post" id="frm" onsubmit="return inschkBox()"> -->
<!--           <button style="float: right; margin-right: 30px; width: 132px;" type="submit" class="btn btn-outline-primary">투표하기</button> -->
<!-- 		  <div class="container-fluid"> -->
<!--             <div class="row"> -->
<!--               <div class="col-sm-12"> -->
<!--                 <div class="blog-single"> -->
<!--                  <input type="checkbox" name="inschkOne" style="float: left; margin-left: 13px;"> -->
<%--                  <input type="hidden" name="sub_num" value="${va.ins_id}"> --%>
<%--                   <i data-feather="list" style="float: left; padding-bottom: 8px;"></i><h6 style="border: 10px; border-radius: 5px;">&nbsp; email : ${va.ins_email}</h6> --%>
<!--                   <div class="blog-box blog-details"> -->
<!--                     <div class="card"> -->
<!--                       <div class="card-body"> -->
<!--                         <div class="blog-details"> -->
<!--                 		 <h6 style="color: teal; font-weight: bold;">과목 제목</h6> -->
<!--                           <ul class="blog-social"> -->
<%--                             <li>${va.ins_name}</li> --%>
<!--                           </ul> -->
<!--                           	<div class="single-blog-content-top"> -->
<!--                           	<br> -->
<!--                          	<h6 style="color: teal; font-weight: bold;">과목 내용</h6> -->
<%--                             <p>${va.ins_carrer}</p> --%>
<!--                           </div> -->
<!--                         </div> -->
<!--                       </div> -->
<!--                     </div> -->
<!--                   </div> -->
<!--                 </div> -->
<!--               </div> -->
<!--             </div> -->
<!--           </div> -->
<!--           </form> -->
<%--                  </c:forEach> --%>
<%--           </c:if> --%>
<%-- 			<c:if test="${insLists != 'null'}"> --%>
			<div class="col-sm-12">
			<form action="#" method="post" id="frm" onsubmit="return inschkBox()">
          	<button style="float: right; margin-right: 30px; width: 132px;" type="submit" class="btn btn-outline-primary">투표하기</button>
                <div class="card">
                  <div class="card-body">
                    <div class="tab-content" id="top-tabContent">
                      <div class="tab-pane fade show active" id="top-home" role="tabpanel" aria-labelledby="top-home-tab">
                        <div class="row">
             			 <c:forEach items="${inslist}" var="vo">
             			 <input type="hidden" name="sub_num" value="${vo.ins_id}">
                          <div class="col-xxl-4 col-lg-6">
                            <div class="project-box">
                            <span class="badge badge-danger">확인중</span>
                              <h6>
                              <a href="./classSelectDetail.do?cla_num=" style="color: #0B614B;">확인중</a></h6>
                              <div class="media"><img class="img-20 me-2 rounded-circle" src="../assets/images/user/3.jpg" alt="" data-original-title="" title="">
                                <div class="media-body">
                                  <p>과정 시작일 : 확인중</p>
                                </div>
                              </div>
                              <p>확인중</p>
                              <div class="row details">
                                <div class="col-6"><span>정원</span></div>
                                <div class="col-6 font-primary">확인중</div>
                                <div class="col-6"> <span>일일 수업시간</span></div>
                                <div class="col-6 font-primary">확인중</div>
                                <div class="col-6"> <span>총 수업시간</span></div>
                                <div class="col-6 font-primary">확인중</div>
                              </div>
                              <div class="customers">
                                <ul>
                                  <li class="d-inline-block"><img class="img-30 rounded-circle" src="../assets/images/user/3.jpg" alt="" data-original-title="" title=""></li>
                                  <li class="d-inline-block"><img class="img-30 rounded-circle" src="../assets/images/user/5.jpg" alt="" data-original-title="" title=""></li>
                                  <li class="d-inline-block"><img class="img-30 rounded-circle" src="../assets/images/user/1.jpg" alt="" data-original-title="" title=""></li>
                                  <li class="d-inline-block ms-2">
                                    <h5 style="color: teal;">확인중</h5>
                                  </li>
                                </ul>
                              </div>
                              <div class="project-status mt-4">
                                <div class="media mb-0">
                                  <p>70% </p>
                                  <div class="media-body text-end"><span>Done</span></div>
                                </div>
                                <div class="progress" style="height: 5px">
                                  <div class="progress-bar-animated bg-primary progress-bar-striped" role="progressbar" style="width: 70%" aria-valuenow="10" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                              </div>
                            </div>
                          </div>
                 		  </c:forEach>
                         </div>
                        </div>
                       </div>
                     </div>
                    </div>
                    </form>
                  </div>
<%--                  </c:if> --%>
          <button style="float: right; margin-right: 30px; width: 132px;" type="button" class="btn btn-light" onclick="javascript:history.back(-1)">뒤로가기</button>
          <a style="float: right; margin-right: 30px; width: 132px;" type="button" class="btn btn-outline-primary" href="./classBoardSelectedAll.do">자료게시판</a>
          <a style="float: right; margin-right: 30px; width: 132px;" type="button" class="btn btn-outline-primary" href="./classModifyForm.do?cla_num=">글 수정하기</a>
          <!-- Container-fluid Ends-->
        </div>
        <br>
        <br>
        <br>
</body>
<%@include file="./admin_footer.jsp" %>
<script src="../resources/js/statistics/like.js"></script>
</html>