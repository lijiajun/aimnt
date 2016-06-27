package com.ai.mnt.service.article.impl;


import java.util.List;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ai.mnt.common.shiro.UserRealm;
import com.ai.mnt.model.article.MntArticle;
import com.ai.mnt.model.sys.SysUser;
import com.ai.mnt.persistence.article.MntArticleMapper;
import com.ai.mnt.service.article.MntArticleService;

/**
 * @Title: MntArticleServiceImpl 
 * @Description: MntArticleServiceImpl ServiceImplPackage
 * @Author: Auto Generate.
 * @Date: 2016-6-27
 */
@Service
public class MntArticleServiceImpl implements MntArticleService{

    @Autowired
    MntArticleMapper mntArticleMapper;
    
    @Autowired
    UserRealm userRealm;
    
    /**
     * 获取所有运维文章列表
     * @return List<MntArticle>
     */
    @Override
    public List<MntArticle> findAllMntArticle() {
        List<MntArticle> mntArticleList = mntArticleMapper.findAll();
        //cvtContentList(mntArticleList);
        return mntArticleList;
    }

    /**
     * 获取运维文章列表
     * @param article
     * @return List<MntArticle>
     */
    @Override
    public List<MntArticle> findMntArticleList(MntArticle mntArticle) {
        List<MntArticle> mntArticleList = mntArticleMapper.findList(mntArticle);
        //cvtContentList(mntArticleList);
        return mntArticleList;
    }

    /**
     * 通过主键ID获取运维文章
     * @param id Primary key
     * @return MntArticle
     */
    @Override
    public MntArticle findMntArticleById(Integer id) {
        MntArticle mntArticle = mntArticleMapper.findByPrimaryKey(id);
        return mntArticle;
    }

    /**
     * 添加运维文章
     * @param MntArticle
     */
    @Override
    public void saveMntArticle(MntArticle mntArticle) {
        SysUser currentUser = userRealm.getCurrentUser();
        mntArticle.setDeleteFlag("0");
        mntArticle.setCreator(currentUser.getUserName());
        mntArticle.setModifier(currentUser.getUserName());
        mntArticle.setCreateDate(new Date());
        mntArticle.setModifyDate(new Date());
        mntArticleMapper.save(mntArticle);
        
    }

    /**
     * 更新运维文章
     * 根据MntArticle的主键更新主键以外的其他字段
     * @param MntArticle
     */
    @Override
    public void updateMntArticleById(MntArticle mntArticle) {
        SysUser currentUser = userRealm.getCurrentUser();
        mntArticle.setModifier(currentUser.getUserName());
        mntArticle.setModifyDate(new Date());
        mntArticleMapper.updateByPrimaryKey(mntArticle);
        
    }

    /**
     * 根据主键批量删除运维文章 
     * 非物理删除 修改删除标识
     * @param id Primary key
     */
    @Override
    public void deleteMntArticleByIds(String ids) {
        SysUser currentUser = userRealm.getCurrentUser();
        MntArticle mntArticle = new MntArticle();
        mntArticle.setDeleteFlag("1");
        mntArticle.setModifier(currentUser.getUserName());
        mntArticle.setModifyDate(new Date());
        String[] idAry = ids.split(",");
        for(String id : idAry) {
            mntArticle.setId(Integer.parseInt(id));
            mntArticleMapper.updateByPrimaryKey(mntArticle);
        }
    }
    
    //private void cvtContentList(List<MntArticle> MntArticleList) {
    //    for(MntArticle mntArticle : MntArticleList) {
    //    }
    //}
}

