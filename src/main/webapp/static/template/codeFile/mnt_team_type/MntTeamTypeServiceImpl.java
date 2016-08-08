package com.ai.mnt.service.report.impl;


import java.util.List;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ai.mnt.common.shiro.UserRealm;
import com.ai.mnt.model.report.MntTeamType;
import com.ai.mnt.model.sys.SysUser;
import com.ai.mnt.persistence.report.MntTeamTypeMapper;
import com.ai.mnt.service.report.MntTeamTypeService;

/**
 * @Title: MntTeamTypeServiceImpl 
 * @Description: MntTeamTypeServiceImpl ServiceImplPackage
 * @Author: Auto Generate.
 * @Date: 2016-7-27
 */
@Service
public class MntTeamTypeServiceImpl implements MntTeamTypeService{

    @Autowired
    MntTeamTypeMapper mntTeamTypeMapper;
    
    @Autowired
    UserRealm userRealm;
    
    /**
     * 获取所有团队类型列表
     * @return List<MntTeamType>
     */
    @Override
    public List<MntTeamType> findAllMntTeamType() {
        List<MntTeamType> mntTeamTypeList = mntTeamTypeMapper.findAll();
        //cvtContentList(mntTeamTypeList);
        return mntTeamTypeList;
    }

    /**
     * 获取团队类型列表
     * @param report
     * @return List<MntTeamType>
     */
    @Override
    public List<MntTeamType> findMntTeamTypeList(MntTeamType mntTeamType) {
        List<MntTeamType> mntTeamTypeList = mntTeamTypeMapper.findList(mntTeamType);
        //cvtContentList(mntTeamTypeList);
        return mntTeamTypeList;
    }

    /**
     * 通过主键ID获取团队类型
     * @param teamId Primary key
     * @return MntTeamType
     */
    @Override
    public MntTeamType findMntTeamTypeByTeamId(Integer teamId) {
        MntTeamType mntTeamType = mntTeamTypeMapper.findByPrimaryKey(teamId);
        return mntTeamType;
    }

    /**
     * 添加团队类型
     * @param MntTeamType
     */
    @Override
    public void saveMntTeamType(MntTeamType mntTeamType) {
        SysUser currentUser = userRealm.getCurrentUser();
        mntTeamType.setDeleteFlag("0");
        mntTeamType.setCreator(currentUser.getUserName());
        mntTeamType.setModifier(currentUser.getUserName());
        mntTeamType.setCreateDate(new Date());
        mntTeamType.setModifyDate(new Date());
        mntTeamTypeMapper.save(mntTeamType);
        
    }

    /**
     * 更新团队类型
     * 根据MntTeamType的主键更新主键以外的其他字段
     * @param MntTeamType
     */
    @Override
    public void updateMntTeamTypeByTeamId(MntTeamType mntTeamType) {
        SysUser currentUser = userRealm.getCurrentUser();
        mntTeamType.setModifier(currentUser.getUserName());
        mntTeamType.setModifyDate(new Date());
        mntTeamTypeMapper.updateByPrimaryKey(mntTeamType);
        
    }

    /**
     * 根据主键批量删除团队类型 
     * 非物理删除 修改删除标识
     * @param teamId Primary key
     */
    @Override
    public void deleteMntTeamTypeByTeamIds(String teamIds) {
        SysUser currentUser = userRealm.getCurrentUser();
        MntTeamType mntTeamType = new MntTeamType();
        mntTeamType.setDeleteFlag("1");
        mntTeamType.setModifier(currentUser.getUserName());
        mntTeamType.setModifyDate(new Date());
        String[] teamIdAry = teamIds.split(",");
        for(String teamId : teamIdAry) {
            mntTeamType.setTeamId(Integer.parseInt(teamId));
            mntTeamTypeMapper.updateByPrimaryKey(mntTeamType);
        }
    }
    
    //private void cvtContentList(List<MntTeamType> MntTeamTypeList) {
    //    for(MntTeamType mntTeamType : MntTeamTypeList) {
    //    }
    //}
}

