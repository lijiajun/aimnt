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
import com.ai.mnt.model.sys.SysUser;
import com.ai.mnt.model.sys.SysUserRole;
import com.ai.mnt.service.sys.SysUserService;


@Controller
@RequestMapping("/sys")
public class SysUserController {

    @Autowired
    SysUserService sysUserService;
    
    /**
     * 角色管理界面跳转
     * @return
     */
    @RequestMapping("/user/page")
    public String showSysUserPage(Model model) {
        List<EnumObject> userStsEnums = BaseDataCache.getDataList("USER_STS");
        model.addAttribute("userStsEnums", userStsEnums);
        return "sys/user/sys_user";
    }
    
    /**
     * 获取角色列表
     * @param sysResource
     * @return
     */
    @RequestMapping("/user/query")
    @ResponseBody
    public Map<String, Object> getSysUserList(SysUser sysUser) {
        List<SysUser> sysUserList = sysUserService.findUserList(sysUser);
        Map<String, Object> map = new HashMap<>();
        map.put("data", sysUserList);
        map.put("status", "1");
        return map;
    }
    
    /**
     * 用户新增界面跳转
     * @return
     */
    @RequiresPermissions("auth:operate")
    @RequestMapping("/user/page_add")
    public String showSysUserAddPage(Model model) {
        List<EnumObject> userStsEnums = BaseDataCache.getDataList("USER_STS");
        List<EnumObject> sysRoleEnums = BaseDataCache.getDataList("SYS_ROLE_ENUM");
        List<EnumObject> baseIdEnums = BaseDataCache.getDataList("BASE_NAME_ENUM");
        model.addAttribute("userStsEnums", userStsEnums);
        model.addAttribute("sysRoleEnums", sysRoleEnums);
        model.addAttribute("baseNameEnums", baseIdEnums);
        return "sys/user/sys_user_add";
    }
    
    /**
     * 保存用户列表
     * @param sysResource
     * @return
     */
    @RequiresPermissions("auth:operate")
    @RequestMapping("/user/add/{roleIds}")
    @ResponseBody
    public Map<String, Object> saveUserAndRole(SysUser sysUser, @PathVariable String roleIds) {
        sysUserService.saveUserAndRole(sysUser, roleIds);
        Map<String, Object> map = new HashMap<>();
        map.put("status", "1");
        return map;
    }
    
    /**
     * 用户更新界面跳转
     * @return
     */
    @RequiresPermissions("auth:operate")
    @RequestMapping("/user/page_update/{userId}")
    public String showSysUserUpdatePage(Model model, @PathVariable String userId) {
        SysUser sysUser = sysUserService.findUserByUserId(Integer.parseInt(userId));
        
        List<SysUserRole> list = sysUserService.findUserRoleByUserId(userId);
        List<EnumObject> userStsEnums = BaseDataCache.getDataList("USER_STS");
        List<EnumObject> sysRoleEnums = BaseDataCache.getDataList("SYS_ROLE_ENUM");
        List<EnumObject> baseIdEnums = BaseDataCache.getDataList("BASE_NAME_ENUM");
        model.addAttribute("userStsEnums", userStsEnums);
        model.addAttribute("sysRoleEnums", sysRoleEnums);
        model.addAttribute("baseNameEnums", baseIdEnums);
        model.addAttribute("sysUser", sysUser);
        if(list != null && list.size() > 0) {
            String strRoleIds = "";
            for(int i=0,len=list.size(); i<len; i++) {
                SysUserRole sysUserRole = list.get(i);
                strRoleIds += sysUserRole.getRoleId() + ",";
            }
            model.addAttribute("roleIds", strRoleIds);
        }
        return "sys/user/sys_user_update";
    }
    
    /**
     * 更新用户信息
     * @param sysResource
     * @return
     */
    @RequiresPermissions("auth:operate")
    @RequestMapping("/user/update/{roleIds}")
    @ResponseBody
    public Map<String, Object> updateUserAndRole(SysUser sysUser, @PathVariable String roleIds) {
        sysUserService.updateUserAndRole(sysUser, roleIds);
        Map<String, Object> map = new HashMap<>();
        map.put("status", "1");
        return map;
    }
    
    /**
     * 删除用户角色
     * @return
     */
    @RequiresPermissions("auth:operate")
    @RequestMapping("/user/delete/{userIds}")
    @ResponseBody
    public Map<String, Object> deleteSysRoleAndRes(@PathVariable String userIds) {
        sysUserService.deleteSysUserAndRole(userIds);
        Map<String, Object> map = new HashMap<>();
        map.put("status", "1");
        return map;
    }
}
