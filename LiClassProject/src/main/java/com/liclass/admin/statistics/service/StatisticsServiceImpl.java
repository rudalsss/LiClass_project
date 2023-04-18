package com.liclass.admin.statistics.service;

import com.liclass.admin.classes.vo.AdminClassVO;
import com.liclass.admin.statistics.dao.StatisticsDao;
import com.liclass.client.login.vo.UserVO;
import com.liclass.client.payment.vo.PaymentVO;
import com.liclass.client.reserve.vo.ReserveVO;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class StatisticsServiceImpl implements StatisticsService{

    @Setter(onMethod_ = @Autowired)
    private StatisticsDao statisticsDao;

    @Override
    public HashMap<String, Integer> userStatistics(UserVO user){
        HashMap<String, Integer> userData = null;
        userData = statisticsDao.userStatistics(user);

        return userData;
    }

    @Override
    public List<Map<String, Object>> quarterStatistics(PaymentVO payment) {
        List<Map<String, Object>> salesData = null;
        salesData = statisticsDao.quarterStatistics(payment);

        return salesData;
    }

    @Override
    public List<Map<String, Object>> allSales(PaymentVO payment) {
        List<Map<String, Object>> sales = null;
        sales = statisticsDao.allSales(payment);
        return sales;
    }

    @Override
    public HashMap<String, Integer> salesCount(PaymentVO payment){
        HashMap<String, Integer> salesCount = null;
        salesCount = statisticsDao.salesCount(payment);

        return salesCount;
    }

    @Override
    public List<Map<String, Object>> levelCount(PaymentVO payment){
        List<Map<String, Object>> levelCount = null;
        levelCount = statisticsDao.levelCount(payment);

        return levelCount;
    }

    @Override
    public List<Map<String, Object>> levelStatistics(PaymentVO payment) {
        List<Map<String, Object>>level = null;
        level = statisticsDao.levelStatistics(payment);

        return level;
    }

    @Override
    public HashMap<String, Integer> reserveStatistics(ReserveVO reserve) {
        HashMap<String, Integer> reserves = null;
        reserves = statisticsDao.reserveStatistics(reserve);

        return reserves;
    }


}
