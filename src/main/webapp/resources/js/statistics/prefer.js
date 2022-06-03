$( function() {
	var searchSource ;
	var input = document.getElementById("searchBox");
		$.ajax({
	    type : 'GET',
	    url: './getSubjectList.do',
	    async:false,
	    dataType : 'text',
	    success : function(sub) {
	        console.log("통신 성공");
	       searchSource =JSON.parse(sub);
	    },
	    error: function(){
	        console.log("통신실패");
	    }
	});
		 
    $( "#searchBox" ).autocomplete({
      source: searchSource,
      select : function(event, ui) { // item 선택 시 이벤트
          console.log(ui.item);
          console.log("선택됨");
          $("#selSub").append("<div class='subName'><em class='tag_text'>"+ui.item.label+"<img class='cancelImg' src='./resources/images/statistics/cancel.png'></em></div>");
      },
      focus : function(event, ui) { // 포커스 시 이벤트
          return false;
      },
      minLength : 1, // 최소 글자 수
      autoFocus : true, // true로 설정 시 메뉴가 표시 될 때, 첫 번째 항목에 자동으로 초점이 맞춰짐
      classes : { // 위젯 요소에 추가 할 클래스를 지정
          'ui-autocomplete' : 'highlight'
      },
      delay : 300, // 입력창에 글자가 써지고 나서 autocomplete 이벤트 발생될 떄 까지 지연 시간(ms)
      disable : false, // 해당 값 true 시, 자동완성 기능 꺼짐
      position : { my : 'right top', at : 'right bottom'}, // 제안 메뉴의 위치를 식별
      close : function(event) { // 자동완성 창 닫아질 때의 이벤트
          console.log(event);
          input.value='';
      }
    });
    $(".calcelImg").onclick(function () { 
        console.log("클릭됨");
     });
  } );



