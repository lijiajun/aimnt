package com.ai.mnt.web.task;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.socket.TextMessage;

import com.ai.mnt.common.cache.BaseDataCache;
import com.ai.mnt.common.shiro.UserRealm;
import com.ai.mnt.model.common.EnumObject;
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
@RequestMapping("/task")
public class MntTaskInfoController {

    @Autowired
    MntTaskInfoService mntTaskInfoService;
    
    @Autowired
    UserRealm userRealm;
    
    /**
     * 任务信息界面跳转
     * @param  model
     * @return String
     */
    @RequestMapping("/schedule/page")
    public String showMntTaskInfoPage(Model model) {
        
        List<EnumObject> userEnums = BaseDataCache.getDataList("USER_NAME_ENUM");
        List<EnumObject> taskEnums = BaseDataCache.getDataList("TASK_NAME_ENUM");
        List<EnumObject> taskStsEnums = BaseDataCache.getDataList("TASK_DEAL_STS");
        model.addAttribute("userEnums", userEnums);
        model.addAttribute("taskEnums", taskEnums);
        model.addAttribute("taskStsEnums", taskStsEnums);
        return "task/schedule/task_schedule_query";
    }
    
    /**
     * 获取任务信息列表
     * @param mntTaskInfo
     * @return Map<String, Object>
     */
    @RequestMapping("/schedule/query")
    @ResponseBody
    public Map<String, Object> getMntTaskInfoList(MntTaskInfo mntTaskInfo) {
        mntTaskInfo.setDeleteFlag("0");
        List<MntTaskInfo> mntTaskInfoList = mntTaskInfoService.findMntTaskInfoList(mntTaskInfo);
        Map<String, Object> map = new HashMap<>();
        map.put("data", mntTaskInfoList);
        map.put("status", "1");
        return map;
    }
    
    /**
     * 任务信息新增界面跳转
     * @param  model
     * @return String
     */
    @RequestMapping("/schedule/add_page")
    public String showMntTaskInfoAddPage(Model model) {
        
        List<EnumObject> userEnums = BaseDataCache.getDataList("USER_NAME_ENUM");
        List<EnumObject> taskEnums = BaseDataCache.getDataList("TASK_NAME_ENUM");
        List<EnumObject> taskStsEnums = BaseDataCache.getDataList("TASK_DEAL_STS");
        model.addAttribute("userEnums", userEnums);
        model.addAttribute("taskEnums", taskEnums);
        model.addAttribute("taskStsEnums", taskStsEnums);
        
        return "task/schedule/task_schedule_add";
    }
    
    @Bean
    public WebSocketMsgHandler wsHandler() {
        return new WebSocketMsgHandler();
    }
    
    /**
     * 任务信息保存
     * @param mntTaskInfo
     * @return Map<String, Object>
     */
    @RequestMapping("/schedule/add")
    @ResponseBody
    public Map<String, Object> saveMntTaskInfo(MntTaskInfo mntTaskInfo) {
        mntTaskInfoService.saveMntTaskInfo(mntTaskInfo);
        Map<String, Object> map = new HashMap<>();
        map.put("status", "1");
        
        //ws
        if(StringUtils.isNotEmpty(mntTaskInfo.getDealPerson())) {
            MntTaskInfo wsTaskInfo = new MntTaskInfo();
            wsTaskInfo.setDealPerson(mntTaskInfo.getDealPerson());
            wsTaskInfo.setDeleteFlag("0");
            wsTaskInfo.setDealSts("2");
            List<MntTaskInfo> mntTaskInfoList = mntTaskInfoService.findMntTaskInfoList(wsTaskInfo);
            int taskCount = mntTaskInfoList == null ? 0 : mntTaskInfoList.size();
            try {
                wsHandler().sendMessageToUser(mntTaskInfo.getDealPerson(), new TextMessage(taskCount + ""));
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        
        return map;
    }
    
    /**
     * 任务信息更新界面跳转
     * @param  model
     * @param  taskId
     * @return
     */
    @RequestMapping("/schedule/update_page/{taskId}")
    public String showMntTaskInfoUpdatePage(Model model, @PathVariable String taskId) {
        
        List<EnumObject> userEnums = BaseDataCache.getDataList("USER_NAME_ENUM");
        List<EnumObject> taskEnums = BaseDataCache.getDataList("TASK_NAME_ENUM");
        List<EnumObject> taskStsEnums = BaseDataCache.getDataList("TASK_DEAL_STS");
        model.addAttribute("userEnums", userEnums);
        model.addAttribute("taskEnums", taskEnums);
        model.addAttribute("taskStsEnums", taskStsEnums);
        
        MntTaskInfo mntTaskInfo = mntTaskInfoService.findMntTaskInfoByTaskId(Integer.parseInt(taskId));
        model.addAttribute("mntTaskInfo", mntTaskInfo);
        return "task/schedule/task_schedule_update";
    }
    
    /**
     * 任务信息根据主键更新
     * @param mntTaskInfo
     * @return
     */
    @RequestMapping("/schedule/update")
    @ResponseBody
    public Map<String, Object> updateMntTaskInfo(MntTaskInfo mntTaskInfo) {
        mntTaskInfoService.updateMntTaskInfoByTaskId(mntTaskInfo);
        Map<String, Object> map = new HashMap<>();
        map.put("status", "1");
        
        //ws
        if(StringUtils.isNotEmpty(mntTaskInfo.getDealPerson())) {
            MntTaskInfo wsTaskInfo = new MntTaskInfo();
            wsTaskInfo.setDealPerson(mntTaskInfo.getDealPerson());
            wsTaskInfo.setDeleteFlag("0");
            wsTaskInfo.setDealSts("2");
            List<MntTaskInfo> mntTaskInfoList = mntTaskInfoService.findMntTaskInfoList(wsTaskInfo);
            int taskCount = mntTaskInfoList == null ? 0 : mntTaskInfoList.size();
            try {
                wsHandler().sendMessageToUser(mntTaskInfo.getDealPerson(), new TextMessage(taskCount + ""));
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        
        return map;
    }
    
    /**
     * 任务信息根据主键批量删除
     * @param taskIds
     * @return Map<String, Object>
     */
    @RequestMapping("/schedule/delete/{taskIds}")
    @ResponseBody
    public Map<String, Object> deleteMntTaskInfoByTaskIds(@PathVariable String taskIds) {
        mntTaskInfoService.deleteMntTaskInfoByTaskIds(taskIds);
        Map<String, Object> map = new HashMap<>();
        map.put("status", "1");
        return map;
    }
    
    /**
     * 根据主键查询任务信息详细信息
     * @param model
     * @return
     */
    @RequestMapping("/schedule/{taskId}/page")
    public String queryMntTaskInfoByTaskId(Model model, @PathVariable String taskId) {
        MntTaskInfo mntTaskInfo = new MntTaskInfo();
        mntTaskInfo.setTaskId(Integer.parseInt(taskId));
        List<MntTaskInfo> mntTaskInfoList = mntTaskInfoService.findMntTaskInfoList(mntTaskInfo);
        if(mntTaskInfoList != null && mntTaskInfoList.size() > 0) { //只会有一条数据
            model.addAttribute("mntTaskInfo", mntTaskInfoList.get(0));
        }
        return "task/schedule/task_schedule_info";
    }
}
