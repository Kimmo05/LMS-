
//드롭다운 바뀔때마다 동작
function changeStatus(){
   	var getText = document.getElementById("list").value;
    console.log("text : ", getText);
	if(getText=='전체'){
		location.href="./adminSelectPay.do";
	}else{
		location.href="./changePage.do?getText="+getText;	
	}
}

