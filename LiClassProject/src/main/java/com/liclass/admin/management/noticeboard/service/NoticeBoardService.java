package com.liclass.admin.management.noticeboard.service;

import com.liclass.admin.management.qnaboard.vo.QnaBoardVo;

import java.util.List;

public interface NoticeBoardService {

    public List<QnaBoardVo> noticeBoardList(QnaBoardVo qnaBoard);

    public int noticeBoardCnt(QnaBoardVo qnaBoard);

    public int noticeBoardInsert(QnaBoardVo qnaBoard);

    public QnaBoardVo noticeBoardDetail(QnaBoardVo qnaBoard);

    public QnaBoardVo updateForm(QnaBoardVo qnaBoard);
    public int noticeBoardUpdate(QnaBoardVo qnaBoard);

    public int noticeBoardDelete(QnaBoardVo qnaBoard);

    public int noticeStateUpdate(QnaBoardVo qnaBoard);


}
