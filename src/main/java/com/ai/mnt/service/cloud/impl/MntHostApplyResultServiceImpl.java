package com.ai.mnt.service.cloud.impl;


import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ai.mnt.common.shiro.UserRealm;
import com.ai.mnt.common.util.DateUtil;
import com.ai.mnt.exception.MntDataAccessException;
import com.ai.mnt.model.cloud.MntHostApplyResult;
import com.ai.mnt.model.sys.SysUser;
import com.ai.mnt.persistence.cloud.MntHostApplyResultMapper;
import com.ai.mnt.service.cloud.MntHostApplyResultService;

/**
 * @Title: MntHostApplyResultServiceImpl 
 * @Description: MntHostApplyResultServiceImpl ServiceImplPackage
 * @Author: Auto Generate.
 * @Date: 2016-8-11
 */
@Service
public class MntHostApplyResultServiceImpl implements MntHostApplyResultService{

    @Autowired
    MntHostApplyResultMapper mntHostApplyResultMapper;
    
    @Autowired
    UserRealm userRealm;
    
    /**
     * 获取所有云主机申请结果列表
     * @return List<MntHostApplyResult>
     */
    @Override
    public List<MntHostApplyResult> findAllMntHostApplyResult() {
        List<MntHostApplyResult> mntHostApplyResultList = mntHostApplyResultMapper.findAll();
        //cvtContentList(mntHostApplyResultList);
        return mntHostApplyResultList;
    }

    /**
     * 获取云主机申请结果列表
     * @param cloud
     * @return List<MntHostApplyResult>
     */
    @Override
    public List<MntHostApplyResult> findMntHostApplyResultList(MntHostApplyResult mntHostApplyResult) {
        List<MntHostApplyResult> mntHostApplyResultList = mntHostApplyResultMapper.findList(mntHostApplyResult);
        cvtContentList(mntHostApplyResultList);
        return mntHostApplyResultList;
    }

    /**
     * 通过主键ID获取云主机申请结果
     * @param id Primary key
     * @return MntHostApplyResult
     */
    @Override
    public MntHostApplyResult findMntHostApplyResultById(Integer id) {
        MntHostApplyResult mntHostApplyResult = mntHostApplyResultMapper.findByPrimaryKey(id);
        return mntHostApplyResult;
    }

    /**
     * 添加云主机申请结果
     * @param MntHostApplyResult
     */
    @Override
    public void saveMntHostApplyResult(MntHostApplyResult mntHostApplyResult) {
        SysUser currentUser = userRealm.getCurrentUser();
        mntHostApplyResult.setDeleteFlag("0");
        mntHostApplyResult.setCreator(currentUser.getUserName());
        mntHostApplyResult.setModifier(currentUser.getUserName());
        mntHostApplyResult.setCreateDate(new Date());
        mntHostApplyResult.setModifyDate(new Date());
        mntHostApplyResultMapper.save(mntHostApplyResult);
        
    }

    /**
     * 更新云主机申请结果
     * 根据MntHostApplyResult的主键更新主键以外的其他字段
     * @param MntHostApplyResult
     */
    @Override
    public void updateMntHostApplyResultById(MntHostApplyResult mntHostApplyResult) {
        SysUser currentUser = userRealm.getCurrentUser();
        mntHostApplyResult.setModifier(currentUser.getUserName());
        mntHostApplyResult.setModifyDate(new Date());
        mntHostApplyResultMapper.updateByPrimaryKey(mntHostApplyResult);
        
    }

    /**
     * 根据主键批量删除云主机申请结果 
     * 非物理删除 修改删除标识
     * @param id Primary key
     */
    @Override
    public void deleteMntHostApplyResultByIds(String ids) {
        SysUser currentUser = userRealm.getCurrentUser();
        MntHostApplyResult mntHostApplyResult = new MntHostApplyResult();
        mntHostApplyResult.setDeleteFlag("1");
        mntHostApplyResult.setModifier(currentUser.getUserName());
        mntHostApplyResult.setModifyDate(new Date());
        String[] idAry = ids.split(",");
        for(String id : idAry) {
            mntHostApplyResult.setId(Integer.parseInt(id));
            mntHostApplyResultMapper.updateByPrimaryKey(mntHostApplyResult);
        }
    }

    @Override
    public void importHostData(List<List<String>> excelData) throws MntDataAccessException{
        
        List<MntHostApplyResult> applyResults = new ArrayList<>();
        int index = 0;
        SysUser currentUser = userRealm.getCurrentUser();
        
        //数据存在校验
        if(excelData == null || excelData.size() <= 1) {
            throw new MntDataAccessException("EXCEL没有数据，请检查后重新导入！" );
        }
        
        for(List<String> rowList : excelData) {
            if(index == 0) {
                index++;
                continue;
            }
            
            MntHostApplyResult mntHostApplyResult = new MntHostApplyResult();
            mntHostApplyResult.setDept(rowList.get(1));
            mntHostApplyResult.setApplicant(rowList.get(2));
            mntHostApplyResult.setApplicantNt(rowList.get(3));
            mntHostApplyResult.setBusiSystem(rowList.get(4));
            mntHostApplyResult.setHostType(rowList.get(5));
            mntHostApplyResult.setHostCfg(rowList.get(6));
            mntHostApplyResult.setDiskSize(rowList.get(7));
            mntHostApplyResult.setHostIp(rowList.get(8));
            mntHostApplyResult.setRootPasswd(rowList.get(9));
            mntHostApplyResult.setPuaiucPasswd(rowList.get(10));
            mntHostApplyResult.setHostOs(rowList.get(11));
            mntHostApplyResult.setRemark(rowList.get(12));
            
            mntHostApplyResult.setDeleteFlag("0");
            mntHostApplyResult.setCreator(currentUser.getUserName());
            mntHostApplyResult.setModifier(currentUser.getUserName());
            mntHostApplyResult.setCreateDate(DateUtil.getCurrDate());
            mntHostApplyResult.setModifyDate(DateUtil.getCurrDate());
            
            applyResults.add(mntHostApplyResult);
            index++;
        }
        
        if(applyResults.size() > 0) {
            mntHostApplyResultMapper.saveAll(applyResults);
        }
        
    }
    
    private void cvtContentList(List<MntHostApplyResult> MntHostApplyResultList) {
        
        Subject subject = SecurityUtils.getSubject();
        boolean permitted = subject.isPermitted("cloud:passwd:query");
        for(MntHostApplyResult mntHostApplyResult : MntHostApplyResultList) {
            if(!permitted) {
                mntHostApplyResult.setRootPasswd("******");
                mntHostApplyResult.setPuaiucPasswd("******");
            }
            
        }
    }
}

