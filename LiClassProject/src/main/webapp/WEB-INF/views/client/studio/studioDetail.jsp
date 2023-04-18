<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ include file="/WEB-INF/views/client/studiocommon/common.jspf" %>
		
		<script type="text/javascript">
		
		$(function(){
			
			
			
			/* 목록 버튼 클릭 시 처리 이벤트 */
			$("#boardListBtn").click(function(){
				location.href="/studio/studioList"; 
			});
			
		});
	
	</script>
	
	<style>
		/* body{
		  font-family: 'Montserrat', sans-serif;
		  margin:0;
		}
		
		.container {
		  display: flex;
		  justify-content: center;
		  align-items: center;
		  align-content: center;
		  flex-wrap: wrap;
		  width: 80vw;
		  margin: 0 auto;
		  min-height: 100vh;
		} */
		.btn {
		  flex: 1 1 auto;
		  margin: 10px;
		  padding: 13px;
		  text-align: center;
		  text-transform: uppercase;
		  transition: 0.5s;
		  background-size: 200% auto;
		  color: white;
		 /* text-shadow: 0px 0px 10px rgba(0,0,0,0.2);*/
		  box-shadow: 0 0 20px #eee;
		  border-radius: 10px;
		  font-size: 13px;
		 }
		
		/* Demo Stuff End -> */
		
		/* <- Magic Stuff Start */
		
		.btn:hover {
		  background-position: right center; /* change the direction of the change here */
		}
		
		.btn-1 {
		  background-image: linear-gradient(to right, #f6d365 0%, #fda085 51%, #f6d365 100%);
		}
		.btn-2 {
		  background-image: linear-gradient(to right, #fbc2eb 0%, #a6c1ee 51%, #fbc2eb 100%);
		}
			
	</style>
		
	</head>
	<body>


	<!-- Main -->
		<div id="main" style="padding-top: 150px">
			<div class="inner">
						
				<form name="f_data" id="f_data" method="post">
					<input type="hidden" name="s_no" value="${detail.s_no}"/>
					<input type="hidden" name="s_file" value="${detail.s_file}"/>
					<input type="hidden" name="s_thumb" value="${detail.s_thumb}"/>
				</form> 
			
				<%-- ========= 버튼 추가 시작 ====== --%>
				<div id="boardPwdBut" class="text-right" style="margin-right: 100px;">
					
						<input type="button" value="목록" id="boardListBtn" class="btn btn-1" />
				
				</div> 
				<%--========= 버튼 추가 종료 ========= --%>
				<br/>
				<br/>

				<%-- =============== 상세 정보 보여주기 시작 ============ --%>
				<div style="text-align: center;">
					<h1>${detail.s_title}</h1>
							
					<h2>센터명: ${detail.ct_name}</h2>
					<span style="font-size:1.5em;">작성일 : ${detail.s_date}</span>
					<br/>
					<br/>
					
					<span class="image main" >
						<c:if test="${not empty detail.s_file}">
							<tr>
								<td class="col-md-1"></td>
								<td colspan="3" class="col-md-8 text-left">
								<img src="/uploadLiClass/studio/${detail.s_file}" 
								style="width: 700px; height: 500px;"/></td>
							</tr>
						</c:if>
					</span>
					<br/>
					<br/>
					<div style="white-space:pre-wrap; font-size:1.5em;" >${detail.s_content}</div>
					
					<br/>
					<br/>
					<a class="btn btn-2" href="/class/classList">클래스 구경하러가기</a>
				</div>			
			</div>
		</div>
					<%-- =============== 상세 정보 보여주기 종료 ============ --%>
					
	
	<!-- Scripts -->
			<!-- <script src="/resources/include/dist/studio/assets/js/jquery.min.js"></script> -->
			<!-- <script src="/resources/include/dist/studio/assets/js/browser.min.js"></script>
			<script src="/resources/include/dist/studio/assets/js/breakpoints.min.js"></script>
			<script src="/resources/include/dist/studio/assets/js/util.js"></script>
			<script src="/resources/include/dist/studio/assets/js/main.js"></script> -->
	</body>
</html>