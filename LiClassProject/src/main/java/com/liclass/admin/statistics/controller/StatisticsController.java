package com.liclass.admin.statistics.controller;


import com.liclass.admin.classes.vo.AdminClassVO;
import com.liclass.admin.statistics.service.StatisticsService;
import com.liclass.client.login.vo.UserVO;
import com.liclass.client.payment.vo.PaymentVO;
import com.liclass.client.reserve.vo.ReserveVO;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.relational.core.sql.In;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Controller
@RequestMapping("/admin/statistics/*")
@Slf4j
public class StatisticsController {

    @Setter(onMethod_ = @Autowired)
    private StatisticsService statisticsService;

    @RequestMapping(value = "/userstatistics", method = RequestMethod.GET)
    private String userStatistics(@ModelAttribute UserVO user, Model model){
        HashMap<String, Integer> userData =statisticsService.userStatistics(user);

        model.addAttribute("userData", userData);
        for(String i : userData.keySet()){
            log.info("key : "+ i +" / value : "+ userData.get(i));
        }


        return "admin/statistics/userstatistics";
    }

    @RequestMapping(value = "/reservestatistics", method = RequestMethod.GET)
    public String reserveStatistics(@ModelAttribute ReserveVO reserve, Model model){
        HashMap<String, Integer> reserveData = statisticsService.reserveStatistics(reserve);
        model.addAttribute("reserveData", reserveData);

        for(String i : reserveData.keySet()){
            log.info("key : "+ i +" / value : "+ reserveData.get(i));
        }

        return "admin/statistics/reservestatistics";
    }

    @RequestMapping(value = "/salesstatistics", method = RequestMethod.GET)
    public String salesStatistics(@ModelAttribute PaymentVO payment, Model model){
        HashMap<String, Integer> salesCount = statisticsService.salesCount(payment);
        for(String i : salesCount.keySet()){
            log.info("key : "+ i +" / value : "+ salesCount.get(i));
        }

        List<Map<String, Object>> levelCount = statisticsService.levelCount(payment);
        List<Integer> levelCountList = new ArrayList<>();

        List<Map<String, Object>> salesData = statisticsService.quarterStatistics(payment);
        List<Integer> salesList = new ArrayList<>();

        List<Map<String, Object>> allSales = statisticsService.allSales(payment);
        List<Integer> allSaleList = new ArrayList<>();

        List<Map<String, Object>> levelData = statisticsService.levelStatistics(payment);
        List<Integer> levelList = new ArrayList<>();

        for (Map<String, Object> sales : salesData) {
            log.info("QUARTER: {}, SALES: {}", sales.get("QUARTER"), sales.get("SALES"));
            salesList.add(Integer.parseInt(sales.get("SALES").toString()));
        }

        for (Map<String, Object> sales : allSales) {
            log.info("SALES_TYPE: {}, SALES_ACOUNT: {}", sales.get("SALES_TYPE"), sales.get("SALES_ACOUNT"));
            allSaleList.add(Integer.parseInt(sales.get("SALES_ACOUNT").toString()));
        }

        for(Map<String, Object> level : levelData){
            log.info("C_LEVEL: {}, SALES_SUM: {}", level.get("C_LEVEL"), level.get("SALES_SUM"));
            levelList.add(Integer.parseInt(level.get("SALES_SUM").toString()));
        }

        for(Map<String, Object> level : levelCount){
            log.info("C_LEVEL: {}, PAYMENT_COUNT: {}", level.get("C_LEVEL"), level.get("PAYMENT_COUNT"));
            levelCountList.add(Integer.parseInt(level.get("PAYMENT_COUNT").toString()));
        }
        model.addAttribute("salesCount", salesCount);
        model.addAttribute("levelCount", levelCount);

        model.addAttribute("salesList", salesList);
        model.addAttribute("allSaleList", allSaleList);
        model.addAttribute("levelList", levelList);
        model.addAttribute("levelCountList", levelCountList);

        return "admin/statistics/salesstatistics";
    }
}
