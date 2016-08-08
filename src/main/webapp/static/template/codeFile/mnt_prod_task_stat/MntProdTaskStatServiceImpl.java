package com.ai.mnt.service.report.impl;


import java.util.List;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ai.mnt.common.shiro.UserRealm;
import com.ai.mnt.model.report.MntProdTaskStat;
import com.ai.mnt.model.sys.SysUser;
import com.ai.mnt.persistence.report.MntProdTaskStatMapper;
import com.ai.mnt.service.report.MntProdTaskStatService;

/**
 * @Title: MntProdTaskStatServiceImpl 
 * @Description: MntProdTaskStatServiceImpl ServiceImplPackage
 * @Author: Auto Generate.
 * @Date: 2016-7-27
 */
@Service
public class MntProdTaskStatServiceImpl implements MntProdTaskStatService{

    @Autowired
    MntProdTaskStatMapper mntProdTaskStatMapper;
    
    @Autowired
    UserRealm userRealm;
    
    /**
     * 获取所有产品线任务统计列表
     * @return List<MntProdTaskStat>
     */
    @Override
    public List<MntProdTaskStat> findAllMntProdTaskStat() {
        List<MntProdTaskStat> mntProdTaskStatList = mntProdTaskStatMapper.findAll();
        //cvtContentList(mntProdTaskStatList);
        return mntProdTaskStatList;
    }

    /**
     * 获取产品线任务统计列表
     * @param report
     * @return List<MntProdTaskStat>
     */
    @Override
    public List<MntProdTaskStat> findMntProdTaskStatList(MntProdTaskStat mntProdTaskStat) {
        List<MntProdTaskStat> mntProdTaskStatList = mntProdTaskStatMapper.findList(mntProdTaskStat);
        //cvtContentList(mntProdTaskStatList);
        return mntProdTaskStatList;
    }

    /**
     * 通过主键ID获取产品线任务统计
     * @param id Primary key
     * @return MntProdTaskStat
     */
    @Override
    public MntProdTaskStat findMntProdTaskStatById(Integer id) {
        MntProdTaskStat mntProdTaskStat = mntProdTaskStatMapper.findByPrimaryKey(id);
        return mntProdTaskStat;
    }

    /**
     * 添加产品线任务统计
     * @param MntProdTaskStat
     */
    @Override
    public void saveMntProdTaskStat(MntProdTaskStat mntProdTaskStat) {
        SysUser currentUser = userRealm.getCurrentUser();
        mntProdTaskStat.setDeleteFlag("0");
        mntProdTaskStat.setCreator(currentUser.getUserName());
        mntProdTaskStat.setModifier(currentUser.getUserName());
        mntProdTaskStat.setCreateDate(new Date());
        mntProdTaskStat.setModifyDate(new Date());
        mntProdTaskStatMapper.save(mntProdTaskStat);
        
    }

    /**
     * 更新产品线任务统计
     * 根据MntProdTaskStat的主键更新主键以外的其他字段
     * @param MntProdTaskStat
     */
    @Override
    public void updateMntProdTaskStatById(MntProdTaskStat mntProdTaskStat) {
        SysUser currentUser = userRealm.getCurrentUser();
        mntProdTaskStat.setModifier(currentUser.getUserName());
        mntProdTaskStat.setModifyDate(new Date());
        mntProdTaskStatMapper.updateByPrimaryKey(mntProdTaskStat);
        
    }

    /**
     * 根据主键批量删除产品线任务统计 
     * 非物理删除 修改删除标识
     * @param id Primary key
     */
    @Override
    public void deleteMntProdTaskStatByIds(String ids) {
        SysUser currentUser = userRealm.getCurrentUser();
        MntProdTaskStat mntProdTaskStat = new MntProdTaskStat();
        mntProdTaskStat.setDeleteFlag("1");
        mntProdTaskStat.setModifier(currentUser.getUserName());
        mntProdTaskStat.setModifyDate(new Date());
        String[] idAry = ids.split(",");
        for(String id : idAry) {
            mntProdTaskStat.setId(Integer.parseInt(id));
            mntProdTaskStatMapper.updateByPrimaryKey(mntProdTaskStat);
        }
    }
    
    //private void cvtContentList(List<MntProdTaskStat> MntProdTaskStatList) {
    //    for(MntProdTaskStat mntProdTaskStat : MntProdTaskStatList) {
    //    }
    //}
}

