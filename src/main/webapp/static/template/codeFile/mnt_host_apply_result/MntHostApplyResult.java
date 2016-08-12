package com.ai.mnt.model.cloud;

import java.io.Serializable;
import java.util.Date;

/**
 * @Title: MntHostApplyResult 
 * @Description: MntHostApplyResult Model
 * @Author: Auto Generate.
 * @Date: 2016-8-11
 */
public class MntHostApplyResult implements Serializable{

    private static final long serialVersionUID = 1L;

    /**编号*/
    private Integer id;

    /**事业部*/
    private String dept;

    /**申请人*/
    private String applicant;

    /**申请人NT账号*/
    private String applicantNt;

    /**业务系统*/
    private String busiSystem;

    /**主机类型*/
    private String hostType;

    /**主机配置*/
    private String hostCfg;

    /**数据盘(G)*/
    private String diskSize;

    /**主机IP*/
    private String hostIp;

    /**root密码*/
    private String rootPasswd;

    /**puaiuc密码*/
    private String puaiucPasswd;

    /**主机系统*/
    private String hostOs;

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

    public String getDept() {
        return dept;
    }

    public void setDept(String dept) {
        this.dept = dept;
    }

    public String getApplicant() {
        return applicant;
    }

    public void setApplicant(String applicant) {
        this.applicant = applicant;
    }

    public String getApplicantNt() {
        return applicantNt;
    }

    public void setApplicantNt(String applicantNt) {
        this.applicantNt = applicantNt;
    }

    public String getBusiSystem() {
        return busiSystem;
    }

    public void setBusiSystem(String busiSystem) {
        this.busiSystem = busiSystem;
    }

    public String getHostType() {
        return hostType;
    }

    public void setHostType(String hostType) {
        this.hostType = hostType;
    }

    public String getHostCfg() {
        return hostCfg;
    }

    public void setHostCfg(String hostCfg) {
        this.hostCfg = hostCfg;
    }

    public String getDiskSize() {
        return diskSize;
    }

    public void setDiskSize(String diskSize) {
        this.diskSize = diskSize;
    }

    public String getHostIp() {
        return hostIp;
    }

    public void setHostIp(String hostIp) {
        this.hostIp = hostIp;
    }

    public String getRootPasswd() {
        return rootPasswd;
    }

    public void setRootPasswd(String rootPasswd) {
        this.rootPasswd = rootPasswd;
    }

    public String getPuaiucPasswd() {
        return puaiucPasswd;
    }

    public void setPuaiucPasswd(String puaiucPasswd) {
        this.puaiucPasswd = puaiucPasswd;
    }

    public String getHostOs() {
        return hostOs;
    }

    public void setHostOs(String hostOs) {
        this.hostOs = hostOs;
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