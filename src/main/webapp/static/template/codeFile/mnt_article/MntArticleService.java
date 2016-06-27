package com.ai.mnt.service.article;

import java.util.List;
import com.ai.mnt.model.article.MntArticle;

/**
 * @Title: MntArticleService 
 * @Description: MntArticleService ServicePackage
 * @Author: Auto Generate.
 * @Date: 2016-6-27
 */

public interface MntArticleService {
    
    /**
     * 获取所有运维文章列表
     * @return List<MntArticle>
     */
    public List<MntArticle> findAllMntArticle();
    
    
    /**
     * 获取运维文章列表
     * @param article
     * @return List<MntArticle>
     */
    public List<MntArticle> findMntArticleList(MntArticle mntArticle);
    
    /**
     * 通过主键ID获取运维文章
     * @param id Primary key
     * @return MntArticle
     */
    public MntArticle findMntArticleById(Integer id);
    
    /**
     * 添加运维文章
     * @param MntArticle
     */
    public void saveMntArticle(MntArticle mntArticle);
    
    /**
     * 更新运维文章
     * 根据MntArticle的主键更新主键以外的其他字段
     * @param MntArticle
     */
    public void updateMntArticleById(MntArticle mntArticle);
    
    /**
     * 根据主键批量删除运维文章 
     * 非物理删除 修改删除标识
     * @param id Primary key
     */
    public void deleteMntArticleByIds(String ids);
}
