package com.ai.mnt.service.product.impl;


import java.util.List;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ai.mnt.common.shiro.UserRealm;
import com.ai.mnt.model.product.MntLibRelHis;
import com.ai.mnt.model.sys.SysUser;
import com.ai.mnt.persistence.product.MntLibRelHisMapper;
import com.ai.mnt.service.product.MntLibRelHisService;

/**
 * @Title: MntLibRelHisServiceImpl 
 * @Description: MntLibRelHisServiceImpl ServiceImplPackage
 * @Author: Auto Generate. HE
 * @Date: 2016-5-17
 */
@Service
public class MntLibRelHisServiceImpl implements MntLibRelHisService{

    @Autowired
    MntLibRelHisMapper mntLibRelHisMapper;
    
    @Autowired
    UserRealm userRealm;
    
    /**
     * 获取所有库文件发布历史明细列表
     * @return List<MntLibRelHis>
     */
    @Override
    public List<MntLibRelHis> findAllMntLibRelHis() {
        List<MntLibRelHis> mntLibRelHisList = mntLibRelHisMapper.findAll();
        //cvtContentList(mntLibRelHisList);
        return mntLibRelHisList;
    }

    /**
     * 获取库文件发布历史明细列表
     * @param product
     * @return List<MntLibRelHis>
     */
    @Override
    public List<MntLibRelHis> findMntLibRelHisList(MntLibRelHis mntLibRelHis) {
        List<MntLibRelHis> mntLibRelHisList = mntLibRelHisMapper.findList(mntLibRelHis);
        //cvtContentList(mntLibRelHisList);
        return mntLibRelHisList;
    }

    /**
     * 通过主键ID获取库文件发布历史明细
     * @param id Primary key
     * @return MntLibRelHis
     */
    @Override
    public MntLibRelHis findMntLibRelHisById(Integer id) {
        MntLibRelHis mntLibRelHis = mntLibRelHisMapper.findByPrimaryKey(id);
        return mntLibRelHis;
    }

    /**
     * 添加库文件发布历史明细
     * @param MntLibRelHis
     */
    @Override
    public void saveMntLibRelHis(MntLibRelHis mntLibRelHis) {
        SysUser currentUser = userRealm.getCurrentUser();
        mntLibRelHis.setDeleteFlag("0");
        mntLibRelHis.setCreator(currentUser.getUserName());
        mntLibRelHis.setModifier(currentUser.getUserName());
        mntLibRelHis.setCreateDate(new Date());
        mntLibRelHis.setModifyDate(new Date());
        mntLibRelHisMapper.save(mntLibRelHis);
        
    }

    /**
     * 更新库文件发布历史明细
     * 根据MntLibRelHis的主键更新主键以外的其他字段
     * @param MntLibRelHis
     */
    @Override
    public void updateMntLibRelHisById(MntLibRelHis mntLibRelHis) {
        SysUser currentUser = userRealm.getCurrentUser();
        mntLibRelHis.setModifier(currentUser.getUserName());
        mntLibRelHis.setModifyDate(new Date());
        mntLibRelHisMapper.updateByPrimaryKey(mntLibRelHis);
        
    }

    /**
     * 根据主键批量删除库文件发布历史明细 
     * 非物理删除 修改删除标识
     * @param id Primary key
     */
    @Override
    public void deleteMntLibRelHisByIds(String ids) {
        SysUser currentUser = userRealm.getCurrentUser();
        MntLibRelHis mntLibRelHis = new MntLibRelHis();
        mntLibRelHis.setDeleteFlag("1");
        mntLibRelHis.setModifier(currentUser.getUserName());
        mntLibRelHis.setModifyDate(new Date());
        String[] idAry = ids.split(",");
        for(String id : idAry) {
            mntLibRelHis.setId(Integer.parseInt(id));
            mntLibRelHisMapper.updateByPrimaryKey(mntLibRelHis);
        }
    }
    
    //private void cvtContentList(List<MntLibRelHis> MntLibRelHisList) {
    //    for(MntLibRelHis mntLibRelHis : MntLibRelHisList) {
    //    }
    //}
}

