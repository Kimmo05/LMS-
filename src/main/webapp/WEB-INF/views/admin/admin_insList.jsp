<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>관리자 일반회원</title>
</head>
<script type="text/javascript" src="../js/jquery-3.5.1.min.js"></script>
<!-- <script type="text/javascript" src="../js/memberInsList.js"></script> -->
<script type="text/javascript">


</script>
<%@ include file="./admin_header.jsp" %>
<body>
   <div class="page-body">
        <div id="container" class="container">
        <div class="col-sm-6">
                  <h3>강사</h3>
                  <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="./main.do">관리자 메인</a></li>
                    <li class="breadcrumb-item">관리자</li>
                    <li class="breadcrumb-item">회원 관리</li>
                    <li class="breadcrumb-item active">일반 회원 전체 목록</li>
                  </ol>
                </div>
    <form action="./adminInsList.do" method="post" id="frmPaging" onsubmit="return chkBox()">
      <div id="select">
      <!-- select listNum 의 값을 변경 -->
      <span>
      	<select class="btn btn-primary" id="listCount" name="listCount" onchange="listCnt()">
      	  <option value="5">5</option>
      	  <option value="10">10</option>
      	  <option value="15">15</option>
      	</select>
    
      </div>
      
      <table class="table table-hover">
        <thead>
          <tr>
          	<th >프로필</th>
            <th>아이디</th>
            <th >이름</th>
            <th >이메일</th>
            <th >가입일</th>
 	        <th >회원상태</th>
 	        <th >경력</th>
          </tr>
        </thead>
        <tbody>
<%--           <jsp:useBean id="insMemberList" class="com.min.bean.InstructorListBean" scope="page"/> --%>
<%--           <jsp:setProperty property="lists" name="insMemberList" value="${lists}"/> --%>
<%--           <jsp:setProperty property="user" name="insMemberList" value="${user}"/> --%>
<%--           <jsp:getProperty property="listForm" name="insMemberList"/> --%>
         <c:forEach var="user" items="${lists}" varStatus="vs">
		      <tr>
		      <td>${user.profile}</td><td>${user.id}</td><td>${user.name}</td><td>${user.email}</td>
<%-- 		        <td>${user.auth == "ROLE_INSTRUCTOR"?"강사":"일반회원"}</td> --%>
		        <td>${user.regdate}</td>
		        <td><button class="btn btn-default">${user.delflag=="Y"?"복구":"탈퇴"}</button></td>
		         <td>${user.career}</td>
		      </tr>
		    </c:forEach>
        </tbody>
      </table>
      
      <input type="text" name="index" id="index" value="${row.index}" hidden="" >
      <input type="text" name="pageStartNum" id="pageStartNum" value="${row.pageStartNum}" hidden="true">
      <input type="text" name="pageListNum" id="pageListNum" value="${row.pageListNum}" hidden="true">
     
   
       <!-- pagination with active and disabled state-->
             <div class="col-xl-12">
                      <ul class="pagination justify-content-center pagination-primary">
                        <li class="page-item "><a onclick="pageFirst()" class="page-link"  href="#" aria-label="Previous"><span>«</span><span class="sr-only">Previous</span></a></li>
                        <li class="page-item"><a onclick="pagePrev(${row.pageStartNum},${row.pageList})" class="page-link"  href="#" aria-label="Previous"><span aria-hidden="true">이전</span><span class="sr-only">Previous</span></a></a></li>
                         <c:forEach var="i" begin="${row.pageStartNum}" end="${row.count}" step="1">
                            <li  onclick="pageIndex(${i})" class="page-item "><a class="page-link " href="#"><span>${i}</span></a></li>
                    </c:forEach>
                        <li class="page-item"><a onclick="pageNext(${row.pageStartNum},${row.total},${row.pageListNum},${row.pageList})" class="page-link"  href="#"  aria-label="Next"><span >다음</span></a></li>
                        <li class="page-item"><a onclick="pageLast(${row.pageStartNum},${row.total},${row.pageListNum},${row.pageList})" class="page-link"  href="#" aria-label="Next"><span >»</span></a></li>
                      </ul>
              </div>
            
      
      
    </form>
    
    <!-- 새글쓰기 모달 -->
    
    <div class="modal fade" id="write" role="dialog">
	    <div class="modal-dialog modal-lg">
	      <div class="modal-content">
		        <div class="modal-header">
			          <button type="button" class="close" data-dismiss="modal">&times;</button>
			          <h4 class="modal-title">게시글 입력</h4>
			   </div>
			   <div class="modal-body">
			          <form method="post" id="frmWriter" class="">
			          
			          </form>
			  </div>
