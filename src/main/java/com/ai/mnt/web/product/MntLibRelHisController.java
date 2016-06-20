package com.ai.mnt.web.product;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ai.mnt.common.cache.BaseDataCache;
import com.ai.mnt.model.common.EnumObject;
import com.ai.mnt.model.product.MntLibBaseRel;
import com.ai.mnt.model.product.MntLibRelHis;
import com.ai.mnt.model.product.MntModuleLib;
import com.ai.mnt.model.product.MntProdModule;
import com.ai.mnt.model.product.MntReleaseRec;
import com.ai.mnt.service.product.MntLibRelHisService;

/**
 * @Title: MntLibRelHisController 
 * @Description: MntLibRelHisController ControllerPackage
 * @Author: Auto Generate. HE
 * @Date: 2016-5-16
 */

@Controller
@RequestMapping("/prod/lib")
public class MntLibRelHisController {

    @Autowired
    MntLibRelHisService mntLibRelHisService;
    
    /**
     * 库文件发布历史明细界面跳转
     * @param  model
     * @return String
     */
    @RequestMapping("/rel_his/page")
    public String showMntLibRelHisPage(Model model) {
        List<EnumObject> prodEnums = BaseDataCache.getDataList("PROD_INFO");
        List<EnumObject> verEnums = BaseDataCache.getDataList("PROD_VER");
        model.addAttribute("verEnums", verEnums);
        model.addAttribute("prodEnums", prodEnums);
        return "product/lib/rel_his/lib_rel_his_query";
    }
    
    /**
     * 获取库文件发布历史明细列表
     * @param mntLibRelHis
     * @return Map<String, Object>
     */
    @RequestMapping("/rel_his/query")
    @ResponseBody
    public Map<String, Object> getMntLibRelHisList(MntLibRelHis mntLibRelHis,
            MntModuleLib mntModuleLib, MntReleaseRec mntReleaseRec, MntProdModule mntProdModule) {
        
        mntLibRelHis.setDeleteFlag("0");
        mntModuleLib.setMntProdModule(mntProdModule);
        mntLibRelHis.setMntModuleLib(mntModuleLib);
        mntLibRelHis.setMntReleaseRec(mntReleaseRec);
        List<MntLibRelHis> mntLibRelHisList = mntLibRelHisService.findLibRelHisJoinList(mntLibRelHis);
        Map<String, Object> map = new HashMap<>();
        map.put("data", mntLibRelHisList);
        map.put("status", "1");
        return map;
    }
    
    /**
     * 库文件发布历史明细新增界面跳转
     * @param  model
     * @return String
     */
    @RequiresPermissions("prod:operate")
    @RequestMapping("/rel_his/add_page")
    public String showMntLibRelHisAddPage(Model model) {
        
        List<EnumObject> prodEnums = BaseDataCache.getDataList("PROD_INFO");
        List<EnumObject> baseIdEnums = BaseDataCache.getDataList("BASE_NAME_ENUM");
        model.addAttribute("prodEnums", prodEnums);
        model.addAttribute("baseIdEnums", baseIdEnums);
        
        return "product/lib/rel_his/lib_rel_his_add";
    }
    
    /**
     * 库文件发布历史明细保存
     * @param mntLibRelHis
     * @return Map<String, Object>
     */
    @RequiresPermissions("prod:operate")
    @RequestMapping("/rel_his/add")
    @ResponseBody
    public Map<String, Object> saveMntLibRelHis(MntLibRelHis mntLibRelHis) {
        //mntLibRelHisService.saveMntLibRelHisAndBaseId(mntLibRelHis, baseId);
        mntLibRelHisService.saveMntLibRelHis(mntLibRelHis);
        Map<String, Object> map = new HashMap<>();
        map.put("status", "1");
        return map;
    }
    
