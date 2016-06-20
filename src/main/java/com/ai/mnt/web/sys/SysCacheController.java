package com.ai.mnt.web.sys;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ai.mnt.model.sys.SysDict;
import com.ai.mnt.service.sys.SysCacheService;

@Controller
@RequestMapping("/sys/cache")
public class SysCacheController {

    @Autowired
    SysCacheService sysCacheService;
    
    /**
     * 缓存管理页面跳转
     * @return
     */
    @RequestMapping("/page")
    public String showCachePage() {
        return "sys/cache/sys_cache_list";
    }
    
    /**
     * 缓存查询
     * @return
     */
    @RequestMapping("/query")
    @ResponseBody
    public Map<String, Object> queryCacheAll() {
        List<SysDict> cacheList = sysCacheService.queryCacheAll();
        Map<String, Object> map = new HashMap<>();
        map.put("data", cacheList);
        map.put("status", "1");
        return map;
    }
    
    
    /**
     * 刷新缓存
     * @return
     */
    @RequiresPermissions("sys:operate")
    @RequestMapping("/refresh")
    @ResponseBody
    public Map<String, Object> refreshCacheAll() {
        sysCacheService.refreshCacheAll();
        List<SysDict> cacheList = sysCacheService.queryCacheAll();
        Map<String, Object> map = new HashMap<>();
        map.put("data", cacheList);
        map.put("status", "1");
        return map;
    }
}
