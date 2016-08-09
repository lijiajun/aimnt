package com.ai.mnt.service.rel.impl;


import java.util.List;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ai.mnt.common.shiro.UserRealm;
import com.ai.mnt.model.rel.MntProdRelPlan;
import com.ai.mnt.model.sys.SysUser;
import com.ai.mnt.persistence.rel.MntProdRelPlanMapper;
import com.ai.mnt.service.rel.MntProdRelPlanService;

/**
 * @Title: MntProdRelPlanServiceImpl 
 * @Description: MntProdRelPlanServiceImpl ServiceImplPackage
 * @Author: Auto Generate.
 * @Date: 2016-7-28
 */
@Service
public class MntProdRelPlanServiceImpl implements MntProdRelPlanService{

    @Autowired
    MntProdRelPlanMapper mntProdRelPlanMapper;
    
    @Autowired
    UserRealm userRealm;
    
    /**
     * 获取所有发布计划列表
     * @return List<MntProdRelPlan>
     */
    @Override
    public List<MntProdRelPlan> findAllMntProdRelPlan() {
        List<MntProdRelPlan> mntProdRelPlanList = mntProdRelPlanMapper.findAll();
        //cvtContentList(mntProdRelPlanList);
        return mntProdRelPlanList;
    }

    /**
     * 获取发布计划列表
     * @param rel
     * @return List<MntProdRelPlan>
     */
    @Override
    public List<MntProdRelPlan> findMntProdRelPlanList(MntProdRelPlan mntProdRelPlan) {
        List<MntProdRelPlan> mntProdRelPlanList = mntProdRelPlanMapper.findList(mntProdRelPlan);
        //cvtContentList(mntProdRelPlanList);
        return mntProdRelPlanList;
    }

    /**
     * 通过主键ID获取发布计划
     * @param id Primary key
     * @return MntProdRelPlan
     */
    @Override
    public MntProdRelPlan findMntProdRelPlanById(Integer id) {
        MntProdRelPlan mntProdRelPlan = mntProdRelPlanMapper.findByPrimaryKey(id);
        return mntProdRelPlan;
    }

    /**
     * 添加发布计划
     * @param MntProdRelPlan
     */
    @Override
    public void saveMntProdRelPlan(MntProdRelPlan mntProdRelPlan) {
        SysUser currentUser = userRealm.getCurrentUser();
        mntProdRelPlan.setDeleteFlag("0");
        mntProdRelPlan.setCreator(currentUser.getUserName());
        mntProdRelPlan.setModifier(currentUser.getUserName());
        mntProdRelPlan.setCreateDate(new Date());
        mntProdRelPlan.setModifyDate(new Date());
        mntProdRelPlanMapper.save(mntProdRelPlan);
        
    }

    /**
     * 更新发布计划
     * 根据MntProdRelPlan的主键更新主键以外的其他字段
     * @param MntProdRelPlan
     */
    @Override
    public void updateMntProdRelPlanById(MntProdRelPlan mntProdRelPlan) {
        SysUser currentUser = userRealm.getCurrentUser();
        mntProdRelPlan.setModifier(currentUser.getUserName());
        mntProdRelPlan.setModifyDate(new Date());
        mntProdRelPlanMapper.updateByPrimaryKey(mntProdRelPlan);
        
    }

    /**
     * 根据主键批量删除发布计划 
     * 非物理删除 修改删除标识
     * @param id Primary key
     */
    @Override
    public void deleteMntProdRelPlanByIds(String ids) {
        SysUser currentUser = userRealm.getCurrentUser();
        MntProdRelPlan mntProdRelPlan = new MntProdRelPlan();
        mntProdRelPlan.setDeleteFlag("1");
        mntProdRelPlan.setModifier(currentUser.getUserName());
        mntProdRelPlan.setModifyDate(new Date());
        String[] idAry = ids.split(",");
        for(String id : idAry) {
            mntProdRelPlan.setId(Integer.parseInt(id));
            mntProdRelPlanMapper.updateByPrimaryKey(mntProdRelPlan);
        }
    }
    
    //private void cvtContentList(List<MntProdRelPlan> MntProdRelPlanList) {
    //    for(MntProdRelPlan mntProdRelPlan : MntProdRelPlanList) {
    //    }
    //}
}

