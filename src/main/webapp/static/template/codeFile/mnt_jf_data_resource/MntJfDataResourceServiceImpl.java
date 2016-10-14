package com.ai.mnt.service.inst.impl;


import java.util.List;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ai.mnt.common.shiro.UserRealm;
import com.ai.mnt.model.inst.MntJfDataResource;
import com.ai.mnt.model.sys.SysUser;
import com.ai.mnt.persistence.inst.MntJfDataResourceMapper;
import com.ai.mnt.service.inst.MntJfDataResourceService;

/**
 * @Title: MntJfDataResourceServiceImpl 
 * @Description: MntJfDataResourceServiceImpl ServiceImplPackage
 * @Author: Auto Generate.
 * @Date: 2016-10-13
 */
@Service
public class MntJfDataResourceServiceImpl implements MntJfDataResourceService{

    @Autowired
    MntJfDataResourceMapper mntJfDataResourceMapper;
    
    @Autowired
    UserRealm userRealm;
    
    /**
     * 获取所有计费数据源列表
     * @return List<MntJfDataResource>
     */
    @Override
    public List<MntJfDataResource> findAllMntJfDataResource() {
        List<MntJfDataResource> mntJfDataResourceList = mntJfDataResourceMapper.findAll();
        //cvtContentList(mntJfDataResourceList);
        return mntJfDataResourceList;
    }

    /**
     * 获取计费数据源列表
     * @param inst
     * @return List<MntJfDataResource>
     */
    @Override
    public List<MntJfDataResource> findMntJfDataResourceList(MntJfDataResource mntJfDataResource) {
        List<MntJfDataResource> mntJfDataResourceList = mntJfDataResourceMapper.findList(mntJfDataResource);
        //cvtContentList(mntJfDataResourceList);
        return mntJfDataResourceList;
    }

    /**
     * 通过主键ID获取计费数据源
     * @param id Primary key
     * @return MntJfDataResource
     */
    @Override
    public MntJfDataResource findMntJfDataResourceById(Integer id) {
        MntJfDataResource mntJfDataResource = mntJfDataResourceMapper.findByPrimaryKey(id);
        return mntJfDataResource;
    }

    /**
     * 添加计费数据源
     * @param MntJfDataResource
     */
    @Override
    public void saveMntJfDataResource(MntJfDataResource mntJfDataResource) {
        SysUser currentUser = userRealm.getCurrentUser();
        mntJfDataResource.setDeleteFlag("0");
        mntJfDataResource.setCreator(currentUser.getUserName());
        mntJfDataResource.setModifier(currentUser.getUserName());
        mntJfDataResource.setCreateDate(new Date());
        mntJfDataResource.setModifyDate(new Date());
        mntJfDataResourceMapper.save(mntJfDataResource);
        
    }

    /**
     * 更新计费数据源
     * 根据MntJfDataResource的主键更新主键以外的其他字段
     * @param MntJfDataResource
     */
    @Override
    public void updateMntJfDataResourceById(MntJfDataResource mntJfDataResource) {
        SysUser currentUser = userRealm.getCurrentUser();
        mntJfDataResource.setModifier(currentUser.getUserName());
        mntJfDataResource.setModifyDate(new Date());
        mntJfDataResourceMapper.updateByPrimaryKey(mntJfDataResource);
        
    }

    /**
     * 根据主键批量删除计费数据源 
     * 非物理删除 修改删除标识
     * @param id Primary key
     */
    @Override
    public void deleteMntJfDataResourceByIds(String ids) {
        SysUser currentUser = userRealm.getCurrentUser();
        MntJfDataResource mntJfDataResource = new MntJfDataResource();
        mntJfDataResource.setDeleteFlag("1");
        mntJfDataResource.setModifier(currentUser.getUserName());
        mntJfDataResource.setModifyDate(new Date());
        String[] idAry = ids.split(",");
        for(String id : idAry) {
            mntJfDataResource.setId(Integer.parseInt(id));
            mntJfDataResourceMapper.updateByPrimaryKey(mntJfDataResource);
        }
    }
    
    //private void cvtContentList(List<MntJfDataResource> MntJfDataResourceList) {
    //    for(MntJfDataResource mntJfDataResource : MntJfDataResourceList) {
    //    }
    //}
}

