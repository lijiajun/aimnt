package com.ai.mnt.service.inst;

import java.util.List;
import com.ai.mnt.model.inst.MntInstallBaseInfo;

/**
 * @Title: MntInstallBaseInfoService 
 * @Description: MntInstallBaseInfoService ServicePackage
 * @Author: Auto Generate.
 * @Date: 2016-7-21
 */

public interface MntInstallBaseInfoService {
    
    /**
     * 获取所有安装点信息列表
     * @return List<MntInstallBaseInfo>
     */
    public List<MntInstallBaseInfo> findAllMntInstallBaseInfo();
    
    
    /**
     * 获取安装点信息列表
     * @param inst
     * @return List<MntInstallBaseInfo>
     */
    public List<MntInstallBaseInfo> findMntInstallBaseInfoList(MntInstallBaseInfo mntInstallBaseInfo);
    
    /**
     * 通过主键ID获取安装点信息
     * @param baseId Primary key
     * @return MntInstallBaseInfo
     */
    public MntInstallBaseInfo findMntInstallBaseInfoByBaseId(Integer baseId);
    
    /**
     * 添加安装点信息
     * @param MntInstallBaseInfo
     */
    public void saveMntInstallBaseInfo(MntInstallBaseInfo mntInstallBaseInfo);
    
    /**
     * 更新安装点信息
     * 根据MntInstallBaseInfo的主键更新主键以外的其他字段
     * @param MntInstallBaseInfo
     */
    public void updateMntInstallBaseInfoByBaseId(MntInstallBaseInfo mntInstallBaseInfo);
    
    /**
     * 根据主键批量删除安装点信息 
     * 非物理删除 修改删除标识
     * @param baseId Primary key
     */
    public void deleteMntInstallBaseInfoByBaseIds(String baseIds);
}
