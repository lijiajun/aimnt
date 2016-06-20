package com.ai.mnt.service.product.impl;


import java.util.List;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ai.mnt.common.shiro.UserRealm;
import com.ai.mnt.model.product.MntLibBaseRel;
import com.ai.mnt.model.sys.SysUser;
import com.ai.mnt.persistence.product.MntLibBaseRelMapper;
import com.ai.mnt.service.product.MntLibBaseRelService;

/**
 * @Title: MntLibBaseRelServiceImpl 
 * @Description: MntLibBaseRelServiceImpl ServiceImplPackage
 * @Author: Auto Generate. HE
 * @Date: 2016-5-19
 */
@Service
public class MntLibBaseRelServiceImpl implements MntLibBaseRelService{

    @Autowired
    MntLibBaseRelMapper mntLibBaseRelMapper;
    
    @Autowired
    UserRealm userRealm;
    
    /**
     * 获取所有库文件历史安装点关联表列表
     * @return List<MntLibBaseRel>
     */
    @Override
    public List<MntLibBaseRel> findAllMntLibBaseRel() {
        List<MntLibBaseRel> mntLibBaseRelList = mntLibBaseRelMapper.findAll();
        //cvtContentList(mntLibBaseRelList);
        return mntLibBaseRelList;
    }

    /**
     * 获取库文件历史安装点关联表列表
     * @param product
     * @return List<MntLibBaseRel>
     */
    @Override
    public List<MntLibBaseRel> findMntLibBaseRelList(MntLibBaseRel mntLibBaseRel) {
        List<MntLibBaseRel> mntLibBaseRelList = mntLibBaseRelMapper.findList(mntLibBaseRel);
        //cvtContentList(mntLibBaseRelList);
        return mntLibBaseRelList;
    }

    /**
     * 通过主键ID获取库文件历史安装点关联表
     * @param id Primary key
     * @return MntLibBaseRel
     */
    @Override
    public MntLibBaseRel findMntLibBaseRelById(Integer id) {
        MntLibBaseRel mntLibBaseRel = mntLibBaseRelMapper.findByPrimaryKey(id);
        return mntLibBaseRel;
    }

    /**
     * 添加库文件历史安装点关联表
     * @param MntLibBaseRel
     */
    @Override
    public void saveMntLibBaseRel(MntLibBaseRel mntLibBaseRel) {
        SysUser currentUser = userRealm.getCurrentUser();
        mntLibBaseRel.setDeleteFlag("0");
        mntLibBaseRel.setCreator(currentUser.getUserName());
        mntLibBaseRel.setModifier(currentUser.getUserName());
        mntLibBaseRel.setCreateDate(new Date());
        mntLibBaseRel.setModifyDate(new Date());
        mntLibBaseRelMapper.save(mntLibBaseRel);
        
    }

    /**
     * 更新库文件历史安装点关联表
     * 根据MntLibBaseRel的主键更新主键以外的其他字段
     * @param MntLibBaseRel
     */
    @Override
    public void updateMntLibBaseRelById(MntLibBaseRel mntLibBaseRel) {
        SysUser currentUser = userRealm.getCurrentUser();
        mntLibBaseRel.setModifier(currentUser.getUserName());
        mntLibBaseRel.setModifyDate(new Date());
        mntLibBaseRelMapper.updateByPrimaryKey(mntLibBaseRel);
        
    }

    /**
     * 根据主键批量删除库文件历史安装点关联表 
     * 非物理删除 修改删除标识
     * @param id Primary key
     */
    @Override
    public void deleteMntLibBaseRelByIds(String ids) {
        SysUser currentUser = userRealm.getCurrentUser();
        MntLibBaseRel mntLibBaseRel = new MntLibBaseRel();
        mntLibBaseRel.setDeleteFlag("1");
        mntLibBaseRel.setModifier(currentUser.getUserName());
        mntLibBaseRel.setModifyDate(new Date());
        String[] idAry = ids.split(",");
        for(String id : idAry) {
            mntLibBaseRel.setId(Integer.parseInt(id));
            mntLibBaseRelMapper.updateByPrimaryKey(mntLibBaseRel);
        }
    }
    
    //private void cvtContentList(List<MntLibBaseRel> MntLibBaseRelList) {
    //    for(MntLibBaseRel mntLibBaseRel : MntLibBaseRelList) {
    //    }
    //}
}

