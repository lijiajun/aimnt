package com.ai.mnt.service.priv.impl;

import java.util.HashMap;
import java.util.Map;

import org.apache.shiro.crypto.SecureRandomNumberGenerator;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ai.mnt.common.shiro.UserRealm;
import com.ai.mnt.common.util.MntConstant;
import com.ai.mnt.model.sys.SysUser;
import com.ai.mnt.service.priv.PersonalInfoService;
import com.ai.mnt.service.sys.SysUserService;

@Service
public class PersonalInfoServiceImpl implements PersonalInfoService {

    @Autowired
    UserRealm userRealm;
    
    @Autowired
    SysUserService sysUserService;
    
    @Override
    public Map<String, Object> updatePersonalPasswd(String passwd, String passwdNew,
            String passwdNew2) {
        Map<String, Object> map = new HashMap<String, Object>();
        if(!passwdNew.equals(passwdNew2)) {
            map.put("sts", "0");
            map.put("info", "密码修改失败:两次输入新密码不一致！");
            return map;
        }
        //当前用户信息
        SysUser currentUser = userRealm.getCurrentUser();
        
        String salt1 = currentUser.getUserName();
        String salt2 = currentUser.getSalt();
        SimpleHash hash = new SimpleHash(MntConstant.HASH_ALGORITHM_NAME, passwd,  
                salt1 + salt2, MntConstant.HASH_ITERATIONS);
        if(!currentUser.getPassword().equals(hash.toHex())) {
            map.put("sts", "0");
            map.put("info", "密码修改失败:旧密码输入有误！");
            return map;
        }
        
        if(passwd.equals(passwdNew)) {
            map.put("sts", "0");
            map.put("info", "密码修改失败:新密码不可与旧密码一致！");
            return map;
        }
        
        salt2 = new SecureRandomNumberGenerator().nextBytes().toHex();
        hash = new SimpleHash(MntConstant.HASH_ALGORITHM_NAME, passwdNew,  
                salt1 + salt2, MntConstant.HASH_ITERATIONS);
        SysUser sysUser = new SysUser();
        sysUser.setSalt(salt2);
        sysUser.setPassword(hash.toHex());
        sysUser.setUserId(currentUser.getUserId());
        sysUserService.updateUser(sysUser);
        map.put("sts", "1");
        map.put("info", "密码修改成功！");
        return map;
    }


}
