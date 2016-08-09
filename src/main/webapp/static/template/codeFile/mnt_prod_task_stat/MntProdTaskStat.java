package com.ai.mnt.model.report;

import java.io.Serializable;
import java.util.Date;

/**
 * @Title: MntProdTaskStat 
 * @Description: MntProdTaskStat Model
 * @Author: Auto Generate.
 * @Date: 2016-7-27
 */
public class MntProdTaskStat implements Serializable{

    private static final long serialVersionUID = 1L;

    /**编号*/
    private Integer id;

    /**产品编号*/
    private Integer prodId;

    /***/
    private Integer newNum;

    /**处理中需求数*/
    private Integer processingNum;

    /**已完成需求数*/
    private Integer finishedNum;

    /**未完成需求最早提出时间*/
    private Date earlSubmTimeUnfinished;

    /**周期 1周 2月 3季 4年*/
    private String cycle;

    /**周期开始日期*/
    private Date cycleBeginDate;

    /**周期结束日期*/
    private Date cycleEndDate;

    /**备注*/
    private String remark;

    /**创建人*/
    private String creator;

    /**创建时间*/
    private Date createDate;

    /**修改人*/
    private String modifier;

    /**修改时间*/
    private Date modifyDate;


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getProdId() {
        return prodId;
    }

    public void setProdId(Integer prodId) {
        this.prodId = prodId;
    }

    public Integer getNewNum() {
        return newNum;
    }

    public void setNewNum(Integer newNum) {
        this.newNum = newNum;
    }

    public Integer getProcessingNum() {
        return processingNum;
    }

    public void setProcessingNum(Integer processingNum) {
        this.processingNum = processingNum;
    }

    public Integer getFinishedNum() {
        return finishedNum;
    }

    public void setFinishedNum(Integer finishedNum) {
        this.finishedNum = finishedNum;
    }

    public Date getEarlSubmTimeUnfinished() {
        return earlSubmTimeUnfinished;
    }

    public void setEarlSubmTimeUnfinished(Date earlSubmTimeUnfinished) {
        this.earlSubmTimeUnfinished = earlSubmTimeUnfinished;
    }

    public String getCycle() {
        return cycle;
    }

    public void setCycle(String cycle) {
        this.cycle = cycle;
    }

    public Date getCycleBeginDate() {
        return cycleBeginDate;
    }

    public void setCycleBeginDate(Date cycleBeginDate) {
        this.cycleBeginDate = cycleBeginDate;
    }

    public Date getCycleEndDate() {
        return cycleEndDate;
    }

    public void setCycleEndDate(Date cycleEndDate) {
        this.cycleEndDate = cycleEndDate;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getCreator() {
        return creator;
    }

    public void setCreator(String creator) {
        this.creator = creator;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public String getModifier() {
        return modifier;
    }

    public void setModifier(String modifier) {
        this.modifier = modifier;
    }

    public Date getModifyDate() {
        return modifyDate;
    }

    public void setModifyDate(Date modifyDate) {
        this.modifyDate = modifyDate;
    }


}