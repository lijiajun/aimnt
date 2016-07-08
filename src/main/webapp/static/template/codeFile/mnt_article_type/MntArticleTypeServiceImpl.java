package com.ai.mnt.service.article.impl;


import java.util.List;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ai.mnt.common.shiro.UserRealm;
import com.ai.mnt.model.article.MntArticleType;
import com.ai.mnt.model.sys.SysUser;
import com.ai.mnt.persistence.article.MntArticleTypeMapper;
import com.ai.mnt.service.article.MntArticleTypeService;

/**
 * @Title: MntArticleTypeServiceImpl 
 * @Description: MntArticleTypeServiceImpl ServiceImplPackage
 * @Author: Auto Generate.
 * @Date: 2016-7-6
 */
@Service
public class MntArticleTypeServiceImpl implements MntArticleTypeService{

    @Autowired
    MntArticleTypeMapper mntArticleTypeMapper;
    
    @Autowired
    UserRealm userRealm;
    
    /**
     * 获取所有运维文章分类列表
     * @return List<MntArticleType>
     */
    @Override
    public List<MntArticleType> findAllMntArticleType() {
        List<MntArticleType> mntArticleTypeList = mntArticleTypeMapper.findAll();
        //cvtContentList(mntArticleTypeList);
        return mntArticleTypeList;
    }

    /**
     * 获取运维文章分类列表
     * @param article
     * @return List<MntArticleType>
     */
    @Override
    public List<MntArticleType> findMntArticleTypeList(MntArticleType mntArticleType) {
        List<MntArticleType> mntArticleTypeList = mntArticleTypeMapper.findList(mntArticleType);
        //cvtContentList(mntArticleTypeList);
        return mntArticleTypeList;
    }

    /**
     * 通过主键ID获取运维文章分类
     * @param typeId Primary key
     * @return MntArticleType
     */
    @Override
    public MntArticleType findMntArticleTypeByTypeId(Integer typeId) {
        MntArticleType mntArticleType = mntArticleTypeMapper.findByPrimaryKey(typeId);
        return mntArticleType;
    }

    /**
     * 添加运维文章分类
     * @param MntArticleType
     */
    @Override
    public void saveMntArticleType(MntArticleType mntArticleType) {
        SysUser currentUser = userRealm.getCurrentUser();
        mntArticleType.setDeleteFlag("0");
        mntArticleType.setCreator(currentUser.getUserName());
        mntArticleType.setModifier(currentUser.getUserName());
        mntArticleType.setCreateDate(new Date());
        mntArticleType.setModifyDate(new Date());
        mntArticleTypeMapper.save(mntArticleType);
        
    }

    /**
     * 更新运维文章分类
     * 根据MntArticleType的主键更新主键以外的其他字段
     * @param MntArticleType
     */
    @Override
    public void updateMntArticleTypeByTypeId(MntArticleType mntArticleType) {
        SysUser currentUser = userRealm.getCurrentUser();
        mntArticleType.setModifier(currentUser.getUserName());
        mntArticleType.setModifyDate(new Date());
        mntArticleTypeMapper.updateByPrimaryKey(mntArticleType);
        
    }

    /**
     * 根据主键批量删除运维文章分类 
     * 非物理删除 修改删除标识
     * @param typeId Primary key
     */
    @Override
    public void deleteMntArticleTypeByTypeIds(String typeIds) {
        SysUser currentUser = userRealm.getCurrentUser();
        MntArticleType mntArticleType = new MntArticleType();
        mntArticleType.setDeleteFlag("1");
        mntArticleType.setModifier(currentUser.getUserName());
        mntArticleType.setModifyDate(new Date());
        String[] typeIdAry = typeIds.split(",");
        for(String typeId : typeIdAry) {
            mntArticleType.setTypeId(Integer.parseInt(typeId));
            mntArticleTypeMapper.updateByPrimaryKey(mntArticleType);
        }
    }
    
    //private void cvtContentList(List<MntArticleType> MntArticleTypeList) {
    //    for(MntArticleType mntArticleType : MntArticleTypeList) {
    //    }
    //}
}

