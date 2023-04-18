package com.liclass.admin.management.dashboard.dao;

import com.liclass.admin.management.dashboard.vo.DashBoardVo;
import com.liclass.admin.management.qnaboard.vo.QnaBoardVo;
import org.apache.ibatis.annotations.Mapper;

import java.util.HashMap;
import java.util.List;

@Mapper
public interface DashBoardDao {
    public List<QnaBoardVo> noticeList(QnaBoardVo qnaBoard);
    public List<QnaBoardVo> qnaList(QnaBoardVo qnaBoard);

    public QnaBoardVo noticeDetail(QnaBoardVo qnaBoard);
    public QnaBoardVo qnaDetail(QnaBoardVo qnaBoard);

    public HashMap<String, Integer> userState(DashBoardVo dashBoard);

    public HashMap<String, Integer> userReserve(DashBoardVo dashBoard);

    public HashMap<String, Integer> allSales(DashBoardVo dashBoard);

}
