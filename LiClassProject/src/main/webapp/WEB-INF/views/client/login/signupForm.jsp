<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="/resources/client/login/js/signupForm.js"></script>
<%-- 은아) 회원가입화면 --%>	
<script>
	/*회원가입 완료 후 성공/실패 alert 후 redirect*/
	if('${message}' != "" || '${url}' !=""){
		var message = "${message}" ;
		var url = '${url}';
		console.log("message : "+message ,"url" +url);
		alert(message);
		location.href=url; 
	}
</script>
<style>
	/*signupForm*/
	#signup-form{
		width: 60%;
		margin: 20px auto;
	}
	.signup-table{
		margin:10px;
		width:100%;
		border-top:1px solid black;
		border-collapse: collapse;
	}
	tr{
		border-bottom: 0.8px solid #DDDDDD;
	}
	th{
		color:black;
		/* background-color: #F8F8F8; */
		padding: 10px;
		width:20%;
		height:40px;
		text-align: left;
		font-weight: normal;
	}
	
	td{
		margin:10px;
		padding: 10px;
		width:100%;
	}
	
	#signup-submit{
		margin: 0px auto;
					display: flex;
					width: 150px;
	    height: 50px;
	    justify-content: center;
	    align-items: center;
	    font-size:12px;
	}
			
	.signup-input{
		padding:10px;
		width: 270px;
		height:50px;
		background-color: #F8F8F8;
		font-size: 10px;
	}
		
	p{
		margin: 10px;
	}
	 
	.center{
		text-align: center;
	}
	.point{
		color:#F08282;
		margin:0px 5px;
		text-align: right;
	}
	.btn{
		margin:0px 20px;
		width: 100px;
		height: 45px;
		font-size: 10px;
	}
	.phone-number, select{
		width:87px;
		height:50px;
		border:0.5px solid grey;
		text-align: center;
		font-size: 15px;
		background-color: #F8F8F8;
	}
	.blocker{
    background-color: rgb(0 0 0 / 19%);
	}
	.modal a.close-modal{
		top: 20px;
		left: 90%;
	}
	
	a{
		color:black;
	}
	
	.check-area{
		border:none;
	}
	.red{
		color:#e016169c;
	}
	
</style>
<hr>
<h3 class="center">회원 가입</h3>
	<form id="signup-form">
		<p class="text-right"><span class="point">*</span>는 필수항목입니다.</p>
		<table class="signup-table" id="information">
			<tr>
				<th>이메일<span class="point">*</span></th>
				<td>
					<input type="text" class="signup-input" id="signup-email" name="user_email" />
					<button type="button" class="btn" id="email-check">이메일 인증</button>
				</td>
			</tr>
			<tr class="check-area" id="email-check-area" style="display: none;">
				<th rowspan="2">인증번호<span class="point">*</span></th>
				<td>
					<input type="text" class="signup-input " id="key-input"/>
					<button type="button" class="btn" id="email-check-ok" >확인</button><br/><br/>
					<i class="fa-solid fa-circle-exclamation"></i><span>인증 메일이 오지 않는다면 스팸메일함을 확인해 주세요.<br/>메일링 서비스에 따라 스팸메일로 분류될 수 있습니다.</span>
				</td>
			</tr>
			<tr>
				<td colspan="3" id="key-check-area"  style="display: none">
					<span id="key-check-result"> </span>
				</td>
			</tr>
			<tr class="check-area">
				<th rowspan="2">비밀번호<span class="point">*</span></th>
				<td><input type="password" class="signup-input" id="signup-pw" name="user_pw" placeholder="영문자,숫자,특수 문자로 조합된 최소 8자" /></td>
				<td></td>
			</tr>
			<tr>
				<td colspan="3" id="pw-check-area"  style="display: none">
					<span id="pw-check-result"> </span>
				</td>
			</tr>
			<tr class="check-area">
				<th rowspan="2" >비밀번호 확인<span class="point">*</span></th>
				<td><input type="password" class="signup-input" id="pw-check" /></td>
				<td></td>
			</tr>
			<tr>
				<td colspan="3" id="pw-double-check-area"  style="display: none">
					<span id="pw-double-check-result"> </span>
				</td>
			</tr>
			<tr>
				<th>이름<span class="point">*</span></th>
				<td><input type="text" class="signup-input" id="user_name" name="user_name" placeholder="12자이하의 이름/닉네임을 입력해주세요." maxlength="12"/></td>
				<td>
					<span class="check-area" id="user_name-check-area"> </span>
				</td>
			</tr>
			<tr class="check-area">
				<th rowspan="2">전화번호</th>
				<td>
					<select class="phone-number" id="phone1" name="phone1">
						<optgroup label="휴대전화">
							<option value="010">010</option>
							<option value="011">011</option>
							<option value="016">016</option>
							<option value="017">017</option>
							<option value="018">018</option>
						</optgroup>
						<optgroup label="유선전화">
							<option value="02">02</option>
							<option value="031">031</option>
							<option value="032">032</option>
							<option value="033">033</option>
							<option value="041">041</option>
							<option value="042">042</option>
							<option value="043">043</option>
							<option value="044">044</option>
							<option value="051">051</option>
							<option value="051">052</option>
							<option value="053">053</option>
							<option value="054">054</option>
							<option value="055">055</option>
							<option value="061">061</option>
							<option value="062">062</option>
							<option value="063">063</option>
							<option value="064">064</option>
						</optgroup>
					</select>
					<input type="text" class="phone-number" id="phone2" name="phone2"/>
					<input type="text" class="phone-number" id="phone3" name="phone3"/>
				</td>
			</tr>
			<tr>
				<td colspan="3" id="tel-check-area" style="display: none">
					<span id="tel-check-result"> </span>
				</td>
			</tr>
		</table>
		<table class="signup-table" id="consent">
			<tr>
				<th colspan="2"><label><input type="checkbox" id="check-all" class="check-box" />전체약관에 모두 동의합니다. </label></th>
			</tr>
			<tr>
				<td colspan="2">
					<label>
						<input type="checkbox" name="check-required" id="check-terms" />
					  		[필수] 이용약관 동의
					</label>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<label>
						<input type="checkbox"  name="check-required" id="check-privacy"  />
					  		[필수] 개인정보 수집 및 이용 동의
					</label>
				</td>
			</tr>
		</table>
		<!-- -------------------------------------------------------------------------------- -->
		
		<div >
         <button type="button" class="btn" id="signup-submit">회원가입</button>
        </div>
	</form>
	<hr />		
