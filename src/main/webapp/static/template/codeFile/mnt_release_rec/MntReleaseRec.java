package com.ai.mnt.model.product;

import java.util.Date;

/**
 * @Title: MntReleaseRec 
 * @Description: MntReleaseRec Model
 * @Author: Auto Generate 
 * @Date: 2016-4-24
 */
public class MntReleaseRec {

    /**小版本ID*/
    private Integer relId;

    /**小版本号*/
    private String relCode;

    /**产品编号*/
    private Integer prodId;

    /**大版本编号*/
    private Integer verId;

    /**发布类型*/
    private Integer relType;

    /**版本描述*/
    private String relDesc;

    /**发布时间*/
    private Date relDate;

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


    public Integer getRelId() {
        return relId;
    }

    public void setRelId(Integer relId) {
        this.relId = relId;
    }

    public String getRelCode() {
        return relCode;
    }

    public void setRelCode(String relCode) {
        this.relCode = relCode;
    }

    public Integer getProdId() {
        return prodId;
    }

    public void setProdId(Integer prodId) {
        this.prodId = prodId;
    }

    public Integer getVerId() {
        return verId;
    }

    public void setVerId(Integer verId) {
        this.verId = verId;
    }

    public Integer getRelType() {
        return relType;
    }

    public void setRelType(Integer relType) {
        this.relType = relType;
    }

    public String getRelDesc() {
        return relDesc;
    }

    public void setRelDesc(String relDesc) {
        this.relDesc = relDesc;
    }

    public Date getRelDate() {
        return relDate;
    }

    public void setRelDate(Date relDate) {
        this.relDate = relDate;
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