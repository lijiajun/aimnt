package com.ai.mnt.service.inst.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ai.mnt.common.cache.BaseDataCache;
import com.ai.mnt.common.shiro.UserRealm;
import com.ai.mnt.model.inst.MntInstallBaseInfo;
import com.ai.mnt.model.sys.SysUser;
import com.ai.mnt.persistence.inst.MntInstallBaseInfoMapper;
import com.ai.mnt.service.inst.MntInstallBaseInfoService;

@Service
public class MntInstallBaseInfoServiceImpl implements MntInstallBaseInfoService{

    @Autowired
    UserRealm userRealm;
    
    @Autowired
    MntInstallBaseInfoMapper mntInstallBaseInfoMapper;
    
    @Override
    public MntInstallBaseInfo findInstallBaseInfoByBaseId(Integer baseId) {
        MntInstallBaseInfo installBaseInfo = mntInstallBaseInfoMapper.findByPrimaryKey(baseId);
        return installBaseInfo;
    }

    @Override
    public List<MntInstallBaseInfo> findAllMntInstallBaseInfo() {
        List<MntInstallBaseInfo> list = mntInstallBaseInfoMapper.findAll();
        return list;
    }

    @Override
    public List<MntInstallBaseInfo> findInstallBaseInfoList(MntInstallBaseInfo mntInstallBaseInfo) {
        List<MntInstallBaseInfo> list = mntInstallBaseInfoMapper.findList(mntInstallBaseInfo);
        cvtContentList(list);
        return list;
    }

    @Override
    public void saveInstallBaseInfo(MntInstallBaseInfo mntInstallBaseInfo) {
        SysUser currentUser = userRealm.getCurrentUser();
        mntInstallBaseInfo.setCreator(currentUser.getUserName());
        mntInstallBaseInfo.setCreateDate(new Date());
        mntInstallBaseInfo.setModifier(currentUser.getUserName());
        mntInstallBaseInfo.setModifyDate(new Date());
        mntInstallBaseInfoMapper.save(mntInstallBaseInfo);
    }

    @Override
    public void updateInstallBaseInfo(MntInstallBaseInfo mntInstallBaseInfo) {
        SysUser currentUser = userRealm.getCurrentUser();
        mntInstallBaseInfo.setModifier(currentUser.getUserName());
        mntInstallBaseInfo.setModifyDate(new Date());
        mntInstallBaseInfoMapper.updateByPrimaryKey(mntInstallBaseInfo);
        
    }

    @Override
    public void deletemntInstallBaseInfoByIds(String baseIds) {
        SysUser currentUser = userRealm.getCurrentUser();
        String[] baseIdAry = baseIds.split(",");
        for(String baseId : baseIdAry) {
            MntInstallBaseInfo mntInstallBaseInfo = new MntInstallBaseInfo();
            mntInstallBaseInfo.setDeleteFlag("1");//已删除
            mntInstallBaseInfo.setBaseId(Integer.parseInt(baseId));
            mntInstallBaseInfo.setModifier(currentUser.getUserName());
            mntInstallBaseInfo.setModifyDate(new Date());
            mntInstallBaseInfoMapper.updateByPrimaryKey(mntInstallBaseInfo);
        }
    }

    private void cvtContentList(List<MntInstallBaseInfo> baseInfoList) {
        for(MntInstallBaseInfo baseInfo : baseInfoList) {
            baseInfo.setDeleteFlagTxt(BaseDataCache.getDataName("DELETE_FLAG", baseInfo.getDeleteFlag()));
        }
    }
}
