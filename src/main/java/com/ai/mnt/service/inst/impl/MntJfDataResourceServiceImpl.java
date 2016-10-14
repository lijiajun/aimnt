package com.ai.mnt.service.inst.impl;


import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ai.mnt.common.cache.BaseDataCache;
import com.ai.mnt.common.shiro.UserRealm;
import com.ai.mnt.exception.MntDataAccessException;
import com.ai.mnt.model.inst.MntJfDataResource;
import com.ai.mnt.model.sys.SysUser;
import com.ai.mnt.persistence.inst.MntJfDataResourceMapper;
import com.ai.mnt.service.inst.MntJfDataResourceService;

/**
 * @Title: MntJfDataResourceServiceImpl 
 * @Description: MntJfDataResourceServiceImpl ServiceImplPackage
 * @Author: Auto Generate.
 * @Date: 2016-10-13
 */
@Service
public class MntJfDataResourceServiceImpl implements MntJfDataResourceService{

    @Autowired
    MntJfDataResourceMapper mntJfDataResourceMapper;
    
    @Autowired
    UserRealm userRealm;
    
    /**
     * 获取所有计费数据源列表
     * @return List<MntJfDataResource>
     */
    @Override
    public List<MntJfDataResource> findAllMntJfDataResource() {
        List<MntJfDataResource> mntJfDataResourceList = mntJfDataResourceMapper.findAll();
        //cvtContentList(mntJfDataResourceList);
        return mntJfDataResourceList;
    }

    /**
     * 获取计费数据源列表
     * @param inst
     * @return List<MntJfDataResource>
     */
    @Override
    public List<MntJfDataResource> findMntJfDataResourceList(MntJfDataResource mntJfDataResource) {
        List<MntJfDataResource> mntJfDataResourceList = mntJfDataResourceMapper.findList(mntJfDataResource);
        cvtContentList(mntJfDataResourceList);
        return mntJfDataResourceList;
    }

    /**
     * 通过主键ID获取计费数据源
     * @param id Primary key
     * @return MntJfDataResource
     */
    @Override
    public MntJfDataResource findMntJfDataResourceById(Integer id) {
        MntJfDataResource mntJfDataResource = mntJfDataResourceMapper.findByPrimaryKey(id);
        return mntJfDataResource;
    }

    /**
     * 添加计费数据源
     * @param MntJfDataResource
     */
    @Override
    public void saveMntJfDataResource(MntJfDataResource mntJfDataResource) {
        SysUser currentUser = userRealm.getCurrentUser();
        mntJfDataResource.setDeleteFlag("0");
        mntJfDataResource.setCreator(currentUser.getUserName());
        mntJfDataResource.setModifier(currentUser.getUserName());
        mntJfDataResource.setCreateDate(new Date());
        mntJfDataResource.setModifyDate(new Date());
        mntJfDataResourceMapper.save(mntJfDataResource);
        
    }

    /**
     * 更新计费数据源
     * 根据MntJfDataResource的主键更新主键以外的其他字段
     * @param MntJfDataResource
     */
    @Override
    public void updateMntJfDataResourceById(MntJfDataResource mntJfDataResource) {
        SysUser currentUser = userRealm.getCurrentUser();
        mntJfDataResource.setModifier(currentUser.getUserName());
        mntJfDataResource.setModifyDate(new Date());
        mntJfDataResourceMapper.updateByPrimaryKey(mntJfDataResource);
        
    }

    /**
     * 根据主键批量删除计费数据源 
     * 非物理删除 修改删除标识
     * @param id Primary key
     */
    @Override
    public void deleteMntJfDataResourceByIds(String ids) {
        SysUser currentUser = userRealm.getCurrentUser();
        MntJfDataResource mntJfDataResource = new MntJfDataResource();
        mntJfDataResource.setDeleteFlag("1");
        mntJfDataResource.setModifier(currentUser.getUserName());
        mntJfDataResource.setModifyDate(new Date());
        String[] idAry = ids.split(",");
        for(String id : idAry) {
            mntJfDataResource.setId(Integer.parseInt(id));
            mntJfDataResourceMapper.updateByPrimaryKey(mntJfDataResource);
        }
    }

