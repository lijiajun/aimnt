package com.ai.mnt.service.sys;

import java.util.List;

import com.ai.mnt.model.sys.SysResourceTree;
import com.ai.mnt.model.sys.SysRole;

public interface SysRoleService {

    /**
     * 通过ID获取角色
     * @return
     */
    public SysRole findRoleById(Integer roleId);

    /**
     * 通过userID获取角色
     * @return
     */
    public SysRole findRoleByUserId(Integer userId);
    
    /**
     * 获取所有角色
     * @return
     */
    public List<SysRole> findAllRole();
    
    /**
     * 获取角色列表
     * @return
     */
    public List<SysRole> findRoleList(SysRole sysRole);

    /**
     * 获取角色资源树
     * @return
     */
    public List<SysResourceTree> getRoleResTree(SysRole sysRole);

    /**
     * 保存角色及其资源
     * @param sysRole
     * @param resIds
     */
    public void saveSysRoleAndRes(SysRole sysRole, String resIds);

    /**
     * 更新角色及其资源
     * @param sysRole
     * @param resIds
     */
    public void updateSysRoleAndRes(SysRole sysRole, String resIds);

    /**
     * 删除角色资源
     * @return
     */
    public void deleteSysRoleAndRes(String roleIds);
    
}
