package com.liclass.admin.statistics.service;

import com.liclass.admin.classes.vo.AdminClassVO;
import com.liclass.client.login.vo.UserVO;
import com.liclass.client.payment.vo.PaymentVO;
import com.liclass.client.reserve.vo.ReserveVO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface StatisticsService {

    public HashMap<String, Integer> userStatistics(UserVO user);

    public List<Map<String, Object>> quarterStatistics(PaymentVO payment);


    public List<Map<String, Object>> allSales(PaymentVO payment);

    public HashMap<String, Integer> salesCount(PaymentVO payment);
    public List<Map<String, Object>> levelCount(PaymentVO payment);

    public List<Map<String, Object>> levelStatistics(PaymentVO payment);

    public HashMap<String, Integer> reserveStatistics(ReserveVO reserve);
}
