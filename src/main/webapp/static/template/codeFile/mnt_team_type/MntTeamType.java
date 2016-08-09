package com.ai.mnt.model.report;

import java.io.Serializable;
import java.util.Date;

/**
 * @Title: MntTeamType 
 * @Description: MntTeamType Model
 * @Author: Auto Generate.
 * @Date: 2016-7-27
 */
public class MntTeamType implements Serializable{

    private static final long serialVersionUID = 1L;

    /**团队编号*/
    private Integer teamId;

    /**团队英文名称*/
    private String teamNameEn;

    /**团队中文名称*/
    private String teamNameCn;


    public Integer getTeamId() {
        return teamId;
    }

    public void setTeamId(Integer teamId) {
        this.teamId = teamId;
    }

    public String getTeamNameEn() {
        return teamNameEn;
    }

    public void setTeamNameEn(String teamNameEn) {
        this.teamNameEn = teamNameEn;
    }

    public String getTeamNameCn() {
        return teamNameCn;
    }

    public void setTeamNameCn(String teamNameCn) {
        this.teamNameCn = teamNameCn;
    }


}