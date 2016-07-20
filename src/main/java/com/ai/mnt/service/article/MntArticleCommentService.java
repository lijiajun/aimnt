package com.ai.mnt.service.article;

import java.util.List;
import com.ai.mnt.model.article.MntArticleComment;

/**
 * @Title: MntArticleCommentService 
 * @Description: MntArticleCommentService ServicePackage
 * @Author: Auto Generate.
 * @Date: 2016-7-6
 */

public interface MntArticleCommentService {
    
    /**
     * 获取所有文章评论列表
     * @return List<MntArticleComment>
     */
    public List<MntArticleComment> findAllMntArticleComment();
    
    
    /**
     * 获取文章评论列表
     * @param article
     * @return List<MntArticleComment>
     */
    public List<MntArticleComment> findMntArticleCommentList(MntArticleComment mntArticleComment);
    
    /**
     * 通过主键ID获取文章评论
     * @param commentId Primary key
     * @return MntArticleComment
     */
    public MntArticleComment findMntArticleCommentByCommentId(Integer commentId);
    
    /**
     * 添加文章评论
     * @param MntArticleComment
     */
    public void saveMntArticleComment(MntArticleComment mntArticleComment);
    
    /**
     * 添加文章评论的评论
     * @param MntArticleComment
     */
    public void saveMntArticleComment2(MntArticleComment mntArticleComment);
    /**
     * 更新文章评论
     * 根据MntArticleComment的主键更新主键以外的其他字段
     * @param MntArticleComment
     */
    public void updateMntArticleCommentByCommentId(MntArticleComment mntArticleComment);
    
    /**
     * 根据主键批量删除文章评论 
     * 非物理删除 修改删除标识
     * @param commentId Primary key
     */
    public void deleteMntArticleCommentByCommentIds(String commentIds);

    // 获得评论的数量
    public long getMntArticleTotalCount(MntArticleComment mntArticleComment);

    /*
     * 评论分页
     * */
    public List<MntArticleComment> findMntArticleCommentListPagination(
            MntArticleComment mntArticleComment);
    //获得评论的父名
    public String getMntArticleCommentParentName(MntArticleComment mntArticleComment);
}
