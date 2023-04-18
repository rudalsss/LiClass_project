/*은아*/
/*signupForm*/
/****************** 함수 ********************/
//1. 이메일 정규식
function emailRegExp() {
	const regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	if(!regExp.test($("#signup-email").val())){
		alert("올바른 이메일을 입력해 주세요.");
		return false;
	}
	return true;
}

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
	const regExp =/^(?:(010-\d{4})|(01[1|6|7|8|9]-\d{3,4}))-(\d{4})$/;
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

//5. 약관동의
function checkAgree(){
	if(!$("#check-terms").is(":checked")){
		alert("이용약관동의를 확인해 주세요.");
		return false;
	}else if(!$("#check-privacy").is(":checked")){
		alert("개인정보동의를 확인해 주세요.");
		return false;
	}else{
		return true;
	}
}

/*****************************************************/
	
/******************$(function(){})********************/
$(function(){
	
	var key;
	var emailAccord = false;
	var pwcheckAccord = false;
	var pwDoublecheckAccord = false;
	var telAccord = false;
	var nameAccord = false;
	var agreeAccord = false;
	
	//1. 이메일인증 버튼 클릭 
	$("#email-check").click(function(){
		if(!emailRegExp()){
			$("#signup-email").focus();
			return false;
		}else{
			$.ajax({
			      type : "POST",
			      url : "/mailCertify",
			      data : {
			         "email" : $("#signup-email").val()
			      },
			      success : function(authoKey){
			    	 if(authoKey == "duplication"){
			    		 alert("이미 가입된 이메일 입니다.");
			    		 $("#signup-email").val("");
			    	 }else if(authoKey == "error"){
			    		 alert("이메일 주소를 확인해 주세요");
			    		 $("#signup-email").val("");
			    	 }else{
			    		 key = authoKey;
			    		 console.log("*** key *** :  "+key);
				         alert("해당 이메일로 인증번호 발송이 완료되었습니다. \n 확인부탁드립니다.")
				         $("#email-check-area").css("display","revert");
				         $("#email-check").css("background-color","dimgray");
			    	 }
			      }
			   });
		}
	});
	
	//2. 인증번호 확인 버튼 클릭
	$("#email-check-ok").click(function(){
		$("#key-check-area").css("display","revert");
		if (key != $("#key-input").val()) {
			$("#key-check-result").addClass('red');
			$("#key-check-result").html("인증번호를 확인해 주세요.");
		} else {
			$("#key-check-result").removeClass('red');
			$("#key-check-result").html("<b>인증번호가 일치합니다. 회원가입을 계속 진행해 주세요.</b>")
			$("#email-check-ok").css("background-color","dimgray");
			emailAccord = true;
			console.log("1. emailAccord : "+emailAccord);
		}
	});
	
	//3. 비밀번호
	$("#signup-pw").keyup(function(){
		$("#pw-check-area").css("display","revert");
		pwcheckAccord = pwRegExp("#signup-pw");
		console.log("2. pwcheckAccord : "+pwcheckAccord);
	});
	
	//3-1. 회원정보 수정 비밀번호
	$("#update-pw").keyup(function(){
		$("#pw-check-area").css("display","revert");
		pwcheckAccord = pwRegExp("#update-pw");
		console.log("pwcheckAccord : "+pwcheckAccord);
	});
		
	
	//4. 비밀번호 확인
	$("#pw-check").keyup(function(){
		$("#pw-double-check-area").css("display","revert");
		if($("#signup-pw").val() != $("#pw-check").val()){
			$("#pw-double-check-result").addClass('red');
			$("#pw-double-check-result").text("비밀번호가 일치하지않습니다.");
		}else{
			$("#pw-double-check-result").removeClass('red');
			$("#pw-double-check-result").text("비밀번호가 일치합니다.");
			pwDoublecheckAccord = true;
			console.log("3. pwDoublecheckAccord : "+pwDoublecheckAccord);
		}
	});
	
	//5. 전화번호 입력
	$(".phone-number").keyup(function(){
		phoneNumber = $('.phone-number').eq(0).val() + "-"+
		$('.phone-number').eq(1).val()+ "-"+
		$('.phone-number').eq(2).val();
		telAccord = checkPhone(phoneNumber);
		console.log("4. telAccord : "+telAccord);
	});
	
	//6. 전체약관동의 클릭시
	$("#check-all").click(function() {
		if($("#check-all").is(":checked")) 
			$("input[name=check-required]").prop("checked", true);
		else 
			$("input[name=check-required]").prop("checked", false);
	});
	
	//7. 필수요소의 Accord가 함수가 true일 때 submit가능
	$("#signup-submit").click(function(){
		
		nameAccord = nameCheck();
		agreeAccord = checkAgree();
		
		//최종 재확인
		if(key != $("#key-input").val()){
			alert("이메일 인증을 확인해 주세요.");
			return false;
		}else if(!pwRegExp("#signup-pw")){
			alert("비밀번호를 확인해 주세요.");
			return false;
		}else if($("#signup-pw").val() != $("#pw-check").val()){
			alert("비밀번호 확인을 확인해 주세요.");
			return false;
		}else if(nameAccord != true){
			alert("이름 또는 닉네임을 입력해 주세요.");
			return false;
		}else if(agreeAccord != true){
			alert("필수 약관동의를 확인해 주세요.");
			return false;
		}else{
			$("#signup-form").attr({
				"method":"post",
				"action":"/user/signup"
			});
			$("#signup-form").submit();
		}
	});
});
