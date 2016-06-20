package com.ai.mnt.common.shiro;

import java.util.concurrent.atomic.AtomicInteger;

import net.sf.ehcache.Cache;
import net.sf.ehcache.CacheManager;
import net.sf.ehcache.Element;

import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.ExcessiveAttemptsException;
import org.apache.shiro.authc.credential.HashedCredentialsMatcher;

import com.ai.mnt.common.util.MntConstant;

public class RetryLimitCredentialsMatcher extends HashedCredentialsMatcher {

    private Cache passwdRetryCache;

    public RetryLimitCredentialsMatcher(CacheManager cacheManager) {
//        Collection<String> cacheNames = springCacheManager.getCacheNames();
        passwdRetryCache = cacheManager.getCache("passwdRetryLimitCache");
    }
    
    /**
     * 重写验证，次数校验
     */
    @Override
    public boolean doCredentialsMatch(AuthenticationToken token,
            AuthenticationInfo info) {
        
        String username = (String)token.getPrincipal();
        Element element = passwdRetryCache.get(username);
        if(null == element) {
            element = new Element(username, new AtomicInteger(0));
            passwdRetryCache.put(element);
        }
        AtomicInteger retryCount = (AtomicInteger)element.getObjectValue(); 
        if(retryCount.incrementAndGet() > MntConstant.PASSWD_RETRY_COUNT) {
            throw new ExcessiveAttemptsException();
        }
        boolean matches = super.doCredentialsMatch(token, info);  
        if(matches) {  
            passwdRetryCache.remove(username);  
        }  
        return matches;  
    }
    
}
