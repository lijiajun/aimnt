package com.ai.mnt.persistence.article;


import java.util.List;

import org.springframework.stereotype.Repository;

import com.ai.mnt.model.article.MntArticle;
import com.ai.mnt.persistence.base.CrudMapper;

/**
 * @Title: MntArticleMapper 
 * @Description: MntArticleMapper Persistence
 * @Author: Auto Generate. HE
 * @Date: 2016-6-27
 */
@Repository
public interface MntArticleMapper extends CrudMapper<MntArticle, Integer>{

    public List<MntArticle> findMntArticleListPagination(MntArticle mntArticle);

    public long getMntArticleTotalCount(MntArticle mntArticle);

    public List<MntArticle> getArticleListReadTopTen(MntArticle mntArticle);
    
    public MntArticle getPreArticle(Integer id);
    
    public MntArticle getNextArticle(Integer id);
    
    public void updateArticleRelCountById(MntArticle mntArticle);
}