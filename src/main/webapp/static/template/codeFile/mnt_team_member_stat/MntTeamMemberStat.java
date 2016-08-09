package com.ai.mnt.model.report;

import java.io.Serializable;
import java.util.Date;

/**
 * @Title: MntTeamMemberStat 
 * @Description: MntTeamMemberStat Model
 * @Author: Auto Generate.
 * @Date: 2016-7-27
 */
public class MntTeamMemberStat implements Serializable{

    private static final long serialVersionUID = 1L;

    /**编号*/
    private Integer id;

    /***/
    private Integer teamId;

    /***/
    private Integer memberNum;

    /**1正式成员 2实习生 3外援 4出差成员*/
    private String memberType;

    /**周期 1周 2月 3季 4年*/
    private String cycle;

    /**周期开始时间*/
    private Date cycleBeginDate;

    /***/
    private Date cycleEndDate;

    /***/
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

    public Integer getTeamId() {
        return teamId;
    }

    public void setTeamId(Integer teamId) {
        this.teamId = teamId;
    }

    public Integer getMemberNum() {
        return memberNum;
    }

    public void setMemberNum(Integer memberNum) {
        this.memberNum = memberNum;
    }

    public String getMemberType() {
        return memberType;
    }

    public void setMemberType(String memberType) {
        this.memberType = memberType;
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