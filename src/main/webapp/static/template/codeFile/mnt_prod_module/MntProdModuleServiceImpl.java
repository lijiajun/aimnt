package com.ai.mnt.service.product.impl;


import java.util.List;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ai.mnt.common.shiro.UserRealm;
import com.ai.mnt.model.product.MntProdModule;
import com.ai.mnt.model.sys.SysUser;
import com.ai.mnt.persistence.product.MntProdModuleMapper;
import com.ai.mnt.service.product.MntProdModuleService;

/**
 * @Title: MntProdModuleServiceImpl 
 * @Description: MntProdModuleServiceImpl ServiceImplPackage
 * @Author: Auto Generate. HE
 * @Date: 2016-5-11
 */
@Service
public class MntProdModuleServiceImpl implements MntProdModuleService{

    @Autowired
    MntProdModuleMapper mntProdModuleMapper;
    
    @Autowired
    UserRealm userRealm;
    
    /**
     * 获取所有产品功能模块信息列表
     * @return List<MntProdModule>
     */
    @Override
    public List<MntProdModule> findAllMntProdModule() {
        List<MntProdModule> mntProdModuleList = mntProdModuleMapper.findAll();
        //cvtContentList(mntProdModuleList);
        return mntProdModuleList;
    }

    /**
     * 获取产品功能模块信息列表
     * @param product
     * @return List<MntProdModule>
     */
    @Override
    public List<MntProdModule> findMntProdModuleList(MntProdModule mntProdModule) {
        List<MntProdModule> mntProdModuleList = mntProdModuleMapper.findList(mntProdModule);
        //cvtContentList(mntProdModuleList);
        return mntProdModuleList;
    }

    /**
     * 通过主键ID获取产品功能模块信息
     * @param moduleId Primary key
     * @return MntProdModule
     */
    @Override
    public MntProdModule findMntProdModuleByModuleId(Integer moduleId) {
        MntProdModule mntProdModule = mntProdModuleMapper.findByPrimaryKey(moduleId);
        return mntProdModule;
    }

    /**
     * 添加产品功能模块信息
     * @param MntProdModule
     */
    @Override
    public void saveMntProdModule(MntProdModule mntProdModule) {
        SysUser currentUser = userRealm.getCurrentUser();
        mntProdModule.setDeleteFlag("0");
        mntProdModule.setCreator(currentUser.getUserName());
        mntProdModule.setModifier(currentUser.getUserName());
        mntProdModule.setCreateDate(new Date());
        mntProdModule.setModifyDate(new Date());
        mntProdModuleMapper.save(mntProdModule);
        
    }

    /**
     * 更新产品功能模块信息
     * 根据MntProdModule的主键更新主键以外的其他字段
     * @param MntProdModule
     */
    @Override
    public void updateMntProdModuleByModuleId(MntProdModule mntProdModule) {
        SysUser currentUser = userRealm.getCurrentUser();
        mntProdModule.setModifier(currentUser.getUserName());
        mntProdModule.setModifyDate(new Date());
        mntProdModuleMapper.updateByPrimaryKey(mntProdModule);
        
    }

    /**
     * 根据主键批量删除产品功能模块信息 
     * 非物理删除 修改删除标识
     * @param moduleId Primary key
     */
    @Override
    public void deleteMntProdModuleByModuleIds(String moduleIds) {
        SysUser currentUser = userRealm.getCurrentUser();
        MntProdModule mntProdModule = new MntProdModule();
        mntProdModule.setDeleteFlag("1");
        mntProdModule.setModifier(currentUser.getUserName());
        mntProdModule.setModifyDate(new Date());
        String[] moduleIdAry = moduleIds.split(",");
        for(String moduleId : moduleIdAry) {
            mntProdModule.setModuleId(Integer.parseInt(moduleId));
            mntProdModuleMapper.updateByPrimaryKey(mntProdModule);
        }
    }
    
    //private void cvtContentList(List<MntProdModule> MntProdModuleList) {
    //    for(MntProdModule mntProdModule : MntProdModuleList) {
    //    }
    //}
}

