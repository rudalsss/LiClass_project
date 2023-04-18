<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>

	<script type="text/javascript">
		$(function(){
			
			/* 저장 버튼 클릭시 처리 이벤트 */
			$("#boardInsertBtn").click(function(){
				//입력값 체크
				if(!chkData("#s_title","제목을"))return;
				else if(!chkData("#s_content","작성할 내용을"))return;
				else{
					if($("#file").val()!=""){
						if(!chkFile($("#file"))) return; //이미지 파일만 업로드 가능. 확장자가 png, jpg, gif 외 파일을 업로드 할 수 없습니다 라고 유효성 체크
					}
					
					$("#f_writeForm").attr({
						"method":"post",
						"enctype":"multipart/form-data", //enctype속성의 기본값은 "application/x-www-form-urlcencoded". POST 방식 폼 전송에 기본 값으로 사용
						"action":"/management/studio/studioInsert"
					});
					$("#f_writeForm").submit();
				}
			});
			
			/* 취소 버튼 클릭시 처리 이벤트 */
			$("#boardCancelBtn").click(function(){
				$("#f_writeForm").each(function(){
					this.reset();
				});
			});
			
			/* 목록 버튼 클릭시 처리 이벤트 */
			$("#boardListBtn").click(function(){
				location.href="/management/studio/studioList";
			});
		}); //종료
	</script>
	
	</head>
	<body>
		<div class="contentContainer container">
			<div class="contentTB text-center">
				<form id="f_writeForm" name="f-writeForm" class="form-horizontal">
					<table class="table table-bordered">
						<colgroup>
							<col width="20%" />
							<col width="80%" />
						</colgroup>
						<tbody>
							<tr>
								<td>센터명</td>
								<td class="text-left">
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
								<td class="text-left"><input type="text" name="s_title" id="s_title" class="form-control" /></td>
							</tr>
							<tr>
								<td>글내용</td>
								<td class="text-left"><textarea name="s_content" id="s_content" class="form-control" rows="8"></textarea></td>
							</tr>
							<tr>
								<td>이미지파일첨부</td>
								<td class="text-left"><input type="file" name="file" id="file" /></td>
							</tr>
						</tbody>
					</table>
					
					<div class="text-right">
						<input type="button" value="저장" id="boardInsertBtn" class="btn btn-success"/>
						<input type="button" value="취소" id="boardCancelBtn" class="btn btn-success"/>
						<input type="button" value="목록" id="boardListBtn" class="btn btn-success"/>
					</div>
				</form>
			
			</div>
		</div>
	</body> 
</html>