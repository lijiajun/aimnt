package com.ai.mnt.service.inst;

import java.util.List;
import com.ai.mnt.model.inst.MntJfDataResource;

/**
 * @Title: MntJfDataResourceService 
 * @Description: MntJfDataResourceService ServicePackage
 * @Author: Auto Generate.
 * @Date: 2016-10-13
 */

public interface MntJfDataResourceService {
    
    /**
     * 获取所有计费数据源列表
     * @return List<MntJfDataResource>
     */
    public List<MntJfDataResource> findAllMntJfDataResource();
    
    
    /**
     * 获取计费数据源列表
     * @param inst
     * @return List<MntJfDataResource>
     */
    public List<MntJfDataResource> findMntJfDataResourceList(MntJfDataResource mntJfDataResource);
    
    /**
     * 通过主键ID获取计费数据源
     * @param id Primary key
     * @return MntJfDataResource
     */
    public MntJfDataResource findMntJfDataResourceById(Integer id);
    
    /**
     * 添加计费数据源
     * @param MntJfDataResource
     */
    public void saveMntJfDataResource(MntJfDataResource mntJfDataResource);
    
    /**
     * 更新计费数据源
     * 根据MntJfDataResource的主键更新主键以外的其他字段
     * @param MntJfDataResource
     */
    public void updateMntJfDataResourceById(MntJfDataResource mntJfDataResource);
    
    /**
     * 根据主键批量删除计费数据源 
     * 非物理删除 修改删除标识
     * @param id Primary key
     */
    public void deleteMntJfDataResourceByIds(String ids);
}
