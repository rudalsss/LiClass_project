/*은아*/
/*updateForm*/
/****************** 함수 ********************/

//2. 비밀번호 정규식
function pwRegExp(item) {
	const regExp = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/;
	if(!regExp.test($(item).val())){
		$("#pw-check-result").addClass('red');
		$("#pw-check-result").text("영문자,숫자,특수 문자로 조합된 최소 8자의 비밀번호를 입력해 주세요.");
		return false;
	}else{
		$("#pw-check-result").removeClass('red');
		$("#pw-check-result").text("사용 가능한 비밀번호 입니다.");
		return true;	
	}
}

//3. 전화번호 정규식
function checkPhone(phoneNumber){
	const regExp =/^(?:(010\d{4})|(01[1|6|7|8|9]\d{3,4}))(\d{4})$/;
	if(!regExp.test(phoneNumber)){
		$("#tel-check-area").css("display","revert");
		$("#tel-check-result").addClass('red');
		$("#tel-check-result").text("올바른 전화번호를 입력해 주세요.");
		return false;
	}else{
		$("#tel-check-area").css("display","none");
		return true;
	}
}

//4. 이름공백 검사
function nameCheck(){
	if($("#user_name").val().replace(/\s/g,"")==""){
		$("#user_name").focus();
		return false;
	}
	return true;
}

/*****************************************************/
	
/******************$(function(){})********************/
$(function(){
	var pwEditCheck = false;
	var pwcheckAccord = false;
	var telAccord = false;
	var nameAccord = false;
	var phoneNumber ="";
	//1. (비밀번호)수정하기 버튼
	$("#pw-edit-btn").click(function(){
		pwEditCheck = true;
		$("#pw-check-tr").css("display","revert");
		$("#pw-edit-btn").css("background-color","dimgray");
	});
		
	//2. (기존비밀번호 입력 후) 확인버튼
	$("#origin-pw-check").click(function(){
		$.ajax({
		      type : "POST",
		      url : "/checkPw",
		      data : {
		    	 "user_email" : $("#update-user-email").val(),
		         "user_pw" : $("#origin-pw").val()
		      },
		      success : function(checkData){
		    	 if(checkData == "0"){
		    		 alert("비밀번호를 확인해 주세요.");
		    	 }else if(checkData == "1"){
		    		 $("#pw-check-tr").css("display","none");
		    		 $("#pw-edit-btn").css("display","none");
		    		 $("#update-pw").removeClass('readonly-input');
		    		 $("#update-pw").attr("readonly",false);
		    		 $("#update-pw").val("");
		    	 }
		      }
		   });
	});
		
	//3.비밀번호
	$("#update-pw").keyup(function(){
		$("#pw-check-area").css("display","revert");
		pwcheckAccord = pwRegExp("#update-pw");
		console.log("pwcheckAccord : "+pwcheckAccord);
	});
		
	//4. 전화번호 입력
	$(".phone-number").keyup(function(){
		phoneNumber = $('.phone-number').eq(0).val() + ""+
		$('.phone-number').eq(1).val()+ ""+
		$('.phone-number').eq(2).val();
		telAccord = checkPhone(phoneNumber);
		$("#user_tel").val(phoneNumber);
		console.log("phoneNumber : "+$("#user_tel").val());
	});
	
	//6. 필수요소의 Accord가 함수가 true일 때 submit가능
	$("#update-submit1").click(function(){
		$("#user_tel").val(phoneNumber);
		console.log("phoneNumber : "+$("#user_tel").val());
		nameAccord = nameCheck();
		
		if(pwEditCheck == false){ //1. 비밀번호 변경없이 이름 및 전화번호만 수정
			if(nameAccord != true){
				alert("이름 또는 닉네임을 입력해 주세요.");
				return false;
			}else if(!checkPhone(phoneNumber)){
				if(confirm("전화번호가 올바르지 않습니다. 그래도 입력하시겠습니까?")){
					$("#update-form").attr({
						"method":"post",
						"action":"/mypage/update"
					});
					$("#update-form").submit();
				}else
					return false;
			}else{
				$("#update-form").attr({
						"method":"post",
						"action":"/mypage/update"
					});
					$("#update-form").submit();
			}
		}else{ //2. 비밀번호 수정 포함 수정
		if(pwcheckAccord != true){
			alert("비밀번호를 확인해 주세요.");
			return false;
		}else if(nameAccord != true){
			alert("이름 또는 닉네임을 입력해 주세요.");
			return false;
		}else if(!checkPhone(phoneNumber)){
			if(confirm("전화번호가 올바르지 않습니다. 그래도 입력하시겠습니까?")){
				$("#update-form").attr({
				"method":"post",
				"action":"/mypage/update"
				});
				$("#update-form").submit();
			}else
				return false;
		}else{
			$("#update-form").attr({
				"method":"post",
				"action":"/mypage/update"
			});
			$("#update-form").submit();
		}
	}
		
	});
	$("#update-submit2").click(function(){
		nameAccord = nameCheck();
		console.log("***************************************");
		console.log("4. telAccord : "+telAccord);
		console.log("5. nameAccord : "+nameAccord);
		console.log("***************************************");
		
		if(nameAccord != true){
			alert("이름 또는 닉네임을 입력해 주세요.");
			return false;
		}else{
			$("#update-form").attr({
				"method":"post",
				"action":"/mypage/update"
			});
			$("#update-form").submit();
		}
	});
	//7. 회원탈퇴 페이지 이동 전 비밀번호확인
	$("#origin-pw-check2").click(function(){
		$.ajax({
		      type : "POST",
		      url : "/checkPw",
		      data : {
		    	 "user_email" : $("#update-user-email").val(),
		         "user_pw" : $("#origin-pw2").val()
		      },
		      success : function(checkData){
		    	 if(checkData == "0"){
		    		 alert("비밀번호를 확인해 주세요.");
		    	 }else if(checkData == "1"){
					 $("#update-form").attr({
					"method":"post",
					"action":"/mypage/unregisterForm"
					});
					$("#update-form").submit();
		    	 }
		      }
		   });
	});
});
