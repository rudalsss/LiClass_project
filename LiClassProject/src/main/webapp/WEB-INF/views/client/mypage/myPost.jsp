<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("replaceChar", "\n"); %>
<style>
	.headline-h4{
		color: #555;
	    font-size: 20px;
	    font-weight: 700;
	    line-height: 35px;
	    margin-bottom: 30px;
	}
	.post-title{
		font-size: 28px;
	}
	.pager .next>a:hover {
		background-color: #191919;
		border:#191919;
		color:white;
	}
	.post-meta{
		margin:0px;
	}
	.pager{
		margin:0px;
	}
	.button:hover{
		cursor: pointer;
	}
	
	.blog-grids {
    overflow: hidden;
    margin: 0 -15px;
}

.blog-grids .grid {
    background-color: #fff;
    width: calc(33.33% - 30px);
    float: left;
    padding: 15px;
    margin: 20px 15px 15px;
    border-radius: 10px;
    -webkit-box-shadow: 0 0 30px rgba(0, 0, 0, 0.1);
    box-shadow: 0 0 30px rgba(0, 0, 0, 0.1);
}

.entry-media img {
    border-radius: 10px;
    width: 100%;
    max-height: 188px;
}

.entry-body {
    padding: 27px 10px;
}

.entry-body .cat {
    font-family: "Poppins", sans-serif;
    font-size: 12px;
    font-weight: 600;
    color: #6220d9;
    text-transform: uppercase;
}

.entry-body h3 {
    font-size: 21px;
    font-weight: 600;
    line-height: 1.30em;
    margin: 3px 0 0.73em;
}

.entry-body h3 a {
    color: #41516a;
}

.entry-body h3 a:hover {
    color: #6220d9;
    text-decoration: none;
}

.entry-body p {
    margin-bottom: 2em;
    color: #90949a;
    line-height: 1.8em;
}

.read-more-date {
    position: relative;
}

.read-more-date a {
    font-family: "Poppins", sans-serif;
    font-size: 16px;
    font-size: 1.06667rem;
    font-weight: 600;
    color: #41516a;
    text-transform: uppercase;
}

.read-more-date .date {
    position: absolute;
    right: 0;
    color: #90949a;
}
</style>
<script>
$(function(){
	$("#floating-recent").click(function(){
		let recentCss = $("#recentDiv").css("visibility");
		console.log(recentCss);
		if(recentCss == "hidden"){
			$("#recentDiv").css("visibility","visible");
		}else{
			$("#recentDiv").css("visibility","hidden");
		}
	});

	 //최근 본 클래스 삭제
	$("#recent-del").click(function(){
		localStorage.removeItem("classNo");
		alert("최근 본 클래스가 삭제되었습니다.");
		location.reload()
	});
});
</script>
<!-- Theme CSS -->
<link href="/resources/client/mypage/mypost/css/clean-blog.css" rel="stylesheet">
<!-- Custom Fonts -->
<link href="/resources/client/mypage/mypost/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href='https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
     <div class="container">
        <div class="row">
       	 	<h2 class="post-title text-center" style="margin: 50px 0px;">
               My Post
            </h2>
           	<div class="col col-xs-12">
                <div class="blog-grids" >
             		 <c:choose>
                    	<c:when test="${ not empty myPostList }">
                    	<ul class="pager">
		                    <li class="next">
		                        <a href="/mypage/posting" class="button myAnswer">클래스 일지 작성하기</a>
		                    </li>
		                </ul>
                       	<c:forEach var="postVO" items="${myPostList}" varStatus="status">
		                   <div class="grid" style="padding:0px;">
		                        <div class="entry-media">
		                            <img src="/uploadLiClass/post/${postVO.post_img}" width="330px" height="188px" alt="" style="border-radius: 0px;">
		                        </div>
		                        <div class="entry-body" style="height: 300px;">
		                            <span class="cat" style="color:#555;">${postVO.post_regdate}</span>
		                             <a href="/updatePostingForm?post_no=${postVO.post_no}"><i class="fa-regular fa-pen-to-square" style="font-size: 14px;"></i></a>
		                            <h3>${postVO.post_title}</h3>
		                            <p>
		                            	<c:if test="${fn:length(postVO.post_content) > 100}">
											${fn:substring(postVO.post_content, 0, 99)}...
										</c:if>
										<c:if test="${fn:length(postVO.post_content) < 101}">
											${likedClass.c_title}
											${fn:replace(postVO.post_content, replaceChar, "<br/>")}
										</c:if>
		                            </p>
		                           	
		                        </div>
		                         
		                    </div>
		                  </c:forEach>
		                </c:when>
		                 <c:otherwise>
					        <div class="services-content">
					          <h5> <i class="fa-solid fa-circle-question"></i> ${loginUser.user_name}님의 클래스일지를 남겨주세요.</h5>
					        </div>
					        <ul class="pager">
			                    <li class="next">
			                        <a href="/mypage/posting" class="button myAnswer">클래스 일지 작성하기</a>
			                    </li>
			                </ul>
			             </c:otherwise>
		             </c:choose>
                </div>
            </div>
        </div>
    </div>
    <hr>
    <!-- Contact Form JavaScript -->
    <script src="/resources/client/mypage/mypost/js/jqBootstrapValidation.js"></script>
    <script src="/resources/client/mypage/mypost/js/contact_me.js"></script>
    <!-- Theme JavaScript -->
    <script src="/resources/client/mypage/mypost/js/clean-blog.min.js"></script>
