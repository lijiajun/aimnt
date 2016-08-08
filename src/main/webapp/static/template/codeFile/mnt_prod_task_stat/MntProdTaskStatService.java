package com.ai.mnt.service.report;

import java.util.List;
import com.ai.mnt.model.report.MntProdTaskStat;

/**
 * @Title: MntProdTaskStatService 
 * @Description: MntProdTaskStatService ServicePackage
 * @Author: Auto Generate.
 * @Date: 2016-7-27
 */

public interface MntProdTaskStatService {
    
    /**
     * 获取所有产品线任务统计列表
     * @return List<MntProdTaskStat>
     */
    public List<MntProdTaskStat> findAllMntProdTaskStat();
    
    
    /**
     * 获取产品线任务统计列表
     * @param report
     * @return List<MntProdTaskStat>
     */
    public List<MntProdTaskStat> findMntProdTaskStatList(MntProdTaskStat mntProdTaskStat);
    
    /**
     * 通过主键ID获取产品线任务统计
     * @param id Primary key
     * @return MntProdTaskStat
     */
    public MntProdTaskStat findMntProdTaskStatById(Integer id);
    
    /**
     * 添加产品线任务统计
     * @param MntProdTaskStat
     */
    public void saveMntProdTaskStat(MntProdTaskStat mntProdTaskStat);
    
    /**
     * 更新产品线任务统计
     * 根据MntProdTaskStat的主键更新主键以外的其他字段
     * @param MntProdTaskStat
     */
    public void updateMntProdTaskStatById(MntProdTaskStat mntProdTaskStat);
    
    /**
     * 根据主键批量删除产品线任务统计 
     * 非物理删除 修改删除标识
     * @param id Primary key
     */
    public void deleteMntProdTaskStatByIds(String ids);
}
