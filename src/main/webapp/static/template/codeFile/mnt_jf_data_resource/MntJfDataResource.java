package com.ai.mnt.model.inst;

import java.io.Serializable;
import java.util.Date;

/**
 * @Title: MntJfDataResource 
 * @Description: MntJfDataResource Model
 * @Author: Auto Generate.
 * @Date: 2016-10-13
 */
public class MntJfDataResource implements Serializable{

    private static final long serialVersionUID = 1L;

    /**编号*/
    private Integer id;

    /**安装点*/
    private Integer baseId;

    /**业务名称*/
    private String busiName;

    /**解码模板*/
    private String decodeTemplate;

    /**分析模板*/
    private String analysisTemplate;

    /**xdr_type*/
    private String xdrType;

    /**服务编号*/
    private String serviceId;

    /**dr_type*/
    private String drType;

    /**业务是否下线*/
    private String isOffline;

    /**是否送计费*/
    private String isToJf;

    /**是否需要处理*/
    private String isNeedDeal;

    /**附件名称*/
    private String fileName;

    /**备注*/
    private String remark;

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


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getBaseId() {
        return baseId;
    }

    public void setBaseId(Integer baseId) {
        this.baseId = baseId;
    }

    public String getBusiName() {
        return busiName;
    }

    public void setBusiName(String busiName) {
        this.busiName = busiName;
    }

    public String getDecodeTemplate() {
        return decodeTemplate;
    }

    public void setDecodeTemplate(String decodeTemplate) {
        this.decodeTemplate = decodeTemplate;
    }

    public String getAnalysisTemplate() {
        return analysisTemplate;
    }

    public void setAnalysisTemplate(String analysisTemplate) {
        this.analysisTemplate = analysisTemplate;
    }

    public String getXdrType() {
        return xdrType;
    }

    public void setXdrType(String xdrType) {
        this.xdrType = xdrType;
    }

    public String getServiceId() {
        return serviceId;
    }

    public void setServiceId(String serviceId) {
        this.serviceId = serviceId;
    }

    public String getDrType() {
        return drType;
    }

    public void setDrType(String drType) {
        this.drType = drType;
    }

    public String getIsOffline() {
        return isOffline;
    }

    public void setIsOffline(String isOffline) {
        this.isOffline = isOffline;
    }

    public String getIsToJf() {
        return isToJf;
    }

    public void setIsToJf(String isToJf) {
        this.isToJf = isToJf;
    }

    public String getIsNeedDeal() {
        return isNeedDeal;
    }

    public void setIsNeedDeal(String isNeedDeal) {
        this.isNeedDeal = isNeedDeal;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
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