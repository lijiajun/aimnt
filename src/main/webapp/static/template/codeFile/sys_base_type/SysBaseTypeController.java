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

import com.ai.mnt.model.product.SysBaseType;
import com.ai.mnt.service.product.SysBaseTypeService;

/**
 * @Title: SysBaseTypeController 
 * @Description: SysBaseTypeController ControllerPackage
 * @Author: Auto Generate. HE
 * @Date: 2016-5-23
 */

@Controller
@RequestMapping("/product")
public class SysBaseTypeController {

    @Autowired
    SysBaseTypeService sysBaseTypeService;
    
    /**
     * 系统枚举类型表界面跳转
     * @param  model
     * @return String
     */
    @RequestMapping("/sys_base_type/page")
    public String showSysBaseTypePage(Model model) {
        return "product/sys_base_type/product_sys_base_type_query";
    }
    
    /**
     * 获取系统枚举类型表列表
     * @param sysBaseType
     * @return Map<String, Object>
     */
    @RequestMapping("/sys_base_type/query")
    @ResponseBody
    public Map<String, Object> getSysBaseTypeList(SysBaseType sysBaseType) {
        List<SysBaseType> sysBaseTypeList = sysBaseTypeService.findSysBaseTypeList(sysBaseType);
        Map<String, Object> map = new HashMap<>();
        map.put("data", sysBaseTypeList);
        map.put("status", "1");
        return map;
    }
    
    /**
     * 系统枚举类型表新增界面跳转
     * @param  model
     * @return String
     */
    @RequestMapping("/sys_base_type/add_page")
    public String showSysBaseTypeAddPage(Model model) {
        return "product/sys_base_type/product_sys_base_type_add";
    }
    
    /**
     * 系统枚举类型表保存
     * @param sysBaseType
     * @return Map<String, Object>
     */
    @RequestMapping("/sys_base_type/add")
    @ResponseBody
    public Map<String, Object> saveSysBaseType(SysBaseType sysBaseType) {
        sysBaseTypeService.saveSysBaseType(sysBaseType);
        Map<String, Object> map = new HashMap<>();
        map.put("status", "1");
        return map;
    }
    
    /**
     * 系统枚举类型表更新界面跳转
     * @param  model
     * @param  id
     * @return
     */
    @RequestMapping("/sys_base_type/update_page/{id}")
    public String showSysBaseTypeUpdatePage(Model model, @PathVariable String id) {
        SysBaseType sysBaseType = sysBaseTypeService.findSysBaseTypeById(Integer.parseInt(id));
        model.addAttribute("sysBaseType", sysBaseType);
        return "product/sys_base_type/product_sys_base_type_update";
    }
    
    /**
     * 系统枚举类型表根据主键更新
     * @param sysBaseType
     * @return
     */
    @RequestMapping("/sys_base_type/update")
    @ResponseBody
    public Map<String, Object> updateSysBaseType(SysBaseType sysBaseType) {
        sysBaseTypeService.updateSysBaseTypeById(sysBaseType);
        Map<String, Object> map = new HashMap<>();
        map.put("status", "1");
        return map;
    }
    
    /**
     * 系统枚举类型表根据主键批量删除
     * @param ids
     * @return Map<String, Object>
     */
    @RequestMapping("/sys_base_type/delete/{ids}")
    @ResponseBody
    public Map<String, Object> deleteSysBaseTypeByIds(@PathVariable String ids) {
        sysBaseTypeService.deleteSysBaseTypeByIds(ids);
        Map<String, Object> map = new HashMap<>();
        map.put("status", "1");
        return map;
    }
    
    /**
     * 根据主键查询系统枚举类型表详细信息
     * @param model
     * @return
     */
    @RequestMapping("/sys_base_type/{id}/page")
    public String querySysBaseTypeById(Model model, @PathVariable String id) {
        SysBaseType sysBaseType = new SysBaseType();
        sysBaseType.setId(Integer.parseInt(id));
        List<SysBaseType> sysBaseTypeList = sysBaseTypeService.findSysBaseTypeList(sysBaseType);
        if(sysBaseTypeList != null && sysBaseTypeList.size() > 0) { //只会有一条数据
            model.addAttribute("sysBaseType", sysBaseTypeList.get(0));
        }
        return "product/sys_base_type/product_sys_base_type_info";
    }
}
