<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
<link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap-theme.min.css">
<script type="text/javascript">
    $(function(){
        /* 저장 버튼 클릭 시 처리 이벤트 */
        $("#answerInsertBtn").click(function(){

            if(!chkData("#qna_title", "제목을")) return;
            else if(!chkData("#qna_content", "본문을")) return;
            $("#writeForm").attr({
                "method" : "post",
                "action" : "/management/qnaboard/answerUpdate"
            });
            $("#writeForm").submit();
        })

        /* 뒤로가기 버튼 클릭 시 처리 이벤트 */
        $("#qnaBoardListBtn").click(function(){
            location.href="/management/qnaboard/qnaBoard";
        });
    });
</script>

<div class="contentContainer container">
    <h2>본문글</h2>
    <hr/>
    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-default">
                <div class="panel-heading clearfix">
                    <h3 class="panel-title pull-left" style="line-height: 2.5;"><strong>[${detail.qna_category}]</strong>&nbsp;${detail.qna_title}</h3>
                </div>
                <div class="panel-body">
                    <c:choose>
                        <c:when test="${detail.qna_category == '답변'}">
                            <p><strong>작성자</strong>&nbsp;:&nbsp;${detail.admin_name}</p>
                        </c:when>
                        <c:otherwise>
                            <p><strong>작성자</strong>&nbsp;:&nbsp;${detail.user_name}</p>
                        </c:otherwise>
                    </c:choose>
                    <p><strong>작성일</strong>&nbsp;:&nbsp;${detail.qna_date}
                    <hr>
                    <div id="collapse2" class="panel-collapse collapse in">
                        <div class="panel-body">
                            <p>${detail.qna_content}</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<div class="container">
    <h2>답변 작성</h2>
    <hr/>
    <form class="form-horizontal" id="writeForm">
        <input type="hidden" id="qna_no" name="qna_no" value="${updateData.qna_no}">
        <input type="hidden" id="user_no" name="user_no" value="${updateData.user_no}">

        <div class="form-group">
            <label for="title">제목:</label>
            <input type="text" id="qna_title" name="qna_title" class="form-control" id="title" placeholder="제목을 입력하세요" value="${updateData.qna_title}">
        </div>
        <div class="form-group">
            <label for="content">본문:</label>
            <textarea class="form-control" id="qna_content" name="qna_content" rows="8" id="content">${updateData.qna_content}</textarea>
        </div>
        <div class="text-right">
            <button type="button" class="btn btn-primary" id="answerInsertBtn">등록</button>
            <button class="btn btn-secondary" type="button" id="qnaBoardListBtn">뒤로가기</button>
        </div>
    </form>
</div>