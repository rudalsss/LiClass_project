<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 은아) 비밀번호찾기화면--%>	
    <script>
	/*임시비밀번호 발급 성공/실패 alert 후 redirect*/
	if('${message}' != "" || '${url}' !=""){
		var message = "${message}";
		var url = '${url}';
		console.log("message : "+message ,"url" +url);
		alert(message);
		location.href=url; 
	}
	</script>
		<style>
			/*findPw */
			#findPw-form{
				width: 60%;
   				margin: 70px auto 200px;
			}
			.findPw-table{
				margin:20px 10px;
				width:100%;
				border-top:1px solid black;
				border-collapse: collapse;
			}
			tr{
				border-bottom: 0.8px solid #DDDDDD;
			}
			th{
				color:black;
				padding: 10px;
				width:40%;
				height:40px;
				text-align: center;
				font-weight: normal;
			}
			td{
				margin:10px;
				padding: 10px;
				width:100%;
			}
			#findPw-submit{
				margin: 0px auto;
   				display: flex;
   				width: 150px;
			    height: 50px;
			    justify-content: center;
			    align-items: center;
			}
			.findPw-input{
				padding:10px;
				width: 270px;
				height:50px;
				background-color: #F8F8F8;
				font-size: 10px;
			}
		  	p{
		  		text-align: center;
  				margin: 10px;
		  	}
			.center{
				margin: 10px;
				text-align: center;
			}
			.point{
				color:#F08282;
				margin:0px 5px;
				text-align: right;
			}
			.btn{
				margin:0px 20px;
			}
			.check-area{
				border:none;
			}
			.red{
				color: salmon;
			}
		</style>
		<script>
			//이메일 정규식
			function emailRegExp() {
				const regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
				if(!regExp.test($("#find-email").val())){
					return false;
				}
				return true;
			}
			$(function(){
				var emailAccord = false;
				
				$("#find-email").keydown(function(){
					$("#find-email-check-area").css("display","revert");
					
					emailAccord = emailRegExp();
					console.log(" emailAccord : "+emailAccord);
					if(emailAccord != true){
						$("#find-email-check-result").addClass('red');
						$("#find-email-check-result").text("올바른 이메일을 입력해주세요.");
					}else{
						$("#find-email-check-result").removeClass('red');
						$("#find-email-check-result").text("");
					}
				});
				
				$("#findPw-submit").click(function(){
					if(!emailRegExp()){
						alert("이메일 주소를 확인해주세요.");
						return false;
					}else{
						$.ajax({
				            type: 'post',
				            url: '/findEmail',
				            data: {
				                'email': $("#find-email").val()
				            },
				            dataType: "text",
				            success: function (result) {
				                if(result == "duplication"){
									$("#find-email-check-result").text("입력하신 이메일 주소로 임시 비밀번호가 전송됩니다.확인버튼을 눌러주세요.");
				                	$("#findPw-submit").css("background-color","dimgray");
									$("#findPw-form").attr({
										"method":"post",
										"action":"/findPw"
									});
									$("#findPw-form").submit();
				                }else{
									$("#find-email-check-result").addClass('red');
									$("#find-email-check-result").text("가입되지 않은 이메일입니다.");
				                }

				            },error: function () {
				                console.log('ajax error');
				            }
				        })
					}
				});
				
				
			});
		</script>
		<title> 비밀번호찾기- findPw.jsp</title>
	</head>
	<body>
		<hr>
		
		<h4 class="center">비밀번호 찾기</h4>
			<form id="findPw-form">
				<table class="findPw-table" id="information">
					<tr>
						<th>가입한 이메일 주소</th>
						<td>
							<input type="email" class="findPw-input" id="find-email" name="user_email" />
						</td>
					</tr>
					<tr class="check-area">
						<td colspan="2" id="find-email-check-area"  style="display: none">
							<i class="fa-solid fa-circle-exclamation"></i><span>메일이 오지 않는다면 스팸메일함을 확인해 주세요.메일링 서비스에 따라 스팸메일로 분류될 수 있습니다.</span>
							<p id="find-email-check-result"> </p>
						</td>
					</tr>
					<tr class="check-area"  id="find-email-send-area" style="display: none">
						<td colspan="2">
							<p></p>
						</td>
					</tr>
				</table>
				<div >
		        	<button type="button" class="btn" id="findPw-submit">확인</button>
		        </div>
			</form>
	</body>
</html>