package com.ai.mnt.persistence.article;


import java.util.List;

import org.springframework.stereotype.Repository;

import com.ai.mnt.model.article.MntArticleComment;
import com.ai.mnt.persistence.base.CrudMapper;

/**
 * @Title: MntArticleCommentMapper 
 * @Description: MntArticleCommentMapper Persistence
 * @Author: Auto Generate. HE
 * @Date: 2016-7-6
 */
@Repository
public interface MntArticleCommentMapper extends CrudMapper<MntArticleComment, Integer>{

    long getMntArticleTotalCount(MntArticleComment mntArticleComment);

    List<MntArticleComment> findMntArticleListPagination(
            MntArticleComment mntArticleComment);
    
    
}