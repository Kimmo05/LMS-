//드롭다운 바뀔때마다 동작
function changeStatus(){
   	var getText = document.getElementById("list").value;
    console.log("text : ", getText);
	location.href="./changeStatusSelect.do?getText="+getText;	
	
}