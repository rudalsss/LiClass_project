let keyword = "", search = "", start_date = "", end_date = "";
$(function(){
   if(search != "b_date"){
       $("#dateCheck").hide();
       var date = getDateFormat(new Date());
       $('#start_date').val(date);
       $('#end_date').val(date);
   }else{
       $("#search").val(search);
       $("#textCheck").hide();
       $('#start_date').val(start_date);
       $('#end_date').val(end_date);
   }

   if(keyword !=""){
       $("#search").val(search);
       $("#keyword").val(keyword);
   }

   /* 검색 버튼 클릭 시 이벤트 처리*/
   $("#searchBtn").click(function(){
      if($("#search").val() != "b_date"){
          if(!chkSubmit($('#keyword'),"검색어를")) return;
      }else if($("#search").val() == "b_date"){
          if(!chkSubmit($('#start_date'),"시작 날짜를")) return;
          else if(!chkSubmit($('#end_date'), "종료 날짜를")) return;
          else if($('#start_date').val() > $('#end_date').val()){
              alert("시작 날짜가 종료 날짜보다 더 클 수 없습니다.");
              return;
          }
      }
      $("#pageNum").val(1);
      goPage();
   });

   $("#allSearchBtn").click(function (){
      $("#search > option:selected").val("");
      $("#keyword").val("");
      $("#start_date").val("");
      $("#end_date").val("");
      //goPage();
      location.href="/admin/board/boardList";
   });

   /* 검색 대상이 변경될 때마다 처리 이벤트 */
   $("#search").change(function (){
       if($("#search").val() != "b_date"){
           $("#dateCheck").hide();
           $("#textCheck").show();
       } if($("#search").val() == "b_date"){
           $("#textCheck").hide();
           $("#dateCheck").show();
       }
   });

   $(".paginate_button a").click(function (e){
      e.preventDefault();
       $("#f_search").find("input[name='pageNum']").val($(this).attr("href"));
       goPage();
   });

   function goPage(){
       $("#f_search").attr({
          "method" : "get",
          "action" : "/admin/board/boardList"
       });
       $("#f_search").submit();
   }

    /* 제목 클릭 시 상세페이지 이동을 위한 처리 이벤트 */
    $(".goDetail").click(function(){
        console.log("클릭")
        let b_num = $(this).parents("tr").attr("data-num");
        $("#b_num").val(b_num);
        console.log("글번호 : " + b_num);
        //상세페이지로 이동하기 위해 form 추가 (id : detailForm)
        $("#detailForm").attr({
            "method" : "get",
            "action" : "/admin/board/boardDetail"
        });
        $("#detailForm").submit();
    });

    /* 목록 버튼 클릭 시 처리 이벤트 */
    $("#boardListBtn").click(function(){
        location.href="/admin/board/boardList";
    });
    /* 삭제 버튼 클릭 시 처리 이벤트 */
    $("#boardDeleteBtn").click(function(){
        $("#f_data").attr({
            "action" : "/admin/board/boardDelete"
        });
        $("#f_data").submit();
    });

});