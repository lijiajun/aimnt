package com.ai.mnt.web.lib;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ai.mnt.model.lib.MntLibRelationExt;
import com.ai.mnt.service.lib.MntLibRelationExtService;

/**
 * @Title: MntLibRelationExtController 
 * @Description: MntLibRelationExtController ControllerPackage
 * @Author: Auto Generate.
 * @Date: 2016-7-11
 */

@Controller
@RequestMapping("/lib")
public class MntLibRelationExtController {

    @Autowired
    MntLibRelationExtService mntLibRelationExtService;
    
    /**
     * 库文件扩展关联信息界面跳转
     * @param  model
     * @return String
     */
    @RequestMapping("/relation/page")
    public String showMntLibRelationExtPage(Model model) {
        return "lib/relation/lib_relation_query";
    }
    
    /**
     * 获取库文件扩展关联信息列表
     * @param mntLibRelationExt
     * @return Map<String, Object>
     */
    @RequestMapping("/relation/query")
    @ResponseBody
    public Map<String, Object> getMntLibRelationExtList(MntLibRelationExt mntLibRelationExt) {
        List<MntLibRelationExt> mntLibRelationExtList = mntLibRelationExtService.findMntLibRelationExtList(mntLibRelationExt);
        Map<String, Object> map = new HashMap<>();
        map.put("data", mntLibRelationExtList);
        map.put("status", "1");
        return map;
    }
    
    /**
     * 库文件扩展关联信息新增界面跳转
     * @param  model
     * @return String
     */
    @RequestMapping("/relation/add_page")
    public String showMntLibRelationExtAddPage(Model model) {
        return "lib/relation/lib_relation_add";
    }
    
    /**
     * 库文件扩展关联信息保存
     * @param mntLibRelationExt
     * @return Map<String, Object>
     */
    @RequestMapping("/relation/add")
    @ResponseBody
    public Map<String, Object> saveMntLibRelationExt(MntLibRelationExt mntLibRelationExt) {
        mntLibRelationExtService.saveMntLibRelationExt(mntLibRelationExt);
        Map<String, Object> map = new HashMap<>();
        map.put("status", "1");
        return map;
    }
    
    /**
     * 库文件扩展关联信息更新界面跳转
     * @param  model
     * @param  id
     * @return
     */
    @RequestMapping("/relation/update_page/{id}")
    public String showMntLibRelationExtUpdatePage(Model model, @PathVariable String id) {
        MntLibRelationExt mntLibRelationExt = mntLibRelationExtService.findMntLibRelationExtById(Integer.parseInt(id));
        model.addAttribute("mntLibRelationExt", mntLibRelationExt);
        return "lib/relation/lib_relation_update";
    }
    
    /**
     * 库文件扩展关联信息根据主键更新
     * @param mntLibRelationExt
     * @return
     */
    @RequestMapping("/relation/update")
    @ResponseBody
    public Map<String, Object> updateMntLibRelationExt(MntLibRelationExt mntLibRelationExt) {
        mntLibRelationExtService.updateMntLibRelationExtById(mntLibRelationExt);
        Map<String, Object> map = new HashMap<>();
        map.put("status", "1");
        return map;
    }
    
    /**
     * 库文件扩展关联信息根据主键批量删除
     * @param ids
     * @return Map<String, Object>
     */
    @RequestMapping("/relation/delete/{ids}")
    @ResponseBody
    public Map<String, Object> deleteMntLibRelationExtByIds(@PathVariable String ids) {
        mntLibRelationExtService.deleteMntLibRelationExtByIds(ids);
        Map<String, Object> map = new HashMap<>();
        map.put("status", "1");
        return map;
    }
    
    /**
     * 根据主键查询库文件扩展关联信息详细信息
     * @param model
     * @return
     */
    @RequestMapping("/relation/{id}/page")
    public String queryMntLibRelationExtById(Model model, @PathVariable String id) {
        MntLibRelationExt mntLibRelationExt = new MntLibRelationExt();
        mntLibRelationExt.setId(Integer.parseInt(id));
        List<MntLibRelationExt> mntLibRelationExtList = mntLibRelationExtService.findMntLibRelationExtList(mntLibRelationExt);
        if(mntLibRelationExtList != null && mntLibRelationExtList.size() > 0) { //只会有一条数据
            model.addAttribute("mntLibRelationExt", mntLibRelationExtList.get(0));
        }
        return "lib/relation/lib_relation_info";
    }
}
