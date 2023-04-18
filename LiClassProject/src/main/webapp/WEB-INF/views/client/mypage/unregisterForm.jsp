<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 은아) 마이페이지 1-3. 회원탈퇴 --%>
 <script>
	/*은아)회원탈퇴 완료 후 성공/실패 alert 후 redirect*/
	if('${message}' != "" || '${url}' !=""){
		var message = "${message}" ;
		var url = '${url}';
		console.log("message : "+message ,"url" +url);
		alert(message);
		location.href=url; 
	}
</script>
	<style>
		.services-content .unreg-p{
			margin:10px auto;
			font-size: 16px;
		}
		#final-check-label{
			font-size: 16px;
			color: salmon;
		}
		#bottom{
			margin: 60px;
    		display: grid;
			justify-content: center;
			align-items: center;
		}
	</style>
	<script>
		$(function(){
			/*은아)회원탈퇴 클릭 시 동의체크 유효성검사   */
			$("#unregister-ok").click(function(){
				if(!$("#final-check").is(":checked")){
					alert("안내사항 동의를 확인해 주세요.");
					return false;
				}else{
					$("#unregister-form").attr({
						"method":"post",
						"action":"/unregister"
					});
					$("#unregister-form").submit();
				}
			});
		});
	</script>
<div id="unregisterForm" style="padding:70px;">
	<!-- unregisterForm start -->
	<section class="section services" style="padding: 50px;">
	  <div class="container-fluid">
	    <div>
	      <div>
	        <div class="services-content" style="color:#555;">
	        	<h5 class="text-center" style="margin-bottom: 50px;">
    				<b>회원 탈퇴 안내</b>
    			</h5>
    			<h5 style="margin-bottom: 30px;">
    				<i class="fa-solid fa-face-sad-tear"></i> "${loginUser.user_name}"이 탈퇴하신다니 아쉬워요, 회원탈퇴를 신청하기 전에 안내 사항을 꼭 확인해주세요.
    			</h5>
           		<p class="unreg-p"><i class="fa-solid fa-check"></i>사용하고 계신 이메일(<b>${loginUser.user_email }</b>)은 탈퇴할 경우 재사용 및 복구가 불가능합니다.</p>
           		<p class="unreg-p"><i class="fa-solid fa-check"></i>탈퇴한 이메일은 본인과 타인 모두 재사용 및 복구가 불가하오니 신중하게 선택하시기 바랍니다.</p>
           		<p class="unreg-p"><i class="fa-solid fa-check"></i>탈퇴 후 회원정보 및 개인형 서비스 이용기록은 모두 삭제되며, 삭제된 데이터는 복구되지 않습니다.</p>
           		<p class="unreg-p"><i class="fa-solid fa-check"></i>삭제되는 내용을 확인하시고 필요한 데이터는 미리 백업을 해주세요.</p>
           		
           		<div id="bottom">
	           		<label id="final-check-label">
	           			<input type="checkbox" id="final-check" name="agree" />
	           			<b>안내 사항을 모두 확인하였으며, 이에 동의합니다.</b>
	           		</label>
	           	
	           		<form id="unregister-form">
		        		<input type="hidden" name="user_email" value="${loginUser.user_email }" >
	           		</form>
	            	<button type="button" id= "unregister-ok" class ="btn">회원탈퇴</button>
            	</div>
	        </div>
	      </div>
	    </div>
	  </div>
	</section>
	<!-- unregisterForm end -->
</div>