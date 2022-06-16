$("#likeBtn").on('click',function () {
   var claid = document.getElementById("claid").value;
   //TODO 과정 id 값 넘겨서 가져오기
   console.log('좋아요 버튼 클릭 됨');
   console.log(claid);
   $.ajax({
      url:'./clickLike.do',
      data:{"claid":claid},
      type:'POST',
      async: true,
      dataType:'text',
      success:function (result) {
         console.log(result);
         $("#likeCnt").text(result);
      },
      error:function () {
         console.log("통신실패")
      }

   })
});