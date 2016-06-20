package com.ai.mnt.service.product;

import java.util.List;
import com.ai.mnt.model.product.MntLibRelation;

/**
 * @Title: MntLibRelationService 
 * @Description: MntLibRelationService ServicePackage
 * @Author: Auto Generate. HE
 * @Date: 2016-5-20
 */

public interface MntLibRelationService {
    
    /**
     * 获取所有库文件关联信息列表
     * @return List<MntLibRelation>
     */
    public List<MntLibRelation> findAllMntLibRelation();
    
    
    /**
     * 获取库文件关联信息列表
     * @param product
     * @return List<MntLibRelation>
     */
    public List<MntLibRelation> findMntLibRelationList(MntLibRelation mntLibRelation);
    
    /**
     * 通过主键ID获取库文件关联信息
     * @param id Primary key
     * @return MntLibRelation
     */
    public MntLibRelation findMntLibRelationById(Integer id);
    
    /**
     * 添加库文件关联信息
     * @param MntLibRelation
     */
    public void saveMntLibRelation(MntLibRelation mntLibRelation);
    
    /**
     * 更新库文件关联信息
     * 根据MntLibRelation的主键更新主键以外的其他字段
     * @param MntLibRelation
     */
    public void updateMntLibRelationById(MntLibRelation mntLibRelation);
    
    /**
     * 根据主键批量删除库文件关联信息 
     * 非物理删除 修改删除标识
     * @param id Primary key
     */
    public void deleteMntLibRelationByIds(String ids);
}
