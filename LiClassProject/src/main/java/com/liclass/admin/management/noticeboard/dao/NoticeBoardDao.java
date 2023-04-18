package com.liclass.admin.management.noticeboard.dao;

import com.liclass.admin.management.qnaboard.vo.QnaBoardVo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface NoticeBoardDao {

    //공지게시판 리스트 메서드
    public List<QnaBoardVo> noticeBoardList(QnaBoardVo qnaBoard);

    //공지게시판 전체 레코드 수
    public int noticeBoardCnt(QnaBoardVo qnaBoard);

    //공지게시판 작성 메서드
    public int noticeBoardInsert(QnaBoardVo qnaBoard);

    //공지게시판 상세페이지 조회 메서드
    public QnaBoardVo noticeBoardDetail(QnaBoardVo qnaBoard);

    //공지게시판 수정 메서드
    public int noticeBoardUpdate(QnaBoardVo qnaBoard);
    //공지게시판 삭제 메서드
    public int noticeBoardDelete(QnaBoardVo qnaBoard);

    public int noticeStateUpdate(QnaBoardVo qnaBoard);


}
