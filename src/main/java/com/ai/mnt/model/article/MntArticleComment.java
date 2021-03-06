package com.ai.mnt.model.article;

import java.io.Serializable;
import java.util.Date;

import com.ai.mnt.model.common.Pagination;

/**
 * @Title: MntArticleComment 
 * @Description: MntArticleComment Model
 * @Author: Auto Generate.
 * @Date: 2016-7-6
 */
public class MntArticleComment extends Pagination implements Serializable{

    private static final long serialVersionUID = 1L;

    /**评论ID*/
    private Integer commentId;

    /**文章ID*/
    private Integer aritcleId;

    /**评论人姓名*/
    private String userName;

    /**评论内容*/
    private String commentContent;

    /**评论时间*/
    private Date commentDate;

    /**评论上级*/
    private Integer parentId;
    
    //评论上级的用户
    private String parentUserName;
    
    //评论上级的内容
    private String parentComment;

    public Integer getCommentId() {
        return commentId;
    }

    public void setCommentId(Integer commentId) {
        this.commentId = commentId;
    }

    public Integer getAritcleId() {
        return aritcleId;
    }

    public void setAritcleId(Integer aritcleId) {
        this.aritcleId = aritcleId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getCommentContent() {
        return commentContent;
    }

    public void setCommentContent(String commentContent) {
        this.commentContent = commentContent;
    }

    public Date getCommentDate() {
        return commentDate;
    }

    public void setCommentDate(Date commentDate) {
        this.commentDate = commentDate;
    }

    public Integer getParentId() {
        return parentId;
    }

    public void setParentId(Integer parentId) {
        this.parentId = parentId;
    }

    public String getParentUserName() {
        return parentUserName;
    }

    public void setParentUserName(String parentUserName) {
        this.parentUserName = parentUserName;
    }

    public String getParentComment() {
        return parentComment;
    }

    public void setParentComment(String parentComment) {
        this.parentComment = parentComment;
    }

   /* public void setCommentCount(int size) {
        // TODO Auto-generated method stub
        
    }*/


}