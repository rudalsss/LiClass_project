<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
	
	<script type="text/javascript">
		$(function(){
			/* 수정 버튼 클릭 시 처리 이벤트 */
			$("#boardUpdateBtn").click(function(){
				//입력값 체크
				if (!chkData("#s_title","제목을"))	 return;
				else if (!chkData("#s_content","작성할 내용을"))	return;
				else{
					if($("#file").val()!=""){
						if(!chkFile($("#file"))) return;
					}
					$("#f_updateForm").attr({
						"method":"post",
						"enctype":"multipart/form-data",
						"action":"/management/studio/studioUpdate"
					});
					$("#f_updateForm").submit();
				}
			});
			
			/* 취소 버튼 클릭 시 처리 이벤트 */
			$("#boardCancelBtn").click(function(){
				$("#f_updateForm").each(function(){
					this.reset();
				});
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
			<!-- <div class="contentTit page-header"><h3 class="text-center">게시판 글수정</h3></div> -->
				
			<div class="contentTB text-center">
				<form id="f_updateForm" name="f_updateForm">
					<input type="hidden" id="s_no" name="s_no" value="${updateData.s_no}" />
					<input type="hidden" id="s_file" name="s_file" value="${updateData.s_file}" />
					<input type="hidden" id="s_thumb" name="s_thumb" value="${updateData.s_thumb}" />
					
					<table class="table table-bordered">
						<tbody>
							<tr>
								<td class="col-md-3">글번호</td> 
								<td class="text-left col-md-3">${updateData.s_no}</td>
								<td class="col-md-3">작성일</td> 
								<td class="text-left col-md-3">${updateData.s_date}</td> 
							</tr>
							
							<tr>
								<td>센터명</td>
								<td class="text-left" colspan="3">
									<select id="ct_bizno" name="ct_bizno" class="form-control">	
										<c:forEach var="centerName" items="${centerNameList}">
											<option value="${centerName.ct_bizno}">
												${centerName.ct_name}
											</option>
										
										</c:forEach>
									
									</select>
								</td>
							</tr>
							
							<tr>
								<td>글제목</td>
								<td colspan="3" class="text-left">
									<input type="text" name="s_title" id="s_title" value="${updateData.s_title}" class="form-control" />
								</td>
							</tr>
							<tr class="table-tr-height">
								<td>글내용</td>
								<td colspan="3" class="text-left">
									<textarea name="s_content" id="s_content" class="form-control" rows="8">${updateData.s_content}</textarea>
								</td>
							</tr>
							<tr>
								<td>이미지파일첨부</td>
								<td colspan="3" class="text-left"><input type="file" name="file" id="file" /></td>
							</tr>
						</tbody>	
					</table>
				</form>
			</div>	
			
			<div class="contentBtn text-right">
				<input type="button" value="수정" id="boardUpdateBtn" class="btn btn-success" />
				<input type="button" value="취소" id="boardCancelBtn" class="btn btn-success" />				
				<input type="button" value="목록" id="boardListBtn" class="btn btn-success" />
			</div>
		</div>
		
	</body>
</html>