package com.ai.mnt.service.report;

import java.util.List;
import com.ai.mnt.model.report.MntTeamType;

/**
 * @Title: MntTeamTypeService 
 * @Description: MntTeamTypeService ServicePackage
 * @Author: Auto Generate.
 * @Date: 2016-7-27
 */

public interface MntTeamTypeService {
    
    /**
     * 获取所有团队类型列表
     * @return List<MntTeamType>
     */
    public List<MntTeamType> findAllMntTeamType();
    
    
    /**
     * 获取团队类型列表
     * @param report
     * @return List<MntTeamType>
     */
    public List<MntTeamType> findMntTeamTypeList(MntTeamType mntTeamType);
    
    /**
     * 通过主键ID获取团队类型
     * @param teamId Primary key
     * @return MntTeamType
     */
    public MntTeamType findMntTeamTypeByTeamId(Integer teamId);
    
    /**
     * 添加团队类型
     * @param MntTeamType
     */
    public void saveMntTeamType(MntTeamType mntTeamType);
    
    /**
     * 更新团队类型
     * 根据MntTeamType的主键更新主键以外的其他字段
     * @param MntTeamType
     */
    public void updateMntTeamTypeByTeamId(MntTeamType mntTeamType);
    
    /**
     * 根据主键批量删除团队类型 
     * 非物理删除 修改删除标识
     * @param teamId Primary key
     */
    public void deleteMntTeamTypeByTeamIds(String teamIds);
}
