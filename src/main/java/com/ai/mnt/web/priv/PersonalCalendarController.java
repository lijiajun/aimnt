package com.ai.mnt.web.priv;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ai.mnt.common.shiro.UserRealm;
import com.ai.mnt.common.util.DateUtil;
import com.ai.mnt.common.util.MntConstant;
import com.ai.mnt.model.product.FullCalendar;
import com.ai.mnt.model.sys.SysUser;
import com.ai.mnt.model.task.MntTaskInfo;
import com.ai.mnt.service.task.MntTaskInfoService;

/**
 * @Title: MntTaskInfoController 
 * @Description: MntTaskInfoController ControllerPackage
 * @Author: Auto Generate. HE
 * @Date: 2016-5-17
 */

@Controller
@RequestMapping("/priv")
public class PersonalCalendarController {

    @Autowired
    MntTaskInfoService mntTaskInfoService;
    
    @Autowired
    UserRealm userRealm;
    /**
     * 任务信息界面跳转
     * @param  model
     * @return String
     */
    @RequestMapping("/calendar/page")
    public String showMntTaskInfoPage(Model model) {
        return "priv/calendar/my_calendar_show";
    }
    
    /**
     * 获取任务信息列表
     * @param mntTaskInfo
     * @return Map<String, Object>
     */
    @RequestMapping("/calendar/query")
    @ResponseBody
    public List<FullCalendar> getMntTaskInfoList(MntTaskInfo mntTaskInfo) {
        
        SysUser currentUser = userRealm.getCurrentUser();
        mntTaskInfo.setDealPerson(currentUser.getUserName());
        mntTaskInfo.setDeleteFlag("0");
        List<MntTaskInfo> mntTaskInfoList = mntTaskInfoService.findMntTaskInfoList(mntTaskInfo);
        
        List<FullCalendar> fullCalendarList = new ArrayList<>();
        Map<String, Integer> map = new HashMap<>();
        for(MntTaskInfo temp : mntTaskInfoList) {
            FullCalendar fullCalendar = new FullCalendar();
            fullCalendar.setId(temp.getTaskId() + "");
            fullCalendar.setTitle(temp.getTaskName() + "(" + temp.getDealStsTxt() + ")");
            fullCalendar.setStart(DateUtil.dateToStringShort(temp.getCreateDate()));
            fullCalendar.setEnd(DateUtil.dateToStringShort(temp.getCreateDate()));
            if(temp.getExpectDate() != null) {
                fullCalendar.setEnd(DateUtil.dateToStringShort(temp.getExpectDate()));
            }
            if(temp.getFinishDate() != null) {
                fullCalendar.setEnd(DateUtil.dateToStringShort(temp.getFinishDate()));
            }
            String day = DateUtil.getDay(temp.getCreateDate());
            int d = Integer.parseInt(day) % 10;//取个位数字 固定颜色
            Integer tempd = map.get(day);
            if(tempd != null) {
                d = tempd;
                d -= 3;
                if(d < 0) {
                    d = 9;
                }
            }
            map.put(day, d);
            fullCalendar.setColor(MntConstant.COLOR_ARY[d]);
            if("3".equals(temp.getDealSts())) {
                fullCalendar.setColor("#00CD00");
                
            }
            fullCalendarList.add(fullCalendar);
        }
        return fullCalendarList;
    }
    
}
