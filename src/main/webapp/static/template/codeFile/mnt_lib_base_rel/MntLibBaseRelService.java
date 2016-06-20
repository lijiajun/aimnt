package com.ai.mnt.service.product;

import java.util.List;
import com.ai.mnt.model.product.MntLibBaseRel;

/**
 * @Title: MntLibBaseRelService 
 * @Description: MntLibBaseRelService ServicePackage
 * @Author: Auto Generate. HE
 * @Date: 2016-5-19
 */

public interface MntLibBaseRelService {
    
    /**
     * 获取所有库文件历史安装点关联表列表
     * @return List<MntLibBaseRel>
     */
    public List<MntLibBaseRel> findAllMntLibBaseRel();
    
    
    /**
     * 获取库文件历史安装点关联表列表
     * @param product
     * @return List<MntLibBaseRel>
     */
    public List<MntLibBaseRel> findMntLibBaseRelList(MntLibBaseRel mntLibBaseRel);
    
    /**
     * 通过主键ID获取库文件历史安装点关联表
     * @param id Primary key
     * @return MntLibBaseRel
     */
    public MntLibBaseRel findMntLibBaseRelById(Integer id);
    
    /**
     * 添加库文件历史安装点关联表
     * @param MntLibBaseRel
     */
    public void saveMntLibBaseRel(MntLibBaseRel mntLibBaseRel);
    
    /**
     * 更新库文件历史安装点关联表
     * 根据MntLibBaseRel的主键更新主键以外的其他字段
     * @param MntLibBaseRel
     */
    public void updateMntLibBaseRelById(MntLibBaseRel mntLibBaseRel);
    
    /**
     * 根据主键批量删除库文件历史安装点关联表 
     * 非物理删除 修改删除标识
     * @param id Primary key
     */
    public void deleteMntLibBaseRelByIds(String ids);
}
