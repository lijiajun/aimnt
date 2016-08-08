package com.ai.mnt.service.product.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ai.mnt.common.cache.BaseDataCache;
import com.ai.mnt.common.shiro.UserRealm;
import com.ai.mnt.exception.MntDataAccessException;
import com.ai.mnt.model.product.MntReleaseRec;
import com.ai.mnt.model.product.MntReleaseRecDtl;
import com.ai.mnt.model.sys.SysUser;
import com.ai.mnt.persistence.product.MntReleaseRecDtlMapper;
import com.ai.mnt.service.product.MntReleaseRecDtlService;
import com.ai.mnt.service.product.MntReleaseRecService;

@Service
public class MntReleaseRecDtlServiceImpl implements MntReleaseRecDtlService{

    @Autowired
    MntReleaseRecDtlMapper mntReleaseRecDtlMapper;
    
    @Autowired
    MntReleaseRecService mntReleaseRecService;
    
    @Autowired
    UserRealm userRealm;
    
    /**
     * 获取发布明细
     * @return
     */
    @Override
    public List<MntReleaseRecDtl> findRelDtlList(MntReleaseRecDtl mntReleaseRecDtl) {
        
        List<MntReleaseRecDtl> recDtllist = mntReleaseRecDtlMapper.findList(mntReleaseRecDtl);
        cvtContentList(recDtllist);
        return recDtllist;
    }
    
    /**
     * 获取发布明细
     * @return
     */
    @Override
    public List<MntReleaseRecDtl> findRecAndDtlJoinList(MntReleaseRecDtl mntReleaseRecDtl) {
        
        List<MntReleaseRecDtl> recDtllist = mntReleaseRecDtlMapper.findRecAndDtlJoinList(mntReleaseRecDtl);
        cvtContentList(recDtllist);
        return recDtllist;
    }
    
    private void cvtContentList(List<MntReleaseRecDtl> relDtlList) {
        for(MntReleaseRecDtl mntReleaseRecDtl : relDtlList) {
            MntReleaseRec releaseRec = mntReleaseRecDtl.getMntReleaseRec();
            if(releaseRec != null) {
                releaseRec.setProdName(BaseDataCache.getDataName("PROD_INFO", releaseRec.getProdId()));
                releaseRec.setVerName(BaseDataCache.getDataName("PROD_VER", releaseRec.getVerCode()));
            }
            mntReleaseRecDtl.setDtlTypeTxt(BaseDataCache.getDataName("REL_DTL_TYPE", mntReleaseRecDtl.getDtlType()));
            mntReleaseRecDtl.setBaseIdTxt(BaseDataCache.getDataName("BASE_NAME_ENUM", mntReleaseRecDtl.getBaseId()));
            mntReleaseRecDtl.setRelCode(BaseDataCache.getDataName("REL_CODE", mntReleaseRecDtl.getRelId()));
        }
    }

    @Override
    public List<MntReleaseRecDtl> getStatResForBaseId(
            MntReleaseRecDtl mntReleaseRecDtl) {
        List<MntReleaseRecDtl> list = mntReleaseRecDtlMapper.getStatResForBaseId(mntReleaseRecDtl);
        return list;
    }

    @Override
    public void saveRelDtl(MntReleaseRecDtl mntReleaseRecDtl) {
        
        
        MntReleaseRec releaseRec = mntReleaseRecService.findReleaseRecById(mntReleaseRecDtl.getRelId());
        if(!"BIZBILLING_VER_00000".equals(releaseRec.getRelCode()) && 
                !"BIZBILLING_VER_11111".equals(releaseRec.getRelCode()) &&
                !"BIZBILLING_VER_99999".equals(releaseRec.getRelCode())) {
            //重复验证
            MntReleaseRecDtl mntReleaseRecDtl2 = new MntReleaseRecDtl();
            mntReleaseRecDtl2.setRelId(mntReleaseRecDtl.getRelId());
            mntReleaseRecDtl2.setDtlCode(mntReleaseRecDtl.getDtlCode());
            MntReleaseRec mntReleaseRec = new MntReleaseRec();
            mntReleaseRec.setProdId(mntReleaseRecDtl.getProdId());
            mntReleaseRecDtl2.setMntReleaseRec(mntReleaseRec);
            List<MntReleaseRecDtl> recDtllist = mntReleaseRecDtlMapper.findRecAndDtlJoinList(mntReleaseRecDtl2);
            if(recDtllist != null && recDtllist.size() > 0) {
                throw new MntDataAccessException("该产品的相同版本号下已经存在相同的明细信息，请检查后重新添加！" );
            }
        }
        
        
        
        SysUser currentUser = userRealm.getCurrentUser();
        mntReleaseRecDtl.setDeleteFlag("0");
        mntReleaseRecDtl.setCreator(currentUser.getUserName());
        mntReleaseRecDtl.setModifier(currentUser.getUserName());
        mntReleaseRecDtl.setCreateDate(new Date());
        mntReleaseRecDtl.setModifyDate(new Date());
        
        mntReleaseRecDtlMapper.save(mntReleaseRecDtl);
        
    }

