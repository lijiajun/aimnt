package com.ai.mnt.service.sys.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ai.mnt.common.cache.BaseDataCache;
import com.ai.mnt.model.common.EnumObject;
import com.ai.mnt.model.sys.SysDict;
import com.ai.mnt.service.sys.SysCacheService;

@Service
public class SysCacheServiceImpl implements SysCacheService{

    
    @Autowired
    BaseDataCache baseDataCache;
    
    /**
     * 查询目前系统中存在的缓存
     * @return
     */
    @Override
    public List<SysDict> queryCacheAll() {
        List<SysDict> cacheList = new ArrayList<>();
      for(Entry<String, Map<Object, EnumObject>> entry : BaseDataCache.GLOBAL_MAP.entrySet()) {
          Map<Object, EnumObject> map = entry.getValue();
          for(Entry<Object, EnumObject> entryTemp : map.entrySet()) {
              SysDict sysDict = new SysDict();
              sysDict.setParamGroupCode(entryTemp.getValue().getGroupKey());
              sysDict.setParamGroupName(entryTemp.getValue().getGroupValue());
              sysDict.setParamCode(entryTemp.getValue().getKey());
              sysDict.setParamValue(entryTemp.getValue().getValue());
              sysDict.setParamOrder(entryTemp.getValue().getOrder());
              sysDict.setCreateDate(BaseDataCache.loadTime);
              cacheList.add(sysDict);
          }
      }
      return cacheList;
    }

    @Override
    public void refreshCacheAll() {
        //清空缓存
        BaseDataCache.clearCache();
        //刷新缓存
        baseDataCache.init();
    }
}
