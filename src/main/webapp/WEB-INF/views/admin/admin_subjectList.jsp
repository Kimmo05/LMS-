<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 전체목록 리스트 화면</title>
</head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="./js/subjectListAdmin.js"></script>
<%@ include file="./admin_header.jsp" %>
<body>
   <div class="page-body">
    
    <form action="#" method="post" id="frm" onsubmit="return chkBox()">
		
		<div id="select">
			<span>
				<select class="btn btn-primary" id="listCount" name="listCount"
				onchange="listCnt()">
					<option>선택</option>
					<option value="5">5</option>
					<option value="10">10</option>
					<option value="15">15</option>
				</select>
			</span>
		</div>
		
          <div class="container-fluid">
            <div class="page-header">
              <div class="row">
                <div class="col-sm-6">
                  <h3>과목 전체 조회</h3>
                    <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="index.html"><i class="icofont icofont-ui-home"></i></a></li>
                    <li class="breadcrumb-item">관리자</li>
                    <li class="breadcrumb-item">과목 승인</li>
                    <li class="breadcrumb-item active">과목 전체 목록 조회</li>
                  </ol>
                </div>
                <div class="col-sm-6">
                </div>
              </div>
            </div>
            
            <div class="row">
              <div class="col-sm-12">
              
                <div class="card">
  				<div class="card-block row">
                  <div class="table-responsive table-border-radius">
                    <table class="table table-hover table-xs table-border-vertical">
                      <thead class="bg-primary">
                        <tr>
		                     	<td><input type="checkbox" name="chkAll" onclick="checkAlls(this.checked)"></td>
                          <th scope="col"><h6 class="f-w-700">과목번호</h6></th>
                          <th scope="col"><h6 class="f-w-700">과목명</h6></th>
                          <th scope="col"><h6 class="f-w-700">카테고리</h6></th>
                          <th scope="col"><h6 class="f-w-700">등록자</h6></th>
                          <th scope="col"><h6 class="f-w-700">담당강사</h6></th>
                          	<th scope="col"><h6 class="f-w-700">승인상태</h6></th>
                          	<th scope="col"><h6 class="f-w-700">관리</h6></th>
                        </tr>
                      </thead>
    				<tbody>
    					<jsp:useBean id="subjectList" class="com.min.bean.SubjectListBeanAdmin" scope="page"/>
    					<jsp:setProperty property="lists" name="subjectList" value="${lists}"/>
    					<jsp:setProperty property="mem" name="subjectList" value="${mem}"/>
    					<jsp:getProperty property="listForm" name="subjectList"/>
    				</tbody>
                    </table>
                    
                    <input type="text" name="index" id="index" value="${row.index}">
					<input type="text" name="pageStartNum" id="pageStartNum" value="${row.pageStartNum}">
					<input type="text" name="pageListNum" id="pageListNum" value="${row.pageListNum}">
		
                    </div>
                  </div>
                </div>
                
            <!-- pagination with active and disabled state-->
             <div class="col-xl-12">
                      <ul class="pagination justify-content-center pagination-primary">
                        <li class="page-item "><a onclick="pageFirst()" class="page-link"  href="#" aria-label="Previous"><span>«</span><span class="sr-only">Previous</span></a></li>
                         <li class="page-item"><a onclick="pagePrev(${row.pageStartNum},${row.pageList})" class="page-link"  href="#" aria-label="Previous"><span aria-hidden="true">이전</span><span class="sr-only">Previous</span></a></li>
                        <c:forEach var="i" begin="${row.pageStartNum}" end="${row.count}" step="1">
                         	<li class="page-item" ${(i-1)==row.index?"class='active'":"" }><a onclick="pageIndex('${i}')" class="page-link" href="#"><span>${i}</span></a></li>
					  	</c:forEach>
                         <li class="page-item"><a onclick="pageNext(${row.pageStartNum},${row.total},${row.pageListNum},${row.pageList})" class="page-link"  href="#"  aria-label="Next"><span>다음</span><span class="sr-only">Next</span></a></li>
                        <li class="page-item"><a onclick="pageLast(${row.pageStartNum},${row.total},${row.pageListNum},${row.pageList})" class="page-link"  href="#" aria-label="Next"><span aria-hidden="true">»</span><span class="sr-only">Next</span></a></li>
                      </ul>
              </div>
              </div>
          </div>
       </div>
 </form>
    </div>
<script type="text/javascript">
	$(document).ready(function(){
		var pageListNum = $("#pageListNum").val();
		$("#list option").each(function(){
			if(pageListNum == $(this).val()){
				$(this).prop("selected",true);
			}else{
				$(this).prop("selected",false);
			}
		});
		});

