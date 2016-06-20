package com.ai.mnt.model.sys;

import java.util.Date;

/**
 * @Title: SysRole 
 * @Description: SysRole Model
 * @Author: Auto Generate 
 * @Date: 2016-4-24
 */
public class SysRole {

    /**角色编号*/
    private Integer roleId;

    /**角色名称*/
    private String roleName;

    /**角色状态，1可用，0不可用*/
    private String roleSts;

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

    /**角色状态，1可用，0不可用*/
    private String roleStsTxt;
    
    public Integer getRoleId() {
        return roleId;
    }

    public void setRoleId(Integer roleId) {
        this.roleId = roleId;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    public String getRoleSts() {
        return roleSts;
    }

    public void setRoleSts(String roleSts) {
        this.roleSts = roleSts;
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

    public String getRoleStsTxt() {
        return roleStsTxt;
    }

    public void setRoleStsTxt(String roleStsTxt) {
        this.roleStsTxt = roleStsTxt;
    }


}