    /**
     * 库文件发布历史明细更新界面跳转
     * @param  model
     * @param  id
     * @return
     */
    @RequiresPermissions("prod:operate")
    @RequestMapping("/rel_his/update_page/{id}")
    public String showMntLibRelHisUpdatePage(Model model, @PathVariable String id) {
        
        MntLibRelHis mntLibRelHis = new MntLibRelHis();
        mntLibRelHis.setId(Integer.parseInt(id));
        List<MntLibRelHis> mntLibRelHisList = mntLibRelHisService.findLibRelHisJoinList(mntLibRelHis);
        if(mntLibRelHisList != null && mntLibRelHisList.size() > 0) {
            model.addAttribute("mntLibRelHis", mntLibRelHisList.get(0));
        }
        List<EnumObject> prodEnums = BaseDataCache.getDataList("PROD_INFO");
        List<EnumObject> baseIdEnums = BaseDataCache.getDataList("BASE_NAME_ENUM");
        model.addAttribute("prodEnums", prodEnums);
        model.addAttribute("baseIdEnums", baseIdEnums);
        return "product/lib/rel_his/lib_rel_his_update";
    }
    
    /**
     * 库文件发布历史明细根据主键更新
     * @param mntLibRelHis
     * @return
     */
    @RequiresPermissions("prod:operate")
    @RequestMapping("/rel_his/update")
    @ResponseBody
    public Map<String, Object> updateMntLibRelHis(MntLibRelHis mntLibRelHis) {
        //mntLibRelHisService.updateMntLibRelHisAndInstBase(mntLibRelHis, baseId);
        mntLibRelHisService.updateMntLibRelHisById(mntLibRelHis);
        Map<String, Object> map = new HashMap<>();
        map.put("status", "1");
        return map;
    }
    
    /**
     * 库文件发布历史明细根据主键批量删除
     * @param ids
     * @return Map<String, Object>
     */
    @RequiresPermissions("prod:operate")
    @RequestMapping("/rel_his/delete/{ids}")
    @ResponseBody
    public Map<String, Object> deleteMntLibRelHisByIds(@PathVariable String ids) {
        mntLibRelHisService.deleteMntLibRelHisByIds(ids);
        Map<String, Object> map = new HashMap<>();
        map.put("status", "1");
        return map;
    }
    
    /**
     * 根据主键查询库文件发布历史明细详细信息
     * @param model
     * @return
     */
    @RequestMapping("/rel_his/{hisId}/page")
    public String queryMntLibRelHisById(Model model, @PathVariable String hisId) {
        MntLibRelHis mntLibRelHis = new MntLibRelHis();
        mntLibRelHis.setId(Integer.parseInt(hisId));
        List<MntLibRelHis> mntLibRelHisList = mntLibRelHisService.findLibRelHisJoinList(mntLibRelHis);
        if(mntLibRelHisList != null && mntLibRelHisList.size() > 0) {
            MntLibRelHis relHis = mntLibRelHisList.get(0);
            model.addAttribute("mntLibRelHis", relHis);
            
//            MntLibBaseRel mntLibBaseRel = new MntLibBaseRel();
//            mntLibBaseRel.setLibRelHisId(relHis.getId());
//            List<MntLibBaseRel> baseRelList = mntLibRelHisService.findMntLibBaseRelList(mntLibBaseRel);
//            String baseNames = "";
//            if(baseRelList != null && baseRelList.size() > 0) {
//                for(MntLibBaseRel temp : baseRelList) {
//                    baseNames += "," + BaseDataCache.getDataName("BASE_NAME_ENUM", temp.getBaseId());
//                }
//                baseNames = baseNames.replaceFirst(",", "");
//            }
//            model.addAttribute("baseNames", baseNames);
        }
        return "product/lib/rel_his/lib_rel_his_info";
    }
    
    /**
     * 获取进程所属的模块
     * @param mntReleaseRec
     * @return
     */
    @RequestMapping("/rel_his/inst_base/{hisId}")
    @ResponseBody
    public List<MntLibBaseRel> getLibHisBaseByHisId(@PathVariable String hisId) {
        MntLibBaseRel mntLibBaseRel = new MntLibBaseRel();
        mntLibBaseRel.setLibRelHisId(Integer.parseInt(hisId));
        List<MntLibBaseRel> mntLibBaseRels = mntLibRelHisService.getLibAndBaseRelList(mntLibBaseRel);
        return mntLibBaseRels;
    }
    
}
