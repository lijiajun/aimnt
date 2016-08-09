package com.ai.mnt.web.rel;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ai.mnt.model.rel.MntProdRelPlan;
import com.ai.mnt.service.rel.MntProdRelPlanService;

/**
 * @Title: MntProdRelPlanController 
 * @Description: MntProdRelPlanController ControllerPackage
 * @Author: Auto Generate.
 * @Date: 2016-7-28
 */

@Controller
@RequestMapping("/rel")
public class MntProdRelPlanController {

    @Autowired
    MntProdRelPlanService mntProdRelPlanService;
    
    /**
     * 发布计划界面跳转
     * @param  model
     * @return String
     */
    @RequestMapping("/plan/page")
    public String showMntProdRelPlanPage(Model model) {
        return "rel/plan/rel_plan_query";
    }
    
    /**
     * 获取发布计划列表
     * @param mntProdRelPlan
     * @return Map<String, Object>
     */
    @RequestMapping("/plan/query")
    @ResponseBody
    public Map<String, Object> getMntProdRelPlanList(MntProdRelPlan mntProdRelPlan) {
        List<MntProdRelPlan> mntProdRelPlanList = mntProdRelPlanService.findMntProdRelPlanList(mntProdRelPlan);
        Map<String, Object> map = new HashMap<>();
        map.put("data", mntProdRelPlanList);
        map.put("status", "1");
        return map;
    }
    
    /**
     * 发布计划新增界面跳转
     * @param  model
     * @return String
     */
    @RequestMapping("/plan/add_page")
    public String showMntProdRelPlanAddPage(Model model) {
        return "rel/plan/rel_plan_add";
    }
    
    /**
     * 发布计划保存
     * @param mntProdRelPlan
     * @return Map<String, Object>
     */
    @RequestMapping("/plan/add")
    @ResponseBody
    public Map<String, Object> saveMntProdRelPlan(MntProdRelPlan mntProdRelPlan) {
        mntProdRelPlanService.saveMntProdRelPlan(mntProdRelPlan);
        Map<String, Object> map = new HashMap<>();
        map.put("status", "1");
        return map;
    }
    
    /**
     * 发布计划更新界面跳转
     * @param  model
     * @param  id
     * @return
     */
    @RequestMapping("/plan/update_page/{id}")
    public String showMntProdRelPlanUpdatePage(Model model, @PathVariable String id) {
        MntProdRelPlan mntProdRelPlan = mntProdRelPlanService.findMntProdRelPlanById(Integer.parseInt(id));
        model.addAttribute("mntProdRelPlan", mntProdRelPlan);
        return "rel/plan/rel_plan_update";
    }
    
    /**
     * 发布计划根据主键更新
     * @param mntProdRelPlan
     * @return
     */
    @RequestMapping("/plan/update")
    @ResponseBody
    public Map<String, Object> updateMntProdRelPlan(MntProdRelPlan mntProdRelPlan) {
        mntProdRelPlanService.updateMntProdRelPlanById(mntProdRelPlan);
        Map<String, Object> map = new HashMap<>();
        map.put("status", "1");
        return map;
    }
    
    /**
     * 发布计划根据主键批量删除
     * @param ids
     * @return Map<String, Object>
     */
    @RequestMapping("/plan/delete/{ids}")
    @ResponseBody
    public Map<String, Object> deleteMntProdRelPlanByIds(@PathVariable String ids) {
        mntProdRelPlanService.deleteMntProdRelPlanByIds(ids);
        Map<String, Object> map = new HashMap<>();
        map.put("status", "1");
        return map;
    }
    
    /**
     * 根据主键查询发布计划详细信息
     * @param model
     * @return
     */
    @RequestMapping("/plan/{id}/page")
    public String queryMntProdRelPlanById(Model model, @PathVariable String id) {
        MntProdRelPlan mntProdRelPlan = new MntProdRelPlan();
        mntProdRelPlan.setId(Integer.parseInt(id));
        List<MntProdRelPlan> mntProdRelPlanList = mntProdRelPlanService.findMntProdRelPlanList(mntProdRelPlan);
        if(mntProdRelPlanList != null && mntProdRelPlanList.size() > 0) { //只会有一条数据
            model.addAttribute("mntProdRelPlan", mntProdRelPlanList.get(0));
        }
        return "rel/plan/rel_plan_info";
    }
}
