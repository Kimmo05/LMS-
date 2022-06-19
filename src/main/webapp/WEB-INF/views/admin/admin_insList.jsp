<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>관리자 일반회원</title>
</head>
<script type="text/javascript" src="../js/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="../js/memberInsList.js"></script>
<script type="text/javascript">

window.onload = function(){
	var chks = document.getElementsByName("chk");
	var checkAll = document.getElementById("checkAll");
	for(let i=0;i<chks.length;i++){
		chks[i].onclick = function(){
			if(chks.length==checkCount()){
				checkAll.checked = true;
			}else{
				checkAll.checked = false;
			}
		}
	}
}

// 전체 체크 버튼

function checkAlls(bool){
//	var chks = document.getElementsByName("chk");
//	for(let i=0; i<chks.length;i++){
//		chks[i].checked = bool;
//	}
	$("input:checkbox[name='chk']").prop("checked",bool);
	console.log("check 갯수 : ",checkCount());
}

// 선택된 checked를 확인하는 함수
function checkCount(){
	var cnt = 0;
	var chks = document.getElementsByName("chk");
//	for(let o in chks){
//		console.log("o는 chk의 인덱스 in : " + o);
//		chks[o].checked
//	}	
	for(let o of chks){
		console.log("o는 object of"+o);
		if(o.checked){
			cnt++;
		}
	}	
	return cnt;
	
}


function chkBox(){
	var chks = $("input:checkbox[name='chk']:checked");
	console.log("chks.length : ",chks.length);
	if(chks.length>0){
		document.getElementById("frm").action="./multiDel.do";
	}else{
		swal("삭제오류","한개 이상의 글을 선택하세요.");
		return false;
	}
	
	
	
		
}

	function del(val){
		console.log("삭제 :",val);
		location.href="./multiDel.do?chk="+val;
	}


// 세션의 저장되어 있는 row 의 값에 따른 listNum  의 갯수
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

// 해당 페이지번호를 클릭 했을 때 해당 값을 전송
function pageIndex(idx){
	console.log("입력 받은 index 값 : " + idx);
	var index = document.getElementById("index");
	index.value = idx - 1;
	pageAjax();
}

function pageFirst(){
	console.log("처음 페이지로 이동");
	var index = document.getElementById("index");
	var pageNum = document.getElementById("pageStartNum");
	
	index.value = 0; //인덱스 처음으로
	pageNum.value = 1; //출력될페이지의 시작번호
	pageAjax();
}

function pagePrev(pNum, pageList){
	console.log("이전 그룹");
	if(0 < pNum - pageList){//출력될페이지의 시작번호 -출력될 페이지의 하단 번호 갯수
		pNum -= pageList;  //1 = 1-5 = 4
		var index = document.getElementById("index"); //현재 2페이지 가정
		var pageNum = document.getElementById("pageStartNum"); // 1
		
		index.value = pNum - 1; //
		pageNum.value = pNum;
	}
	
	pageAjax();
}


function pageNext(pNum,total, listNum, pageList){
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
	pageAjax();
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
		
		index.value = pNum - 1;
		pageNum.value = pNum;
		pageAjax();
}


// 글 갯수가 변할 때 동작
function pageList(){
	var index = document.getElementById("index");
	var pageNum = document.getElementById("pageStartNum");
	var listNum = document.getElementById("pageListNum");
	
	index.value = 0;
	pageNum.value = 1;
	listNum.value = document.getElementById("list").value;
	
	console.log("pageList : " + listNum.value);
	pageAjax();
}



