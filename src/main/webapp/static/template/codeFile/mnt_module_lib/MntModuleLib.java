package com.ai.mnt.model.product;

import java.util.Date;

/**
 * @Title: MntModuleLib 
 * @Description: MntModuleLib Model
 * @Author: Auto Generate. HE
 * @Date: 2016-5-12
 */
public class MntModuleLib {

    /**库文件编号*/
    private Integer libId;

    /**库文件名称*/
    private String libName;

    /**所属模块*/
    private Integer moduleId;

    /**库文件描述*/
    private String libDesc;

    /**是否在用*/
    private String isUsed;

    /**删除标识，1删除，0未删除*/
    private String deleteFlag;

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


    public Integer getLibId() {
        return libId;
    }

    public void setLibId(Integer libId) {
        this.libId = libId;
    }

    public String getLibName() {
        return libName;
    }

    public void setLibName(String libName) {
        this.libName = libName;
    }

    public Integer getModuleId() {
        return moduleId;
    }

    public void setModuleId(Integer moduleId) {
        this.moduleId = moduleId;
    }

    public String getLibDesc() {
        return libDesc;
    }

    public void setLibDesc(String libDesc) {
        this.libDesc = libDesc;
    }

    public String getIsUsed() {
        return isUsed;
    }

    public void setIsUsed(String isUsed) {
        this.isUsed = isUsed;
    }

    public String getDeleteFlag() {
        return deleteFlag;
    }

    public void setDeleteFlag(String deleteFlag) {
        this.deleteFlag = deleteFlag;
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