package com.ai.mnt.common.shiro;

import java.util.concurrent.atomic.AtomicInteger;

import net.sf.ehcache.Cache;
import net.sf.ehcache.CacheManager;
import net.sf.ehcache.Element;

import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.ExcessiveAttemptsException;
import org.apache.shiro.authc.credential.HashedCredentialsMatcher;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ai.mnt.common.util.MntConstant;
import com.ai.mnt.model.sys.SysUser;
import com.ai.mnt.service.sys.SysUserService;

@Service
public class RetryLimitCredentialsMatcher extends HashedCredentialsMatcher {

    private Cache passwdRetryCache;

    @Autowired
    SysUserService sysUserService;
    
    public RetryLimitCredentialsMatcher() {}
    
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
            //锁定用户
            SysUser user = new SysUser();
            user.setUserSts("2");
            user.setUserName(username);
            sysUserService.updateUserStsByUserName(user);
            
            throw new ExcessiveAttemptsException();
        }
        boolean matches = super.doCredentialsMatch(token, info);  
        if(matches) {  
            passwdRetryCache.remove(username);  
        }  
        return matches;
    }
    
    public void unlockUser(String username) {
        //解锁用户
        Element element = passwdRetryCache.get(username);
        if(null != element) {
            passwdRetryCache.remove(username);
        }
    }
    
    
    
}
