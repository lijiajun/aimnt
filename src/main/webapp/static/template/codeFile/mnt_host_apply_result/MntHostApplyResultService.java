package com.ai.mnt.service.cloud;

import java.util.List;
import com.ai.mnt.model.cloud.MntHostApplyResult;

/**
 * @Title: MntHostApplyResultService 
 * @Description: MntHostApplyResultService ServicePackage
 * @Author: Auto Generate.
 * @Date: 2016-8-11
 */

public interface MntHostApplyResultService {
    
    /**
     * 获取所有云主机申请结果列表
     * @return List<MntHostApplyResult>
     */
    public List<MntHostApplyResult> findAllMntHostApplyResult();
    
    
    /**
     * 获取云主机申请结果列表
     * @param cloud
     * @return List<MntHostApplyResult>
     */
    public List<MntHostApplyResult> findMntHostApplyResultList(MntHostApplyResult mntHostApplyResult);
    
    /**
     * 通过主键ID获取云主机申请结果
     * @param id Primary key
     * @return MntHostApplyResult
     */
    public MntHostApplyResult findMntHostApplyResultById(Integer id);
    
    /**
     * 添加云主机申请结果
     * @param MntHostApplyResult
     */
    public void saveMntHostApplyResult(MntHostApplyResult mntHostApplyResult);
    
    /**
     * 更新云主机申请结果
     * 根据MntHostApplyResult的主键更新主键以外的其他字段
     * @param MntHostApplyResult
     */
    public void updateMntHostApplyResultById(MntHostApplyResult mntHostApplyResult);
    
    /**
     * 根据主键批量删除云主机申请结果 
     * 非物理删除 修改删除标识
     * @param id Primary key
     */
    public void deleteMntHostApplyResultByIds(String ids);
}
