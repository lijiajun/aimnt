package com.ai.mnt.service.sys;

import java.util.List;

import com.ai.mnt.model.sys.SysResource;

public interface LoginService {

    /**
     * 获取资源列表
     * @return
     */
    public List<SysResource> findAllSysResource();


    /**
     * 获取资源列表
     * @return
     */
    public List<SysResource> getMenuTreeList();
    
}
