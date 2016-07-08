package com.ai.mnt.model.article;

import java.io.Serializable;
import java.util.Date;

/**
 * @Title: MntArticleComment 
 * @Description: MntArticleComment Model
 * @Author: Auto Generate.
 * @Date: 2016-7-6
 */
public class MntArticleComment implements Serializable{

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


}