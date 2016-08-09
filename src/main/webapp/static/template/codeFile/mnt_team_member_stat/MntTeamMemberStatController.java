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

import com.ai.mnt.model.report.MntTeamMemberStat;
import com.ai.mnt.service.report.MntTeamMemberStatService;

/**
 * @Title: MntTeamMemberStatController 
 * @Description: MntTeamMemberStatController ControllerPackage
 * @Author: Auto Generate.
 * @Date: 2016-7-27
 */

@Controller
@RequestMapping("/report")
public class MntTeamMemberStatController {

    @Autowired
    MntTeamMemberStatService mntTeamMemberStatService;
    
    /**
     * 团队成员统计界面跳转
     * @param  model
     * @return String
     */
    @RequestMapping("/week/page")
    public String showMntTeamMemberStatPage(Model model) {
        return "report/week/report_week_query";
    }
    
    /**
     * 获取团队成员统计列表
     * @param mntTeamMemberStat
     * @return Map<String, Object>
     */
    @RequestMapping("/week/query")
    @ResponseBody
    public Map<String, Object> getMntTeamMemberStatList(MntTeamMemberStat mntTeamMemberStat) {
        List<MntTeamMemberStat> mntTeamMemberStatList = mntTeamMemberStatService.findMntTeamMemberStatList(mntTeamMemberStat);
        Map<String, Object> map = new HashMap<>();
        map.put("data", mntTeamMemberStatList);
        map.put("status", "1");
        return map;
    }
    
    /**
     * 团队成员统计新增界面跳转
     * @param  model
     * @return String
     */
    @RequestMapping("/week/add_page")
    public String showMntTeamMemberStatAddPage(Model model) {
        return "report/week/report_week_add";
    }
    
    /**
     * 团队成员统计保存
     * @param mntTeamMemberStat
     * @return Map<String, Object>
     */
    @RequestMapping("/week/add")
    @ResponseBody
    public Map<String, Object> saveMntTeamMemberStat(MntTeamMemberStat mntTeamMemberStat) {
        mntTeamMemberStatService.saveMntTeamMemberStat(mntTeamMemberStat);
        Map<String, Object> map = new HashMap<>();
        map.put("status", "1");
        return map;
    }
    
    /**
     * 团队成员统计更新界面跳转
     * @param  model
     * @param  id
     * @return
     */
    @RequestMapping("/week/update_page/{id}")
    public String showMntTeamMemberStatUpdatePage(Model model, @PathVariable String id) {
        MntTeamMemberStat mntTeamMemberStat = mntTeamMemberStatService.findMntTeamMemberStatById(Integer.parseInt(id));
        model.addAttribute("mntTeamMemberStat", mntTeamMemberStat);
        return "report/week/report_week_update";
    }
    
    /**
     * 团队成员统计根据主键更新
     * @param mntTeamMemberStat
     * @return
     */
    @RequestMapping("/week/update")
    @ResponseBody
    public Map<String, Object> updateMntTeamMemberStat(MntTeamMemberStat mntTeamMemberStat) {
        mntTeamMemberStatService.updateMntTeamMemberStatById(mntTeamMemberStat);
        Map<String, Object> map = new HashMap<>();
        map.put("status", "1");
        return map;
    }
    
    /**
     * 团队成员统计根据主键批量删除
     * @param ids
     * @return Map<String, Object>
     */
    @RequestMapping("/week/delete/{ids}")
    @ResponseBody
    public Map<String, Object> deleteMntTeamMemberStatByIds(@PathVariable String ids) {
        mntTeamMemberStatService.deleteMntTeamMemberStatByIds(ids);
        Map<String, Object> map = new HashMap<>();
        map.put("status", "1");
        return map;
    }
    
    /**
     * 根据主键查询团队成员统计详细信息
     * @param model
     * @return
     */
    @RequestMapping("/week/{id}/page")
    public String queryMntTeamMemberStatById(Model model, @PathVariable String id) {
        MntTeamMemberStat mntTeamMemberStat = new MntTeamMemberStat();
        mntTeamMemberStat.setId(Integer.parseInt(id));
        List<MntTeamMemberStat> mntTeamMemberStatList = mntTeamMemberStatService.findMntTeamMemberStatList(mntTeamMemberStat);
        if(mntTeamMemberStatList != null && mntTeamMemberStatList.size() > 0) { //只会有一条数据
            model.addAttribute("mntTeamMemberStat", mntTeamMemberStatList.get(0));
        }
        return "report/week/report_week_info";
    }
}
