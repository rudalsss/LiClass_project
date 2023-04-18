<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%-- 은아) 우측 플로팅 메뉴 --%>
<link rel="stylesheet" href="/resources/client/mainTheme/css/floatingNav.css" />
<style>
	.side-menu{
		margin:0px;
		padding:0px;
	}
</style>
<script type="text/javascript">
	/* 메인화면 floating nav */
	function isNull(obj){
		 if(obj == '' || obj == null || obj == undefined || obj == NaN){ 
		  return true;
		 }else{
		  return false;
		 }
	}
	
	$(function(){
		/* 로그인 */
		$("#floating-login").click(function(){
		       $("#login-pop-modal").attr("style", "display:block");
		   });
		  
	    $("#modal_close_btn").click(function(){
	       $("#login-pop-modal").attr("style", "display:none");
		 });
		    
		/* 최근 본 클래스 */
		//localStorage.clear();
		//localStorage.removeItem("classNo");
		//localStorage.removeItem("activePosition");
		//console.log("localStorage - classNo : "+localStorage.getItem("classNo"));
		console.log("activePosition : "+localStorage.getItem("activePosition"));

		/* 최근 본 클래스 */
	 	var imgArr = [];
		var recetClasses = JSON.parse(localStorage.getItem("classNo") || "[]");
		if (isNull(recetClasses)) {
			 $("#recentDiv").append('<span style="color:#555;">최근 본 클래스가 없습니다.</span>');
			 $(".recent-a").css("display","none");
		 }else{
			
			 var recentClasses3 = recetClasses.slice(-3);
			 //중복제거
				let uniqueArr = [];
				recentClasses3.forEach((element) => {
				    if (!uniqueArr.includes(element)) {
				        uniqueArr.push(element);
				    }
				});
 				console.log("uniqueArr : "+uniqueArr);
			 
			 for(i=0;i<uniqueArr.length;i++){
			 	var c_no = uniqueArr[i];
	 			if(typeof c_no != "undefined" && c_no != null && c_no != ""){
					var url = "http://localhost:8080/class/classDetail?c_no="+c_no;
	                $("#recentDiv").children("a:eq("+i+")").attr("href",url);
		 				$.ajax({
				            type: 'get',
				            url: '/class/getClassImg',
				            data: {
				                'c_no': c_no
				            }
				            ,dataType : 'text',
				            success: function (c_img_file) {
				                imgArr.push(c_img_file);
				                for(i=0;i<imgArr.length; i++){
			                	 $(".recent-img:eq("+i+")").css("display","grid");
			                	  $(".recent-img:eq("+i+")").attr("src","/uploadLiClass/class/"+imgArr[i]);
				                }
				            },error: function () {
				                console.log('ajax error');
				            }
				        })
		 			}
		 		}
		 	}
		
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
		 
	})

</script>
	<!-- 은아)플로팅메뉴  -->
	<!-- floating nav start -->
	<div id="floatMenu" style="z-index: 0;">
		<div class="section-block">
			<nav class="side-menu">
		        <ul>
		          <li class="hidden active">
		            <a class="page-scroll" href="#gotop"></a>
		          </li>
		          <li>
		            <a href="#gotop" class="page-scroll">
		              <span class="menu-title">맨 위로</span>
		              <span class="dot"></span>
		            </a>
		          </li>
		          
		          <li>
		          	   <c:if test="${loginUser == null}">
		          			  <a href="#gotop" id="floating-login" class="page-scroll">
				              <span class="menu-title">로그인</span>
				              <span class="dot"></span>
				            </a>
			           </c:if>
					          
			           <c:if test="${loginUser != null}">
				           	<a href="/mypage" class="page-scroll">
				              <span class="menu-title">마이페이지</span>
				              <span class="dot"></span>
				            </a>
			           </c:if>
		          </li>
		          <c:if test="${loginUser != null}">
		          <li>
		            <a href="/user/logout" class="page-scroll">
		              <span class="menu-title">로그아웃</span>
		              <span class="dot"></span>
		            </a>
		          </li>
		          </c:if>
		          <li>
		            <a id="floating-recent" class="page-scroll" >
		              <span class="menu-title">최근 본 클래스</span>
		              <span class="dot"></span>
		            </a>
		          </li>
		          <li id="recent-li">
			         <div id="recentDiv" style=" visibility: hidden; display: grid;">
				 		<a class="recent-a" id="first-a"><img class="recent-img" id="first-img" style="display: none;"></a>
				 		<a class="recent-a"  id="second-a" ><img class="recent-img" id="second-img" style="display: none;"></a>
				 		<a class="recent-a" id="third-a"><img class="recent-img" id="third-img" style="display: none;"></a>
				 		<a class="recent-a" id="recent-del"><i class="fa-solid fa-trash"></i></a>
				 	</div>
		          </li>
		            
		        </ul>
		      </nav>
		</div>
	</div>
	<!-- floating nav end -->