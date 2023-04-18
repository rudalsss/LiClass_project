<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>

<script type="text/javascript">
    $(function(){

        /* 저장 버튼 클릭 시 처리 이벤트 */
        $("#qnaBoardInsertBtn").click(function(){

            if(!chkData("#qna_title", "제목을")) return;
            else if(!chkData("#qna_content", "본문을")) return;
            $("#updateForm").attr({
                "method" : "post",
                "action" : "/management/noticeboard/noticeUpdate"
            });
            $("#updateForm").submit();
        })

        /* 뒤로가기 버튼 클릭 시 처리 이벤트 */
        $("#qnaBoardListBtn").click(function(){
            location.href="/management/noticeboard/noticeBoard";
        });
    });
    function topStateCheck(state){
        var checked = state.checked;
        if(checked){
            state.value = "Y";
            console.log(state.value);
        } else{
            state.value = "N";
            console.log(state.value);
        }
        return state;
    };
</script>
<div class="container">
    <div class="text-center">
        <h1 class="mt-4">공지사항 작성</h1>
        <hr/>

        <form class="form-horizontal" id="updateForm">
            <input type="hidden" id="qna_no" name="qna_no" value="${updateData.qna_no}">
            <div class="input-group mb-3 " >
                <span class="input-group-text" id="inputGroup-sizing-default">제목</span>
                <input type="text" id="qna_title" name="qna_title" class="form-control" aria-label="Recipient's username" aria-describedby="inputGroup-sizing-default" aria-describedby="button-addon2" value="${updateData.qna_title}">
                <input type="checkbox" class="btn-check" id="qna_top_state_checked" name="qna_top_state_checked" autocomplete="off" onchange="topStateCheck(this)">
                <label class="btn btn-outline-primary" for="qna_top_state_checked">상단고정</label>
            </div>
            <div class="input-group mb-3">
                <span class="input-group-text" id="areaGroup-sizing-default">내용</span>
                <textarea class="form-control" id="qna_content" name="qna_content" aria-label="Sizing example input" aria-describedby="areaGroup-sizing-default" rows="8">${updateData.qna_content}</textarea>
            </div>
        </form>
    </div>
    <div class="d-grid gap-2 d-md-flex justify-content-md-end">
        <button class="btn btn-success me-md-2" type="button" id="qnaBoardInsertBtn">등록하기</button>
        <button class="btn btn-secondary" type="button" id="qnaBoardListBtn">뒤로가기</button>
    </div>
</div>