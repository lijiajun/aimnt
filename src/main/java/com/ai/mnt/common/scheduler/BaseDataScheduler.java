package com.ai.mnt.common.scheduler;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.ai.mnt.common.cache.BaseDataCache;


public class BaseDataScheduler {

    
    public static Logger logger = LoggerFactory.getLogger(BaseDataScheduler.class);
    
    
    private BaseDataCache baseDataCache;
    
    public void loadCacheData() {
//        logger.info("===============加载缓存数据===============");
//        baseDataCache.loadBaseData();
//        logger.info("===============加载缓存数据完成===============");
//        logger.info(baseDataCache.getData("PROD_INFO", 1));
        
    }

    public BaseDataCache getBaseDataCache() {
        return baseDataCache;
    }

    public void setBaseDataCache(BaseDataCache baseDataCache) {
        this.baseDataCache = baseDataCache;
    }
    
    
    
}
