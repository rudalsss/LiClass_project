<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="/resources/client/mypage/assets/js/updateForm.js"></script>
<link rel="stylesheet" href="/resources/client/mypage/assets/css/updateForm.css" />
<%-- 은아) 마이페이지 1-2. 내 회원정보 수정 --%>
<script>
	$(function(){
		/*회원정보수정 완료 후 성공/실패 alert 후 redirect*/
		if('${message}' != "" || '${url}' !=""){
			var message = "${message}" ;
			var url = '${url}';
			console.log("message : "+message ,"url" +url);
			alert(message);
			location.href=url; 
		}
	})
</script>
<div id="updateFrom" style="padding:100px;">
	<h4 class="center">회원 정보 수정</h4>
		<form id="update-form">
			<table class="update-table" id="information">
				<tr>
					<th>이메일</th>
					<td>
						<input type="text" class="update-input readonly-input" id="update-user-email" name="user_email" value="${loginUser.user_email}" readonly="readonly"/>
					</td>
				</tr>
		    		<c:if test="${loginUser.user_type eq 0}">
		    			<tr class="check-area">
							<th rowspan="3">비밀번호</th>
							<td>
								<input type="password" class="update-input readonly-input" id="update-pw" name="user_pw" value="${loginUser.user_pw}" readonly="readonly"/>
								<button type="button" class="btn" id="pw-edit-btn" >수정하기</button>
							</td>
						</tr>
						<tr class="check-area"  id= "pw-check-tr" style="display: none" >
							<td>
								<input type="password" class="update-input" id="origin-pw" placeholder="기존 비밀번호를 입력해주세요."/>
								<button type="button" class="btn" id="origin-pw-check" >확인</button>
							</td>
						</tr>
						<tr>
							<td colspan="3" id="pw-check-area"  style="display: none">
								<span id="pw-check-result"></span>
							</td>
						</tr>
					</c:if>
				<tr>
					<td colspan="3" id="pw-check-area"  style="display: none">
						<span id="pw-check-result"> </span>
					</td>
				</tr>
				<tr>
					<td colspan="3" id="pw-double-check-area"  style="display: none">
						<span id="pw-double-check-result"> </span>
					</td>
				</tr>
				<tr>
					<th>이름</th>
					<td><input type="text" class="update-input" id="user_name" name="user_name" value="${loginUser.user_name}" maxlength="12"/></td>
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
						<input type="hidden" id="user_tel" name="user_tel" />
						<input type="hidden" id="user_update" name="user_update" value="${loginUser.user_update }" />
						<input type="hidden" id="user_update" name="user_update" value="${loginUser.user_update }" />
						<input type="hidden" id="user_update" name="user_update" value="${loginUser.user_update }" />
					</td>
				</tr>
				<tr>
					<td colspan="3" id="tel-check-area" style="display: none">
						<span id="tel-check-result"> </span>
					</td>
				</tr>
			</table>
			<!-- -------------------------------------------------------------------------------- -->
			<div id="submit-div">
	         <c:choose>
	    		<c:when test="${loginUser.user_type eq 0}">
			        <button type="button" class="btn" id="update-submit1">수정완료</button>
	     			<a href="#pw-check-modal" rel="modal:open"><button type="button" class="btn" id="resign-submit">회원탈퇴</button></a>
	   			</c:when>
	   			<c:otherwise>
	   				<input type="hidden" name="user_pw" value="${loginUser.user_pw}">
			        <button type="button" class="btn" id="update-submit2">수정완료</button>
	   			</c:otherwise>
			</c:choose>
	        </div>
		</form>
		
		<!-- pw check modal start -->
		<div id="pw-check-modal" class="modal" style="position: initial; height:100px">
					<table>
				<tr class="check-area"  id= "pw-check-tr">
					<td>
						<input type="password" class="update-input" id="origin-pw2" placeholder="기존 비밀번호를 입력해주세요."/>
						<button type="button" class="btn" id="origin-pw-check2" >확인</button>
					</td>
				</tr>
				<tr class="check-area">
					<td colspan="3" id="pw-check-area">
						<span id="pw-check-result"></span>
					</td>
				</tr>
			</table>
		</div>
		<!-- pw check modal end -->
		
</div>		
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<!-- jQuery Modal -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
	