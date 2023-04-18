<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>

	<script type="text/javascript">
		
		$(function(){
			

			/* 수정 버튼 클릭 시 처리 이벤트 */
			$("#updateFormBtn").click(function(){
					goUrl = "/management/studio/updateForm";
					$("#f_data").attr("action",goUrl);
					$("#f_data").submit();
			});
			
			/* 삭제 버튼 클릭 시 처리 이벤트 */
			$("#boardDeleteBtn").click(function(){
					if(confirm("정말 삭제하시겠습니까?")){
						goUrl = "/management/studio/studioDelete";
						$("#f_data").attr("action",goUrl);
						$("#f_data").submit();
					}
			});
			
			
			/* 글쓰기 버튼 클릭 시 처리 이벤트 */
			$("#insertFormBtn").click(function(){
				location.href = "/management/studio/writeForm";
			});
			
			/* 목록 버튼 클릭 시 처리 이벤트 */
			$("#boardListBtn").click(function(){
				location.href="/management/studio/studioList";
			});
			
		});
	
	</script>

	</head>
	<body>
		<div class="contentContainer container">
			<!-- <div class="contentTit page-header"><h3 class="text-center">게시판 상세보기</h3></div>  -->
			
			<form name="f_data" id="f_data" method="post">
				<input type="hidden" name="s_no" value="${detail.s_no}"/>
				<input type="hidden" name="s_file" value="${detail.s_file}"/>
				<input type="hidden" name="s_thumb" value="${detail.s_thumb}"/>
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
							<td class="col-md-1">작성일</td>
							<td class="col-md-3 text-left">${detail.s_date}</td>
						</tr>
						
						
						<tr>
							<td class="col-md-1">센터명</td>
							<td class="text-left">${detail.ct_name}</td>
						</tr>
						
						
						<tr>
							<td class="col-md-1">글제목</td>
							<td colspan="3" class="col-md-8 text-left">${detail.s_title}</td>
						</tr>
						<tr class="table-tr-height">
							<td class="col-md-1">글내용</td>
							<td colspan="3" class="col-md-8 text-left" style="white-space:pre-wrap;">${detail.s_content}</td>
						</tr>
						<c:if test="${not empty detail.s_file}">
						<tr>
							<td class="col-md-1">이미지</td>
							<td colspan="3" class="col-md-8 text-left">
							<img src="/uploadLiClass/studio/${detail.s_file}" style="width: 100%; height: auto;"/></td>
						</tr>
						</c:if>
					</tbody>
				</table>
			</div>
			<%-- =============== 상세 정보 보여주기 종료 ============ --%>
			
		</div>
	</body>
</html>