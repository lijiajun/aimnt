package com.ai.mnt.service.product.impl;


import java.util.List;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ai.mnt.common.shiro.UserRealm;
import com.ai.mnt.model.product.MntModuleLib;
import com.ai.mnt.model.sys.SysUser;
import com.ai.mnt.persistence.product.MntModuleLibMapper;
import com.ai.mnt.service.product.MntModuleLibService;

/**
 * @Title: MntModuleLibServiceImpl 
 * @Description: MntModuleLibServiceImpl ServiceImplPackage
 * @Author: Auto Generate. HE
 * @Date: 2016-5-12
 */
@Service
public class MntModuleLibServiceImpl implements MntModuleLibService{

    @Autowired
    MntModuleLibMapper mntModuleLibMapper;
    
    @Autowired
    UserRealm userRealm;
    
    /**
     * 获取所有库文件信息列表
     * @return List<MntModuleLib>
     */
    @Override
    public List<MntModuleLib> findAllMntModuleLib() {
        List<MntModuleLib> mntModuleLibList = mntModuleLibMapper.findAll();
        //cvtContentList(mntModuleLibList);
        return mntModuleLibList;
    }

    /**
     * 获取库文件信息列表
     * @param product
     * @return List<MntModuleLib>
     */
    @Override
    public List<MntModuleLib> findMntModuleLibList(MntModuleLib mntModuleLib) {
        List<MntModuleLib> mntModuleLibList = mntModuleLibMapper.findList(mntModuleLib);
        //cvtContentList(mntModuleLibList);
        return mntModuleLibList;
    }

    /**
     * 通过主键ID获取库文件信息
     * @param libId Primary key
     * @return MntModuleLib
     */
    @Override
    public MntModuleLib findMntModuleLibByLibId(Integer libId) {
        MntModuleLib mntModuleLib = mntModuleLibMapper.findByPrimaryKey(libId);
        return mntModuleLib;
    }

    /**
     * 添加库文件信息
     * @param MntModuleLib
     */
    @Override
    public void saveMntModuleLib(MntModuleLib mntModuleLib) {
        SysUser currentUser = userRealm.getCurrentUser();
        mntModuleLib.setDeleteFlag("0");
        mntModuleLib.setCreator(currentUser.getUserName());
        mntModuleLib.setModifier(currentUser.getUserName());
        mntModuleLib.setCreateDate(new Date());
        mntModuleLib.setModifyDate(new Date());
        mntModuleLibMapper.save(mntModuleLib);
        
    }

    /**
     * 更新库文件信息
     * 根据MntModuleLib的主键更新主键以外的其他字段
     * @param MntModuleLib
     */
    @Override
    public void updateMntModuleLibByLibId(MntModuleLib mntModuleLib) {
        SysUser currentUser = userRealm.getCurrentUser();
        mntModuleLib.setModifier(currentUser.getUserName());
        mntModuleLib.setModifyDate(new Date());
        mntModuleLibMapper.updateByPrimaryKey(mntModuleLib);
        
    }

    /**
     * 根据主键批量删除库文件信息 
     * 非物理删除 修改删除标识
     * @param libId Primary key
     */
    @Override
    public void deleteMntModuleLibByLibIds(String libIds) {
        SysUser currentUser = userRealm.getCurrentUser();
        MntModuleLib mntModuleLib = new MntModuleLib();
        mntModuleLib.setDeleteFlag("1");
        mntModuleLib.setModifier(currentUser.getUserName());
        mntModuleLib.setModifyDate(new Date());
        String[] libIdAry = libIds.split(",");
        for(String libId : libIdAry) {
            mntModuleLib.setLibId(Integer.parseInt(libId));
            mntModuleLibMapper.updateByPrimaryKey(mntModuleLib);
        }
    }
    
    //private void cvtContentList(List<MntModuleLib> MntModuleLibList) {
    //    for(MntModuleLib mntModuleLib : MntModuleLibList) {
    //    }
    //}
}

