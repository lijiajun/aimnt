package com.ai.mnt.service.report;

import java.util.List;
import com.ai.mnt.model.report.MntTeamMemberStat;

/**
 * @Title: MntTeamMemberStatService 
 * @Description: MntTeamMemberStatService ServicePackage
 * @Author: Auto Generate.
 * @Date: 2016-7-27
 */

public interface MntTeamMemberStatService {
    
    /**
     * 获取所有团队成员统计列表
     * @return List<MntTeamMemberStat>
     */
    public List<MntTeamMemberStat> findAllMntTeamMemberStat();
    
    
    /**
     * 获取团队成员统计列表
     * @param report
     * @return List<MntTeamMemberStat>
     */
    public List<MntTeamMemberStat> findMntTeamMemberStatList(MntTeamMemberStat mntTeamMemberStat);
    
    /**
     * 通过主键ID获取团队成员统计
     * @param id Primary key
     * @return MntTeamMemberStat
     */
    public MntTeamMemberStat findMntTeamMemberStatById(Integer id);
    
    /**
     * 添加团队成员统计
     * @param MntTeamMemberStat
     */
    public void saveMntTeamMemberStat(MntTeamMemberStat mntTeamMemberStat);
    
    /**
     * 更新团队成员统计
     * 根据MntTeamMemberStat的主键更新主键以外的其他字段
     * @param MntTeamMemberStat
     */
    public void updateMntTeamMemberStatById(MntTeamMemberStat mntTeamMemberStat);
    
    /**
     * 根据主键批量删除团队成员统计 
     * 非物理删除 修改删除标识
     * @param id Primary key
     */
    public void deleteMntTeamMemberStatByIds(String ids);
}
