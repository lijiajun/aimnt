package com.ai.mnt.service.sys.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.shiro.crypto.SecureRandomNumberGenerator;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ai.mnt.common.cache.BaseDataCache;
import com.ai.mnt.common.shiro.UserRealm;
import com.ai.mnt.common.util.MntConstant;
import com.ai.mnt.model.sys.SysUser;
import com.ai.mnt.model.sys.SysUserRole;
import com.ai.mnt.persistence.sys.SysUserMapper;
import com.ai.mnt.persistence.sys.SysUserRoleMapper;
import com.ai.mnt.service.sys.SysUserService;

@Service
public class SysUserServiceImpl implements SysUserService {

    @Autowired
    SysUserMapper sysUserMapper;
    
    @Autowired
    SysUserRoleMapper sysUserRoleMapper;
    
    @Autowired
    UserRealm userRealm;
    
    @Override
    public SysUser findUserByUserName(String userName) {
        SysUser sysUser = sysUserMapper.findUserByUserName(userName);
        return sysUser;
    }

    @Override
    public SysUser findUserByUserId(Integer userId) {
        SysUser sysUser = sysUserMapper.findByPrimaryKey(userId);
        return sysUser;
    }

    @Override
    public List<SysUser> findAllUser() {
        List<SysUser> sysUserList = sysUserMapper.findAll();
        cvtContentList(sysUserList);
        return sysUserList;
    }

    @Override
    public List<SysUser> findUserList(SysUser sysUser) {
        List<SysUser> sysUserList = sysUserMapper.findList(sysUser);
        cvtContentList(sysUserList);
        return sysUserList;
    }

    @Override
    public void saveUserAndRole(SysUser sysUser, String roleIds) {
        //当前用户信息
        SysUser currentUser = userRealm.getCurrentUser();
        sysUser.setCreator(currentUser.getUserName());
        sysUser.setCreateDate(new Date());
        sysUser.setModifier(currentUser.getUserName());
        sysUser.setModifyDate(new Date());
        sysUser.setUserAvatar("avatar.png");
        //密码加密
        encryptUserPasswd(sysUser);
        
        //插入用户信息
        sysUserMapper.save(sysUser);
        
        //插入用户角色关联信息
        if(roleIds != null && !"none".equals(roleIds)) {
            String[] roleIdAry = roleIds.split(",");
            List<SysUserRole> sysUserRoleList = new ArrayList<>();
            for(String roleId : roleIdAry) {
                SysUserRole sysUserRoleNew = new SysUserRole();
                sysUserRoleNew.setRoleId(Integer.parseInt(roleId));
                sysUserRoleNew.setUserId(sysUser.getUserId());
                sysUserRoleList.add(sysUserRoleNew);
            }
            sysUserRoleMapper.saveAll(sysUserRoleList);
        }
    }

    @Override
    public void updateUserAndRole(SysUser sysUser, String roleIds) {
        //当前用户信息
        SysUser currentUser = userRealm.getCurrentUser();
        sysUser.setModifier(currentUser.getUserName());
        sysUser.setModifyDate(new Date());
        
        //密码为空的时不修改
        if(sysUser.getPassword() != null && !"".equals(sysUser.getPassword())) {
            encryptUserPasswd(sysUser);
        }
        
        //更新用户信息
        sysUserMapper.updateByPrimaryKey(sysUser);
        
        //删除原用户关联角色信息
        SysUserRole sysUserRole = new SysUserRole();
        sysUserRole.setUserId(sysUser.getUserId());
        sysUserRoleMapper.deleteSysUserRole(sysUserRole);
        //插入新的用户角色关联信息
        //保存新的角色资源
        if(roleIds != null && !"none".equals(roleIds)) {
            String[] roleIdAry = roleIds.split(",");
            List<SysUserRole> sysUserRoleList = new ArrayList<>();
            for(String roleId : roleIdAry) {
                SysUserRole sysUserRoleNew = new SysUserRole();
                sysUserRoleNew.setRoleId(Integer.parseInt(roleId));
                sysUserRoleNew.setUserId(sysUser.getUserId());
                sysUserRoleList.add(sysUserRoleNew);
            }
            sysUserRoleMapper.saveAll(sysUserRoleList);
        }
    }

    /**
     * 更新用户
     * @param sysUser
     */
    @Override
    public void updateUser(SysUser sysUser) {
        
        SysUser currentUser = userRealm.getCurrentUser();
        sysUser.setModifier(currentUser.getUserName());
        sysUser.setModifyDate(new Date());
        
        sysUserMapper.updateByPrimaryKey(sysUser);
    }

    /**
     * 删除用户及其角色映射
     * @return
     */
    @Override
    public void deleteSysUserAndRole(String userIds) {
        String[] userIdAry = userIds.split(",");
        for(String userId : userIdAry) {
            sysUserMapper.deleteByPrimaryKey(Integer.parseInt(userId));
            SysUserRole sysUserRole = new SysUserRole();
            sysUserRole.setUserId(Integer.parseInt(userId));
            sysUserRoleMapper.deleteSysUserRole(sysUserRole);
        }
    }

    @Override
    public List<SysUserRole> findUserRoleByUserId(String userId) {
        SysUserRole sysUserRole = new SysUserRole();
        sysUserRole.setUserId(Integer.parseInt(userId));
        List<SysUserRole> list = sysUserRoleMapper.findList(sysUserRole);
        return list;
    }
    
    private void cvtContentList(List<SysUser> sysUserList) {
        for(SysUser sysUser : sysUserList) {
            sysUser.setUserStsTxt(BaseDataCache.getDataName("USER_STS", sysUser.getUserSts()));
            sysUser.setBaseIdTxt(BaseDataCache.getDataName("BASE_NAME_ENUM", sysUser.getBaseId()));
        }
    }
    
    public void encryptUserPasswd(SysUser sysUser) {
        String salt1 = sysUser.getUserName();
        String salt2 = new SecureRandomNumberGenerator().nextBytes().toHex();  
        SimpleHash hash = new SimpleHash(MntConstant.HASH_ALGORITHM_NAME, sysUser.getPassword(),  
                salt1 + salt2, MntConstant.HASH_ITERATIONS);
        sysUser.setSalt(salt2);
        sysUser.setPassword(hash.toHex());
    }
    
}
