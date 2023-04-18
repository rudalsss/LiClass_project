package com.liclass.admin.management.qnaboard.vo;

import com.liclass.common.vo.CommonVO;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class QnaBoardVo  extends CommonVO {
    private int qna_no = 0; //공지, 문의게시판 글번호
    private int admin_no = 0; //관리자 번호
    private long user_no = 0; //유저 번호
    private String user_name=""; //유저 이름
    private String admin_name=""; //관리자 이름
    private String qna_title = ""; //공지, 문의게시판 제목
    private String qna_content = ""; //공지, 문의게시판 내용
    private String qna_date = ""; //공지, 문의게시판 등록일
    private String qna_date_fix = ""; //공지, 문의게시판 수정일
    private String qna_category = ""; //공지, 문의게시판 카테고리
    private int qna_top_state = 0; //공지, 문의게시판 구분 및 공지사항 상단 고정 상태값
    private int qna_group = 0; // 문의게시판 답변 그룹번호
    private int qna_indent = 0; //문의게시판 답변글의 위치번호
    private int qna_step = 0; //문의게시판 답변글의 계층번호
}
