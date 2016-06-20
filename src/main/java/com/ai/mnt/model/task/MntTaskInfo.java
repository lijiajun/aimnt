package com.ai.mnt.model.task;

import java.io.Serializable;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

/**
 * @Title: MntTaskInfo 
 * @Description: MntTaskInfo Model
 * @Author: Auto Generate. HE
 * @Date: 2016-5-17
 */
public class MntTaskInfo implements Serializable{

    /**
     * 
     */
    private static final long serialVersionUID = 2748188200781225177L;

    /***/
    private Integer taskId;

    /**任务名称*/
    private String taskName;

    /**任务描述*/
    private String taskDesc;

    /**分派人*/
    private String creator;

    /**处理人*/
    private String dealPerson;

    /**上级任务*/
    private Integer parentTaskId;

    /**分派时间*/
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date createDate;

    /**预计完成时间*/
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date expectDate;

    /**处理时间*/
    private Date dealDate;

    /***/
    private Date finishDate;

    /**处理状态 1未分派 2处理中 3已完成*/
    private String dealSts;

    /**删除标识 1已删除 0未删除*/
    private String deleteFlag;

    /**备注*/
    private String taskRemark;

    /** 开始时间 */
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date beginDate;

    /** 结束时间 */
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date endDate;
    
    /**上级任务*/
    private String parentTaskName;

    /**处理状态 1未分派 2处理中 3已完成*/
    private String dealStsTxt;
    
    public Integer getTaskId() {
        return taskId;
    }

    public void setTaskId(Integer taskId) {
        this.taskId = taskId;
    }

    public String getTaskName() {
        return taskName;
    }

    public void setTaskName(String taskName) {
        this.taskName = taskName;
    }

    public String getTaskDesc() {
        return taskDesc;
    }

    public void setTaskDesc(String taskDesc) {
        this.taskDesc = taskDesc;
    }

    public String getCreator() {
        return creator;
    }

    public void setCreator(String creator) {
        this.creator = creator;
    }

    public String getDealPerson() {
        return dealPerson;
    }

    public void setDealPerson(String dealPerson) {
        this.dealPerson = dealPerson;
    }

    public Integer getParentTaskId() {
        return parentTaskId;
    }

    public void setParentTaskId(Integer parentTaskId) {
        this.parentTaskId = parentTaskId;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public Date getExpectDate() {
        return expectDate;
    }

    public void setExpectDate(Date expectDate) {
        this.expectDate = expectDate;
    }

    public Date getDealDate() {
        return dealDate;
    }

    public void setDealDate(Date dealDate) {
        this.dealDate = dealDate;
    }

    public Date getFinishDate() {
        return finishDate;
    }

    public void setFinishDate(Date finishDate) {
        this.finishDate = finishDate;
    }

    public String getDealSts() {
        return dealSts;
    }

    public void setDealSts(String dealSts) {
        this.dealSts = dealSts;
    }

    public String getDeleteFlag() {
        return deleteFlag;
    }

    public void setDeleteFlag(String deleteFlag) {
        this.deleteFlag = deleteFlag;
    }

    public String getTaskRemark() {
        return taskRemark;
    }

    public void setTaskRemark(String taskRemark) {
        this.taskRemark = taskRemark;
    }

    public Date getBeginDate() {
        return beginDate;
    }

    public void setBeginDate(Date beginDate) {
        this.beginDate = beginDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public String getParentTaskName() {
        return parentTaskName;
    }

    public void setParentTaskName(String parentTaskName) {
        this.parentTaskName = parentTaskName;
    }

    public String getDealStsTxt() {
        return dealStsTxt;
    }

    public void setDealStsTxt(String dealStsTxt) {
        this.dealStsTxt = dealStsTxt;
    }


}