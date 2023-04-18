<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<link rel="stylesheet" href="/resources/client/qnaBoard/css/css.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">

<script type="text/javascript">
    $(function(){
        $("#listBtn").click(function (){
            location.href="/client/qnaboard/qnaBoard";
        });

        $("#updateBtn").click(function(){
            if(!chkData("#qna_title", "제목을")) return;
            else if(!chkData("#qna_content", "본문을")) return;
            $("#updateForm").attr({
                "method" : "post",
                "action" : "/client/qnaboard/qnaBoardUpdate"
            });
            $("#updateForm").submit();
        })
    });


</script>
<div class="board_wrap">
    <div class="board_title">
        <strong>고객센터</strong>
        <p>공지사항을 빠르고 정확하게 안내해드립니다.</p>
    </div>
    <form class="form-horizontal" id="updateForm">
        <input type="hidden" id="qna_no" name="qna_no" value="${updateData.qna_no}">
        <input type="hidden" id="user_no" name="user_no" value="${updateData.user_no}">
            <div class="board_write_wrap">
                <div class="board_write">
                    <div class="title">
                        <dl>
                            <dt>제목</dt>
                            <dd><input type="text" id="qna_title" name="qna_title" value="${updateData.qna_title}"></dd>
                        </dl>
                    </div>
                    <div class="cont">
                        <textarea placeholder="내용 입력" id="qna_content" name="qna_content">${updateData.qna_content}</textarea>
                    </div>
                </div>
                <div class="bt_wrap">
                    <button type="button" class="on" id="updateBtn">등록</button>
                    <button type="button" class="on" id="listBtn">목록</button>
                </div>
            </div>
    </form>
</div>
</div>