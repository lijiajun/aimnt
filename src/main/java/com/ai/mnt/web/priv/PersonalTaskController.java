package com.ai.mnt.web.priv;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.socket.TextMessage;

import com.ai.mnt.common.cache.BaseDataCache;
import com.ai.mnt.common.shiro.UserRealm;
import com.ai.mnt.common.util.DateUtil;
import com.ai.mnt.model.common.EnumObject;
import com.ai.mnt.model.sys.SysUser;
import com.ai.mnt.model.task.MntTaskInfo;
import com.ai.mnt.service.task.MntTaskInfoService;
import com.ai.mnt.webscoket.WebSocketMsgHandler;

/**
 * @Title: MntTaskInfoController 
 * @Description: MntTaskInfoController ControllerPackage
 * @Author: Auto Generate. HE
 * @Date: 2016-5-17
 */

@Controller
@RequestMapping("/priv")
public class PersonalTaskController {

    @Autowired
    MntTaskInfoService mntTaskInfoService;
    
    @Autowired
    UserRealm userRealm;
    /**
     * 任务信息界面跳转
     * @param  model
     * @return String
     */
    @RequestMapping("/task/page")
    public String showMntTaskInfoPage(Model model) {
        List<EnumObject> taskStsEnums = BaseDataCache.getDataList("TASK_DEAL_STS");
        model.addAttribute("taskStsEnums", taskStsEnums);
        return "priv/task/my_task_query";
    }
    
    /**
     * 获取任务信息列表
     * @param mntTaskInfo
     * @return Map<String, Object>
     */
    @RequestMapping("/task/query")
    @ResponseBody
    public Map<String, Object> getMntTaskInfoList(MntTaskInfo mntTaskInfo) {
        SysUser currentUser = userRealm.getCurrentUser();
        mntTaskInfo.setDealPerson(currentUser.getUserName());
        mntTaskInfo.setDeleteFlag("0");
        List<MntTaskInfo> mntTaskInfoList = mntTaskInfoService.findMntTaskInfoList(mntTaskInfo);
        Map<String, Object> map = new HashMap<>();
        map.put("data", mntTaskInfoList);
        map.put("status", "1");
        return map;
    }
    
    @Bean
    public WebSocketMsgHandler wsHandler() {
        return new WebSocketMsgHandler();
    }
    
    /**
     * 任务信息根据主键更新
     * @param mntTaskInfo
     * @return
     */
    @RequestMapping("/task/update")
    @ResponseBody
    public Map<String, Object> updateFinishMntTask(MntTaskInfo mntTaskInfo) {
        Map<String, Object> map = new HashMap<>();
        
        MntTaskInfo taskInfo = mntTaskInfoService.findMntTaskInfoByTaskId(mntTaskInfo.getTaskId());
        SysUser currentUser = userRealm.getCurrentUser();
        if(!currentUser.getUserName().equals(taskInfo.getDealPerson())) {
            map.put("status", "0");
            map.put("msg", "别乱来，不能修改别人的任务！");
            return map;
        }
        
        if("3".equals(taskInfo.getDealSts())) {
            map.put("status", "0");
            map.put("msg", "该任务早就已完成，不用再麻烦点我了！");
            return map;
        }
        
        mntTaskInfo.setDealSts("3");//完成
        mntTaskInfo.setFinishDate(DateUtil.getCurrDate());
        mntTaskInfoService.updateMntTaskInfoByTaskId(mntTaskInfo);
        map.put("status", "1");
        map.put("msg", "恭喜任务已完成，小红花+1！");
        
        //ws
        if(StringUtils.isNotEmpty(taskInfo.getDealPerson())) {
            MntTaskInfo wsTaskInfo = new MntTaskInfo();
            wsTaskInfo.setDealPerson(taskInfo.getDealPerson());
            wsTaskInfo.setDeleteFlag("0");
            wsTaskInfo.setDealSts("2");
            List<MntTaskInfo> mntTaskInfoList = mntTaskInfoService.findMntTaskInfoList(wsTaskInfo);
            int taskCount = mntTaskInfoList == null ? 0 : mntTaskInfoList.size();
            try {
                wsHandler().sendMessageToUser(taskInfo.getDealPerson(), new TextMessage(taskCount + ""));
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        
        return map;
    }
}
