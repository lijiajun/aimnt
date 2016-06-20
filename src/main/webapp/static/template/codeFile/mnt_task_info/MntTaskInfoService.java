package com.ai.mnt.service.task;

import java.util.List;
import com.ai.mnt.model.task.MntTaskInfo;

/**
 * @Title: MntTaskInfoService 
 * @Description: MntTaskInfoService ServicePackage
 * @Author: Auto Generate. HE
 * @Date: 2016-5-17
 */

public interface MntTaskInfoService {
    
    /**
     * 获取所有任务信息列表
     * @return List<MntTaskInfo>
     */
    public List<MntTaskInfo> findAllMntTaskInfo();
    
    
    /**
     * 获取任务信息列表
     * @param task
     * @return List<MntTaskInfo>
     */
    public List<MntTaskInfo> findMntTaskInfoList(MntTaskInfo mntTaskInfo);
    
    /**
     * 通过主键ID获取任务信息
     * @param taskId Primary key
     * @return MntTaskInfo
     */
    public MntTaskInfo findMntTaskInfoByTaskId(Integer taskId);
    
    /**
     * 添加任务信息
     * @param MntTaskInfo
     */
    public void saveMntTaskInfo(MntTaskInfo mntTaskInfo);
    
    /**
     * 更新任务信息
     * 根据MntTaskInfo的主键更新主键以外的其他字段
     * @param MntTaskInfo
     */
    public void updateMntTaskInfoByTaskId(MntTaskInfo mntTaskInfo);
    
    /**
     * 根据主键批量删除任务信息 
     * 非物理删除 修改删除标识
     * @param taskId Primary key
     */
    public void deleteMntTaskInfoByTaskIds(String taskIds);
}