<!-- 			  <div class="modal-footer"> -->
<!-- 			          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button> -->
<!-- 		      </div> -->
	      </div>
	    </div>
  </div>
     	<div class="col-sm-12">
                <div class="card">
                
                  <div class="card-body btn-showcase">
                      <div class="modal fade bd-example-modal-lg" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" style="display: none;" aria-hidden="true">
                      <div class="modal-dialog modal modal-dialog-centered modal-lg" role="document">
                        <div class="modal-content text-center d-block">
                          <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">과목 상세보기<small class="text-muted">과목 상세정보</small></h5>
                            <button class="btn-close" type="button" data-bs-dismiss="modal" aria-label="Close" data-bs-original-title="" title=""></button>
                          </div>
                          <div class="modal-body">
                          	<br><br>
                          	<h6 id="modalTitle">ㅇㅇㅇ</h6>
                          	<div id="modalText">dㅇㅇd</div>
                          </div>
                          <div class="modal-footer">
                            <button class="btn btn-light" type="button" data-bs-dismiss="modal" data-bs-original-title="" title="">돌아가기</button>
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
    </div>
</div>

</body>
  <script type="text/javascript">
	function pageFirst(){
		console.log("처음 페이지로 이동");
		var index = document.getElementById("index");
		var pageNum = document.getElementById("pageStartNum");
		
		index.value = 0;
		pageNum.value = 1;
		pagingForm()
	}
	function pagePrev(pNum, pageList){
		console.log("이전 그룹");
		if(0 < pNum - pageList){
			pNum -= pageList;
			var index = document.getElementById("index");
			var pageNum = document.getElementById("pageStartNum");
			
			index.value = pNum - 1;
			pageNum.value = pNum;
		}
		pagingForm()
		}
	function pageIndex(idx){
		console.log("입력 받은 index 값 : " + idx);
		var index = document.getElementById("index");
		index.value = idx - 1;
		pagingForm()
	}
	function pageNext(pNum,total,listNum,pageList){
		console.log("다음 페이지");
		var idx = Math.ceil(total/listNum); // 31/5 = 7
		var max = Math.ceil(idx/pageList); // 2 그룹
		
		if(max*pageList > pNum+pageList){
			pNum += pageList;
			
			var index = document.getElementById("index");
			var pageNum = document.getElementById("pageStartNum");
			
			index.value = pNum - 1;
			pageNum.value = pNum;
		}
		pagingForm()
	}
	function pageLast(pNum,total, listNum, pageList){
		console.log("마지막 페이지");
		var idx = Math.ceil(total/listNum); // 31/5 7 index
		var max = Math.ceil(idx/pageList); // 12345 | 67 => 2 묶음
		
		while(max*pageList > pNum+pageList){
			pNum += pageList;			
		}
			var index = document.getElementById("index");
			var pageNum = document.getElementById("pageStartNum");
			
			index.value = idx - 1;
			pageNum.value = pNum;
			pagingForm()
	}
	
	function pagingForm(){
		document.getElementById("frmPaging").submit();
	}
	
	function listCnt(){
		document.getElementById("index").value = 0;
		document.getElementById("pageStartNum").value = 1;
		document.getElementById("pageListNum").value = document.getElementById("listCount").value;
		pagingForm();
	}
	
	  window.onload = function(){
		  var buttons = document.getElementsByTagName("button");
		  console.log(buttons.length);

		  for(var i=0; i<buttons.length;i++){
			  console.log(buttons[i].innerHTML);
			  buttons[i].onclick = function(){
				 var id = this.parentNode.parentNode.childNodes[1].innerHTML;
				 // this 는 선택된 객체의 DOM
				 var tmp = this;
// 				  console.log(this.innerHTML);
// 				  console.log(this.parentNode.parentNode.childNodes[1].innerHTML)
// 				  console.log(this.parentNode.parentNode.childNodes[3].innerHTML)
				  console.log("tmp : " + tmp);
				  
// 				  var id = this.parentNode.parentNode.childNodes[1].innerHTML;
// 				  var delflag = this.parentNode.parentNode.childNodes[3].innerHTML;
				  
// 				  $.ajax({
// 					 url:"./changeUser.do",
// 					 method:"post",
// 					 data:{
// 						 id : id,
// 						 delflag : delflag
// 					 },
// 					 success:function(data){
// 						this.parentNode.parentNode.childNodes[3].innerHTML = 
// 					  	(this.parentNode.parentNode.childNodes[3].innerHTML == "Y") ? "N" : "Y";
				  
// 						  this.innerHTML = (this.innerHTML == "복구" ? "탈퇴" : "복구");
// 					 },
// 					 error:function(){
// 						 console.log("에러");
// 					 }
// 				  })

				$.ajax({
					// this 는 jquery 의 $ajax 자체를 의미
					url:"./changeUser.do",
					type:"post",
					data:{"id":id},
					success:function(msg){
						console.log(msg.isc);
						console.log(tmp);
						if(msg.isc){
							tmp.parentNode.parentNode.childNodes[7].innerHTML = 
		 					(tmp.parentNode.parentNode.childNodes[7].innerHTML == "Y") ? "N" : "Y";
						  
							tmp.innerHTML = (tmp.innerHTML == "복구" ? "탈퇴" : "복구");	
						}
					},
					error:function(){
						alert("잘못된 요청");
					}
				});
			  };
		  }
	  }
	  
	  $(document).ready(function(){
			var listNum = $("#pageListNum").val();
			
			$("#listCount option").each(function(){
				if(listNum == $(this).val()){
					$(this).prop("selected",true);
				}else{
					$(this).prop("selected",false);
				}
			})
		})
	  
	  
	</script>
</body>
</html>