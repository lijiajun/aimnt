package com.ai.mnt.service.product;

import java.util.List;
import com.ai.mnt.model.product.MntProdModule;

/**
 * @Title: MntProdModuleService 
 * @Description: MntProdModuleService ServicePackage
 * @Author: Auto Generate. HE
 * @Date: 2016-5-11
 */

public interface MntProdModuleService {
    
    /**
     * 获取所有产品功能模块信息列表
     * @return List<MntProdModule>
     */
    public List<MntProdModule> findAllMntProdModule();
    
    
    /**
     * 获取产品功能模块信息列表
     * @param product
     * @return List<MntProdModule>
     */
    public List<MntProdModule> findMntProdModuleList(MntProdModule mntProdModule);
    
    /**
     * 通过主键ID获取产品功能模块信息
     * @param moduleId Primary key
     * @return MntProdModule
     */
    public MntProdModule findMntProdModuleByModuleId(Integer moduleId);
    
    /**
     * 添加产品功能模块信息
     * @param MntProdModule
     */
    public void saveMntProdModule(MntProdModule mntProdModule);
    
    /**
     * 更新产品功能模块信息
     * 根据MntProdModule的主键更新主键以外的其他字段
     * @param MntProdModule
     */
    public void updateMntProdModuleByModuleId(MntProdModule mntProdModule);
    
    /**
     * 根据主键批量删除产品功能模块信息 
     * 非物理删除 修改删除标识
     * @param moduleId Primary key
     */
    public void deleteMntProdModuleByModuleIds(String moduleIds);
}
