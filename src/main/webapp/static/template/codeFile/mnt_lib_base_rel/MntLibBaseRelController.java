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

import com.ai.mnt.model.product.MntLibBaseRel;
import com.ai.mnt.service.product.MntLibBaseRelService;

/**
 * @Title: MntLibBaseRelController 
 * @Description: MntLibBaseRelController ControllerPackage
 * @Author: Auto Generate. HE
 * @Date: 2016-5-19
 */

@Controller
@RequestMapping("/product")
public class MntLibBaseRelController {

    @Autowired
    MntLibBaseRelService mntLibBaseRelService;
    
    /**
     * 库文件历史安装点关联表界面跳转
     * @param  model
     * @return String
     */
    @RequestMapping("/lib_base/page")
    public String showMntLibBaseRelPage(Model model) {
        return "product/lib_base/product_lib_base_query";
    }
    
    /**
     * 获取库文件历史安装点关联表列表
     * @param mntLibBaseRel
     * @return Map<String, Object>
     */
    @RequestMapping("/lib_base/query")
    @ResponseBody
    public Map<String, Object> getMntLibBaseRelList(MntLibBaseRel mntLibBaseRel) {
        List<MntLibBaseRel> mntLibBaseRelList = mntLibBaseRelService.findMntLibBaseRelList(mntLibBaseRel);
        Map<String, Object> map = new HashMap<>();
        map.put("data", mntLibBaseRelList);
        map.put("status", "1");
        return map;
    }
    
    /**
     * 库文件历史安装点关联表新增界面跳转
     * @param  model
     * @return String
     */
    @RequestMapping("/lib_base/add_page")
    public String showMntLibBaseRelAddPage(Model model) {
        return "product/lib_base/product_lib_base_add";
    }
    
    /**
     * 库文件历史安装点关联表保存
     * @param mntLibBaseRel
     * @return Map<String, Object>
     */
    @RequestMapping("/lib_base/add")
    @ResponseBody
    public Map<String, Object> saveMntLibBaseRel(MntLibBaseRel mntLibBaseRel) {
        mntLibBaseRelService.saveMntLibBaseRel(mntLibBaseRel);
        Map<String, Object> map = new HashMap<>();
        map.put("status", "1");
        return map;
    }
    
    /**
     * 库文件历史安装点关联表更新界面跳转
     * @param  model
     * @param  id
     * @return
     */
    @RequestMapping("/lib_base/update_page/{id}")
    public String showMntLibBaseRelUpdatePage(Model model, @PathVariable String id) {
        MntLibBaseRel mntLibBaseRel = mntLibBaseRelService.findMntLibBaseRelById(Integer.parseInt(id));
        model.addAttribute("mntLibBaseRel", mntLibBaseRel);
        return "product/lib_base/product_lib_base_update";
    }
    
    /**
     * 库文件历史安装点关联表根据主键更新
     * @param mntLibBaseRel
     * @return
     */
    @RequestMapping("/lib_base/update")
    @ResponseBody
    public Map<String, Object> updateMntLibBaseRel(MntLibBaseRel mntLibBaseRel) {
        mntLibBaseRelService.updateMntLibBaseRelById(mntLibBaseRel);
        Map<String, Object> map = new HashMap<>();
        map.put("status", "1");
        return map;
    }
    
    /**
     * 库文件历史安装点关联表根据主键批量删除
     * @param ids
     * @return Map<String, Object>
     */
    @RequestMapping("/lib_base/delete/{ids}")
    @ResponseBody
    public Map<String, Object> deleteMntLibBaseRelByIds(@PathVariable String ids) {
        mntLibBaseRelService.deleteMntLibBaseRelByIds(ids);
        Map<String, Object> map = new HashMap<>();
        map.put("status", "1");
        return map;
    }
    
    /**
     * 根据主键查询库文件历史安装点关联表详细信息
     * @param model
     * @return
     */
    @RequestMapping("/lib_base/{id}/page")
    public String queryMntLibBaseRelById(Model model, @PathVariable String id) {
        MntLibBaseRel mntLibBaseRel = new MntLibBaseRel();
        mntLibBaseRel.setId(Integer.parseInt(id));
        List<MntLibBaseRel> mntLibBaseRelList = mntLibBaseRelService.findMntLibBaseRelList(mntLibBaseRel);
        if(mntLibBaseRelList != null && mntLibBaseRelList.size() > 0) { //只会有一条数据
            model.addAttribute("mntLibBaseRel", mntLibBaseRelList.get(0));
        }
        return "product/lib_base/product_lib_base_info";
    }
}
