package com.ai.mnt.service.inst.impl;


import java.util.List;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ai.mnt.common.shiro.UserRealm;
import com.ai.mnt.model.inst.MntInstallBaseInfo;
import com.ai.mnt.model.sys.SysUser;
import com.ai.mnt.persistence.inst.MntInstallBaseInfoMapper;
import com.ai.mnt.service.inst.MntInstallBaseInfoService;

/**
 * @Title: MntInstallBaseInfoServiceImpl 
 * @Description: MntInstallBaseInfoServiceImpl ServiceImplPackage
 * @Author: Auto Generate.
 * @Date: 2016-7-21
 */
@Service
public class MntInstallBaseInfoServiceImpl implements MntInstallBaseInfoService{

    @Autowired
    MntInstallBaseInfoMapper mntInstallBaseInfoMapper;
    
    @Autowired
    UserRealm userRealm;
    
    /**
     * 获取所有安装点信息列表
     * @return List<MntInstallBaseInfo>
     */
    @Override
    public List<MntInstallBaseInfo> findAllMntInstallBaseInfo() {
        List<MntInstallBaseInfo> mntInstallBaseInfoList = mntInstallBaseInfoMapper.findAll();
        //cvtContentList(mntInstallBaseInfoList);
        return mntInstallBaseInfoList;
    }

    /**
     * 获取安装点信息列表
     * @param inst
     * @return List<MntInstallBaseInfo>
     */
    @Override
    public List<MntInstallBaseInfo> findMntInstallBaseInfoList(MntInstallBaseInfo mntInstallBaseInfo) {
        List<MntInstallBaseInfo> mntInstallBaseInfoList = mntInstallBaseInfoMapper.findList(mntInstallBaseInfo);
        //cvtContentList(mntInstallBaseInfoList);
        return mntInstallBaseInfoList;
    }

    /**
     * 通过主键ID获取安装点信息
     * @param baseId Primary key
     * @return MntInstallBaseInfo
     */
    @Override
    public MntInstallBaseInfo findMntInstallBaseInfoByBaseId(Integer baseId) {
        MntInstallBaseInfo mntInstallBaseInfo = mntInstallBaseInfoMapper.findByPrimaryKey(baseId);
        return mntInstallBaseInfo;
    }

    /**
     * 添加安装点信息
     * @param MntInstallBaseInfo
     */
    @Override
    public void saveMntInstallBaseInfo(MntInstallBaseInfo mntInstallBaseInfo) {
        SysUser currentUser = userRealm.getCurrentUser();
        mntInstallBaseInfo.setDeleteFlag("0");
        mntInstallBaseInfo.setCreator(currentUser.getUserName());
        mntInstallBaseInfo.setModifier(currentUser.getUserName());
        mntInstallBaseInfo.setCreateDate(new Date());
        mntInstallBaseInfo.setModifyDate(new Date());
        mntInstallBaseInfoMapper.save(mntInstallBaseInfo);
        
    }

    /**
     * 更新安装点信息
     * 根据MntInstallBaseInfo的主键更新主键以外的其他字段
     * @param MntInstallBaseInfo
     */
    @Override
    public void updateMntInstallBaseInfoByBaseId(MntInstallBaseInfo mntInstallBaseInfo) {
        SysUser currentUser = userRealm.getCurrentUser();
        mntInstallBaseInfo.setModifier(currentUser.getUserName());
        mntInstallBaseInfo.setModifyDate(new Date());
        mntInstallBaseInfoMapper.updateByPrimaryKey(mntInstallBaseInfo);
        
    }

    /**
     * 根据主键批量删除安装点信息 
     * 非物理删除 修改删除标识
     * @param baseId Primary key
     */
    @Override
    public void deleteMntInstallBaseInfoByBaseIds(String baseIds) {
        SysUser currentUser = userRealm.getCurrentUser();
        MntInstallBaseInfo mntInstallBaseInfo = new MntInstallBaseInfo();
        mntInstallBaseInfo.setDeleteFlag("1");
        mntInstallBaseInfo.setModifier(currentUser.getUserName());
        mntInstallBaseInfo.setModifyDate(new Date());
        String[] baseIdAry = baseIds.split(",");
        for(String baseId : baseIdAry) {
            mntInstallBaseInfo.setBaseId(Integer.parseInt(baseId));
            mntInstallBaseInfoMapper.updateByPrimaryKey(mntInstallBaseInfo);
        }
    }
    
    //private void cvtContentList(List<MntInstallBaseInfo> MntInstallBaseInfoList) {
    //    for(MntInstallBaseInfo mntInstallBaseInfo : MntInstallBaseInfoList) {
    //    }
    //}
}

