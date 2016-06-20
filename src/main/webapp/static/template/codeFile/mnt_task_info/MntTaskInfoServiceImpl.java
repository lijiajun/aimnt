package com.ai.mnt.service.task.impl;


import java.util.List;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ai.mnt.common.shiro.UserRealm;
import com.ai.mnt.model.task.MntTaskInfo;
import com.ai.mnt.model.sys.SysUser;
import com.ai.mnt.persistence.product.MntTaskInfoMapper;
import com.ai.mnt.service.task.MntTaskInfoService;

/**
 * @Title: MntTaskInfoServiceImpl 
 * @Description: MntTaskInfoServiceImpl ServiceImplPackage
 * @Author: Auto Generate. HE
 * @Date: 2016-5-17
 */
@Service
public class MntTaskInfoServiceImpl implements MntTaskInfoService{

    @Autowired
    MntTaskInfoMapper mntTaskInfoMapper;
    
    @Autowired
    UserRealm userRealm;
    
    /**
     * 获取所有任务信息列表
     * @return List<MntTaskInfo>
     */
    @Override
    public List<MntTaskInfo> findAllMntTaskInfo() {
        List<MntTaskInfo> mntTaskInfoList = mntTaskInfoMapper.findAll();
        //cvtContentList(mntTaskInfoList);
        return mntTaskInfoList;
    }

    /**
     * 获取任务信息列表
     * @param task
     * @return List<MntTaskInfo>
     */
    @Override
    public List<MntTaskInfo> findMntTaskInfoList(MntTaskInfo mntTaskInfo) {
        List<MntTaskInfo> mntTaskInfoList = mntTaskInfoMapper.findList(mntTaskInfo);
        //cvtContentList(mntTaskInfoList);
        return mntTaskInfoList;
    }

    /**
     * 通过主键ID获取任务信息
     * @param taskId Primary key
     * @return MntTaskInfo
     */
    @Override
    public MntTaskInfo findMntTaskInfoByTaskId(Integer taskId) {
        MntTaskInfo mntTaskInfo = mntTaskInfoMapper.findByPrimaryKey(taskId);
        return mntTaskInfo;
    }

    /**
     * 添加任务信息
     * @param MntTaskInfo
     */
    @Override
    public void saveMntTaskInfo(MntTaskInfo mntTaskInfo) {
        SysUser currentUser = userRealm.getCurrentUser();
        mntTaskInfo.setDeleteFlag("0");
        mntTaskInfo.setCreator(currentUser.getUserName());
        mntTaskInfo.setModifier(currentUser.getUserName());
        mntTaskInfo.setCreateDate(new Date());
        mntTaskInfo.setModifyDate(new Date());
        mntTaskInfoMapper.save(mntTaskInfo);
        
    }

    /**
     * 更新任务信息
     * 根据MntTaskInfo的主键更新主键以外的其他字段
     * @param MntTaskInfo
     */
    @Override
    public void updateMntTaskInfoByTaskId(MntTaskInfo mntTaskInfo) {
        SysUser currentUser = userRealm.getCurrentUser();
        mntTaskInfo.setModifier(currentUser.getUserName());
        mntTaskInfo.setModifyDate(new Date());
        mntTaskInfoMapper.updateByPrimaryKey(mntTaskInfo);
        
    }

    /**
     * 根据主键批量删除任务信息 
     * 非物理删除 修改删除标识
     * @param taskId Primary key
     */
    @Override
    public void deleteMntTaskInfoByTaskIds(String taskIds) {
        SysUser currentUser = userRealm.getCurrentUser();
        MntTaskInfo mntTaskInfo = new MntTaskInfo();
        mntTaskInfo.setDeleteFlag("1");
        mntTaskInfo.setModifier(currentUser.getUserName());
        mntTaskInfo.setModifyDate(new Date());
        String[] taskIdAry = taskIds.split(",");
        for(String taskId : taskIdAry) {
            mntTaskInfo.setTaskId(Integer.parseInt(taskId));
            mntTaskInfoMapper.updateByPrimaryKey(mntTaskInfo);
        }
    }
    
    //private void cvtContentList(List<MntTaskInfo> MntTaskInfoList) {
    //    for(MntTaskInfo mntTaskInfo : MntTaskInfoList) {
    //    }
    //}
}

