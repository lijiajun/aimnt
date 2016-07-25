package com.ai.mnt.service.inst.impl;


import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ai.mnt.common.cache.BaseDataCache;
import com.ai.mnt.common.shiro.UserRealm;
import com.ai.mnt.common.util.DateUtil;
import com.ai.mnt.exception.MntDataAccessException;
import com.ai.mnt.model.inst.MntInstallBaseInfo;
import com.ai.mnt.model.inst.MntProdRelPlan;
import com.ai.mnt.model.product.MntProd;
import com.ai.mnt.model.product.MntProdModule;
import com.ai.mnt.model.product.MntProdVersion;
import com.ai.mnt.model.sys.SysUser;
import com.ai.mnt.persistence.inst.MntInstallBaseInfoMapper;
import com.ai.mnt.persistence.inst.MntProdRelPlanMapper;
import com.ai.mnt.persistence.product.MntProdMapper;
import com.ai.mnt.persistence.product.MntProdModuleMapper;
import com.ai.mnt.persistence.product.MntProdVersionMapper;
import com.ai.mnt.service.inst.MntProdRelPlanService;

/**
 * @Title: MntProdRelPlanServiceImpl 
 * @Description: MntProdRelPlanServiceImpl ServiceImplPackage
 * @Author: Auto Generate.
 * @Date: 2016-7-25
 */
@Service
public class MntProdRelPlanServiceImpl implements MntProdRelPlanService{

    @Autowired
    MntProdRelPlanMapper mntProdRelPlanMapper;
    
    @Autowired
    UserRealm userRealm;
    
    @Autowired
    MntInstallBaseInfoMapper mntInstallBaseInfoMapper;
    
    @Autowired
    MntProdMapper mntProdMapper;
    
    @Autowired
    MntProdVersionMapper mntProdVersionMapper;
    
    @Autowired
    MntProdModuleMapper mntProdModuleMapper;
    
    /**
     * 获取所有发布计划列表
     * @return List<MntProdRelPlan>
     */
    @Override
    public List<MntProdRelPlan> findAllMntProdRelPlan() {
        List<MntProdRelPlan> mntProdRelPlanList = mntProdRelPlanMapper.findAll();
        //cvtContentList(mntProdRelPlanList);
        return mntProdRelPlanList;
    }

    /**
     * 获取发布计划列表
     * @param rel
     * @return List<MntProdRelPlan>
     */
    @Override
    public List<MntProdRelPlan> findMntProdRelPlanList(MntProdRelPlan mntProdRelPlan) {
        List<MntProdRelPlan> mntProdRelPlanList = mntProdRelPlanMapper.findList(mntProdRelPlan);
        cvtContentList(mntProdRelPlanList);
        return mntProdRelPlanList;
    }

    /**
     * 通过主键ID获取发布计划
     * @param id Primary key
     * @return MntProdRelPlan
     */
    @Override
    public MntProdRelPlan findMntProdRelPlanById(Integer id) {
        MntProdRelPlan mntProdRelPlan = mntProdRelPlanMapper.findByPrimaryKey(id);
        return mntProdRelPlan;
    }

    /**
     * 添加发布计划
     * @param MntProdRelPlan
     */
    @Override
    public void saveMntProdRelPlan(MntProdRelPlan mntProdRelPlan) {
        SysUser currentUser = userRealm.getCurrentUser();
        mntProdRelPlan.setDeleteFlag("0");
        mntProdRelPlan.setCreator(currentUser.getUserName());
        mntProdRelPlan.setModifier(currentUser.getUserName());
        mntProdRelPlan.setCreateDate(new Date());
        mntProdRelPlan.setModifyDate(new Date());
        mntProdRelPlanMapper.save(mntProdRelPlan);
        
    }

    /**
     * 更新发布计划
     * 根据MntProdRelPlan的主键更新主键以外的其他字段
     * @param MntProdRelPlan
     */
    @Override
    public void updateMntProdRelPlanById(MntProdRelPlan mntProdRelPlan) {
        SysUser currentUser = userRealm.getCurrentUser();
        mntProdRelPlan.setModifier(currentUser.getUserName());
        mntProdRelPlan.setModifyDate(new Date());
        mntProdRelPlanMapper.updateByPrimaryKey(mntProdRelPlan);
        
    }

    /**
     * 根据主键批量删除发布计划 
     * 非物理删除 修改删除标识
     * @param id Primary key
     */
    @Override
    public void deleteMntProdRelPlanByIds(String ids) {
        SysUser currentUser = userRealm.getCurrentUser();
        MntProdRelPlan mntProdRelPlan = new MntProdRelPlan();
        mntProdRelPlan.setDeleteFlag("1");
        mntProdRelPlan.setModifier(currentUser.getUserName());
        mntProdRelPlan.setModifyDate(new Date());
        String[] idAry = ids.split(",");
        for(String id : idAry) {
            mntProdRelPlan.setId(Integer.parseInt(id));
            mntProdRelPlanMapper.updateByPrimaryKey(mntProdRelPlan);
        }
    }
    
