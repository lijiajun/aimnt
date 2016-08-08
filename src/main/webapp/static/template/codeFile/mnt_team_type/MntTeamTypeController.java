package com.ai.mnt.web.report;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ai.mnt.model.report.MntTeamType;
import com.ai.mnt.service.report.MntTeamTypeService;

/**
 * @Title: MntTeamTypeController 
 * @Description: MntTeamTypeController ControllerPackage
 * @Author: Auto Generate.
 * @Date: 2016-7-27
 */

@Controller
@RequestMapping("/report")
public class MntTeamTypeController {

    @Autowired
    MntTeamTypeService mntTeamTypeService;
    
    /**
     * 团队类型界面跳转
     * @param  model
     * @return String
     */
    @RequestMapping("/week/page")
    public String showMntTeamTypePage(Model model) {
        return "report/week/report_week_query";
    }
    
    /**
     * 获取团队类型列表
     * @param mntTeamType
     * @return Map<String, Object>
     */
    @RequestMapping("/week/query")
    @ResponseBody
    public Map<String, Object> getMntTeamTypeList(MntTeamType mntTeamType) {
        List<MntTeamType> mntTeamTypeList = mntTeamTypeService.findMntTeamTypeList(mntTeamType);
        Map<String, Object> map = new HashMap<>();
        map.put("data", mntTeamTypeList);
        map.put("status", "1");
        return map;
    }
    
    /**
     * 团队类型新增界面跳转
     * @param  model
     * @return String
     */
    @RequestMapping("/week/add_page")
    public String showMntTeamTypeAddPage(Model model) {
        return "report/week/report_week_add";
    }
    
    /**
     * 团队类型保存
     * @param mntTeamType
     * @return Map<String, Object>
     */
    @RequestMapping("/week/add")
    @ResponseBody
    public Map<String, Object> saveMntTeamType(MntTeamType mntTeamType) {
        mntTeamTypeService.saveMntTeamType(mntTeamType);
        Map<String, Object> map = new HashMap<>();
        map.put("status", "1");
        return map;
    }
    
    /**
     * 团队类型更新界面跳转
     * @param  model
     * @param  teamId
     * @return
     */
    @RequestMapping("/week/update_page/{teamId}")
    public String showMntTeamTypeUpdatePage(Model model, @PathVariable String teamId) {
        MntTeamType mntTeamType = mntTeamTypeService.findMntTeamTypeByTeamId(Integer.parseInt(teamId));
        model.addAttribute("mntTeamType", mntTeamType);
        return "report/week/report_week_update";
    }
    
    /**
     * 团队类型根据主键更新
     * @param mntTeamType
     * @return
     */
    @RequestMapping("/week/update")
    @ResponseBody
    public Map<String, Object> updateMntTeamType(MntTeamType mntTeamType) {
        mntTeamTypeService.updateMntTeamTypeByTeamId(mntTeamType);
        Map<String, Object> map = new HashMap<>();
        map.put("status", "1");
        return map;
    }
    
    /**
     * 团队类型根据主键批量删除
     * @param teamIds
     * @return Map<String, Object>
     */
    @RequestMapping("/week/delete/{teamIds}")
    @ResponseBody
    public Map<String, Object> deleteMntTeamTypeByTeamIds(@PathVariable String teamIds) {
        mntTeamTypeService.deleteMntTeamTypeByTeamIds(teamIds);
        Map<String, Object> map = new HashMap<>();
        map.put("status", "1");
        return map;
    }
    
    /**
     * 根据主键查询团队类型详细信息
     * @param model
     * @return
     */
    @RequestMapping("/week/{teamId}/page")
    public String queryMntTeamTypeByTeamId(Model model, @PathVariable String teamId) {
        MntTeamType mntTeamType = new MntTeamType();
        mntTeamType.setTeamId(Integer.parseInt(teamId));
        List<MntTeamType> mntTeamTypeList = mntTeamTypeService.findMntTeamTypeList(mntTeamType);
        if(mntTeamTypeList != null && mntTeamTypeList.size() > 0) { //只会有一条数据
            model.addAttribute("mntTeamType", mntTeamTypeList.get(0));
        }
        return "report/week/report_week_info";
    }
}
