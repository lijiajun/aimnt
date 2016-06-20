package com.ai.mnt.common.shiro;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ai.mnt.model.sys.SysResource;
import com.ai.mnt.model.sys.SysUser;
import com.ai.mnt.service.sys.SysResourceService;
import com.ai.mnt.service.sys.SysUserService;

@Service
public class UserRealm extends AuthorizingRealm {

    @Autowired
    SysUserService sysUserService;

    @Autowired
    SysResourceService sysResourceService;
    
    /**
     * 授权
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(
            PrincipalCollection principals) {
        SysUser sysUser = (SysUser) principals.getPrimaryPrincipal();
        //获取用户所具有的权限集合
        List<SysResource> resList = sysResourceService.findResListByUserId(sysUser.getUserId());
        List<String> permissions = new ArrayList<>();
        for(SysResource sysResource : resList) {
            if(StringUtils.isNotEmpty(sysResource.getPermission())) {
                permissions.add(sysResource.getPermission());
            }
        }
//        permissions.add("prod:query");
//        permissions.add("prod:add");
        SimpleAuthorizationInfo simpleAuthorizationInfo = new SimpleAuthorizationInfo();
        simpleAuthorizationInfo.addStringPermissions(permissions);
        return simpleAuthorizationInfo;
    }

    /**
     * 认证
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(
            AuthenticationToken token) throws AuthenticationException {
        String userName = (String) token.getPrincipal();
        SysUser sysUser = sysUserService.findUserByUserName(userName);
        if (sysUser == null) {
            return null;
        }
        SimpleAuthenticationInfo simpleAuthenticationInfo = new SimpleAuthenticationInfo(
                sysUser, sysUser.getPassword(), 
                ByteSource.Util.bytes(sysUser.getUserName() + sysUser.getSalt()), this.getName());
        return simpleAuthenticationInfo;
    }
    
    /**
     * 清空shiro缓存
     * 在修改授权配置的时候调用
     */
    public void clearCache() {
        
        PrincipalCollection previousPrincipals = SecurityUtils.getSubject().getPreviousPrincipals();
        this.clearCache(previousPrincipals);
        
        
    }
    
    /**
     * 获取当前用户
     * @return
     */
    public SysUser getCurrentUser() {
        Subject subject = SecurityUtils.getSubject();
        SysUser sysUser = (SysUser) subject.getPrincipal();
        return sysUser;
    }
    
    
}
