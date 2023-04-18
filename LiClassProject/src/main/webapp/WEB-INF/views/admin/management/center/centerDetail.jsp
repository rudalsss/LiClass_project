<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
	
	<script type="text/javascript">
		
		$(function(){
			

			/* 수정 버튼 클릭 시 처리 이벤트 */
			$("#updateFormBtn").click(function(){
					goUrl = "/management/center/updateForm";
					$("#f_data").attr("action",goUrl);
					$("#f_data").submit();
			});
			
			/* 삭제 버튼 클릭 시 처리 이벤트 */
			$("#boardDeleteBtn").click(function(){
					if(confirm("정말 삭제하시겠습니까?")){
						goUrl = "/management/center/centerDelete";
						$("#f_data").attr("action",goUrl);
						$("#f_data").submit();
					}
			});
			
			
			/* 글쓰기 버튼 클릭 시 처리 이벤트 */
			$("#insertFormBtn").click(function(){
				location.href = "/management/center/writeForm";
			});
			
			/* 목록 버튼 클릭 시 처리 이벤트 */
			$("#boardListBtn").click(function(){
				location.href="/management/center/centerList";
			});
			
		});
	
	</script>



	</head>
	<body>
		<div class="contentContainer container">
			<!-- <div class="contentTit page-header"><h3 class="text-center">게시판 상세보기</h3></div>  -->
			
			 <form name="f_data" id="f_data" method="post">
				<input type="hidden" name="ct_bizno" value="${detail.ct_bizno}"/>
			</form>
			
			<%-- ========= 버튼 추가 시작 ====== --%>
			<div id="boardPwdBut" class="row text-center">
				
				<div class="btnArea col-md-4 text-right">
					<input type="button" value="글수정" id="updateFormBtn" class="btn btn-success" />
					<input type="button" value="글삭제" id="boardDeleteBtn" class="btn btn-success" />
					<input type="button" value="글쓰기" id="insertFormBtn" class="btn btn-success" />
					<input type="button" value="목록" id="boardListBtn" class="btn btn-success" />
				</div>
			</div> 
			<%--========= 버튼 추가 종료 ========= --%>
	
			<%-- =============== 상세 정보 보여주기 시작 ============ --%>
			<div class="contentTB text-center">
				<table class="table table-bordered">
					<tbody>
						<tr>
							<td class="col-md-2">사업자등록번호</td>
							<td class="">${detail.ct_bizno}</td>
							
							<td class="col-md-2">센터명</td>
							<td class="">${detail.ct_name}</td>
							
							<td class="col-md-2">센터개업년월</td>
							<td class="">${detail.ct_opbiz_ym}</td>
						</tr>
						
						<tr>
							<td class="col-md-2">센터 소개</td>
							<td class="" colspan="2">${detail.ct_intro}</td>
							
							<td class="col-md-2">센터 주요작품</td>
							<td class="" colspan="2">${detail.ct_mainart}</td>
							
						</tr>
						
						<tr>
							<td class="col-md-2">센터 우편번호</td>
							<td class="">${detail.ct_zipno}</td>
							
							<td class="col-md-2">센터 주소</td>
							<td class="">${detail.ct_addr}</td>
							
							<td class="col-md-2">센터 상세주소</td>
							<td class="">${detail.ct_detail_addr}</td>
						</tr>
						
						<tr>
							<td class="col-md-2">센터 대표전화</td>
							<td class="">${detail.ct_tel}</td>
							
							<td class="col-md-2">센터 홈페이지주소</td>
							<td class="">${detail.ct_hmpg_addr}</td>
							
							<td class="col-md-2">센터 등록일</td>
							<td class="col-md-2">${detail.ct_date}</td>
						</tr>
						
						
						
					</tbody>
				</table>
			</div>
			<%-- =============== 상세 정보 보여주기 종료 ============ --%>
			
		</div>
	</body>
</html>