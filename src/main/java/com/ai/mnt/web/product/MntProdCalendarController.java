package com.ai.mnt.web.product;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ai.mnt.common.util.DateUtil;
import com.ai.mnt.model.product.FullCalendar;
import com.ai.mnt.model.product.MntReleaseRec;
import com.ai.mnt.service.product.MntReleaseRecService;

/**
 * @Title: MntProdControllor 
 * @Description: MntProdControllor
 * @Author: He
 * @Date: 2016-4-14
 */
@Controller
@RequestMapping("prod/calendar")
public class MntProdCalendarController {
    
    
    @Autowired
    MntReleaseRecService mntReleaseRecService;
    
    /**
     * 产品上线日历页面
     * @param model
     * @return
     */
    @RequestMapping("/page")
    public String showModulePage(Model model) {
        

        
        
        
        return "product/calendar/prod_calendar";
    }
    
    /**
     * 获取角色列表
     * @param sysResource
     * @return [{"id":"7850","title":"aaa","start":"2016-01-25 00:00",
     *          "end":"1970-01-01 08:00","url":null,"allDay":true,"color":"#360"}
     */
    @RequestMapping("/rel_rec/query")
    @ResponseBody
    public List<FullCalendar> getRelCalenderData() {
        MntReleaseRec mntReleaseRec = new MntReleaseRec();
        mntReleaseRec.setDeleteFlag("0");
        List<MntReleaseRec> recList = mntReleaseRecService.findReleaseRecList(mntReleaseRec);
        String[] color = {"yellow", "green", "grey", "purple", "red"};
        List<FullCalendar> fullCalendarList = new ArrayList<>();
        for(MntReleaseRec temp : recList) {
            FullCalendar fullCalendar = new FullCalendar();
            fullCalendar.setId(temp.getRelId() + "");
            fullCalendar.setTitle(temp.getRelCode());
            fullCalendar.setStart(DateUtil.dateToString(temp.getRelDate()));
            fullCalendar.setEnd(DateUtil.dateToString(temp.getRelDate()));
            Random r = new Random();
            fullCalendar.setColor(color[r.nextInt(5)]);
            fullCalendarList.add(fullCalendar);
        }
        return fullCalendarList;
    }
    
}