    private void cvtContentList(List<MntProdRelPlan> MntProdRelPlanList) {
        for(MntProdRelPlan mntProdRelPlan : MntProdRelPlanList) {
            
            mntProdRelPlan.setProdName(BaseDataCache.getDataName("PROD_INFO", mntProdRelPlan.getProdId()));
            mntProdRelPlan.setModuleName(BaseDataCache.getDataName("PROD_MODULE_ENUM", mntProdRelPlan.getModuleId()));
            mntProdRelPlan.setBaseName(BaseDataCache.getDataName("BASE_NAME_ENUM", mntProdRelPlan.getBaseId()));
            
        }
    }

    /**
     * 发布计划批量导入Excel
     */
    @Override
    public void batchImportRelPlan(List<List<String>> excelData) {
        
        List<MntProdRelPlan> mntProdRelPlans = new ArrayList<>();
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
            
            MntProdRelPlan mntProdRelPlan = new MntProdRelPlan();
            
            //1.省份
            MntInstallBaseInfo mntInstallBaseInfo = new MntInstallBaseInfo();
            mntInstallBaseInfo.setBaseName(rowList.get(0));
            mntInstallBaseInfo.setDeleteFlag("0");
            List<MntInstallBaseInfo> insts = mntInstallBaseInfoMapper.findList(mntInstallBaseInfo);
            if(insts == null || insts.size() == 0) {
                throw new MntDataAccessException("第" + (index+1) + "行该发布省份不存在，请检查后重新导入！" );
            }
            mntProdRelPlan.setBaseId(insts.get(0).getBaseId());
            
            
            //2.计划发布时间
            mntProdRelPlan.setPlanDate(DateUtil.stringToDate2(rowList.get(1), "yyyy-MM-dd"));
            
            
            //3.产品线
            String prodName = rowList.get(2);
            MntProd mntProd = new MntProd();
            mntProd.setProdName(prodName);
            mntProd.setDeleteFlag("0");
            List<MntProd> prodList = mntProdMapper.findList(mntProd);
            if(prodList == null || prodList.size() == 0) {
                throw new MntDataAccessException("第" + (index+1) + "行该产品线名称不存在，请检查后重新导入！" );
            }
            Integer prodId = prodList.get(0).getProdId();
            mntProdRelPlan.setProdId(prodId);
            
            
            //4.产品版本
            String verName = rowList.get(3);
            MntProdVersion mntProdVersion = new MntProdVersion();
            mntProdVersion.setVerName(verName);
            mntProdVersion.setProdId(prodId);
            mntProdVersion.setDeleteFlag("0");
            List<MntProdVersion> verList = mntProdVersionMapper.findList(mntProdVersion);
            if(verList == null || verList.size() == 0) {
                throw new MntDataAccessException("第" + (index+1) + "行该系统下系统版本名称不存在，请检查后重新导入！" );
            }
            String verCode = verList.get(0).getVerCode();
            mntProdRelPlan.setVerCode(verCode);
            
            
            //5.上线模块
            MntProdModule module = new MntProdModule();
            module.setProdId(prodId);
            module.setVerCode(verCode);
            module.setDeleteFlag("0");
            module.setModuleName(rowList.get(4).trim());
            List<MntProdModule> moduleList = mntProdModuleMapper.findList(module);
            if(moduleList == null || moduleList.size() == 0) {
                throw new MntDataAccessException("第" + (index+1) + "行该模块不存在，请检查后重新导入！" );
            }
            mntProdRelPlan.setModuleId(moduleList.get(0).getModuleId());
            
            //6.上线需求或缺陷ID
            mntProdRelPlan.setReqNo(rowList.get(5).trim());
            
            //7.上线需求或缺陷名称
            mntProdRelPlan.setReqName(rowList.get(6));
            
            //8.备注
            mntProdRelPlan.setRemark(rowList.get(7));
            
            
            mntProdRelPlan.setDeleteFlag("0");
            mntProdRelPlan.setCreator(currentUser.getUserName());
            mntProdRelPlan.setModifier(currentUser.getUserName());
            mntProdRelPlan.setCreateDate(new Date());
            mntProdRelPlan.setModifyDate(new Date());
            
            mntProdRelPlans.add(mntProdRelPlan);
            
            
            index++;
            
        }
        
        //保存
        if(mntProdRelPlans.size() > 0) {
            mntProdRelPlanMapper.saveAll(mntProdRelPlans);
        }
        
    }
}

