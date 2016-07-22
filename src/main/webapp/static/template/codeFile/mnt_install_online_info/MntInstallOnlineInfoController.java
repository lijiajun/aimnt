package com.ai.mnt.web.inst;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ai.mnt.model.inst.MntInstallOnlineInfo;
import com.ai.mnt.service.inst.MntInstallOnlineInfoService;

/**
 * @Title: MntInstallOnlineInfoController 
 * @Description: MntInstallOnlineInfoController ControllerPackage
 * @Author: Auto Generate.
 * @Date: 2016-7-21
 */

@Controller
@RequestMapping("/inst")
public class MntInstallOnlineInfoController {

    @Autowired
    MntInstallOnlineInfoService mntInstallOnlineInfoService;
    
    /**
     * 安装点上线信息界面跳转
     * @param  model
     * @return String
     */
    @RequestMapping("/online/page")
    public String showMntInstallOnlineInfoPage(Model model) {
        return "inst/online/inst_online_query";
    }
    
    /**
     * 获取安装点上线信息列表
     * @param mntInstallOnlineInfo
     * @return Map<String, Object>
     */
    @RequestMapping("/online/query")
    @ResponseBody
    public Map<String, Object> getMntInstallOnlineInfoList(MntInstallOnlineInfo mntInstallOnlineInfo) {
        List<MntInstallOnlineInfo> mntInstallOnlineInfoList = mntInstallOnlineInfoService.findMntInstallOnlineInfoList(mntInstallOnlineInfo);
        Map<String, Object> map = new HashMap<>();
        map.put("data", mntInstallOnlineInfoList);
        map.put("status", "1");
        return map;
    }
    
    /**
     * 安装点上线信息新增界面跳转
     * @param  model
     * @return String
     */
    @RequestMapping("/online/add_page")
    public String showMntInstallOnlineInfoAddPage(Model model) {
        return "inst/online/inst_online_add";
    }
    
    /**
     * 安装点上线信息保存
     * @param mntInstallOnlineInfo
     * @return Map<String, Object>
     */
    @RequestMapping("/online/add")
    @ResponseBody
    public Map<String, Object> saveMntInstallOnlineInfo(MntInstallOnlineInfo mntInstallOnlineInfo) {
        mntInstallOnlineInfoService.saveMntInstallOnlineInfo(mntInstallOnlineInfo);
        Map<String, Object> map = new HashMap<>();
        map.put("status", "1");
        return map;
    }
    
    /**
     * 安装点上线信息更新界面跳转
     * @param  model
     * @param  onlineId
     * @return
     */
    @RequestMapping("/online/update_page/{onlineId}")
    public String showMntInstallOnlineInfoUpdatePage(Model model, @PathVariable String onlineId) {
        MntInstallOnlineInfo mntInstallOnlineInfo = mntInstallOnlineInfoService.findMntInstallOnlineInfoByOnlineId(Integer.parseInt(onlineId));
        model.addAttribute("mntInstallOnlineInfo", mntInstallOnlineInfo);
        return "inst/online/inst_online_update";
    }
    
    /**
     * 安装点上线信息根据主键更新
     * @param mntInstallOnlineInfo
     * @return
     */
    @RequestMapping("/online/update")
    @ResponseBody
    public Map<String, Object> updateMntInstallOnlineInfo(MntInstallOnlineInfo mntInstallOnlineInfo) {
        mntInstallOnlineInfoService.updateMntInstallOnlineInfoByOnlineId(mntInstallOnlineInfo);
        Map<String, Object> map = new HashMap<>();
        map.put("status", "1");
        return map;
    }
    
    /**
     * 安装点上线信息根据主键批量删除
     * @param onlineIds
     * @return Map<String, Object>
     */
    @RequestMapping("/online/delete/{onlineIds}")
    @ResponseBody
    public Map<String, Object> deleteMntInstallOnlineInfoByOnlineIds(@PathVariable String onlineIds) {
        mntInstallOnlineInfoService.deleteMntInstallOnlineInfoByOnlineIds(onlineIds);
        Map<String, Object> map = new HashMap<>();
        map.put("status", "1");
        return map;
    }
    
    /**
     * 根据主键查询安装点上线信息详细信息
     * @param model
     * @return
     */
    @RequestMapping("/online/{onlineId}/page")
    public String queryMntInstallOnlineInfoByOnlineId(Model model, @PathVariable String onlineId) {
        MntInstallOnlineInfo mntInstallOnlineInfo = new MntInstallOnlineInfo();
        mntInstallOnlineInfo.setOnlineId(Integer.parseInt(onlineId));
        List<MntInstallOnlineInfo> mntInstallOnlineInfoList = mntInstallOnlineInfoService.findMntInstallOnlineInfoList(mntInstallOnlineInfo);
        if(mntInstallOnlineInfoList != null && mntInstallOnlineInfoList.size() > 0) { //只会有一条数据
            model.addAttribute("mntInstallOnlineInfo", mntInstallOnlineInfoList.get(0));
        }
        return "inst/online/inst_online_info";
    }
}
