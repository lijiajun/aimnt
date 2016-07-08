package com.ai.mnt.service.article;

import java.util.List;
import com.ai.mnt.model.article.MntArticleType;

/**
 * @Title: MntArticleTypeService 
 * @Description: MntArticleTypeService ServicePackage
 * @Author: Auto Generate.
 * @Date: 2016-7-6
 */

public interface MntArticleTypeService {
    
    /**
     * 获取所有运维文章分类列表
     * @return List<MntArticleType>
     */
    public List<MntArticleType> findAllMntArticleType();
    
    
    /**
     * 获取运维文章分类列表
     * @param article
     * @return List<MntArticleType>
     */
    public List<MntArticleType> findMntArticleTypeList(MntArticleType mntArticleType);
    
    /**
     * 通过主键ID获取运维文章分类
     * @param typeId Primary key
     * @return MntArticleType
     */
    public MntArticleType findMntArticleTypeByTypeId(Integer typeId);
    
    /**
     * 添加运维文章分类
     * @param MntArticleType
     */
    public void saveMntArticleType(MntArticleType mntArticleType);
    
    /**
     * 更新运维文章分类
     * 根据MntArticleType的主键更新主键以外的其他字段
     * @param MntArticleType
     */
    public void updateMntArticleTypeByTypeId(MntArticleType mntArticleType);
    
    /**
     * 根据主键批量删除运维文章分类 
     * 非物理删除 修改删除标识
     * @param typeId Primary key
     */
    public void deleteMntArticleTypeByTypeIds(String typeIds);
}
