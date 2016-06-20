package com.ai.mnt.service.sys.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ai.mnt.common.cache.BaseDataCache;
import com.ai.mnt.common.shiro.UserRealm;
import com.ai.mnt.model.sys.SysResource;
import com.ai.mnt.model.sys.SysResourceTree;
import com.ai.mnt.model.sys.SysUser;
import com.ai.mnt.persistence.sys.SysResourceMapper;
import com.ai.mnt.service.sys.SysResourceService;

@Service
public class SysResourceServiceImpl implements SysResourceService{

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
     * 获取角色资源列表
     * @return
     */
    @Override
    public List<SysResource> findResListByRoleId(Integer roleId) {
        List<SysResource> list = sysResourceMapper.findResListByRoleId(roleId);
        return list;
    }
    
    /**
     * 获取用户资源列表
     * @return
     */
    @Override
    public List<SysResource> findResListByUserId(Integer userId) {
        List<SysResource> list = sysResourceMapper.findResListByUserId(userId);
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
        SysResource sysResource = new SysResource();
        //查询资源类型为菜单的资源
        sysResource.setResSts("1");
        List<SysResource> list = sysResourceMapper.findList(sysResource);
        List<SysResource> resultList = new ArrayList<>();
        createMenuTree(list, resultList, true);
        return resultList;
    }

    /**
     * 保存资源
     * @return
     */
    @Override
    public void saveSysResource(SysResource sysResource) {
        SysUser currentUser = userRealm.getCurrentUser();
        sysResource.setCreator(currentUser.getUserName());
        sysResource.setCreateDate(new Date());
        sysResource.setModifier(currentUser.getUserName());
        sysResource.setModifyDate(new Date());
        //获取所有父节点并保存
        SysResource sysResourceParent = findSysResourceByResId(sysResource.getParentId());
        if(sysResourceParent != null) {
            if(StringUtils.isNotEmpty(sysResourceParent.getParentIds())) {
                sysResource.setParentIds(sysResourceParent.getParentIds() + "/" + sysResource.getParentId());
            }else {
                sysResource.setParentIds(sysResource.getParentId() + "");
            }
        }
        sysResourceMapper.save(sysResource);
    }

    @Override
    public List<SysResource> findAllSysResource(SysResource sysResource) {
        List<SysResource> sysResourceList = sysResourceMapper.findList(sysResource);
        cvtContentList(sysResourceList);
        return sysResourceList;
    }
    
    /**
     * 获取资源数对象列表
     * @param sysResource
     * @return
     */
    @Override
    public List<SysResourceTree> getSysResourceTreeList(SysResource sysResource) {
        List<SysResource> sysResourceList = sysResourceMapper.findList(sysResource);
        if(sysResourceList == null) {
            return null;
        }
        
        List<SysResourceTree> treelist = new ArrayList<>();
        for(SysResource temp : sysResourceList) {
            SysResourceTree tree = new SysResourceTree();
            tree.setId(temp.getResId());
            tree.setText(temp.getResName());
            tree.setParent(temp.getParentId().toString());
            if(temp.getResId() == 1) {
                tree.getState().setOpened(true);
            }
            treelist.add(tree);
        }
        //自定义根节点
        SysResourceTree rootNode = new SysResourceTree();
        rootNode.setId(-1);
        rootNode.setText("运维平台资源");
        rootNode.setParent("#");
        rootNode.getState().setOpened(true);
        treelist.add(rootNode);

        return treelist;
    }

    @Override
    public SysResource findSysResourceByResId(Integer resId) {
        SysResource sysResource = sysResourceMapper.findByPrimaryKey(resId);
        return sysResource;
    }

    /**
     * 更新资源
     * @return
     */
    @Override
    public void updateSysResource(SysResource sysResource) {
        SysUser currentUser = userRealm.getCurrentUser();
        sysResource.setModifier(currentUser.getUserName());
        sysResource.setModifyDate(new Date());
        //获取所有父节点并保存
        SysResource sysResourceParent = findSysResourceByResId(sysResource.getParentId());
        if(sysResourceParent != null) {
            if(StringUtils.isNotEmpty(sysResourceParent.getParentIds())) {
                sysResource.setParentIds(sysResourceParent.getParentIds() + "/" + sysResource.getParentId());
            }else {
                sysResource.setParentIds(sysResource.getParentId() + "");
            }
        }
        sysResourceMapper.updateByPrimaryKey(sysResource);
        
    }
    
    /**
     * 批量更新   主要用于非物理批量删除
     * @param resId
     */
    public void updateByIdList(List<Integer> resIdList) {
        sysResourceMapper.updateByIdList(resIdList);
    }
    
    private void cvtContentList(List<SysResource> sysResourceList) {
        for(SysResource sysResource : sysResourceList) {
            sysResource.setParentName("[" + sysResource.getParentId() + "]" + BaseDataCache.getDataName("SYS_RESOURCE", sysResource.getParentId()));
            sysResource.setResTypeTxt(BaseDataCache.getDataName("RES_TYPE", sysResource.getResType()));
            sysResource.setResStsTxt(BaseDataCache.getDataName("RES_STS", sysResource.getResSts()));
        }
    }
}
