package com.ai.mnt.service.sys;

import java.util.List;

import com.ai.mnt.model.sys.SysDict;


public interface SysCacheService {

    /**
     * 查询目前系统中存在的缓存
     * @return
     */
    public List<SysDict> queryCacheAll();
    
    /**
     * 刷新缓存
     * @return
     */
    public void refreshCacheAll();
}
