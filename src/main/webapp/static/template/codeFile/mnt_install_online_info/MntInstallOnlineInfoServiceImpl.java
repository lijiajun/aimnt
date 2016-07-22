package com.ai.mnt.service.inst.impl;


import java.util.List;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ai.mnt.common.shiro.UserRealm;
import com.ai.mnt.model.inst.MntInstallOnlineInfo;
import com.ai.mnt.model.sys.SysUser;
import com.ai.mnt.persistence.inst.MntInstallOnlineInfoMapper;
import com.ai.mnt.service.inst.MntInstallOnlineInfoService;

/**
 * @Title: MntInstallOnlineInfoServiceImpl 
 * @Description: MntInstallOnlineInfoServiceImpl ServiceImplPackage
 * @Author: Auto Generate.
 * @Date: 2016-7-21
 */
@Service
public class MntInstallOnlineInfoServiceImpl implements MntInstallOnlineInfoService{

    @Autowired
    MntInstallOnlineInfoMapper mntInstallOnlineInfoMapper;
    
    @Autowired
    UserRealm userRealm;
    
    /**
     * 获取所有安装点上线信息列表
     * @return List<MntInstallOnlineInfo>
     */
    @Override
    public List<MntInstallOnlineInfo> findAllMntInstallOnlineInfo() {
        List<MntInstallOnlineInfo> mntInstallOnlineInfoList = mntInstallOnlineInfoMapper.findAll();
        //cvtContentList(mntInstallOnlineInfoList);
        return mntInstallOnlineInfoList;
    }

    /**
     * 获取安装点上线信息列表
     * @param inst
     * @return List<MntInstallOnlineInfo>
     */
    @Override
    public List<MntInstallOnlineInfo> findMntInstallOnlineInfoList(MntInstallOnlineInfo mntInstallOnlineInfo) {
        List<MntInstallOnlineInfo> mntInstallOnlineInfoList = mntInstallOnlineInfoMapper.findList(mntInstallOnlineInfo);
        //cvtContentList(mntInstallOnlineInfoList);
        return mntInstallOnlineInfoList;
    }

    /**
     * 通过主键ID获取安装点上线信息
     * @param onlineId Primary key
     * @return MntInstallOnlineInfo
     */
    @Override
    public MntInstallOnlineInfo findMntInstallOnlineInfoByOnlineId(Integer onlineId) {
        MntInstallOnlineInfo mntInstallOnlineInfo = mntInstallOnlineInfoMapper.findByPrimaryKey(onlineId);
        return mntInstallOnlineInfo;
    }

    /**
     * 添加安装点上线信息
     * @param MntInstallOnlineInfo
     */
    @Override
    public void saveMntInstallOnlineInfo(MntInstallOnlineInfo mntInstallOnlineInfo) {
        SysUser currentUser = userRealm.getCurrentUser();
        mntInstallOnlineInfo.setDeleteFlag("0");
        mntInstallOnlineInfo.setCreator(currentUser.getUserName());
        mntInstallOnlineInfo.setModifier(currentUser.getUserName());
        mntInstallOnlineInfo.setCreateDate(new Date());
        mntInstallOnlineInfo.setModifyDate(new Date());
        mntInstallOnlineInfoMapper.save(mntInstallOnlineInfo);
        
    }

    /**
     * 更新安装点上线信息
     * 根据MntInstallOnlineInfo的主键更新主键以外的其他字段
     * @param MntInstallOnlineInfo
     */
    @Override
    public void updateMntInstallOnlineInfoByOnlineId(MntInstallOnlineInfo mntInstallOnlineInfo) {
        SysUser currentUser = userRealm.getCurrentUser();
        mntInstallOnlineInfo.setModifier(currentUser.getUserName());
        mntInstallOnlineInfo.setModifyDate(new Date());
        mntInstallOnlineInfoMapper.updateByPrimaryKey(mntInstallOnlineInfo);
        
    }

    /**
     * 根据主键批量删除安装点上线信息 
     * 非物理删除 修改删除标识
     * @param onlineId Primary key
     */
    @Override
    public void deleteMntInstallOnlineInfoByOnlineIds(String onlineIds) {
        SysUser currentUser = userRealm.getCurrentUser();
        MntInstallOnlineInfo mntInstallOnlineInfo = new MntInstallOnlineInfo();
        mntInstallOnlineInfo.setDeleteFlag("1");
        mntInstallOnlineInfo.setModifier(currentUser.getUserName());
        mntInstallOnlineInfo.setModifyDate(new Date());
        String[] onlineIdAry = onlineIds.split(",");
        for(String onlineId : onlineIdAry) {
            mntInstallOnlineInfo.setOnlineId(Integer.parseInt(onlineId));
            mntInstallOnlineInfoMapper.updateByPrimaryKey(mntInstallOnlineInfo);
        }
    }
    
    //private void cvtContentList(List<MntInstallOnlineInfo> MntInstallOnlineInfoList) {
    //    for(MntInstallOnlineInfo mntInstallOnlineInfo : MntInstallOnlineInfoList) {
    //    }
    //}
}

