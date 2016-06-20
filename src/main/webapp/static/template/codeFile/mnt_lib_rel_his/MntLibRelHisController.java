package com.ai.mnt.web.product;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ai.mnt.model.product.MntLibRelHis;
import com.ai.mnt.service.product.MntLibRelHisService;

/**
 * @Title: MntLibRelHisController 
 * @Description: MntLibRelHisController ControllerPackage
 * @Author: Auto Generate. HE
 * @Date: 2016-5-17
 */

@Controller
@RequestMapping("/product")
public class MntLibRelHisController {

    @Autowired
    MntLibRelHisService mntLibRelHisService;
    
    /**
     * 库文件发布历史明细界面跳转
     * @param  model
     * @return String
     */
    @RequestMapping("/rel_his/page")
    public String showMntLibRelHisPage(Model model) {
        return "product/rel_his/product_rel_his_query";
    }
    
    /**
     * 获取库文件发布历史明细列表
     * @param mntLibRelHis
     * @return Map<String, Object>
     */
    @RequestMapping("/rel_his/query")
    @ResponseBody
    public Map<String, Object> getMntLibRelHisList(MntLibRelHis mntLibRelHis) {
        List<MntLibRelHis> mntLibRelHisList = mntLibRelHisService.findMntLibRelHisList(mntLibRelHis);
        Map<String, Object> map = new HashMap<>();
        map.put("data", mntLibRelHisList);
        map.put("status", "1");
        return map;
    }
    
    /**
     * 库文件发布历史明细新增界面跳转
     * @param  model
     * @return String
     */
    @RequestMapping("/rel_his/add_page")
    public String showMntLibRelHisAddPage(Model model) {
        return "product/rel_his/product_rel_his_add";
    }
    
    /**
     * 库文件发布历史明细保存
     * @param mntLibRelHis
     * @return Map<String, Object>
     */
    @RequestMapping("/rel_his/add")
    @ResponseBody
    public Map<String, Object> saveMntLibRelHis(MntLibRelHis mntLibRelHis) {
        mntLibRelHisService.saveMntLibRelHis(mntLibRelHis);
        Map<String, Object> map = new HashMap<>();
        map.put("status", "1");
        return map;
    }
    
    /**
     * 库文件发布历史明细更新界面跳转
     * @param  model
     * @param  id
     * @return
     */
    @RequestMapping("/rel_his/update_page/{id}")
    public String showMntLibRelHisUpdatePage(Model model, @PathVariable String id) {
        MntLibRelHis mntLibRelHis = mntLibRelHisService.findMntLibRelHisById(Integer.parseInt(id));
        model.addAttribute("mntLibRelHis", mntLibRelHis);
        return "product/rel_his/product_rel_his_update";
    }
    
    /**
     * 库文件发布历史明细根据主键更新
     * @param mntLibRelHis
     * @return
     */
    @RequestMapping("/rel_his/update")
    @ResponseBody
    public Map<String, Object> updateMntLibRelHis(MntLibRelHis mntLibRelHis) {
        mntLibRelHisService.updateMntLibRelHisById(mntLibRelHis);
        Map<String, Object> map = new HashMap<>();
        map.put("status", "1");
        return map;
    }
    
    /**
     * 库文件发布历史明细根据主键批量删除
     * @param ids
     * @return Map<String, Object>
     */
    @RequestMapping("/rel_his/delete/{ids}")
    @ResponseBody
    public Map<String, Object> deleteMntLibRelHisByIds(@PathVariable String ids) {
        mntLibRelHisService.deleteMntLibRelHisByIds(ids);
        Map<String, Object> map = new HashMap<>();
        map.put("status", "1");
        return map;
    }
    
    /**
     * 根据主键查询库文件发布历史明细详细信息
     * @param model
     * @return
     */
    @RequestMapping("/rel_his/{id}/page")
    public String queryMntLibRelHisById(Model model, @PathVariable String id) {
        MntLibRelHis mntLibRelHis = new MntLibRelHis();
        mntLibRelHis.setId(Integer.parseInt(id));
        List<MntLibRelHis> mntLibRelHisList = mntLibRelHisService.findMntLibRelHisList(mntLibRelHis);
        if(mntLibRelHisList != null && mntLibRelHisList.size() > 0) { //只会有一条数据
            model.addAttribute("mntLibRelHis", mntLibRelHisList.get(0));
        }
        return "product/rel_his/product_rel_his_info";
    }
}
