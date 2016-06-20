package com.ai.mnt.service.sys;

import java.util.List;

import com.ai.mnt.model.sys.SysResource;
import com.ai.mnt.model.sys.SysResourceTree;

public interface SysResourceService {
    
    /**
     * 获取资源列表
     * @return
     */
    public List<SysResource> findAllSysResource();


    /**
     * 获取资源列表
     * @return
     */
    public SysResource findSysResourceByResId(Integer resId);
    
    /**
     * 获取资源列表
     * @param sysResource
     * @return
     */
    public List<SysResource> findAllSysResource(SysResource sysResource);
    
    /**
     * 获取资源数对象列表
     * @param sysResource
     * @return
     */
    public List<SysResourceTree> getSysResourceTreeList(SysResource SysResource);
    
    /**
     * 获取资源列表
     * @return
     */
    public List<SysResource> getMenuTreeList();
    
    /**
     * 保存资源
     * @return
     */
    public void saveSysResource(SysResource sysResource);
    
    /**
     * 更新资源
     * @return
     */
    public void updateSysResource(SysResource sysResource);
    
    /**
     * 批量更新   主要用于非物理批量删除
     * @param resId
     */
    public void updateByIdList(List<Integer> resIdList);
    
    /**
     * 获取角色资源列表
     * @return
     */
    public List<SysResource> findResListByRoleId(Integer roleId);
    
    /**
     * 获取用户资源列表
     * @return
     */
    public List<SysResource> findResListByUserId(Integer userId);
}
