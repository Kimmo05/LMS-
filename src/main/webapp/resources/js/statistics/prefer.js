$(function(){
    $.ajax({
        type: "post",
        url: "./getSubjectList.do",
        datatype:"text",
        data:"1",
        success: function (response) {
            console.log("통신 성공");
        },
        error: function(){
            console.log("통신실패");
        }
    });
});