    @Override
    public void updateRelDtlById(MntReleaseRecDtl mntReleaseRecDtl) {
        SysUser currentUser = userRealm.getCurrentUser();
        mntReleaseRecDtl.setModifier(currentUser.getUserName());
        mntReleaseRecDtl.setModifyDate(new Date());
        mntReleaseRecDtlMapper.updateByPrimaryKey(mntReleaseRecDtl);
    }

    @Override
    public void deleteRelDtlByIds(String dtlIds) {
        SysUser currentUser = userRealm.getCurrentUser();
        MntReleaseRecDtl mntReleaseRecDtl = new MntReleaseRecDtl();
        mntReleaseRecDtl.setDeleteFlag("1");
        mntReleaseRecDtl.setModifier(currentUser.getUserName());
        mntReleaseRecDtl.setModifyDate(new Date());
        String[] dtlIdAry = dtlIds.split(",");
        for(String dtlId : dtlIdAry) {
            mntReleaseRecDtl.setDtlId(Integer.parseInt(dtlId));
            mntReleaseRecDtlMapper.updateByPrimaryKey(mntReleaseRecDtl);
        }
    }

    @Override
    public MntReleaseRecDtl getRelDtlByDtlId(Integer dtlId) {
        MntReleaseRecDtl releaseRecDtl = mntReleaseRecDtlMapper.findByPrimaryKey(dtlId);
        return releaseRecDtl;
    }

    @Override
    public void saveReleaseRecWithBaseIds(MntReleaseRecDtl mntReleaseRecDtl,
            String[] baseIdAry) {
        
        MntReleaseRec releaseRec = mntReleaseRecService.findReleaseRecById(mntReleaseRecDtl.getRelId());
        if(!"BIZBILLING_VER_00000".equals(releaseRec.getRelCode()) && 
                !"BIZBILLING_VER_11111".equals(releaseRec.getRelCode()) &&
                !"BIZBILLING_VER_99999".equals(releaseRec.getRelCode())) {
            //重复验证
            MntReleaseRecDtl mntReleaseRecDtl2 = new MntReleaseRecDtl();
            mntReleaseRecDtl2.setRelId(mntReleaseRecDtl.getRelId());
            mntReleaseRecDtl2.setDtlCode(mntReleaseRecDtl.getDtlCode());
            MntReleaseRec mntReleaseRec = new MntReleaseRec();
            mntReleaseRec.setProdId(mntReleaseRecDtl.getProdId());
            mntReleaseRecDtl2.setMntReleaseRec(mntReleaseRec);
            List<MntReleaseRecDtl> recDtllist = mntReleaseRecDtlMapper.findRecAndDtlJoinList(mntReleaseRecDtl2);
            if(recDtllist != null && recDtllist.size() > 0) {
                throw new MntDataAccessException("该产品的相同版本号下已经存在相同的明细信息，请检查后重新添加！" );
            }
        }
        
        SysUser currentUser = userRealm.getCurrentUser();
        mntReleaseRecDtl.setDeleteFlag("0");
        mntReleaseRecDtl.setCreator(currentUser.getUserName());
        mntReleaseRecDtl.setModifier(currentUser.getUserName());
        mntReleaseRecDtl.setCreateDate(new Date());
        mntReleaseRecDtl.setModifyDate(new Date());
        
        for(String baseId : baseIdAry) {
            mntReleaseRecDtl.setBaseId(Integer.parseInt(baseId));
            mntReleaseRecDtlMapper.save(mntReleaseRecDtl);
        }
        
    }

}
