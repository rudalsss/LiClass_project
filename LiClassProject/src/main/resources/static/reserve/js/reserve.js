let checkDate =""; //td에 해당하는 온전한 날짜값(23/03/24)
let year="";			  //td에 해당하는 연도(23)
let month = "";		  //td에 해당하는 월(03)
let day = "";			  //td에 해당하는 일(24)
let refDate = $(".print-month").text();     //상단측에서 참고한 년월 값(2023년 3월)

/*insertDate함수(update 23.03.24 : 이경민) :: 상단측의 년월값 + td의 일값을 조합하여 각 td에 온전한 날짜값(checkDate)이 부여되게 한다.*/
function insertDate(){
	year = $(".print-month").text().substring(2,4);
	month = $(".print-month").text().substring(6,7);
	month = month.padStart(2,"0");
	$("td").each(function(){
		day = $(this).text();
		day = day.padStart(2,"0");
		checkDate = year+"/"+month+"/"+day;
		$(this).attr('data-no', checkDate);		
	});
}

/*tdActive함수(update 23.03.24 : 이경민) :: 클래스의 날짜값 & td에 저장된 날짜값을 비교하여 td의 클릭(이벤트) 활성화 여부를 결정한다...*/
function tdActive(classnum){
	$.ajax({
		url : "/admin/episode/epDateList?c_no="+classnum,
		type : "get",
		data : "json",
		error : function(xhr, textStatus, errorThrown){		
			alert( textStatus + "(HTTP-"+ xhr.status + " / " + errorThrown + ")" );
		},
		success : function(epDateList){
			//console.log(epDateList);
			$("td").each(function(){
				$(this).css('background','');
				$(this).css('pointer-events','');
				let date = $(this).attr('data-no'); 			//각 td에 저장된 온전한 날짜값 = data-no속성
				//console.log(date);
				if($.inArray( date , epDateList) != -1){	//회차날짜배열(json)에 일치하는 값이 존재한다면..
					$(this).css('background', '#FAD79B');
				} else {
					$(this).css('background', '#FDF5E6');
					$(this).css('pointer-events', 'none');	//이벤트 비활성화..
				}
			}); //each의 종료
		} //success의 종료
	}); //ajax의 종료
}
			
function templateEp( ep_no, ep_reserveState, ep_date, ep_price, ep_cnt, c_maxcnt, c_endtime, until_cnt  ){
	console.log("함수호출");
	let $epBox = $("#ep_template").clone().removeAttr("id");
	$epBox.addClass("episodeBox"); //해당작업(templateEp함수)을 통해 만들어진 episodeBox
	
	$epBox.attr("data-num", ep_no );
	$epBox.attr("data-value", ep_reserveState);
	$epBox.attr("data-code", until_cnt );
	
	starttime = ep_date.substring(ep_date.indexOf(')')+2,);
	endtime = c_endtime.substring(ep_date.indexOf(')')+2,);
	$epBox.find(".epdate").html(starttime+" ~ "+endtime);
	$epBox.find(".eprice").html(ep_price);
	$epBox.find(".nowcnt").text(ep_cnt);
	$epBox.find(".maxcnt").text(c_maxcnt);
	
	$("#episodeList").append($epBox);
	console.log("templateEp함수 :::"+ep_price+"의 회차출력완.");
}

function CalCount(type, ths, max){
    var $input = $("#sample_cnt");
    var tCount = Number($input.val());
    var tEqCount = max;
    
    if(type=='p'){
        if(tCount < tEqCount) $input.val(Number(tCount)+1);
    }else{
        if(tCount >0) $input.val(Number(tCount)-1);    
    }
}		