package com.ai.mnt.service.product.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ai.mnt.common.cache.BaseDataCache;
import com.ai.mnt.common.shiro.UserRealm;
import com.ai.mnt.exception.MntDataAccessException;
import com.ai.mnt.model.product.MntReleaseRec;
import com.ai.mnt.model.sys.SysUser;
import com.ai.mnt.persistence.product.MntReleaseRecMapper;
import com.ai.mnt.service.product.MntReleaseRecService;

@Service
public class MntReleaseRecServiceImpl implements MntReleaseRecService {
    
    @Autowired
    MntReleaseRecMapper mntReleaseRecMapper;

    @Autowired
    UserRealm userRealm;
    
    /**
     * 获取全部发布记录
     */
    @Override
    public List<MntReleaseRec> findAllMntReleaseRec() {
        List<MntReleaseRec> relReclist = mntReleaseRecMapper.findAll();
        cvtContentList(relReclist);
        return relReclist;
    }

    @Override
    public MntReleaseRec findReleaseRecById(Integer relId) {
        MntReleaseRec relRec = mntReleaseRecMapper.findByPrimaryKey(relId);
        return relRec;
    }

    @Override
    public List<MntReleaseRec> findReleaseRecList(MntReleaseRec mntReleaseRec) {
        List<MntReleaseRec> relReclist = mntReleaseRecMapper.findList(mntReleaseRec);
        cvtContentList(relReclist);
        return relReclist;
    }
    
    /**
     * 统计各安装点的需求量
     * @param mntReleaseRecDtl
     * @return
     */
    @Override
    public List<MntReleaseRec> getStatResForBaseId(MntReleaseRec mntReleaseRec) {
        List<MntReleaseRec> relReclist = mntReleaseRecMapper.getStatResForBaseId(mntReleaseRec);
        cvtContentList(relReclist);
        return relReclist;
    }
    
    /**
     * 统计各产品的需求量
     * @param mntReleaseRecDtl
     * @return
     */
    @Override
    public List<MntReleaseRec> getStatResForProdId(MntReleaseRec mntReleaseRec) {
        List<MntReleaseRec> relReclist = mntReleaseRecMapper.getStatResForProdId(mntReleaseRec);
        cvtContentList(relReclist);
        return relReclist;
    }
    
    private void cvtContentList(List<MntReleaseRec> relList) {
        for(MntReleaseRec mntReleaseRec : relList) {
            mntReleaseRec.setProdName(BaseDataCache.getDataName("PROD_INFO", mntReleaseRec.getProdId()));
            mntReleaseRec.setVerName(BaseDataCache.getDataName("PROD_VER", mntReleaseRec.getVerCode()));
            mntReleaseRec.setRelTypeTxt(BaseDataCache.getDataName("REL_TYPE", mntReleaseRec.getRelType()));
            mntReleaseRec.setBaseName(BaseDataCache.getDataName("BASE_NAME_ENUM", mntReleaseRec.getBaseId()));
        }
    }

    @Override
    public void saveReleaseRec(MntReleaseRec mntReleaseRec) throws MntDataAccessException{
        
        if(!"BIZBILLING_VER_00000".equals(mntReleaseRec.getRelCode()) && 
                !"BIZBILLING_VER_11111".equals(mntReleaseRec.getRelCode()) &&
                !"BIZBILLING_VER_99999".equals(mntReleaseRec.getRelCode())) {
            //重复验证
            MntReleaseRec mntReleaseRec2 = new MntReleaseRec();
            mntReleaseRec2.setRelCode(mntReleaseRec.getRelCode());
            mntReleaseRec2.setProdId(mntReleaseRec.getProdId());
            List<MntReleaseRec> relReclist = mntReleaseRecMapper.findList(mntReleaseRec2);
            if(relReclist != null && relReclist.size() > 0) {
                throw new MntDataAccessException("该产品的版本号信息已经存在，请检查后重新添加！" );
            }
        }
        SysUser currentUser = userRealm.getCurrentUser();
        mntReleaseRec.setDeleteFlag("0");
        mntReleaseRec.setCreator(currentUser.getUserName());
        mntReleaseRec.setModifier(currentUser.getUserName());
        mntReleaseRec.setCreateDate(new Date());
        mntReleaseRec.setModifyDate(new Date());
        
        mntReleaseRecMapper.save(mntReleaseRec);
        
    }

    @Override
    public void updateReleaseRec(MntReleaseRec mntReleaseRec) {
        SysUser currentUser = userRealm.getCurrentUser();
        mntReleaseRec.setModifier(currentUser.getUserName());
        mntReleaseRec.setModifyDate(new Date());
        mntReleaseRecMapper.updateByPrimaryKey(mntReleaseRec);
    }

    @Override
    public void deleteReleaseRec(String relIds) {
        SysUser currentUser = userRealm.getCurrentUser();
        MntReleaseRec mntReleaseRec = new MntReleaseRec();
        mntReleaseRec.setDeleteFlag("1");
        mntReleaseRec.setModifier(currentUser.getUserName());
        mntReleaseRec.setModifyDate(new Date());
        String[] relIdAry = relIds.split(",");
        for(String relId : relIdAry) {
            mntReleaseRec.setRelId(Integer.parseInt(relId));
            mntReleaseRecMapper.updateByPrimaryKey(mntReleaseRec);
        }
    }

}
