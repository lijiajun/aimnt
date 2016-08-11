package com.ai.mnt.service.article.impl;


import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ai.mnt.common.shiro.UserRealm;
import com.ai.mnt.model.article.MntArticleComment;
import com.ai.mnt.model.sys.SysUser;
import com.ai.mnt.persistence.article.MntArticleCommentMapper;
import com.ai.mnt.service.article.MntArticleCommentService;

/**
 * @Title: MntArticleCommentServiceImpl 
 * @Description: MntArticleCommentServiceImpl ServiceImplPackage
 * @Author: Auto Generate.
 * @Date: 2016-7-6
 */
@Service
public class MntArticleCommentServiceImpl implements MntArticleCommentService{

    @Autowired
    MntArticleCommentMapper mntArticleCommentMapper;
    
    @Autowired
    UserRealm userRealm;
    
  
    
    /**
     * 获取所有文章评论列表
     * @return List<MntArticleComment>
     */
    @Override
    public List<MntArticleComment> findAllMntArticleComment() {
        List<MntArticleComment> mntArticleCommentList = mntArticleCommentMapper.findAll();
        //cvtContentList(mntArticleCommentList);
        return mntArticleCommentList;
    }

    /**
     * 获取文章评论列表
     * @param article
     * @return List<MntArticleComment>
     */
    @Override
    public List<MntArticleComment> findMntArticleCommentList(MntArticleComment mntArticleComment) {
        List<MntArticleComment> mntArticleCommentList = mntArticleCommentMapper.findList(mntArticleComment);
        //cvtContentList(mntArticleCommentList);
        return mntArticleCommentList;
    }
    
    /**
     * 评论分页
     * */
    @Override
    public List<MntArticleComment> findMntArticleCommentListPagination(
            MntArticleComment mntArticleComment) {
        List<MntArticleComment> mntArticleCommentList = mntArticleCommentMapper.findMntArticleCommentListPagination(mntArticleComment);
        //cvtContentList(mntArticleCommentList);
        for (MntArticleComment mntArticleComment2 : mntArticleCommentList) {
            if (mntArticleComment2.getParentId()!=-1) {
                MntArticleComment mntArticleComment1 = findMntArticleCommentByCommentId(mntArticleComment2.getParentId());
                mntArticleComment2.setParentUserName(mntArticleComment1.getUserName());
                mntArticleComment2.setParentComment(mntArticleComment1.getCommentContent());
                System.out.println(mntArticleComment2.getParentUserName()+"===============");
            }else {
                mntArticleComment2.setParentUserName("");
            }
        }
        return mntArticleCommentList;
    }

    /**
     * 通过主键ID获取文章评论
     * @param commentId Primary key
     * @return MntArticleComment
     */
    @Override
    public MntArticleComment findMntArticleCommentByCommentId(Integer commentId) {
        MntArticleComment mntArticleComment = mntArticleCommentMapper.findByPrimaryKey(commentId);
        return mntArticleComment;
    }

    /**
     * 添加文章评论
     * @param MntArticleComment
     */
    @Override
    public void saveMntArticleComment(MntArticleComment mntArticleComment) {
        SysUser currentUser = userRealm.getCurrentUser();
       
        mntArticleComment.setCommentDate(new Date());
        mntArticleComment.setUserName(currentUser.getUserName());
        mntArticleComment.setParentId(-1);
        //mntArticleComment.setParentUserName(parentUserName);
        mntArticleCommentMapper.save(mntArticleComment);
    }

    /**
     * 更新文章评论
     * 根据MntArticleComment的主键更新主键以外的其他字段
     * @param MntArticleComment
     */
    @Override
    public void updateMntArticleCommentByCommentId(MntArticleComment mntArticleComment) {
        //SysUser currentUser = userRealm.getCurrentUser();
       /* mntArticleComment.setModifier(currentUser.getUserName());
        mntArticleComment.setModifyDate(new Date());
        */
        mntArticleCommentMapper.updateByPrimaryKey(mntArticleComment);
        
    }

    /**
     * 根据主键批量删除文章评论 
     * 非物理删除 修改删除标识
     * @param commentId Primary key
     */
    @Override
    public void deleteMntArticleCommentByCommentIds(String commentIds) {
        //SysUser currentUser = userRealm.getCurrentUser();
        MntArticleComment mntArticleComment = new MntArticleComment();
       /* mntArticleComment.setDeleteFlag("1");
        mntArticleComment.setModifier(currentUser.getUserName());
        mntArticleComment.setModifyDate(new Date());
        */String[] commentIdAry = commentIds.split(",");
        for(String commentId : commentIdAry) {
            mntArticleComment.setCommentId(Integer.parseInt(commentId));
            mntArticleCommentMapper.updateByPrimaryKey(mntArticleComment);
        }
    }
    //评论的总数
    @Override
    public long getMntArticleTotalCount(MntArticleComment mntArticleComment) {
        return mntArticleCommentMapper.getMntArticleTotalCount(mntArticleComment);
    }
    
    //评论的回复
    @Override
    public void saveMntArticleComment2(MntArticleComment mntArticleComment) {
        SysUser currentUser = userRealm.getCurrentUser();
        mntArticleComment.setCommentDate(new Date());
        mntArticleComment.setUserName(currentUser.getUserName());
        mntArticleCommentMapper.save(mntArticleComment);
    }

    //获取评论父名
    @Override
    public String getMntArticleCommentParentName(MntArticleComment mntArticleComment) {
        return null;
       /* for (MntArticleComment mntArticleComment2 : mntArticleCommentList) {
            // System.out.println(mntArticleComment2.getParentId()+"============----------------");
             if (mntArticleComment2.getParentId()!=-1) {
                 mntArticleComment =findMntArticleCommentByCommentId(mntArticleComment2.getParentId());
                 System.out.println(mntArticleComment.getUserName()+"-----------------");
                 mntArticleComment.setParentUserName(mntArticleComment.getUserName());
                 System.out.println(mntArticleComment.getParentUserName()+"===============");
             }
         }*/
    }
    
    
  
    //private void cvtContentList(List<MntArticleComment> MntArticleCommentList) {
    //    for(MntArticleComment mntArticleComment : MntArticleCommentList) {
    //    }
    //}
}

