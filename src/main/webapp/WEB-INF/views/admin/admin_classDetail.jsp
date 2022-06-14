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


function makeBox(){
	var sub_num = $("input:checkbox[name='sub_num']:checked");
	console.log(sub_num.length);
	if(sub_num.length > 0){
		document.getElementById("frm1").action = "./voteBoxInsert.do";
	}else{
		alert("삭제 오류", "한개 이상의 글을 선택하세요");
		return false;
	}
}

function vote(){
	var vot_sub_num = $("input:checkbox[name='vot_sub_num']:checked");
	console.log(vot_sub_num.length);
	if(vot_sub_num.length > 0){
		document.getElementById("frm2").action = "./updateVote.do";
	}else{
		alert("적어도 한 강사에게는 투표해야합니다");
		return false;
	}
}

function selectAll(selectAll)  {
	var vot_sub_num = document.getElementsByName("vot_sub_num");
	
	for (var i = 1; i < vot_sub_num.length+1; i++) {
		if(document.getElementById("vot_sub_num"+i).checked==true){
			$("#ins_id"+i).prop("checked",true);
		}
		if(document.getElementById("vot_sub_num"+i).checked==false){
			$("#ins_id"+i).prop("checked",false);
		}
	}
	
	if ($("input:checkbox[name=vot_sub_num]:checked").length>1) {
		alert("한 강사에게만 투표가 가능합니다");
		$("input:checkbox[name=vot_sub_num]:checked").prop("checked",false);
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
          <form action="#" method="post" id="frm1" onsubmit="return makeBox()">
          <div class="container-fluid">
            <div class="row">
              <div class="col-sm-12">
                <div class="blog-single">
                
                 <c:forEach items="${lists}" var="vo" varStatus="vs">
                 <input type="checkbox" name="sub_num" value="${vo.sub_num}" style="float: left; margin-left: 13px; margin-top: 2px;">
                 <input type="hidden" value="${vo.sub_num}" name="sub">
                  <i data-feather="list" style="float: left; padding-bottom: 8px;"></i><h6 style="border: 10px; border-radius: 5px;">&nbsp;과목 리스트 ${vs.count}</h6>
                  <div class="blog-box blog-details">
                    <div class="card">
                      <div class="card-body">
                        <div class="blog-details">
                		 <h6 style="color: teal; font-weight: bold;">과목 제목</h6>
                          <ul class="blog-social">
                            <li>${vo.sub_title}</li>
                            <li>${vo.sub_num}</li>
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
                 <button style="margin-left: 30px; margin-bottom: 30px; width: 132px;" type="submit" class="btn btn-outline-primary">지원하기</button>
                </div>
              </div>
            </div>
          </div>
          </form>
<%-- 			<c:if test="${insLists != 'null'}"> --%>
			<div class="col-sm-12">
			<form action="#" method="post" id="frm2" onsubmit="return vote()">
                <div class="card">
                  <div class="card-body">
                    <div class="tab-content" id="top-tabContent">
                      <div class="tab-pane fade show active" id="top-home" role="tabpanel" aria-labelledby="top-home-tab">
                        <div class="row">
                        
             			 <c:forEach items="${insList}" var="vo" varStatus="vs">
                          <div class="col-xxl-4 col-lg-6">
             			 	<input onclick="selectAll(selectAll)" type="checkbox" id="vot_sub_num${vs.count}" name="vot_sub_num" value="${vo.voteVo.vot_sub_num}" style="float: left; margin-left: 10px; margin-top: 2px;">
                          	<div class="parent" id="red" style="display: none;">
             			 	<input type="checkbox" id="ins_id${vs.count}" name="ins_id" value="${vo.ins_id}" style="float: left; margin-left: 10px; margin-top: 2px;">
             			 	<input type="hidden" name="ins" value="${vo.ins_id}"">
                          	</div>
                            <i data-feather="list" style="float: left; padding-bottom: 8px;"></i><h6 style="border: 10px; border-radius: 5px;">&nbsp;지원 강사 ${vs.count}</h6>
                            <div class="project-box">
                            <span class="badge badge-secondary" style="width:210px; height:21px; font-size:13px; float:right; align-content: center; margin-top: 5px;">과정 코드 : ${vo.voteVo.vot_sub_num}</span>
                            <br>
                            <br>
                              <h6><a href="./classSelectDetail.do?cla_num=" style="color: #0B614B;">강사 이름 :  ${vo.ins_name}</a></h6>
                              <div class="media"><img class="img-20 me-2 rounded-circle" src="../assets/images/user/3.jpg" alt="" data-original-title="" title="">
                                <div class="media-body">
                                  <p>강사 ID : ${vo.ins_id}</p>
                                </div>
                              </div>
                              <div class="customers">
                                <ul>
                                  <li class="d-inline-block"><img class="img-30 rounded-circle" src="../assets/images/user/3.jpg" alt="" data-original-title="" title=""></li>
                                  <li class="d-inline-block"><img class="img-30 rounded-circle" src="../assets/images/user/5.jpg" alt="" data-original-title="" title=""></li>
                                  <li class="d-inline-block"><img class="img-30 rounded-circle" src="../assets/images/user/1.jpg" alt="" data-original-title="" title=""></li>
                                  <li class="d-inline-block ms-2">
                                  	<br>
                                  	<input type="hidden" value="${vo.voteVo.vot_voter}" name="vot_voter">
                                  </li>
                                </ul>
                              </div>
                              <h6 style="color: teal;">투표 현황</h6>
                              <c:forEach items="${percent}" var="vo" varStatus="vd">
                                  <c:if test="${vd.count eq vs.count}">
                              <div class="project-status mt-4">
                                <div class="media mb-0">
                                  <p>지원강사 ${vs.count}</p>
                                  
                                  <div class="media-body text-end"><span>${vo}%</span></div>
                                </div>
                                <div class="progress" style="height: 5px">
                                  <div class="progress-bar-animated bg-primary progress-bar-striped" role="progressbar" style="width: ${vo}px;" aria-valuenow="10" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                              </div>
                                  </c:if>
                              </c:forEach>
                            </div>
                          </div>
                 		  </c:forEach>
                              <p style="font-size: 13px; color: silver;">※ 투표는 과목에 따라서 투표가 가능합니다.  과목이 다른 강사는 동일한 강사여도 투표가 가능합니다 </p>
                            
<%-- 							<c:forEach items="${percent}" var="vo" varStatus="vs"> --%>
<!--                               <div class="project-status mt-4"> -->
<!--                                 <div class="media mb-0"> -->
<%--                                   <p>지원강사 ${vs.count}</p> --%>
<%--                                   <div class="media-body text-end"><span>${vo}%</span></div> --%>
<!--                                 </div> -->
<!--                                 <div class="progress" style="height: 5px"> -->
<%--                                   <div class="progress-bar-animated bg-primary progress-bar-striped" role="progressbar" style="width: ${vo}px;" aria-valuenow="10" aria-valuemin="0" aria-valuemax="100"></div> --%>
<!--                                 </div> -->
<!--                               </div> -->
<%--                               </c:forEach> --%>
                         </div>
                        </div>
                       </div>
                     </div>
                    </div>
<%-- 						${percent}                     --%>
                    	  <button style="margin-left : 30px; width: 132px;" type="submit" class="btn btn-outline-primary">투표하기</button>
                    </form>
                  </div>
                  <br>
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