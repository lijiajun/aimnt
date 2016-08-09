package com.ai.mnt.service.report.impl;


import java.util.List;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ai.mnt.common.shiro.UserRealm;
import com.ai.mnt.model.report.MntTeamMemberStat;
import com.ai.mnt.model.sys.SysUser;
import com.ai.mnt.persistence.report.MntTeamMemberStatMapper;
import com.ai.mnt.service.report.MntTeamMemberStatService;

/**
 * @Title: MntTeamMemberStatServiceImpl 
 * @Description: MntTeamMemberStatServiceImpl ServiceImplPackage
 * @Author: Auto Generate.
 * @Date: 2016-7-27
 */
@Service
public class MntTeamMemberStatServiceImpl implements MntTeamMemberStatService{

    @Autowired
    MntTeamMemberStatMapper mntTeamMemberStatMapper;
    
    @Autowired
    UserRealm userRealm;
    
    /**
     * 获取所有团队成员统计列表
     * @return List<MntTeamMemberStat>
     */
    @Override
    public List<MntTeamMemberStat> findAllMntTeamMemberStat() {
        List<MntTeamMemberStat> mntTeamMemberStatList = mntTeamMemberStatMapper.findAll();
        //cvtContentList(mntTeamMemberStatList);
        return mntTeamMemberStatList;
    }

    /**
     * 获取团队成员统计列表
     * @param report
     * @return List<MntTeamMemberStat>
     */
    @Override
    public List<MntTeamMemberStat> findMntTeamMemberStatList(MntTeamMemberStat mntTeamMemberStat) {
        List<MntTeamMemberStat> mntTeamMemberStatList = mntTeamMemberStatMapper.findList(mntTeamMemberStat);
        //cvtContentList(mntTeamMemberStatList);
        return mntTeamMemberStatList;
    }

    /**
     * 通过主键ID获取团队成员统计
     * @param id Primary key
     * @return MntTeamMemberStat
     */
    @Override
    public MntTeamMemberStat findMntTeamMemberStatById(Integer id) {
        MntTeamMemberStat mntTeamMemberStat = mntTeamMemberStatMapper.findByPrimaryKey(id);
        return mntTeamMemberStat;
    }

    /**
     * 添加团队成员统计
     * @param MntTeamMemberStat
     */
    @Override
    public void saveMntTeamMemberStat(MntTeamMemberStat mntTeamMemberStat) {
        SysUser currentUser = userRealm.getCurrentUser();
        mntTeamMemberStat.setDeleteFlag("0");
        mntTeamMemberStat.setCreator(currentUser.getUserName());
        mntTeamMemberStat.setModifier(currentUser.getUserName());
        mntTeamMemberStat.setCreateDate(new Date());
        mntTeamMemberStat.setModifyDate(new Date());
        mntTeamMemberStatMapper.save(mntTeamMemberStat);
        
    }

    /**
     * 更新团队成员统计
     * 根据MntTeamMemberStat的主键更新主键以外的其他字段
     * @param MntTeamMemberStat
     */
    @Override
    public void updateMntTeamMemberStatById(MntTeamMemberStat mntTeamMemberStat) {
        SysUser currentUser = userRealm.getCurrentUser();
        mntTeamMemberStat.setModifier(currentUser.getUserName());
        mntTeamMemberStat.setModifyDate(new Date());
        mntTeamMemberStatMapper.updateByPrimaryKey(mntTeamMemberStat);
        
    }

    /**
     * 根据主键批量删除团队成员统计 
     * 非物理删除 修改删除标识
     * @param id Primary key
     */
    @Override
    public void deleteMntTeamMemberStatByIds(String ids) {
        SysUser currentUser = userRealm.getCurrentUser();
        MntTeamMemberStat mntTeamMemberStat = new MntTeamMemberStat();
        mntTeamMemberStat.setDeleteFlag("1");
        mntTeamMemberStat.setModifier(currentUser.getUserName());
        mntTeamMemberStat.setModifyDate(new Date());
        String[] idAry = ids.split(",");
        for(String id : idAry) {
            mntTeamMemberStat.setId(Integer.parseInt(id));
            mntTeamMemberStatMapper.updateByPrimaryKey(mntTeamMemberStat);
        }
    }
    
    //private void cvtContentList(List<MntTeamMemberStat> MntTeamMemberStatList) {
    //    for(MntTeamMemberStat mntTeamMemberStat : MntTeamMemberStatList) {
    //    }
    //}
}

