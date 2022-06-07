//드롭다운 바뀔때마다 동작
function changeStatus(){
   	var getText = document.getElementById("list").value;
    console.log("text : ", getText);
	location.href="./changeStatusSelect.do?getText="+getText;		
}

//모달 결제 상세
//상세정보 모달 값 받아오기
function modalOpen(paynum){
	console.log("모달오픈!모달오픈!" + paynum);
	 $.ajax({
			 url:"./getPayDetail.do",
			 method :"POST",
			 data :{
				paynum : paynum
			},success:function(data){
				console.log("성공이다");
				console.log(data);
				var noCoupon;
				if(data.pay_ucounum == null){
					 noCoupon = "사용안함.";
				}else{
					noCoupon =data.pay_ucounum;
				}
				const getTextTitle = document.getElementById('modalTitle');
				getTextTitle.innerHTML='<h6><span style="color:tomato;">'+paynum+'</span>&nbsp;의 결제내역입니다.<br>'
				+"<h6>----------------------------------------------------------</h6>";
				const getTextModal = document.getElementById('modalText');
				getTextModal.innerHTML = '<h6>결제 번호&nbsp;&nbsp;:&nbsp;&nbsp;<span style="color:tomato;">'+paynum+'</span></h6><br>'
				+'<h6>결제내역&nbsp;&nbsp;:&nbsp;&nbsp;<span style="color:tomato;">'+data.pay_content+'</span></h6><br>'
				+'<h6>결제방식&nbsp;&nbsp;:&nbsp;&nbsp;<span style="color:tomato;">'+data.pay_pg+'</span></h6><br>'
				+'<h6>결제상태&nbsp;&nbsp;:&nbsp;&nbsp;<span style="color:tomato;">'+data.pay_status+'</span></h6><br>'
				+'<h6>결제일자&nbsp;&nbsp;:&nbsp;&nbsp;<span style="color:tomato;">'+data.pay_date+'</span></h6><br>'
				+'<h6>결제원가&nbsp;&nbsp;:&nbsp;&nbsp;<span style="color:tomato;">'+data.pay_raw+'</span></h6><br>'
				+'<h6>결제 할인가&nbsp;&nbsp;:&nbsp;&nbsp;<span style="color:tomato;">'+data.pay_discount+'</span></h6><br>'
				+'<h6>결제시 사용된 쿠폰번호&nbsp;&nbsp;:&nbsp;&nbsp;<span style="color:tomato;">'+noCoupon+'</span></h6><br>'
				+'<h6>결제시 사용된 마일리지&nbsp;&nbsp;:&nbsp;&nbsp;<span style="color:tomato;">'+data.pay_umilage+'</span></h6><br>'
				+'<h6>----------------------------------------------------------</h6><br>'
				+'<h5>최종 결제액&nbsp;&nbsp;:&nbsp;&nbsp;<span style="color:tomato;">'+data.pay_price+'</span></h5><br>';
				
				 
			 }
		 })
}