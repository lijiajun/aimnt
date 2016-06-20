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

import com.ai.mnt.model.product.MntModuleLib;
import com.ai.mnt.service.product.MntModuleLibService;

/**
 * @Title: MntModuleLibController 
 * @Description: MntModuleLibController ControllerPackage
 * @Author: Auto Generate. HE
 * @Date: 2016-5-12
 */

@Controller
@RequestMapping("/product")
public class MntModuleLibController {

    @Autowired
    MntModuleLibService mntModuleLibService;
    
    /**
     * 库文件信息界面跳转
     * @param  model
     * @return String
     */
    @RequestMapping("/lib/page")
    public String showMntModuleLibPage(Model model) {
        return "product/lib/product_lib_query";
    }
    
    /**
     * 获取库文件信息列表
     * @param mntModuleLib
     * @return Map<String, Object>
     */
    @RequestMapping("/lib/query")
    @ResponseBody
    public Map<String, Object> getMntModuleLibList(MntModuleLib mntModuleLib) {
        List<MntModuleLib> mntModuleLibList = mntModuleLibService.findMntModuleLibList(mntModuleLib);
        Map<String, Object> map = new HashMap<>();
        map.put("data", mntModuleLibList);
        map.put("status", "1");
        return map;
    }
    
    /**
     * 库文件信息新增界面跳转
     * @param  model
     * @return String
     */
    @RequestMapping("/lib/add_page")
    public String showMntModuleLibAddPage(Model model) {
        return "product/lib/product_lib_add";
    }
    
    /**
     * 库文件信息保存
     * @param mntModuleLib
     * @return Map<String, Object>
     */
    @RequestMapping("/lib/add")
    @ResponseBody
    public Map<String, Object> saveMntModuleLib(MntModuleLib mntModuleLib) {
        mntModuleLibService.saveMntModuleLib(mntModuleLib);
        Map<String, Object> map = new HashMap<>();
        map.put("status", "1");
        return map;
    }
    
    /**
     * 库文件信息更新界面跳转
     * @param  model
     * @param  libId
     * @return
     */
    @RequestMapping("/lib/update_page/{libId}")
    public String showMntModuleLibUpdatePage(Model model, @PathVariable String libId) {
        MntModuleLib mntModuleLib = mntModuleLibService.findMntModuleLibByLibId(Integer.parseInt(libId));
        model.addAttribute("mntModuleLib", mntModuleLib);
        return "product/lib/product_lib_update";
    }
    
    /**
     * 库文件信息根据主键更新
     * @param mntModuleLib
     * @return
     */
    @RequestMapping("/lib/update")
    @ResponseBody
    public Map<String, Object> updateMntModuleLib(MntModuleLib mntModuleLib) {
        mntModuleLibService.updateMntModuleLibByLibId(mntModuleLib);
        Map<String, Object> map = new HashMap<>();
        map.put("status", "1");
        return map;
    }
    
    /**
     * 库文件信息根据主键批量删除
     * @param libIds
     * @return Map<String, Object>
     */
    @RequestMapping("/lib/delete/{libIds}")
    @ResponseBody
    public Map<String, Object> deleteMntModuleLibByLibIds(@PathVariable String libIds) {
        mntModuleLibService.deleteMntModuleLibByLibIds(libIds);
        Map<String, Object> map = new HashMap<>();
        map.put("status", "1");
        return map;
    }
    
    /**
     * 根据主键查询库文件信息详细信息
     * @param model
     * @return
     */
    @RequestMapping("/lib/{libId}/page")
    public String queryMntModuleLibByLibId(Model model, @PathVariable String libId) {
        MntModuleLib mntModuleLib = new MntModuleLib();
        mntModuleLib.setLibId(Integer.parseInt(libId));
        List<MntModuleLib> mntModuleLibList = mntModuleLibService.findMntModuleLibList(mntModuleLib);
        if(mntModuleLibList != null && mntModuleLibList.size() > 0) { //只会有一条数据
            model.addAttribute("mntModuleLib", mntModuleLibList.get(0));
        }
        return "product/lib/product_lib_info";
    }
}
