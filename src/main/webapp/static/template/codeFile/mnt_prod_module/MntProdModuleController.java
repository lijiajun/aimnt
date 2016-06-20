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

import com.ai.mnt.model.product.MntProdModule;
import com.ai.mnt.service.product.MntProdModuleService;

/**
 * @Title: MntProdModuleController 
 * @Description: MntProdModuleController ControllerPackage
 * @Author: Auto Generate. HE
 * @Date: 2016-5-11
 */

@Controller
@RequestMapping("/product")
public class MntProdModuleController {

    @Autowired
    MntProdModuleService mntProdModuleService;
    
    /**
     * 产品功能模块信息界面跳转
     * @param  model
     * @return String
     */
    @RequestMapping("/module/page")
    public String showMntProdModulePage(Model model) {
        return "product/module/module_info";
    }
    
    /**
     * 获取产品功能模块信息列表
     * @param mntProdModule
     * @return Map<String, Object>
     */
    @RequestMapping("/module/query")
    @ResponseBody
    public Map<String, Object> getMntProdModuleList(MntProdModule mntProdModule) {
        List<MntProdModule> mntProdModuleList = mntProdModuleService.findMntProdModuleList(mntProdModule);
        Map<String, Object> map = new HashMap<>();
        map.put("data", mntProdModuleList);
        map.put("status", "1");
        return map;
    }
    
    /**
     * 产品功能模块信息新增界面跳转
     * @param  model
     * @return String
     */
    @RequestMapping("/module/add_page")
    public String showMntProdModuleAddPage(Model model) {
        return "product/module/module_add";
    }
    
    /**
     * 产品功能模块信息保存
     * @param mntProdModule
     * @return Map<String, Object>
     */
    @RequestMapping("/module/add")
    @ResponseBody
    public Map<String, Object> saveMntProdModule(MntProdModule mntProdModule) {
        mntProdModuleService.saveMntProdModule(mntProdModule);
        Map<String, Object> map = new HashMap<>();
        map.put("status", "1");
        return map;
    }
    
    /**
     * 产品功能模块信息更新界面跳转
     * @param  model
     * @param  moduleId
     * @return
     */
    @RequestMapping("/module/update_page/{moduleId}")
    public String showMntProdModuleUpdatePage(Model model, @PathVariable String moduleId) {
        MntProdModule mntProdModule = mntProdModuleService.findMntProdModuleByModuleId(Integer.parseInt(moduleId));
        model.addAttribute("mntProdModule", mntProdModule);
        return "product/module/module_update";
    }
    
    /**
     * 产品功能模块信息根据主键更新
     * @param mntProdModule
     * @return
     */
    @RequestMapping("/module/update")
    @ResponseBody
    public Map<String, Object> updateMntProdModule(MntProdModule mntProdModule) {
        mntProdModuleService.updateMntProdModuleByModuleId(mntProdModule);
        Map<String, Object> map = new HashMap<>();
        map.put("status", "1");
        return map;
    }
    
    /**
     * 产品功能模块信息根据主键批量删除
     * @param moduleIds
     * @return Map<String, Object>
     */
    @RequestMapping("/module/delete/{moduleIds}")
    @ResponseBody
    public Map<String, Object> deleteMntProdModuleByModuleIds(@PathVariable String moduleIds) {
        mntProdModuleService.deleteMntProdModuleByModuleIds(moduleIds);
        Map<String, Object> map = new HashMap<>();
        map.put("status", "1");
        return map;
    }
}
