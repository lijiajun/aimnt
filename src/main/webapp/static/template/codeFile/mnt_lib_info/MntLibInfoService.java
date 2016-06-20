package com.ai.mnt.service.product;

import java.util.List;
import com.ai.mnt.model.product.MntLibInfo;

/**
 * @Title: MntLibInfoService 
 * @Description: MntLibInfoService ServicePackage
 * @Author: Auto Generate. HE
 * @Date: 2016-5-11
 */

public interface MntLibInfoService {
    
    /**
     * 获取所有库文件信息列表
     * @return List<MntLibInfo>
     */
    public List<MntLibInfo> findAllMntLibInfo();
    
    
    /**
     * 获取库文件信息列表
     * @param product
     * @return List<MntLibInfo>
     */
    public List<MntLibInfo> findMntLibInfoList(MntLibInfo mntLibInfo);
    
    /**
     * 通过主键ID获取库文件信息
     * @param libId Primary key
     * @return MntLibInfo
     */
    public MntLibInfo findMntLibInfoByLibId(Integer libId);
    
    /**
     * 添加库文件信息
     * @param MntLibInfo
     */
    public void saveMntLibInfo(MntLibInfo mntLibInfo);
    
    /**
     * 更新库文件信息
     * 根据MntLibInfo的主键更新主键以外的其他字段
     * @param MntLibInfo
     */
    public void updateMntLibInfoByLibId(MntLibInfo mntLibInfo);
    
    /**
     * 根据主键批量删除库文件信息 
     * 非物理删除 修改删除标识
     * @param libId Primary key
     */
    public void deleteMntLibInfoByLibIds(String libIds);
}
