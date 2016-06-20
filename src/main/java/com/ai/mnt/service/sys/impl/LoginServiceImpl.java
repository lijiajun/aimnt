package com.ai.mnt.service.sys.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ai.mnt.common.shiro.UserRealm;
import com.ai.mnt.model.sys.SysResource;
import com.ai.mnt.model.sys.SysUser;
import com.ai.mnt.persistence.sys.SysResourceMapper;
import com.ai.mnt.service.sys.LoginService;

@Service
public class LoginServiceImpl implements LoginService {

    @Autowired
    public SysResourceMapper sysResourceMapper;
    
    @Autowired
    UserRealm userRealm;
    
    /**
     * 获取所有资源列表
     */
    @Override
    public List<SysResource> findAllSysResource() {
        List<SysResource> list = sysResourceMapper.findAll();
        return list;
    }
    
    /**
     * 创建菜单树
     * @param list
     * @param resultList
     * @param root  是否是根节点
     */
    private void createMenuTree(List<SysResource> list, List<SysResource> resultList, boolean root) {
        for(SysResource sysResource : list) {
            if(sysResource.getParentId() == -1 && root) {
                resultList.add(sysResource);
            }
            for(SysResource temp : resultList) {
                if(temp.getResId() == sysResource.getParentId() && !temp.getSysResourceList().contains(sysResource)) {
                    temp.getSysResourceList().add(sysResource);
                    createMenuTree(list, temp.getSysResourceList(), false);
                }
            }
        }
    }

    /**
     * 获取菜单树列表
     */
    @Override
    public List<SysResource> getMenuTreeList() {
//        SysResource sysResource = new SysResource();
        //查询状态正常且资源类型为菜单的资源
//        sysResource.setResSts("1");
//        sysResource.setResType(1);
//        List<SysResource> list = sysResourceMapper.findList(sysResource);
        SysUser currentUser = userRealm.getCurrentUser();
        List<SysResource> list = sysResourceMapper.findResMenuListByUserId(currentUser.getUserId());
        List<SysResource> resultList = new ArrayList<>();
        createMenuTree(list, resultList, true);
        return resultList;
    }

}