var pageAjax = function(){
	console.log("index 페이지 처리 Ajax")
	console.log($("#frm").serialize())
	$.ajax({
		url:"./insuserpage.do",
		type:"post",
		async:true,
		data:$("#frm").serialize(),
		dataType:"json",
		success:function(msg){
			console.log(msg);
		 	$.each(msg,function(key,value){
            var varHtml = "";
            var n = $(".table tr:eq(0) th").length;
            if(key=="lists"){
            varHtml += "<thead>                                                                  ";
            varHtml += "   <tr>                                                                 ";
            varHtml += "      <th><input type='checkbox' id='checkAll' onclick='checkAll(this.checked)'></th>";
            varHtml += "      <th>프로필</th>                                                  ";
            varHtml += "      <th>아이디</th>                                                    ";
            varHtml += "      <th>이름</th>                                                    ";
            varHtml += "      <th>이메일</th>                                                  ";
            varHtml += "      <th>가입일</th>                                                  ";
            varHtml += "      <th>회원상태</th>                                                ";
            varHtml += "   </tr>                                                                ";
            varHtml += "</thead>                                                                 ";
            varHtml +="<tbody>";
            $.each(value, function(k,v){
               varHtml +="<tr>                                                                                                                                ";
	           varHtml +="  <td><input type='checkbox' name='chk' value='"+v.id+"'></td>                                                                           ";			
               varHtml +="  <td>"+replyImage(v.profile)+"</td>                                                                                                                              ";
               varHtml +="    <td onclick='modalOpen("+v.Id+")'><a href='#' data-bs-toggle='modal' data-original-title='test' data-bs-target='#exampleModal'>"+v.id+"</a></td>                                   ";
               varHtml +="  <td>"+v.name+"</td>                                                                                                                    ";
               varHtml +="  <td>"+v.email+"</td>                                                                                                                        ";
               varHtml +="  <td>"+v.regdate+"</td>                                                                                                      ";
			   varHtml +="  <th>"+v.delflag+"</th>                                                                                                                        ";	
               varHtml +="</tr>                                                                                                                               ";
               varHtml +="<tr>                                                                                                                                ";                                                                                                                     
            });
				varHtml +="</tbody>";
            }else{
			varHtml += "<li class='page-item '><a onclick='pageFirst()' class='page-link'  href=''#' aria-label='Previous'><span>«</span><span class='sr-only'>Previous</span></a></li>";
            varHtml += "   <li class='page-item'><a onclick='pagePrev("+value.pageStartNum+","+value.pageList+")' class='page-link'  href='#' aria-label='Previous'><span aria-hidden='true'>이전</span><span class='sr-only'>Previous</span></a></li>";
           for(let i = value.pageStartNum; i<=value.count; i++){
        	   if(value.index+1 == i){
        		   varHtml += "<li class='page-item active' onclick='pageIndex("+i+")'>";
        	   }else{
        		   varHtml += "<li class='page-item ' onclick='pageIndex("+i+")' >";
        	   }
            varHtml += "   	<a href='#'  class='page-link' ><span>"+i+"</span></a></li>";
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
			alert("잘못된 요청");
		}
	})
};


//새글 작성
function writeBoard(){
	console.log("글 작성");
	//화면을 구성해서 append 처리 
	showWrite();
	$("#write").modal({backdrop:'static', keyboard:false});
	
}
function replyImage(depth) {
		var replyImg = "";
		for (let i = 0; i < depth; i++) {
		replyImg+="&nbsp;&nbsp;&nbsp;&nbsp;";
		}
		if(depth!=0) {
				replyImg+="<img src='./images/reply.png' alt=''>";
		}
		
		return replyImg;
	}
var showWrite = function(){
	html = "";
//		 html += " <div class='form-group'>";
//		 html += "   <label for='id'>아이디 : </label>";
//		 html += "   <input type='email' class='form-control' id='id' readonly value=''>";
//		 html += " </div>";
		 html += " <div class='form-group'>";
		 html += "   <label for='title'>제목 : </label>";
		 html += "   <input type='text' class='form-control' name='title'  id='title' required>";
		 html += " </div>";
		 html += " <div class='form-group'>";
		 html += "   <label for='title'>내용 : </label>";
		 html += "   <textarea class='form-control' row = '5'  name='content'  id='content' ></textarea>";
		 html += " </div>"
		 html += "	<div class='modal-footer'>                                                        ";
	     html += "    <input type='button' class='btn btn-success' value='새글입력' onclick='writeVal()'>";
	     html += "    <input type='reset' class='btn btn-info' value='초기화'>";
         html += "    <button type='button' class='btn btn-default' data-dismiss='modal'>취소</button>";
	     html += "  </div>                                                                             ";
		$("#frmWriter").html(html);
}

function writeVal(){
	console.log("새글작성");
	var frmWrite = document.getElementById("frmWriter");
	frmWrite.action ="./write.do";
	var title = document.getElementById("title");
	var content = document.getElementById("content");
	const extractTextPattern =/(<[^>]+)>/gi;
	let convertTitle = title.value.replace(extractTextPattern,'');
	title.value = convertTitle;
	console.log("변경된 title값 :", convertTitle);
	if(title.value.trim() == "" ){
		swal("새글작성 오류","제목은 필수값 입니다.");
		title.value="";
	}else{
		frmWrite.submit();
	}
}


//글 수정
function modify(seq){
	console.log("선택된 글 번호",seq);
//DOM 탐색을 ID나 class.. 아니라 속성의 값(글자)를 탐색하여 선택함
	var id = "[href*='+seq+']";
	//화면을 구성해서 append 처리 
	 $(id).css("background","orange");

	ajaxModify(seq);
	$("#modify").modal({backdrop:'static', keyboard:false});

//	showModify();
//	$("#modify").modal();
	
}


function modalHide(){
	$("#modify").modal("hide");
}

var ajaxModify = function(seq){
	console.log("ajaxModify",seq);
	$.ajax({
		url : "./modifyForm.do",
		method : "post",
		data : "seq="+seq,
//		dataType : "json",
		success: function(msg){
			console.log(msg, typeof msg);
			var json = JSON.parse(msg);
			console.log(json, typeof json);
		 html = "";
		 html += " <div class='form-group'>";
		 html += "   <label for='id'>아이디 : </label>";
		 html += "<input type='hidden' name='seq' value='"+json.seq+"'> ";
		 html += "   <b class='form-control'>"+json.id+" </b> ";
		 html += " </div>";
	
		 html += " <div class='form-group'>";
		 html += "   <label for='regdate'> 작성일 : </label>";
		 html += "   <b class='form-control'>"+json.regdate+" </b> ";
		 html += " </div>";
		 html+="      <label for = 'title'>제목:</label>                                      ";
		 html+="      <input type = 'text'  class= 'form-control' id='title' name = 'title' required value='"+json.title+"'>";
		 html+="    </div>"; 
		 html += " <div class='form-group'>";
		 html += "   <label for='title'>내용 : </label>";
		 html += "   <textarea class='form-control' row = '5'  name='content'  id='content' >"+json.content+"</textarea>";
		 html += " </div>"	 
	
		 html += "	<div class='modal-footer'>                                                        ";
	     html += "    <input type='button' class='btn btn-success' value='글수정' onclick='modifyVal()'>";
	     html += "    <input type='reset' class='btn btn-info' value='초기화'>";
         html += "    <button type='button' class='btn btn-default' data-dismiss='modal'>취소</button>";
	     html += "  </div>  ";  

		 $("#frmModify").html(html);
		},
		error: function(){
			alert("잘못된 요청 처리")	
		}
	});
}

function modifyVal(){
   var frm = $("#frmModify")
   var idx = document.getElementById("index").value;
//   console.log(frm.serialize());
//   console.log(idx);
   $.ajax({
      url : "./modify.do",
      type : "post",
      data : frm.serialize(),
      success : function(msg){
         console.log(msg)
         if(msg.isc == "true"){
            $("#modify").modal("hide");
        pageAjax();
         }else{
            location.href="./logout.do";
         }
      },error:function(){
         alert("잘못된 요청 처리");
      }
       
   });
}


function reply(seq){
	console.log("선택된 글 번호",seq);
//DOM 탐색을 ID나 class.. 아니라 속성의 값(글자)를 탐색하여 선택함
	var id = "[href*='+seq+']";
	//화면을 구성해서 append 처리 
	 $(id).css("background","orange");

	$("#reply").modal({backdrop:'static', keyboard:false});
	ajaxReply(seq);

	
}


function modalHide(){
	$("#reply").modal("hide");
}


var ajaxReply = function(seq){
   $.ajax({
      url:"./replyForm.do",
      type:"post",
      data:{"seq":seq},
      dataType:"json",
      success:function(r){
         console.log(r);
         $("#frmReply").html("");
//         html += " <div class='form-group'>";
//          html += "   <label for='id'>아이디 : </label>";
//          html += "   <input type='email' class='form-control' id='id' readonly value=''>";
//          html += " </div>";

//         var div = $("<div>").attr("class","form-group");
//         var input = $("<input>").attr({"type":"hidden","name":"seq","value":r.obj.seq});
//         var label = $("<label></label>").text("부모글 정보("+r.obj.seq+")");
//         var p = $("<p>").attr("class","form-control").text("조회수 /"+r.obj.readcount + " 작성일 / " + r.obj.regdate + "작성자 / "+r.obj.id);
//         div.append(input).append(label).append(p);
//         $("#frmReply").append(div);
         
         html ="";
         html += "<div class='form-group'>";
         html += "<input type='hidden' name='seq' value='"+r.obj.seq+"'>";
         html += "<label>부모글의 정보("+r.obj.seq+")</label>";
         html += "<b>조회수:"+r.obj.readcount+" / 작성일 :"+r.obj.regdate+"/ 작성자:"+r.obj.id+"</b>";
         html += "</div>";
         
         
         html +="<div class='form-group'>";
         html +="<label>작성자</label>";
         html +="<b>"+r.sessionId+"</b>";
         html +="</div>";
         
         html +="<div class='form-group'>";
         html +="<label id='tit'>제목(원본)</label>";
         html +="<input type='text' class='form-control' id='title' name='title' value='"+r.obj.title+"'>";
         html +="</div>";
         
         html +="<div class='form-group'>";
         html +="<input type='hidden' id='hiddenContent' value='"+r.obj.content+"'>";
         html +="<label id='con'>내용(원본)</label>";
         html += "<textarea rows='5' class='form-control' id='Textarea' name='content' onclick='chk()'>"+r.obj.content+"</textarea>";         
         html +="</div>";
         
         html += "   <div class='modal-footer'>                                                        ";
          html += "    <input type='button' class='btn btn-success' value='답글작성' onclick='replyVal()'>";
         html += "    <span onclick='reset()'><input type='reset' class='btn btn-info' value='초기화'></span>";
         html += "    <button type='button' class='btn btn-danger' data-dismiss='modal'>취소</button>";
           html += "  </div> ";
         
         $("#frmReply").html(html);
         
      },
      error:function(){
         alert("잘못된 요청 처리 값");   
      }
      
   });
}

function reset(){
   console.log("리셋");
   document.getElementById("tit").innerHTML = "제목(원본)";
   document.getElementById("con").textContent = "내용(원본)";
}

function chk(){
   var tit = document.getElementById("tit");
   var con = document.getElementById("con");
   var title = document.getElementById("title");
   var Textarea = document.getElementById("Textarea");
   
   var hiddenContent = document.getElementById("hiddenContent");
   
   console.log(tit,con,title,Textarea,hiddenContent);
   
   if(Textarea.value == hiddenContent.value){
      con.innerHTML = "답글내용";
      tit.innerHTML = "답글제목";
      Textarea.value="";
      title.value="";
   }
}

function replyVal(){
	var tit = document.getElementById("tit").textContent; //제목(원본) -> 답글 제목
	console.log(tit);
	if(tit == "제목(원본)"){
		swal("답글작성 오류","제목과 내용을 작성해주세요");
		return;
	}
	var parentSeq = document.getElementsByName("seq")[0].value;
	var title = document.getElementById("title");
	var content = document.getElementsByName("content")[0];
	
	const extractTextPattern =/(<[^>]+)>/gi;
	let convertTitle = title.value.replace(extractTextPattern,'');
	let convertContent = content.value.replace(extractTextPattern,'');
	console.log(convertTitle,convertContent);
	
	$.ajax({
		url:"./reply.do",
		type:"post",
		data:{"seq":parentSeq,"title":convertTitle,"content":convertContent},
		success:function(msg){
			if(msg.isc == "true"){
				pageAjax();
				$("#reply").modal("hide");
			}else{
				swal("답글작성 오류","다시 작성해 주세요");
			}
		},error:function(){
			alert("잘못된 요청 처리")	
		}
	});
	
}
</script>
<%@ include file="./admin_header.jsp" %>
<body>
   <div class="page-body">
        <div id="container" class="container">
        <div class="col-sm-6">
                  <h3>일반회원</h3>
                  <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="./main.do">관리자 메인</a></li>
                    <li class="breadcrumb-item">관리자</li>
                    <li class="breadcrumb-item">회원 관리</li>
                    <li class="breadcrumb-item active">일반 회원 전체 목록</li>
                  </ol>
                </div>
    <form action="#" method="post" id="frm" onsubmit="return chkBox()">
      <div id="select">
      <!-- select listNum 의 값을 변경 -->
      <span>
      	<select class="btn btn-primary" id="list" name="list" onchange="pageList()">
      	  <option value="5">5</option>
      	  <option value="10">10</option>
      	  <option value="15">15</option>
      	</select>
      </span>
          <span><input type="submit" class="btn btn-danger" value="다중삭제"></span>      
      </div>
      
      <table class="table table-hover">
        <thead>
          <tr>
            <th>
                <input type="checkbox" id="checkAll" onclick="checkAlls(this.checked)">
            </th>
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
          <jsp:useBean id="insMemberList" class="com.min.bean.InstructorListBean" scope="page"/>
          <jsp:setProperty property="lists" name="insMemberList" value="${lists}"/>
          <jsp:setProperty property="user" name="insMemberList" value="${user}"/>
          <jsp:getProperty property="listForm" name="insMemberList"/>
        </tbody>
      </table>
      
      <input type="text" name="index" id="index" value="${row.index}" hidden="true">
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
</body>
<%@include file="./admin_footer.jsp" %>
  
</body>
</html>