var pagingAjax= function (){
	console.log("페이징 처리 Ajax 실행")
	var obj = $("#frm").serialize();
	console.log(obj);
	
	$.ajax({
		url:"./page.do",
		type:"post",
		async:true,
		data:$("#frm").serialize(),
		dataType:"json",
		success:function(msg){
			console.log(msg);
			$.each(msg,function(key,value){
				var varHtml="";
			    var n = $(".table tr:eq(0) th").length;
			
			if(key=="lists"){
			varHtml += "	 <thead class='bg-primary'>";
            varHtml += "     <tr>";
	        varHtml += "       <th><input type='checkbox' name='chkAll' onclick='checkAlls(this.checked)''></td>";
            varHtml += "       <th scope='col'><h6 class='f-w-700'>과목번호</h6></th>";
            varHtml += "       <th scope='col'><h6 class='f-w-700'>과목명</h6></th>  ";
            varHtml += "       <th scope='col'><h6 class='f-w-700'>카테고리</h6></th>";
            varHtml += "       <th scope='col'><h6 class='f-w-700'>등록자</h6></th>  ";
            varHtml += "       <th scope='col'><h6 class='f-w-700'>담당강사</h6></th>";
            varHtml += "       <th scope='col'><h6 class='f-w-700'>승인상태</h6></th>";
            varHtml += "       <th scope='col'><h6 class='f-w-700'>관리</h6></th>";
            varHtml += "     </tr>";
            varHtml += "   </thead>";
			varHtml += "	<tbody>";
			}else{
			varHtml += "<li class='page-item '><a onclick='pageFirst()' class='page-link'  href=''#' aria-label='Previous'><span>«</span><span class='sr-only'>Previous</span></a></li>";
            varHtml += "   <li class='page-item'><a onclick='pagePrev("+value.pageStartNum+","+value.pageList+")' class='page-link'  href='#' aria-label='Previous'><span aria-hidden='true'>이전</span><span class='sr-only'>Previous</span></a></li>";
           for(let i = value.pageStartNum; i<=value.count; i++){
        	   if(value.index+1 == i){
        		   varHtml += "<li class='active'>";
        	   }else{
        		   varHtml += "<li>";
        	   }
            varHtml += "   	<li  onclick='pageIndex("+i+")' class='page-item'><a href='#'><span>"+i+"</span></a></li>";
           }
            varHtml += "   <li class='page-item'><a onclick='pageNext("+value.pageStartNum+","+value.total+","+value.pageListNum+","+value.pageList+")' class='page-link'  href='#'  aria-label='Next'><span>다음</span><span class='sr-only'>Next</span></a></li>";
            varHtml += "  <li class='page-item'><a onclick='pageLast("+value.pageStartNum+","+value.total+","+value.pageListNum+","+value.pageList+")' class='page-link'  href='#'   aria-label='Next'><span aria-hidden='true'>»</span><span class='sr-only'>Next</span></a></li>";

			}	
			
                 if(key == "lists"){
                	 $(".table").html(varHtml);
                 }else{
                	 $(".pagination").html(varHtml);
                 }
			});
	},
	error:function(){
		alert("잘못된 요청입니다.");
	}
	});
	
	};

//해당 페이지 번호를 클릭 시 해당하는 값을 전송
function pageIndex(idx){
	console.log("입력 받은 index 값 ", idx);
	var index = document.getElementById("index");
	index.value = idx-1;
	 pagingAjax();
}
//글 갯수 변동
function pageList(){
	var index = document.getElementById("index");
	var pageStartNum = document.getElementById("pageStartNum");
	var listNum = document.getElementById("listNum");
	
	index.value=0;
	pageStartNum.value=1;
	listNum.value=document.getElementById("list").value;
	
	pagingAjax();
}
//처음 페이지로이동
function pageFirst(){
	console.log("처음페이지로 이동");
	var index = document.getElementById("index");
	var pageStartNum = document.getElementById("pageStartNum");
	index.value=0;
	pageStartNum.value=1;
	pagingAjax();
}

function pagePrev(pNum,pageListNum){
	console.log("이전 그룹");
	if(0 < pNum - pageListNum){
		pNum -= pageListNum
		var index = document.getElementById("index");
		var pageStartNum = document.getElementById("pageStartNum");
		
		index.value = pNum-1;
		pageStartNum.value = pNum;
	}
	pagingAjax();
}

function pageNext(pNum,total,pageListNum,pageList){
	console.log("다음 그룹으로 이동");
	var idx = Math.ceil(total/pageListNum);
	var max = Math.ceil(idx/pageList);
	console.log(idx, max);
	
	if(max*pageList > pNum+pageList){
		pNum += pageList;
		console.log(pageStartNum);
		
		var index = document.getElementById("index");
		var pageStartNum = document.getElementById("pageStartNum");
		
		index.value = pNum-1;
		pageStartNum.value=pNum;
	}
	pagingAjax();
}

function pageLast(pNum,total,pageListNum,pageList){
	console.log("마지막 페이지로 이동");
	var idx = Math.ceil(total/pageListNum); 
	var max = Math.ceil(idx/pageList);
	
	while(max*pageList > pNum+pageList){
		pNum += pageList;
	}
	
	var index = document.getElementById("index");
	var pageStartNum = document.getElementById("pageStartNum");
	
	index.value=idx-1;
	pNum.value=pNum;
	pagingAjax()
}
</script>
</body>
<%@include file="./admin_footer.jsp" %>
</html>