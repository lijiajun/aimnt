package com.ai.mnt.model.sys;

import java.util.Date;

/**
 * @Title: SysUserRole 
 * @Description: SysUserRole Model
 * @Author: Auto Generate 
 * @Date: 2016-4-24
 */
public class SysUserRole {

    /**关联ID*/
    private Integer id;

    /**用户编号*/
    private Integer userId;

    /**角色编号*/
    private Integer roleId;


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getRoleId() {
        return roleId;
    }

    public void setRoleId(Integer roleId) {
        this.roleId = roleId;
    }


}