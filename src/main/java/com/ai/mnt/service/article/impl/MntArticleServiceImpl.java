package com.ai.mnt.service.article.impl;


import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ai.mnt.common.cache.BaseDataCache;
import com.ai.mnt.common.shiro.UserRealm;
import com.ai.mnt.model.article.MntArticle;
import com.ai.mnt.model.article.MntArticleType;
import com.ai.mnt.model.common.EnumObject;
import com.ai.mnt.model.sys.SysUser;
import com.ai.mnt.persistence.article.MntArticleMapper;
import com.ai.mnt.persistence.article.MntArticleTypeMapper;
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
    
    @Autowired
    MntArticleTypeMapper mntArticleTypeMapper;
    
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
     * 获取分页运维文章列表
     * @param article
     * @return List<MntArticle>
     */
    @Override
    public List<MntArticle> findMntArticleListPagination(MntArticle mntArticle) {
        List<MntArticle> mntArticleList = mntArticleMapper.findMntArticleListPagination(mntArticle);
        cvtContentList(mntArticleList);
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
        
        //getSummary
//        if(StringUtils.isEmpty(mntArticle.getSummary())) {
//            if(!StringUtils.isEmpty(mntArticle.getContent())) {
//                if(mntArticle.getContent().length() > 100) {
//                    mntArticle.setSummary(mntArticle.getContent().substring(0, 100));
//                }else {
//                    mntArticle.setSummary(mntArticle.getContent());
//                }
//            }
//        }
        
        //文章分类
        if(mntArticle.getTypeId() == -99) {
            MntArticleType mntArticleType = new MntArticleType();
            mntArticleType.setTypeCn(mntArticle.getTypeCn());
            mntArticleType.setParentTypeId(-1);
            mntArticleTypeMapper.save(mntArticleType);
            mntArticle.setTypeId(mntArticleType.getTypeId());
            
            addArticleTypeCache(mntArticleType);
        }
        
        
        //getAuthor
        if(StringUtils.isEmpty(mntArticle.getAuthor())) {
            mntArticle.setAuthor(currentUser.getUserName());
        }
        mntArticle.setReadCount(0);
        mntArticle.setIsTop("0");
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
        
        //文章分类
        if(mntArticle.getTypeId() == -99) {
            MntArticleType mntArticleType = new MntArticleType();
            mntArticleType.setTypeCn(mntArticle.getTypeCn());
            mntArticleType.setParentTypeId(-1);
            mntArticleTypeMapper.save(mntArticleType);
            mntArticle.setTypeId(mntArticleType.getTypeId());
            
            addArticleTypeCache(mntArticleType);
        }
        
        SysUser currentUser = userRealm.getCurrentUser();
        
        //getAuthor
        if(StringUtils.isEmpty(mntArticle.getAuthor())) {
            mntArticle.setAuthor(currentUser.getUserName());
        }
        
        mntArticle.setModifier(currentUser.getUserName());
        mntArticle.setModifyDate(new Date());
        
        mntArticleMapper.updateByPrimaryKey(mntArticle);
        
    }

    /**
     * 更新运维文章阅读次数
     * @param MntArticle
     */
    @Override
    public void updateArticleReadCountById(MntArticle mntArticle) {
        mntArticleMapper.updateArticleReadCountById(mntArticle);
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

    @Override
    public long getMntArticleTotalCount(MntArticle mntArticle) {
        return mntArticleMapper.getMntArticleTotalCount(mntArticle);
    }

    @Override
    public List<MntArticle> getArticleListReadTopTen(MntArticle mntArticle) {
        List<MntArticle> topTenList = mntArticleMapper.getArticleListReadTopTen(mntArticle);
        return topTenList;
    }

    /**
     * 上一篇文章
     * @param MntArticle mntArticle
     */
    @Override
    public MntArticle getPreArticle(Integer id) {
        return mntArticleMapper.getPreArticle(id);
    }

    /**
     * 下一篇文章
     * @param MntArticle mntArticle
     */
    @Override
    public MntArticle getNextArticle(Integer id) {
        return mntArticleMapper.getNextArticle(id);
    }

    @Override
    public List<MntArticleType> findAllMntArticleType() {
        return mntArticleTypeMapper.findAll();
    }
    
    private void cvtContentList(List<MntArticle> MntArticleList) {
        for(MntArticle mntArticle : MntArticleList) {
            mntArticle.setTypeCn(BaseDataCache.getDataName("ARTICLE_TYPE", mntArticle.getTypeId()));
        }
    }
    
    private void addArticleTypeCache(MntArticleType mntArticleType) {
        Map<Object, EnumObject> map = BaseDataCache.GLOBAL_MAP.get("ARTICLE_TYPE");
        EnumObject enumObject = new EnumObject();
        enumObject.setKey(mntArticleType.getTypeId().toString());
        enumObject.setValue(mntArticleType.getTypeCn());
        enumObject.setOrder(mntArticleType.getTypeId());
        enumObject.setGroupKey("ARTICLE_TYPE");
        enumObject.setGroupValue("文章分类映射");
        map.put(mntArticleType.getTypeId().toString(), enumObject);
    }
}

