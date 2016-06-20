package com.ai.mnt.model.product;

import java.util.Date;

/**
 * @Title: MntReleaseRecDtl 
 * @Description: MntReleaseRecDtl Model
 * @Author: Auto Generate 
 * @Date: 2016-4-26
 */
public class MntReleaseRecDtl {

    /**发布明细ID*/
    private Integer dtlId;

    /**小版本ID*/
    private Integer relId;

    /**明细类型, 1需求，2bug*/
    private Integer dtlType;

    /**需求编号、故障编号、SQL脚本编号*/
    private String dtlCode;

    /**需求名称、故障名称、SQL脚本名称*/
    private String dtlName;

    /**安装点，如：省份*/
    private Integer baseId;

    /**明细详细描述*/
    private String dtlDesc;

    /**删除标识，1删除，0未删除*/
    private String deleteFlag;

    /**创建人*/
    private String creator;

    /**创建时间*/
    private Date createDate;

    /**修改人*/
    private String modifier;

    /**修改时间*/
    private Date modifyDate;


    public Integer getDtlId() {
        return dtlId;
    }

    public void setDtlId(Integer dtlId) {
        this.dtlId = dtlId;
    }

    public Integer getRelId() {
        return relId;
    }

    public void setRelId(Integer relId) {
        this.relId = relId;
    }

    public Integer getDtlType() {
        return dtlType;
    }

    public void setDtlType(Integer dtlType) {
        this.dtlType = dtlType;
    }

    public String getDtlCode() {
        return dtlCode;
    }

    public void setDtlCode(String dtlCode) {
        this.dtlCode = dtlCode;
    }

    public String getDtlName() {
        return dtlName;
    }

    public void setDtlName(String dtlName) {
        this.dtlName = dtlName;
    }

    public Integer getBaseId() {
        return baseId;
    }

    public void setBaseId(Integer baseId) {
        this.baseId = baseId;
    }

    public String getDtlDesc() {
        return dtlDesc;
    }

    public void setDtlDesc(String dtlDesc) {
        this.dtlDesc = dtlDesc;
    }

    public String getDeleteFlag() {
        return deleteFlag;
    }

    public void setDeleteFlag(String deleteFlag) {
        this.deleteFlag = deleteFlag;
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