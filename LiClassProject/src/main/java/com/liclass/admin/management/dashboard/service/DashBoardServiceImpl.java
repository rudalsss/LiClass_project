package com.liclass.admin.management.dashboard.service;

import com.liclass.admin.management.dashboard.dao.DashBoardDao;
import com.liclass.admin.management.dashboard.vo.DashBoardVo;
import com.liclass.admin.management.qnaboard.vo.QnaBoardVo;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class DashBoardServiceImpl implements DashBoardService{

    @Setter(onMethod_ = @Autowired)
    private DashBoardDao dashBoardDao;


    @Override
    public List<QnaBoardVo> noticeList(QnaBoardVo qnaBoard) {
        List<QnaBoardVo> list = null;
        list = dashBoardDao.noticeList(qnaBoard);

        return list;
    }

    @Override
    public List<QnaBoardVo> qnaList(QnaBoardVo qnaBoard) {
        List<QnaBoardVo> list = null;
        list = dashBoardDao.qnaList(qnaBoard);

        return list;
    }

    @Override
    public QnaBoardVo noticeDetail(QnaBoardVo qnaBoard) {
        QnaBoardVo detail = null;

        detail = dashBoardDao.noticeDetail(qnaBoard);

        if(detail != null){
            detail.setQna_content(detail.getQna_content().toString().replaceAll("\n", "<br />"));
        }
        return detail;
    }

    @Override
    public QnaBoardVo qnaDetail(QnaBoardVo qnaBoard) {
        QnaBoardVo detail = null;

        detail = dashBoardDao.qnaDetail(qnaBoard);

        if(detail != null){
            detail.setQna_content(detail.getQna_content().toString().replaceAll("\n", "<br />"));
        }
        return detail;
    }

    @Override
    public HashMap<String, Integer> userState(DashBoardVo dashBoard){
        HashMap<String, Integer> user = null;

        user = dashBoardDao.userState(dashBoard);

        return user;
    }

    @Override
    public HashMap<String, Integer> userReserve(DashBoardVo dashBoard){
        HashMap<String, Integer> reserve = null;
        reserve = dashBoardDao.userReserve(dashBoard);

        return reserve;
    }

    @Override
    public HashMap<String, Integer> allSales(DashBoardVo dashBoard) {
        HashMap<String, Integer> sales = null;
        sales = dashBoardDao.allSales(dashBoard);
        return sales;
    }

}
