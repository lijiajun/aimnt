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

import com.ai.mnt.model.report.MntProdTaskStat;
import com.ai.mnt.service.report.MntProdTaskStatService;

/**
 * @Title: MntProdTaskStatController 
 * @Description: MntProdTaskStatController ControllerPackage
 * @Author: Auto Generate.
 * @Date: 2016-7-27
 */

@Controller
@RequestMapping("/report")
public class MntProdTaskStatController {

    @Autowired
    MntProdTaskStatService mntProdTaskStatService;
    
    /**
     * 产品线任务统计界面跳转
     * @param  model
     * @return String
     */
    @RequestMapping("/week/page")
    public String showMntProdTaskStatPage(Model model) {
        return "report/week/report_week_query";
    }
    
    /**
     * 获取产品线任务统计列表
     * @param mntProdTaskStat
     * @return Map<String, Object>
     */
    @RequestMapping("/week/query")
    @ResponseBody
    public Map<String, Object> getMntProdTaskStatList(MntProdTaskStat mntProdTaskStat) {
        List<MntProdTaskStat> mntProdTaskStatList = mntProdTaskStatService.findMntProdTaskStatList(mntProdTaskStat);
        Map<String, Object> map = new HashMap<>();
        map.put("data", mntProdTaskStatList);
        map.put("status", "1");
        return map;
    }
    
    /**
     * 产品线任务统计新增界面跳转
     * @param  model
     * @return String
     */
    @RequestMapping("/week/add_page")
    public String showMntProdTaskStatAddPage(Model model) {
        return "report/week/report_week_add";
    }
    
    /**
     * 产品线任务统计保存
     * @param mntProdTaskStat
     * @return Map<String, Object>
     */
    @RequestMapping("/week/add")
    @ResponseBody
    public Map<String, Object> saveMntProdTaskStat(MntProdTaskStat mntProdTaskStat) {
        mntProdTaskStatService.saveMntProdTaskStat(mntProdTaskStat);
        Map<String, Object> map = new HashMap<>();
        map.put("status", "1");
        return map;
    }
    
    /**
     * 产品线任务统计更新界面跳转
     * @param  model
     * @param  id
     * @return
     */
    @RequestMapping("/week/update_page/{id}")
    public String showMntProdTaskStatUpdatePage(Model model, @PathVariable String id) {
        MntProdTaskStat mntProdTaskStat = mntProdTaskStatService.findMntProdTaskStatById(Integer.parseInt(id));
        model.addAttribute("mntProdTaskStat", mntProdTaskStat);
        return "report/week/report_week_update";
    }
    
    /**
     * 产品线任务统计根据主键更新
     * @param mntProdTaskStat
     * @return
     */
    @RequestMapping("/week/update")
    @ResponseBody
    public Map<String, Object> updateMntProdTaskStat(MntProdTaskStat mntProdTaskStat) {
        mntProdTaskStatService.updateMntProdTaskStatById(mntProdTaskStat);
        Map<String, Object> map = new HashMap<>();
        map.put("status", "1");
        return map;
    }
    
    /**
     * 产品线任务统计根据主键批量删除
     * @param ids
     * @return Map<String, Object>
     */
    @RequestMapping("/week/delete/{ids}")
    @ResponseBody
    public Map<String, Object> deleteMntProdTaskStatByIds(@PathVariable String ids) {
        mntProdTaskStatService.deleteMntProdTaskStatByIds(ids);
        Map<String, Object> map = new HashMap<>();
        map.put("status", "1");
        return map;
    }
    
    /**
     * 根据主键查询产品线任务统计详细信息
     * @param model
     * @return
     */
    @RequestMapping("/week/{id}/page")
    public String queryMntProdTaskStatById(Model model, @PathVariable String id) {
        MntProdTaskStat mntProdTaskStat = new MntProdTaskStat();
        mntProdTaskStat.setId(Integer.parseInt(id));
        List<MntProdTaskStat> mntProdTaskStatList = mntProdTaskStatService.findMntProdTaskStatList(mntProdTaskStat);
        if(mntProdTaskStatList != null && mntProdTaskStatList.size() > 0) { //只会有一条数据
            model.addAttribute("mntProdTaskStat", mntProdTaskStatList.get(0));
        }
        return "report/week/report_week_info";
    }
}
