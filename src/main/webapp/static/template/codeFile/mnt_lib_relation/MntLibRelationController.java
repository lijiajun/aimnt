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

import com.ai.mnt.model.product.MntLibRelation;
import com.ai.mnt.service.product.MntLibRelationService;

/**
 * @Title: MntLibRelationController 
 * @Description: MntLibRelationController ControllerPackage
 * @Author: Auto Generate. HE
 * @Date: 2016-5-20
 */

@Controller
@RequestMapping("/product")
public class MntLibRelationController {

    @Autowired
    MntLibRelationService mntLibRelationService;
    
    /**
     * 库文件关联信息界面跳转
     * @param  model
     * @return String
     */
    @RequestMapping("/lib_relation/page")
    public String showMntLibRelationPage(Model model) {
        return "product/lib_relation/product_lib_relation_query";
    }
    
    /**
     * 获取库文件关联信息列表
     * @param mntLibRelation
     * @return Map<String, Object>
     */
    @RequestMapping("/lib_relation/query")
    @ResponseBody
    public Map<String, Object> getMntLibRelationList(MntLibRelation mntLibRelation) {
        List<MntLibRelation> mntLibRelationList = mntLibRelationService.findMntLibRelationList(mntLibRelation);
        Map<String, Object> map = new HashMap<>();
        map.put("data", mntLibRelationList);
        map.put("status", "1");
        return map;
    }
    
    /**
     * 库文件关联信息新增界面跳转
     * @param  model
     * @return String
     */
    @RequestMapping("/lib_relation/add_page")
    public String showMntLibRelationAddPage(Model model) {
        return "product/lib_relation/product_lib_relation_add";
    }
    
    /**
     * 库文件关联信息保存
     * @param mntLibRelation
     * @return Map<String, Object>
     */
    @RequestMapping("/lib_relation/add")
    @ResponseBody
    public Map<String, Object> saveMntLibRelation(MntLibRelation mntLibRelation) {
        mntLibRelationService.saveMntLibRelation(mntLibRelation);
        Map<String, Object> map = new HashMap<>();
        map.put("status", "1");
        return map;
    }
    
    /**
     * 库文件关联信息更新界面跳转
     * @param  model
     * @param  id
     * @return
     */
    @RequestMapping("/lib_relation/update_page/{id}")
    public String showMntLibRelationUpdatePage(Model model, @PathVariable String id) {
        MntLibRelation mntLibRelation = mntLibRelationService.findMntLibRelationById(Integer.parseInt(id));
        model.addAttribute("mntLibRelation", mntLibRelation);
        return "product/lib_relation/product_lib_relation_update";
    }
    
    /**
     * 库文件关联信息根据主键更新
     * @param mntLibRelation
     * @return
     */
    @RequestMapping("/lib_relation/update")
    @ResponseBody
    public Map<String, Object> updateMntLibRelation(MntLibRelation mntLibRelation) {
        mntLibRelationService.updateMntLibRelationById(mntLibRelation);
        Map<String, Object> map = new HashMap<>();
        map.put("status", "1");
        return map;
    }
    
    /**
     * 库文件关联信息根据主键批量删除
     * @param ids
     * @return Map<String, Object>
     */
    @RequestMapping("/lib_relation/delete/{ids}")
    @ResponseBody
    public Map<String, Object> deleteMntLibRelationByIds(@PathVariable String ids) {
        mntLibRelationService.deleteMntLibRelationByIds(ids);
        Map<String, Object> map = new HashMap<>();
        map.put("status", "1");
        return map;
    }
    
    /**
     * 根据主键查询库文件关联信息详细信息
     * @param model
     * @return
     */
    @RequestMapping("/lib_relation/{id}/page")
    public String queryMntLibRelationById(Model model, @PathVariable String id) {
        MntLibRelation mntLibRelation = new MntLibRelation();
        mntLibRelation.setId(Integer.parseInt(id));
        List<MntLibRelation> mntLibRelationList = mntLibRelationService.findMntLibRelationList(mntLibRelation);
        if(mntLibRelationList != null && mntLibRelationList.size() > 0) { //只会有一条数据
            model.addAttribute("mntLibRelation", mntLibRelationList.get(0));
        }
        return "product/lib_relation/product_lib_relation_info";
    }
}
