package com.ai.mnt.service.product.impl;


import java.util.List;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ai.mnt.common.shiro.UserRealm;
import com.ai.mnt.model.product.MntLibInfo;
import com.ai.mnt.model.sys.SysUser;
import com.ai.mnt.persistence.product.MntLibInfoMapper;
import com.ai.mnt.service.product.MntLibInfoService;

/**
 * @Title: MntLibInfoServiceImpl 
 * @Description: MntLibInfoServiceImpl ServiceImplPackage
 * @Author: Auto Generate. HE
 * @Date: 2016-5-11
 */
@Service
public class MntLibInfoServiceImpl implements MntLibInfoService{

    @Autowired
    MntLibInfoMapper mntLibInfoMapper;
    
    @Autowired
    UserRealm userRealm;
    
    /**
     * 获取所有库文件信息列表
     * @return List<MntLibInfo>
     */
    @Override
    public List<MntLibInfo> findAllMntLibInfo() {
        List<MntLibInfo> mntLibInfoList = mntLibInfoMapper.findAll();
        //cvtContentList(mntLibInfoList);
        return mntLibInfoList;
    }

    /**
     * 获取库文件信息列表
     * @param product
     * @return List<MntLibInfo>
     */
    @Override
    public List<MntLibInfo> findMntLibInfoList(MntLibInfo mntLibInfo) {
        List<MntLibInfo> mntLibInfoList = mntLibInfoMapper.findList(mntLibInfo);
        //cvtContentList(mntLibInfoList);
        return mntLibInfoList;
    }

    /**
     * 通过主键ID获取库文件信息
     * @param libId Primary key
     * @return MntLibInfo
     */
    @Override
    public MntLibInfo findMntLibInfoByLibId(Integer libId) {
        MntLibInfo mntLibInfo = mntLibInfoMapper.findByPrimaryKey(libId);
        return mntLibInfo;
    }

    /**
     * 添加库文件信息
     * @param MntLibInfo
     */
    @Override
    public void saveMntLibInfo(MntLibInfo mntLibInfo) {
        SysUser currentUser = userRealm.getCurrentUser();
        mntLibInfo.setDeleteFlag("0");
        mntLibInfo.setCreator(currentUser.getUserName());
        mntLibInfo.setModifier(currentUser.getUserName());
        mntLibInfo.setCreateDate(new Date());
        mntLibInfo.setModifyDate(new Date());
        mntLibInfoMapper.save(mntLibInfo);
        
    }

    /**
     * 更新库文件信息
     * 根据MntLibInfo的主键更新主键以外的其他字段
     * @param MntLibInfo
     */
    @Override
    public void updateMntLibInfoByLibId(MntLibInfo mntLibInfo) {
        SysUser currentUser = userRealm.getCurrentUser();
        mntLibInfo.setModifier(currentUser.getUserName());
        mntLibInfo.setModifyDate(new Date());
        mntLibInfoMapper.updateByPrimaryKey(mntLibInfo);
        
    }

    /**
     * 根据主键批量删除库文件信息 
     * 非物理删除 修改删除标识
     * @param libId Primary key
     */
    @Override
    public void deleteMntLibInfoByLibIds(String libIds) {
        SysUser currentUser = userRealm.getCurrentUser();
        MntLibInfo mntLibInfo = new MntLibInfo();
        mntLibInfo.setDeleteFlag("1");
        mntLibInfo.setModifier(currentUser.getUserName());
        mntLibInfo.setModifyDate(new Date());
        String[] libIdAry = libIds.split(",");
        for(String libId : libIdAry) {
            mntLibInfo.setLibId(Integer.parseInt(libId));
            mntLibInfoMapper.updateByPrimaryKey(mntLibInfo);
        }
    }
    
    //private void cvtContentList(List<MntLibInfo> MntLibInfoList) {
    //    for(MntLibInfo mntLibInfo : MntLibInfoList) {
    //    }
    //}
}

