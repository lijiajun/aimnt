package com.ai.mnt.web.sys;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ai.mnt.common.cache.BaseDataCache;
import com.ai.mnt.model.common.EnumObject;
import com.ai.mnt.model.sys.SysResource;
import com.ai.mnt.model.sys.SysResourceTree;
import com.ai.mnt.service.sys.SysResourceService;


@Controller
@RequestMapping("/sys")
public class SysResourceController {

    @Autowired
    SysResourceService sysResourceService;
    
    /**
     * 资源管理界面跳转
     * @return
     */
    @RequestMapping("/res/page")
    public String showSysResourcePage() {
        return "sys/resource/sys_resource";
    }
    
    /**
     * 获取资源树对象列表
     * @param sysResource
     * @return
     */
    @RequestMapping("/res/query/tree")
    @ResponseBody
    public List<SysResourceTree> getSysResourceTreeList(SysResource sysResource) {
        List<SysResourceTree> treeList = sysResourceService.getSysResourceTreeList(sysResource);
        return treeList;
    }
    
    /**
     * 获取资源列表
     * @param sysResource
     * @return
     */
    @RequestMapping("/res/query")
    @ResponseBody
    public Map<String, Object> getSysResourceList(SysResource sysResource) {
        List<SysResource> sysResourceList = sysResourceService.findAllSysResource(sysResource);
        Map<String, Object> map = new HashMap<>();
        map.put("data", sysResourceList);
        map.put("status", "1");
        return map;
    }
    
    /**
     * 资源新增界面跳转
     * @return
     */
    @RequiresPermissions("auth:operate")
    @RequestMapping("/res/page_add")
    public String showSysResourceAddPage(Model model) {
        List<EnumObject> resStsEnums = BaseDataCache.getDataList("RES_STS");
        List<EnumObject> resTypeEnums = BaseDataCache.getDataList("RES_TYPE");
        List<EnumObject> resIdEnums = BaseDataCache.getDataList("SYS_RESOURCE");
        model.addAttribute("resStsEnums", resStsEnums);
        model.addAttribute("resTypeEnums", resTypeEnums);
        model.addAttribute("resIdEnums", resIdEnums);
        return "sys/resource/sys_resource_add";
    }
    
    /**
     * 新增资源
     * @param sysResource
     * @return
     */
    @RequiresPermissions("auth:operate")
    @RequestMapping("/res/add")
    @ResponseBody
    public Map<String, String> saveSysResource(SysResource sysResource) {
        sysResourceService.saveSysResource(sysResource);

        Map<String, String> map = new HashMap<>();
        map.put("status", "1");
        return map;
    }
    
    /**
     * 更新资源界面跳转
     * @param model
     * @return
     */
    @RequiresPermissions("auth:operate")
    @RequestMapping("/res/page_update/{resId}")
    public String showSysResourceUpdatePage(Model model, @PathVariable String resId) {
        SysResource sysResource = sysResourceService.findSysResourceByResId(Integer.parseInt(resId));
        
        List<EnumObject> resStsEnums = BaseDataCache.getDataList("RES_STS");
        List<EnumObject> resTypeEnums = BaseDataCache.getDataList("RES_TYPE");
        List<EnumObject> resIdEnums = BaseDataCache.getDataList("SYS_RESOURCE");
        model.addAttribute("resStsEnums", resStsEnums);
        model.addAttribute("resTypeEnums", resTypeEnums);
        model.addAttribute("resIdEnums", resIdEnums);
        model.addAttribute("sysResource", sysResource);
        
        return "sys/resource/sys_resource_update";
    }
    
    /**
     * 更新资源
     * @param sysResource
     * @return
     */
    @RequiresPermissions("auth:operate")
    @RequestMapping("/res/update")
    @ResponseBody
    public Map<String, String> updateSysResource(SysResource sysResource) {
        sysResourceService.updateSysResource(sysResource);

        Map<String, String> map = new HashMap<>();
        map.put("status", "1");
        return map;
    }
    
    /**
     * 删除资源
     * @param sysResource
     * @return
     */
    @RequiresPermissions("auth:operate")
    @RequestMapping("/res/delete/{resId}")
    @ResponseBody
    public Map<String, String> deleteSysResource(@PathVariable String resId) {
        
        String[] resIdAry = resId.split(",");
        for(String resIdTemp :resIdAry) {
            SysResource sysResource = new SysResource();
            sysResource.setResId(Integer.parseInt(resIdTemp));
            sysResource.setResSts("0"); //0 禁用
            sysResourceService.updateSysResource(sysResource);
        }

        Map<String, String> map = new HashMap<>();
        map.put("status", "1");
        return map;
    }
    
}