    @Override
    public void importJfDsData(List<List<String>> excelData, Integer baseId) {
        
        List<MntJfDataResource> mntJfDataResources = new ArrayList<>();
        int index = 0;
        SysUser currentUser = userRealm.getCurrentUser();
        
        //数据存在校验
        if(excelData == null || excelData.size() <= 2) {
            throw new MntDataAccessException("EXCEL没有数据，请检查后重新导入！" );
        }
        
        for(List<String> rowList : excelData) {
            if(index == 0 || index == 1) {
                index++;
                continue;
            }
            
            MntJfDataResource mntJfDataResource = new MntJfDataResource();
            
            //附件名称
            String fileName = rowList.get(0);
            mntJfDataResource.setFileName(fileName);
            //业务
            String busiName = rowList.get(1);
            mntJfDataResource.setBusiName(busiName);
            //解码模板
            String decodeTemplate = rowList.get(2);
            mntJfDataResource.setDecodeTemplate(decodeTemplate);
            //业务分析模板
            String analysisTemplate = rowList.get(3);
            mntJfDataResource.setAnalysisTemplate(analysisTemplate);
            //xdr_type
            String xdrType = rowList.get(4);
            mntJfDataResource.setXdrType(xdrType);
            //service_id
            String serviceId = rowList.get(5);
            mntJfDataResource.setServiceId(serviceId);
            //dr_type
            String drType = rowList.get(6);
            mntJfDataResource.setDrType(drType);
            //业务是否下线
            String strIsOffline = rowList.get(7);
            if("是".equals(strIsOffline)) {
                strIsOffline = "1";
            }else {
                strIsOffline = "0";
            }
            mntJfDataResource.setIsOffline(strIsOffline);
            //是否送计费
            String strIsToJf = rowList.get(8);
            if("是".equals(strIsToJf)) {
                strIsToJf = "1";
            }else {
                strIsToJf = "0";
            }
            mntJfDataResource.setIsToJf(strIsToJf);
            //是否需要处理
            String strIsNeedDeal = rowList.get(9);
            if("是".equals(strIsNeedDeal)) {
                strIsNeedDeal = "1";
            }else {
                strIsNeedDeal = "0";
            }
            mntJfDataResource.setIsNeedDeal(strIsNeedDeal);
            //备注
            String remark = rowList.get(10);
            mntJfDataResource.setRemark(remark);
            
            mntJfDataResource.setBaseId(baseId);
            mntJfDataResource.setDeleteFlag("0");
            mntJfDataResource.setCreator(currentUser.getUserName());
            mntJfDataResource.setModifier(currentUser.getUserName());
            mntJfDataResource.setCreateDate(new Date());
            mntJfDataResource.setModifyDate(new Date());
            
            mntJfDataResources.add(mntJfDataResource);
            
            index++;
            
        }
        //保存
        if(mntJfDataResources.size() > 0) {
            mntJfDataResourceMapper.saveAll(mntJfDataResources);
        }
    }
    
    private void cvtContentList(List<MntJfDataResource> MntJfDataResourceList) {
        for(MntJfDataResource mntJfDataResource : MntJfDataResourceList) {
            mntJfDataResource.setBaseName(BaseDataCache.getDataName("BASE_NAME_ENUM", mntJfDataResource.getBaseId()));
            mntJfDataResource.setIsOfflineTxt(BaseDataCache.getDataName("IS_FAULT", mntJfDataResource.getIsOffline()));
            mntJfDataResource.setIsToJfTxt(BaseDataCache.getDataName("IS_FAULT", mntJfDataResource.getIsToJf()));
            mntJfDataResource.setIsNeedDealTxt(BaseDataCache.getDataName("IS_FAULT", mntJfDataResource.getIsNeedDeal()));
        }
    }
}

