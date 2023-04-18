<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="/resources/client/mypage/assets/css/myProfileImg.css" />
<script src="/resources/client/mypage/assets/js/myProfileImg.js"></script>
<%-- 은아) 마이페이지 1. 나의 회원정보--%>	
<style>
	.tdfont{ font-size : 20px;}
 
    .logintable tr{    
    	border-collapse: separate;
    	border-spacing: 0 10px;
    	height: 70px;
    	text-align: center;
    	}
    .main-white-button.col a{ 
    	border: 1px solid #999;
    	margin-top : 30px;
    }
</style>

<div>
	<div>
		<h4 class="subtitle-head">프로필 정보</h4>
		<hr style="border: 1px solid black;  margin: 40px 0;">
	</div>
	
	<table style="width: 100%;">
	<tr>
		<td  class="img-box-sm">
			<c:if test="${loginUser.user_img != ''}">
   			<c:choose>
     			<c:when test="${loginUser.user_type eq 0}">
      				<div class="profile-img" style="height:100px;">
						<img class="icon2" src="/uploadLiClass/user/${loginUser.user_img}" alt="profile" style="border: 1px solid #999;">
					</div>
    			</c:when>
    			
	    		<c:otherwise>
	      			<div class="profile-img" style="height:100px;"><img class="icon2" src="${loginUser.user_img}" alt="profile"  style="border: 1px solid #999;"></div>
	    		</c:otherwise>
   			</c:choose>
	  		</c:if>
			<c:if test="${loginUser.user_img == ''}">
	 			<div class="profile-img" style="height:100px;"><img class="icon2" src="/uploadLiClass/user/default-profile.png" alt="profile" style="border: 1px solid #999;"/></div>
			</c:if>
			<c:if test="${loginUser.user_type eq 0}">
				<div class="hover-content2">
           			<a href="#img-edit" rel="modal:open"><i class="fa-solid fa-pen-to-square" id="profile-edit" style="color: #555;"></i></a>
           		</div>
  			</c:if>
		</td>
		<td style="padding-left : 40px;"><h5>${loginUser.user_name}</h5></td>
	</tr>
	
	</table>

	<div style="margin-top : 70px;">
	<h6 class="subtitle-head">로그인 정보</h6>
	<hr style="border: 1px solid black;">
	</div>
	
	<table  style="width: 100%;" class = "logintable">
	
	
	<tr>
		<td><i class="fa-solid fa-record-vinyl fa-2x"></i></td>
		<td><span class = "tdfont"> <fmt:formatNumber value="${loginUser.user_point}" pattern="#,###"/>  point</span></td>
	</tr>
	
	<tr>
		<td><i class="fa-solid fa-envelope fa-2x"></i></td>
		<td><span class = "tdfont">${loginUser.user_email}</span></td>
	</tr>
	
	<tr>
		<td><i class="fa-solid fa-phone fa-2x" data-tel="${loginUser.user_tel}"></i></td>
		<td><span id="user_tel" class = "tdfont" ></span></td>
	</tr>
	
	</table>
	<div class = "container">
		<div class = "row" style="width: 80%;">
			<div class = "main-white-button col">
				<span><a href="/mypage/updateForm" id="edit-btn" style="width: 100%; text-align: center;"><i class="fa-regular fa-user"></i>수정하기</a></span>
			</div>
			
			<div class="main-white-button col">
				<span><a href="/courseHistory" style="width: 100%; text-align: center;"><i class="fa-solid fa-money-check"></i>수강내역</a></span>
      		</div>
			
		</div>
	
	</div>

	<!-- profile img edit modal start -->
	
	<div id="img-edit" class="filebox preview-image modal" style="height: 150px; z-index: 2; position: initial; text-align: center;">
		
		<form id="img-update-form">
			<label for="input-file" >
            	<a class="main-white-button" style="color : #555; margin: 0;"><i class="fa-regular fa-image"></i>사진선택</a>
			</label>
			<input type="file" class="upload-hidden" id="input-file" name="file" accept="image/png, image/jpeg"  style="display: none;">
        </form>
                      		
        <a class="btn" id="update-img" ><i class="fa-solid fa-repeat" style="margin:1px;"></i>변경</a>
        <a class="btn" id="delete-img" ><i class="fa-regular fa-user" style="margin:1px;"></i>기본이미지로 변경</a>
        <a class="btn" id="cancel" rel="modal:close"><i class="fa-solid fa-xmark" style="margin:1px;"></i>취소</a>
</div>
	<!-- profile img edit modal end -->
</div>

<div class="col-lg-7 align-self-center" id="pw-check-div" style="display: none" >
	<div class="right-text"></div>
</div>    		     	                     	                     		                  