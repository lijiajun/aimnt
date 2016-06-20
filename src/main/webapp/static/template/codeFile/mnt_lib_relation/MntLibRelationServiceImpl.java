package com.ai.mnt.service.product.impl;


import java.util.List;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ai.mnt.common.shiro.UserRealm;
import com.ai.mnt.model.product.MntLibRelation;
import com.ai.mnt.model.sys.SysUser;
import com.ai.mnt.persistence.product.MntLibRelationMapper;
import com.ai.mnt.service.product.MntLibRelationService;

/**
 * @Title: MntLibRelationServiceImpl 
 * @Description: MntLibRelationServiceImpl ServiceImplPackage
 * @Author: Auto Generate. HE
 * @Date: 2016-5-20
 */
@Service
public class MntLibRelationServiceImpl implements MntLibRelationService{

    @Autowired
    MntLibRelationMapper mntLibRelationMapper;
    
    @Autowired
    UserRealm userRealm;
    
    /**
     * 获取所有库文件关联信息列表
     * @return List<MntLibRelation>
     */
    @Override
    public List<MntLibRelation> findAllMntLibRelation() {
        List<MntLibRelation> mntLibRelationList = mntLibRelationMapper.findAll();
        //cvtContentList(mntLibRelationList);
        return mntLibRelationList;
    }

    /**
     * 获取库文件关联信息列表
     * @param product
     * @return List<MntLibRelation>
     */
    @Override
    public List<MntLibRelation> findMntLibRelationList(MntLibRelation mntLibRelation) {
        List<MntLibRelation> mntLibRelationList = mntLibRelationMapper.findList(mntLibRelation);
        //cvtContentList(mntLibRelationList);
        return mntLibRelationList;
    }

    /**
     * 通过主键ID获取库文件关联信息
     * @param id Primary key
     * @return MntLibRelation
     */
    @Override
    public MntLibRelation findMntLibRelationById(Integer id) {
        MntLibRelation mntLibRelation = mntLibRelationMapper.findByPrimaryKey(id);
        return mntLibRelation;
    }

    /**
     * 添加库文件关联信息
     * @param MntLibRelation
     */
    @Override
    public void saveMntLibRelation(MntLibRelation mntLibRelation) {
        SysUser currentUser = userRealm.getCurrentUser();
        mntLibRelation.setDeleteFlag("0");
        mntLibRelation.setCreator(currentUser.getUserName());
        mntLibRelation.setModifier(currentUser.getUserName());
        mntLibRelation.setCreateDate(new Date());
        mntLibRelation.setModifyDate(new Date());
        mntLibRelationMapper.save(mntLibRelation);
        
    }

    /**
     * 更新库文件关联信息
     * 根据MntLibRelation的主键更新主键以外的其他字段
     * @param MntLibRelation
     */
    @Override
    public void updateMntLibRelationById(MntLibRelation mntLibRelation) {
        SysUser currentUser = userRealm.getCurrentUser();
        mntLibRelation.setModifier(currentUser.getUserName());
        mntLibRelation.setModifyDate(new Date());
        mntLibRelationMapper.updateByPrimaryKey(mntLibRelation);
        
    }

    /**
     * 根据主键批量删除库文件关联信息 
     * 非物理删除 修改删除标识
     * @param id Primary key
     */
    @Override
    public void deleteMntLibRelationByIds(String ids) {
        SysUser currentUser = userRealm.getCurrentUser();
        MntLibRelation mntLibRelation = new MntLibRelation();
        mntLibRelation.setDeleteFlag("1");
        mntLibRelation.setModifier(currentUser.getUserName());
        mntLibRelation.setModifyDate(new Date());
        String[] idAry = ids.split(",");
        for(String id : idAry) {
            mntLibRelation.setId(Integer.parseInt(id));
            mntLibRelationMapper.updateByPrimaryKey(mntLibRelation);
        }
    }
    
    //private void cvtContentList(List<MntLibRelation> MntLibRelationList) {
    //    for(MntLibRelation mntLibRelation : MntLibRelationList) {
    //    }
    //}
}

