$("#likcBtn").on('click',function () {
   //TODO 과정 id 값 넘겨서 가져오기
   console.log('좋아요 버튼 클릭 됨');
   $.ajax({
      url:'./clickLike.do,',
      data:{"claid":claid},
      type:'POST',
      async: true,
      dataType:'json',
      success:function (result) {
         console.log(result);
      },
      error:function () {
         console.log("통신실패")
      }

   })
});