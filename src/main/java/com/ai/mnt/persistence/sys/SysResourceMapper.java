package com.ai.mnt.persistence.sys;


import java.util.List;

import org.springframework.stereotype.Repository;

import com.ai.mnt.model.sys.SysResource;
import com.ai.mnt.persistence.base.CrudMapper;

@Repository
public interface SysResourceMapper extends CrudMapper<SysResource, Integer>{

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
    
    /**
     * 获取用户资源列表
     * @return
     */
    public List<SysResource> findResMenuListByUserId(Integer userId);
}