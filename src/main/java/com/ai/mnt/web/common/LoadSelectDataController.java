package com.ai.mnt.web.common;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ai.mnt.model.product.MntModuleLib;
import com.ai.mnt.model.product.MntProdModule;
import com.ai.mnt.model.product.MntProdVersion;
import com.ai.mnt.model.product.MntReleaseRec;
import com.ai.mnt.model.product.MntReleaseRecDtl;
import com.ai.mnt.service.product.MntModuleLibService;
import com.ai.mnt.service.product.MntProdModuleService;
import com.ai.mnt.service.product.MntProdVerService;
import com.ai.mnt.service.product.MntReleaseRecDtlService;
import com.ai.mnt.service.product.MntReleaseRecService;

/**
 * 下拉框加载
 * @author matrix
 *
 */
@Controller
@RequestMapping("/load/select")
public class LoadSelectDataController {
    
    @Autowired
    MntProdVerService mntProdVerService;
    
    @Autowired
    MntReleaseRecService mntReleaseRecService;
    
    @Autowired
    MntProdModuleService mntProdModuleService;
    
    @Autowired
    MntModuleLibService mntModuleLibService;
    
    @Autowired
    MntReleaseRecDtlService mntReleaseRecDtlService;
    
    /**
     * 获取产品版本
     */
    @RequestMapping("/ver/{prodId}")
    @ResponseBody
    public List<Map<String, String>> queryProdVerByProdId(@PathVariable String prodId) {
        MntProdVersion mntProdVer = new MntProdVersion();
        if(!"-1".equals(prodId)) {
            mntProdVer.setProdId(Integer.parseInt(prodId));
        }
        mntProdVer.setDeleteFlag("0");
        List<MntProdVersion> prodVerList = mntProdVerService.findProdVerList(mntProdVer);
        List<Map<String, String>> list = new ArrayList<>();
        for(MntProdVersion mntProdVersion : prodVerList) {
            Map<String, String> map = new HashMap<>();
            map.put(mntProdVersion.getVerCode(), mntProdVersion.getVerName());
            list.add(map);
        }
        return list;
    }
    
    /**
     * 获取产品发布版本
     * @param prodId
     * @param verCode
     * @return
     */
    @RequestMapping("/rel/{prodId}/{verCode}")
    @ResponseBody
    public List<Map<Integer, String>> queryRelByProdIdAndVerCode(@PathVariable String prodId,
            @PathVariable String verCode) {
        MntReleaseRec mntReleaseRec = new MntReleaseRec();
        mntReleaseRec.setProdId(Integer.parseInt(prodId));
        mntReleaseRec.setVerCode(verCode);
        mntReleaseRec.setDeleteFlag("0");
        List<MntReleaseRec> relList = mntReleaseRecService.findReleaseRecList(mntReleaseRec);
        List<Map<Integer, String>> list = new ArrayList<>();
        for(MntReleaseRec relRec : relList) {
            Map<Integer, String> map = new HashMap<>();
            map.put(relRec.getRelId(), relRec.getRelCode());
            list.add(map);
        }
        return list;
    }
    
    /**
     * 获取产品版本包含的模块
     * @param prodId
     * @param verCode
     * @return
     */
    @RequestMapping("/module/{prodId}/{verCode}")
    @ResponseBody
    public List<Map<Integer, String>> queryModuleByProdIdAndVerCode(@PathVariable String prodId,
            @PathVariable String verCode) {
        MntProdModule mntProdModule = new MntProdModule();
        mntProdModule.setProdId(Integer.parseInt(prodId));
        mntProdModule.setVerCode(verCode);
        mntProdModule.setDeleteFlag("0");
        List<MntProdModule> moduleList = mntProdModuleService.findProdModuleList(mntProdModule);
        List<Map<Integer, String>> list = new ArrayList<>();
        for(MntProdModule module : moduleList) {
            Map<Integer, String> map = new HashMap<>();
            map.put(module.getModuleId(), module.getModuleName());
            list.add(map);
        }
        return list;
    }
    
    /**
     * 获取模块下的库文件
     * @param prodId
     * @param verCode
     * @return
     */
    @RequestMapping("/lib/{moduleId}")
    @ResponseBody
    public List<Map<Integer, String>> queryLibByModuleId(@PathVariable String moduleId) {
        List<Map<Integer, String>> list = new ArrayList<>();
        if(moduleId != null && !"".equals(moduleId) && !"null".equals(moduleId)) {
            MntModuleLib mntModuleLib = new MntModuleLib();
            mntModuleLib.setDeleteFlag("0");
            mntModuleLib.setModuleId(Integer.parseInt(moduleId));
            List<MntModuleLib> mntModuleLibList = mntModuleLibService.findMntModuleLibList(mntModuleLib);
            for(MntModuleLib lib : mntModuleLibList) {
                Map<Integer, String> map = new HashMap<>();
                map.put(lib.getLibId(), lib.getLibName());
                list.add(map);
            }
        }
        return list;
    }
    
    /**
     * 获取发布版本下的需求或故障列表
     * @param prodId
     * @param verCode
     * @return
     */
    @RequestMapping("/dtl/{relId}")
    @ResponseBody
    public List<Map<Integer, String>> queryRelDtlByRelId(@PathVariable String relId) {
        List<Map<Integer, String>> list = new ArrayList<>();
        if(relId != null && !"".equals(relId) && !"null".equals(relId)) {
            MntReleaseRecDtl mntReleaseRecDtl = new MntReleaseRecDtl();
            mntReleaseRecDtl.setDeleteFlag("0");
            mntReleaseRecDtl.setRelId(Integer.parseInt(relId));
            List<MntReleaseRecDtl> mntReleaseRecDtls = mntReleaseRecDtlService.findRelDtlList(mntReleaseRecDtl);
            for(MntReleaseRecDtl dtl : mntReleaseRecDtls) {
                Map<Integer, String> map = new HashMap<>();
                map.put(dtl.getDtlId(), dtl.getDtlCode());
                list.add(map);
            }
        }
        return list;
    }
}
