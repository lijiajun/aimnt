package com.ai.mnt.service.sys;

import java.util.List;

import com.ai.mnt.model.sys.SysUser;
import com.ai.mnt.model.sys.SysUserRole;

public interface SysUserService {

    /**
     * 通过用户名获取用户
     * @return
     */
    public SysUser findUserByUserName(String userName);

    /**
     * 通过用户名获取用户
     * @return
     */
    public SysUser findUserByUserId(Integer userId);
    
    /**
     * 通过用户名获取用户
     * @return
     */
    public List<SysUser> findAllUser();
    
    /**
     * 通过用户名获取用户
     * @return
     */
    public List<SysUser> findUserList(SysUser sysUser);
    
    /**
     * 保存用户及其角色
     * @param sysUser
     * @param roleIds
     */
    public void saveUserAndRole(SysUser sysUser, String roleIds);
    
    /**
     * 更新用户及其角色
     * @param sysUser
     * @param roleIds
     */
    public void updateUserAndRole(SysUser sysUser, String roleIds);
    
    /**
     * 更新用户
     * @param sysUser
     */
    public void updateUser(SysUser sysUser);
    
    /**
     * 删除用户及其角色映射
     * @return
     */
    public void deleteSysUserAndRole(String userIds);
    
    /**
     * 通过UserId获取用户角色映射
     * @return
     */
    public List<SysUserRole> findUserRoleByUserId(String userId);
    
    
}
