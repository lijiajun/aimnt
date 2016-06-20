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
import com.ai.mnt.model.sys.SysResourceTree;
import com.ai.mnt.model.sys.SysRole;
import com.ai.mnt.service.sys.SysRoleService;


@Controller
@RequestMapping("/sys")
public class SysRoleController {

    @Autowired
    SysRoleService sysRoleService;
    
    /**
     * 角色管理界面跳转
     * @return
     */
    @RequestMapping("/role/page")
    public String showSysResourcePage() {
        return "sys/role/sys_role";
    }
    
    /**
     * 获取角色列表
     * @param sysResource
     * @return
     */
    @RequestMapping("/role/query")
    @ResponseBody
    public Map<String, Object> getSysResourceList(SysRole sysRole) {
        List<SysRole> sysRoleList = sysRoleService.findRoleList(sysRole);
        Map<String, Object> map = new HashMap<>();
        map.put("data", sysRoleList);
        map.put("status", "1");
        return map;
    }
    
    /**
     * 角色新增界面跳转
     * @return
     */
    @RequiresPermissions("auth:operate")
    @RequestMapping("/role/page_add")
    public String showSysRoleAddPage(Model model) {
        List<EnumObject> roleStsEnums = BaseDataCache.getDataList("ROLE_STS");
        model.addAttribute("roleStsEnums", roleStsEnums);
        return "sys/role/sys_role_add";
    }
    
    /**
     * 获取角色列表
     * @param sysResource
     * @return
     */
    @RequiresPermissions("auth:operate")
    @RequestMapping("/role/res_tree")
    @ResponseBody
    public List<SysResourceTree> getRoleResTree(SysRole sysRole) {
        List<SysResourceTree> sysRoleResList = sysRoleService.getRoleResTree(sysRole);
        return sysRoleResList;
    }
    
    /**
     * 保存角色列表
     * @param sysResource
     * @return
     */
    @RequiresPermissions("auth:operate")
    @RequestMapping("/role/add/{resIds}")
    @ResponseBody
    public Map<String, Object> saveSysRoleAndRes(SysRole sysRole, @PathVariable String resIds) {
        sysRoleService.saveSysRoleAndRes(sysRole, resIds);
        Map<String, Object> map = new HashMap<>();
        map.put("status", "1");
        return map;
    }
    
    /**
     * 资源更新界面跳转
     * @return
     */
    @RequiresPermissions("auth:operate")
    @RequestMapping("/role/page_update/{roleId}")
    public String showSysRoleUpdatePage(Model model, @PathVariable String roleId) {
        SysRole sysRole = sysRoleService.findRoleById(Integer.parseInt(roleId));
        List<EnumObject> roleStsEnums = BaseDataCache.getDataList("ROLE_STS");
        model.addAttribute("roleStsEnums", roleStsEnums);
        model.addAttribute("sysRole", sysRole);
        return "sys/role/sys_role_update";
    }
    
    /**
     * 更新角色资源
     * @param sysResource
     * @return
     */
    @RequiresPermissions("auth:operate")
    @RequestMapping("/role/update/{resIds}")
    @ResponseBody
    public Map<String, Object> updateSysRoleAndRes(SysRole sysRole, @PathVariable String resIds) {
        sysRoleService.updateSysRoleAndRes(sysRole, resIds);
        Map<String, Object> map = new HashMap<>();
        map.put("status", "1");
        return map;
    }
    
    /**
     * 删除角色资源
     * @return
     */
    @RequiresPermissions("auth:operate")
    @RequestMapping("/role/delete/{roleIds}")
    @ResponseBody
    public Map<String, Object> deleteSysRoleAndRes(@PathVariable String roleIds) {
        sysRoleService.deleteSysRoleAndRes(roleIds);
        Map<String, Object> map = new HashMap<>();
        map.put("status", "1");
        return map;
    }
}
