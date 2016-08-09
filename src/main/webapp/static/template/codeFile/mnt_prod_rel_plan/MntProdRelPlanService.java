package com.ai.mnt.service.rel;

import java.util.List;
import com.ai.mnt.model.rel.MntProdRelPlan;

/**
 * @Title: MntProdRelPlanService 
 * @Description: MntProdRelPlanService ServicePackage
 * @Author: Auto Generate.
 * @Date: 2016-7-28
 */

public interface MntProdRelPlanService {
    
    /**
     * 获取所有发布计划列表
     * @return List<MntProdRelPlan>
     */
    public List<MntProdRelPlan> findAllMntProdRelPlan();
    
    
    /**
     * 获取发布计划列表
     * @param rel
     * @return List<MntProdRelPlan>
     */
    public List<MntProdRelPlan> findMntProdRelPlanList(MntProdRelPlan mntProdRelPlan);
    
    /**
     * 通过主键ID获取发布计划
     * @param id Primary key
     * @return MntProdRelPlan
     */
    public MntProdRelPlan findMntProdRelPlanById(Integer id);
    
    /**
     * 添加发布计划
     * @param MntProdRelPlan
     */
    public void saveMntProdRelPlan(MntProdRelPlan mntProdRelPlan);
    
    /**
     * 更新发布计划
     * 根据MntProdRelPlan的主键更新主键以外的其他字段
     * @param MntProdRelPlan
     */
    public void updateMntProdRelPlanById(MntProdRelPlan mntProdRelPlan);
    
    /**
     * 根据主键批量删除发布计划 
     * 非物理删除 修改删除标识
     * @param id Primary key
     */
    public void deleteMntProdRelPlanByIds(String ids);
}
