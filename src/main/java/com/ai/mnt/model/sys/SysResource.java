package com.ai.mnt.model.sys;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @Title: SysResource 
 * @Description: SysResource Model
 * @Author: Auto Generate 
 * @Date: 2016-4-24
 */
public class SysResource {

    /**资源编号*/
    private Integer resId;

    /**资源名称*/
    private String resName;

    /**资源类型,1菜单，2按钮*/
    private Integer resType;

    /**资源链接*/
    private String resUrl;

    /**父节点资源编号*/
    private Integer parentId;

    /**所有父节点资源编号*/
    private String parentIds;

    /**资源顺序*/
    private Integer resOrder;

    /**资源图标*/
    private String resIcon;

    /**权限标识*/
    private String permission;

    /**资源状态，1正常，0禁用*/
    private String resSts;

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

    /**子列表*/
    List<SysResource> sysResourceList = new ArrayList<>();

    /**修改人*/
    private String parentName;
    
    /**修改人*/
    private String resTypeTxt;
    
    /**修改人*/
    private String resStsTxt;
    
    public Integer getResId() {
        return resId;
    }

    public void setResId(Integer resId) {
        this.resId = resId;
    }

    public String getResName() {
        return resName;
    }

    public void setResName(String resName) {
        this.resName = resName;
    }

    public Integer getResType() {
        return resType;
    }

    public void setResType(Integer resType) {
        this.resType = resType;
    }

    public String getResUrl() {
        return resUrl;
    }

    public void setResUrl(String resUrl) {
        this.resUrl = resUrl;
    }

    public Integer getParentId() {
        return parentId;
    }

    public void setParentId(Integer parentId) {
        this.parentId = parentId;
    }

    public String getParentIds() {
        return parentIds;
    }

    public void setParentIds(String parentIds) {
        this.parentIds = parentIds;
    }

    public Integer getResOrder() {
        return resOrder;
    }

    public void setResOrder(Integer resOrder) {
        this.resOrder = resOrder;
    }

    public String getResIcon() {
        return resIcon;
    }

    public void setResIcon(String resIcon) {
        this.resIcon = resIcon;
    }

    public String getPermission() {
        return permission;
    }

    public void setPermission(String permission) {
        this.permission = permission;
    }

    public String getResSts() {
        return resSts;
    }

    public void setResSts(String resSts) {
        this.resSts = resSts;
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

    public List<SysResource> getSysResourceList() {
        return sysResourceList;
    }

    public void setSysResourceList(List<SysResource> sysResourceList) {
        this.sysResourceList = sysResourceList;
    }

    public String getParentName() {
        return parentName;
    }

    public void setParentName(String parentName) {
        this.parentName = parentName;
    }

    public String getResTypeTxt() {
        return resTypeTxt;
    }

    public void setResTypeTxt(String resTypeTxt) {
        this.resTypeTxt = resTypeTxt;
    }

    public String getResStsTxt() {
        return resStsTxt;
    }

    public void setResStsTxt(String resStsTxt) {
        this.resStsTxt = resStsTxt;
    }

    
}