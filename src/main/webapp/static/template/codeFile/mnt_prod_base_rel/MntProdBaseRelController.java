package com.ai.mnt.web.inst;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ai.mnt.model.inst.MntProdBaseRel;
import com.ai.mnt.service.inst.MntProdBaseRelService;

/**
 * @Title: MntProdBaseRelController 
 * @Description: MntProdBaseRelController ControllerPackage
 * @Author: Auto Generate.
 * @Date: 2016-10-13
 */

@Controller
@RequestMapping("/inst")
public class MntProdBaseRelController {

    @Autowired
    MntProdBaseRelService mntProdBaseRelService;
    
    /**
     * 产品安装点映射界面跳转
     * @param  model
     * @return String
     */
    @RequestMapping("/prodbase/page")
    public String showMntProdBaseRelPage(Model model) {
        return "inst/prodbase/inst_prodbase_query";
    }
    
    /**
     * 获取产品安装点映射列表
     * @param mntProdBaseRel
     * @return Map<String, Object>
     */
    @RequestMapping("/prodbase/query")
    @ResponseBody
    public Map<String, Object> getMntProdBaseRelList(MntProdBaseRel mntProdBaseRel) {
        List<MntProdBaseRel> mntProdBaseRelList = mntProdBaseRelService.findMntProdBaseRelList(mntProdBaseRel);
        Map<String, Object> map = new HashMap<>();
        map.put("data", mntProdBaseRelList);
        map.put("status", "1");
        return map;
    }
    
    /**
     * 产品安装点映射新增界面跳转
     * @param  model
     * @return String
     */
    @RequestMapping("/prodbase/add_page")
    public String showMntProdBaseRelAddPage(Model model) {
        return "inst/prodbase/inst_prodbase_add";
    }
    
    /**
     * 产品安装点映射保存
     * @param mntProdBaseRel
     * @return Map<String, Object>
     */
    @RequestMapping("/prodbase/add")
    @ResponseBody
    public Map<String, Object> saveMntProdBaseRel(MntProdBaseRel mntProdBaseRel) {
        mntProdBaseRelService.saveMntProdBaseRel(mntProdBaseRel);
        Map<String, Object> map = new HashMap<>();
        map.put("status", "1");
        return map;
    }
    
    /**
     * 产品安装点映射更新界面跳转
     * @param  model
     * @param  id
     * @return
     */
    @RequestMapping("/prodbase/update_page/{id}")
    public String showMntProdBaseRelUpdatePage(Model model, @PathVariable String id) {
        MntProdBaseRel mntProdBaseRel = mntProdBaseRelService.findMntProdBaseRelById(Integer.parseInt(id));
        model.addAttribute("mntProdBaseRel", mntProdBaseRel);
        return "inst/prodbase/inst_prodbase_update";
    }
    
    /**
     * 产品安装点映射根据主键更新
     * @param mntProdBaseRel
     * @return
     */
    @RequestMapping("/prodbase/update")
    @ResponseBody
    public Map<String, Object> updateMntProdBaseRel(MntProdBaseRel mntProdBaseRel) {
        mntProdBaseRelService.updateMntProdBaseRelById(mntProdBaseRel);
        Map<String, Object> map = new HashMap<>();
        map.put("status", "1");
        return map;
    }
    
    /**
     * 产品安装点映射根据主键批量删除
     * @param ids
     * @return Map<String, Object>
     */
    @RequestMapping("/prodbase/delete/{ids}")
    @ResponseBody
    public Map<String, Object> deleteMntProdBaseRelByIds(@PathVariable String ids) {
        mntProdBaseRelService.deleteMntProdBaseRelByIds(ids);
        Map<String, Object> map = new HashMap<>();
        map.put("status", "1");
        return map;
    }
    
    /**
     * 根据主键查询产品安装点映射详细信息
     * @param model
     * @return
     */
    @RequestMapping("/prodbase/{id}/page")
    public String queryMntProdBaseRelById(Model model, @PathVariable String id) {
        MntProdBaseRel mntProdBaseRel = new MntProdBaseRel();
        mntProdBaseRel.setId(Integer.parseInt(id));
        List<MntProdBaseRel> mntProdBaseRelList = mntProdBaseRelService.findMntProdBaseRelList(mntProdBaseRel);
        if(mntProdBaseRelList != null && mntProdBaseRelList.size() > 0) { //只会有一条数据
            model.addAttribute("mntProdBaseRel", mntProdBaseRelList.get(0));
        }
        return "inst/prodbase/inst_prodbase_info";
    }
}
