/**********************************************************************************************/
$(function(){
	//------2) 각 td 클릭시 해당날짜의 예약정보조회------//
	$("td").click(function(){
		
		$(".episodeBox").detach(); //이전에 만들어 놓았던 것들 다 없애버림
		
		//폼완성
		let clickDate = $(this).attr("data-no");
		$("#ep_date").val(clickDate);
		
		//폼전송 -> 해당날짜의 회차리스트(json) 받음
		$.ajax({
			url : "/admin/episode/epListOfDay",
			type : "post",
			dataType : "json",
			data : $("#epListOfDay").serialize(),
			error : function(xhr, textStatus, errorThrown){		
				alert( textStatus + "(HTTP-"+ xhr.status + " / " + errorThrown + ")" );
			},
			success : function(data){
				$(data).each(function(){
					let ep_no = this.ep_no;
					let ep_price = this.ep_price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')+"원";
					let ep_date = this.ep_date;
					let ep_cnt = this.ep_cnt;
					let ep_reserveState = this.ep_state1;
					let c_maxcnt = this.c_maxcnt;
					let c_endtime = this.c_endtime;
					let until_cnt = this.c_maxcnt - this.ep_cnt;
					//part1에 날짜 출력
					let day = ep_date.substring( 0, ep_date.indexOf(')')+1 );
					$(".part1").text(day);
					//part2에 회차box 출력
					templateEp( ep_no, ep_reserveState, ep_date, ep_price, ep_cnt, c_maxcnt, c_endtime, until_cnt  );
				});
			}
		}); //ajax의 종료
		$("#collapseTwo").addClass("show");
		$("button[data-bs-target='#collapseTwo']").removeClass("accordion-button collapsed").addClass("accordion-button");
		$("button[data-bs-target='#collapseTwo']").attr("aria-expanded", "true");
		
	}); //td클릭시

	///------3) 인원수 카운터
	$(".plusBtn").click(function(){
		let cnt = $(".checkEp").attr('data-code');
		//console.log(cnt+"개개개"); cnt를 세는 시점은 plus버튼이 눌러졌을때 !!
		CalCount('p', this, cnt);
	});
	$(".minBtn").click(function(){
		let cnt = $(".checkEp").attr('data-code');
		CalCount('m', this, cnt);
	});
	
	//------4) 각 episodeBox 클릭(=하나의 단독회차선택) => 폼만들기
	let ep_price = 0;
	$(document).on("click", ".episodeBox",function(){
		$("#r_cnt").val(0); //비정상흐름 제어
		$("#sample_cnt").val(0);
		// 인원선택, 결제선택 부분 오픈
		$("#collapseThree").addClass("show");
		$("#collapseFour").addClass("show");
		$("button[data-bs-target='#collapseThree']").removeClass("accordion-button collapsed").addClass("accordion-button");
		$("button[data-bs-target='#collapseThree']").attr("aria-expanded", "true");
		$("button[data-bs-target='#collapseFour']").removeClass("accordion-button collapsed").addClass("accordion-button");
		$("button[data-bs-target='#collapseFour']").attr("aria-expanded", "true");
		
		/* 클래스 checkEp ::: 선택된 episodeBox로 
		    이 클래스를 가진 유일한 episodeBox의 정보가 폼에 입력 & reservtitle, reservtime, reservinfo에 출력 */
		$(".episodeBox").removeClass("checkEp");  //기존의 모든 episodeBox에서 제거
		$(this).addClass("checkEp")	;								//클릭된 곳에 유일하게 부여
		
		//해당 에피소드의 데이터를 가져오기 위함
		let ep_no = $(this).attr("data-num");
		$("#ep_no").val( ep_no );											// 1-- 폼에 ep번호입력
		
		//이를 이용해 episode의 정보를 가져옴 & 예약 폼 만들기
		
		$.ajax({
			url : "/admin/episode/epReserve?ep_no="+$("#ep_no").val(),
			type : "get",
			dataType : "json",
			error : function(xhr, textStatus, errorThrown){		
				alert( textStatus + "(HTTP-"+ xhr.status + " / " + errorThrown + ")" );
			},
			success : function(data){
				$("#c_title").val(data.c_title);					// 3-- 폼에 ep제목입력
				$("#r_date").val(data.ep_date);				// 4-- 폼에 ep날짜 & 시간입력
				ep_price = data.ep_price;
				let r_price = data.ep_price * Number($("#r_cnt").val());
				$("#r_price").val( r_price );  // 5--폼에 연산된 가격입력(비정상흐름 : 인원선택-> ep변경)
				
				//###정보출력변환###
				$("#reservtitle").html(data.c_title); 
				$("#reservtime").html(data.ep_date); 
				$("#reservInfo").html($("#r_cnt").val()+"명 ");

				$("#reservInfo").append( r_price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')+"원" );
			}
		}); //ajax의 종료
		
		
	}); //episodeBox의 클릭이벤트
	
	$(".rcntBtn").click(function(){
		$("#r_cnt").val( $("#sample_cnt").val() );				// 2--폼에 cnt 입력
		$("#r_price").val( ep_price * Number($("#r_cnt").val()) );	// 4--폼에 연산된 가격입력(정상흐름 : ep선택-> 인원선택)
		
		//###정보출력변환###
		$("#reservtitle").html($("#c_title").val()); 
		$("#reservtime").html($("#r_date").val()); 
		$("#reservInfo").html($("#r_cnt").val()+"명 ");
		$("#reservInfo").append( $("#r_price").val().replace(/\B(?=(\d{3})+(?!\d))/g, ',')+"원" );
	});
	
	$(".payBtn").click(function(){
		if( $("#r_cnt").val()==0 ){
			alert("인원수를 선택해주세요");
			return;
		} else {
		   var today = new Date();
           var hours = today.getHours(); // 시
           var minutes = today.getMinutes();  // 분
           var seconds = today.getSeconds();  // 초
           var milliseconds = today.getMilliseconds();
           var makeMerchantUid = hours*13 +  minutes + seconds + milliseconds;
           console.log(makeMerchantUid);
           $("#r_no").val(makeMerchantUid);
           
           $("#reservFrm").attr({
        	   "method":"post",
        	   "action":"/client/reserve/makeReserve"
           });
           $("#reservFrm").submit();
		} 
	});//결제버튼 클릭 종료
	
});//최상위 $