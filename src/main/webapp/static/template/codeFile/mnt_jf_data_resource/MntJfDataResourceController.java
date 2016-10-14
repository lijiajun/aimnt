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

import com.ai.mnt.model.inst.MntJfDataResource;
import com.ai.mnt.service.inst.MntJfDataResourceService;

/**
 * @Title: MntJfDataResourceController 
 * @Description: MntJfDataResourceController ControllerPackage
 * @Author: Auto Generate.
 * @Date: 2016-10-13
 */

@Controller
@RequestMapping("/inst")
public class MntJfDataResourceController {

    @Autowired
    MntJfDataResourceService mntJfDataResourceService;
    
    /**
     * 计费数据源界面跳转
     * @param  model
     * @return String
     */
    @RequestMapping("/jf_ds/page")
    public String showMntJfDataResourcePage(Model model) {
        return "inst/jf_ds/inst_jf_ds_query";
    }
    
    /**
     * 获取计费数据源列表
     * @param mntJfDataResource
     * @return Map<String, Object>
     */
    @RequestMapping("/jf_ds/query")
    @ResponseBody
    public Map<String, Object> getMntJfDataResourceList(MntJfDataResource mntJfDataResource) {
        List<MntJfDataResource> mntJfDataResourceList = mntJfDataResourceService.findMntJfDataResourceList(mntJfDataResource);
        Map<String, Object> map = new HashMap<>();
        map.put("data", mntJfDataResourceList);
        map.put("status", "1");
        return map;
    }
    
    /**
     * 计费数据源新增界面跳转
     * @param  model
     * @return String
     */
    @RequestMapping("/jf_ds/add_page")
    public String showMntJfDataResourceAddPage(Model model) {
        return "inst/jf_ds/inst_jf_ds_add";
    }
    
    /**
     * 计费数据源保存
     * @param mntJfDataResource
     * @return Map<String, Object>
     */
    @RequestMapping("/jf_ds/add")
    @ResponseBody
    public Map<String, Object> saveMntJfDataResource(MntJfDataResource mntJfDataResource) {
        mntJfDataResourceService.saveMntJfDataResource(mntJfDataResource);
        Map<String, Object> map = new HashMap<>();
        map.put("status", "1");
        return map;
    }
    
    /**
     * 计费数据源更新界面跳转
     * @param  model
     * @param  id
     * @return
     */
    @RequestMapping("/jf_ds/update_page/{id}")
    public String showMntJfDataResourceUpdatePage(Model model, @PathVariable String id) {
        MntJfDataResource mntJfDataResource = mntJfDataResourceService.findMntJfDataResourceById(Integer.parseInt(id));
        model.addAttribute("mntJfDataResource", mntJfDataResource);
        return "inst/jf_ds/inst_jf_ds_update";
    }
    
    /**
     * 计费数据源根据主键更新
     * @param mntJfDataResource
     * @return
     */
    @RequestMapping("/jf_ds/update")
    @ResponseBody
    public Map<String, Object> updateMntJfDataResource(MntJfDataResource mntJfDataResource) {
        mntJfDataResourceService.updateMntJfDataResourceById(mntJfDataResource);
        Map<String, Object> map = new HashMap<>();
        map.put("status", "1");
        return map;
    }
    
    /**
     * 计费数据源根据主键批量删除
     * @param ids
     * @return Map<String, Object>
     */
    @RequestMapping("/jf_ds/delete/{ids}")
    @ResponseBody
    public Map<String, Object> deleteMntJfDataResourceByIds(@PathVariable String ids) {
        mntJfDataResourceService.deleteMntJfDataResourceByIds(ids);
        Map<String, Object> map = new HashMap<>();
        map.put("status", "1");
        return map;
    }
    
    /**
     * 根据主键查询计费数据源详细信息
     * @param model
     * @return
     */
    @RequestMapping("/jf_ds/{id}/page")
    public String queryMntJfDataResourceById(Model model, @PathVariable String id) {
        MntJfDataResource mntJfDataResource = new MntJfDataResource();
        mntJfDataResource.setId(Integer.parseInt(id));
        List<MntJfDataResource> mntJfDataResourceList = mntJfDataResourceService.findMntJfDataResourceList(mntJfDataResource);
        if(mntJfDataResourceList != null && mntJfDataResourceList.size() > 0) { //只会有一条数据
            model.addAttribute("mntJfDataResource", mntJfDataResourceList.get(0));
        }
        return "inst/jf_ds/inst_jf_ds_info";
    }
}
