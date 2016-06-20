package com.ai.mnt.service.product.impl;


import java.util.List;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ai.mnt.common.shiro.UserRealm;
import com.ai.mnt.model.product.SysBaseType;
import com.ai.mnt.model.sys.SysUser;
import com.ai.mnt.persistence.product.SysBaseTypeMapper;
import com.ai.mnt.service.product.SysBaseTypeService;

/**
 * @Title: SysBaseTypeServiceImpl 
 * @Description: SysBaseTypeServiceImpl ServiceImplPackage
 * @Author: Auto Generate. HE
 * @Date: 2016-5-23
 */
@Service
public class SysBaseTypeServiceImpl implements SysBaseTypeService{

    @Autowired
    SysBaseTypeMapper sysBaseTypeMapper;
    
    @Autowired
    UserRealm userRealm;
    
    /**
     * 获取所有系统枚举类型表列表
     * @return List<SysBaseType>
     */
    @Override
    public List<SysBaseType> findAllSysBaseType() {
        List<SysBaseType> sysBaseTypeList = sysBaseTypeMapper.findAll();
        //cvtContentList(sysBaseTypeList);
        return sysBaseTypeList;
    }

    /**
     * 获取系统枚举类型表列表
     * @param product
     * @return List<SysBaseType>
     */
    @Override
    public List<SysBaseType> findSysBaseTypeList(SysBaseType sysBaseType) {
        List<SysBaseType> sysBaseTypeList = sysBaseTypeMapper.findList(sysBaseType);
        //cvtContentList(sysBaseTypeList);
        return sysBaseTypeList;
    }

    /**
     * 通过主键ID获取系统枚举类型表
     * @param id Primary key
     * @return SysBaseType
     */
    @Override
    public SysBaseType findSysBaseTypeById(Integer id) {
        SysBaseType sysBaseType = sysBaseTypeMapper.findByPrimaryKey(id);
        return sysBaseType;
    }

    /**
     * 添加系统枚举类型表
     * @param SysBaseType
     */
    @Override
    public void saveSysBaseType(SysBaseType sysBaseType) {
        SysUser currentUser = userRealm.getCurrentUser();
        sysBaseType.setDeleteFlag("0");
        sysBaseType.setCreator(currentUser.getUserName());
        sysBaseType.setModifier(currentUser.getUserName());
        sysBaseType.setCreateDate(new Date());
        sysBaseType.setModifyDate(new Date());
        sysBaseTypeMapper.save(sysBaseType);
        
    }

    /**
     * 更新系统枚举类型表
     * 根据SysBaseType的主键更新主键以外的其他字段
     * @param SysBaseType
     */
    @Override
    public void updateSysBaseTypeById(SysBaseType sysBaseType) {
        SysUser currentUser = userRealm.getCurrentUser();
        sysBaseType.setModifier(currentUser.getUserName());
        sysBaseType.setModifyDate(new Date());
        sysBaseTypeMapper.updateByPrimaryKey(sysBaseType);
        
    }

    /**
     * 根据主键批量删除系统枚举类型表 
     * 非物理删除 修改删除标识
     * @param id Primary key
     */
    @Override
    public void deleteSysBaseTypeByIds(String ids) {
        SysUser currentUser = userRealm.getCurrentUser();
        SysBaseType sysBaseType = new SysBaseType();
        sysBaseType.setDeleteFlag("1");
        sysBaseType.setModifier(currentUser.getUserName());
        sysBaseType.setModifyDate(new Date());
        String[] idAry = ids.split(",");
        for(String id : idAry) {
            sysBaseType.setId(Integer.parseInt(id));
            sysBaseTypeMapper.updateByPrimaryKey(sysBaseType);
        }
    }
    
    //private void cvtContentList(List<SysBaseType> SysBaseTypeList) {
    //    for(SysBaseType sysBaseType : SysBaseTypeList) {
    //    }
    //}
}

