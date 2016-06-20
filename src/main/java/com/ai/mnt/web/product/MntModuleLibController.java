package com.ai.mnt.web.product;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.ai.mnt.common.cache.BaseDataCache;
import com.ai.mnt.common.util.ExcelUtil;
import com.ai.mnt.model.common.EnumObject;
import com.ai.mnt.model.product.MntLibRelHis;
import com.ai.mnt.model.product.MntLibRelation;
import com.ai.mnt.model.product.MntModuleLib;
import com.ai.mnt.model.product.MntProdModule;
import com.ai.mnt.service.product.MntLibRelHisService;
import com.ai.mnt.service.product.MntModuleLibService;

/**
 * @Title: MntModuleLibController 
 * @Description: MntModuleLibController ControllerPackage
 * @Author: Auto Generate. HE
 * @Date: 2016-5-12
 */

@Controller
@RequestMapping("/prod")
public class MntModuleLibController {

    @Autowired
    MntModuleLibService mntModuleLibService;
    
    @Autowired
    MntLibRelHisService mntLibRelHisService;
    
    /**
     * 库文件信息界面跳转
     * @param  model
     * @return String
     */
    @RequestMapping("/lib/page")
    public String showMntModuleLibPage(Model model) {
        
        List<EnumObject> prodEnums = BaseDataCache.getDataList("PROD_INFO");
        List<EnumObject> verEnums = BaseDataCache.getDataList("PROD_VER");
        List<EnumObject> isUsedEnums = BaseDataCache.getDataList("MODULE_IS_USED");
        model.addAttribute("prodEnums", prodEnums);
        model.addAttribute("verEnums", verEnums);
        model.addAttribute("isUsedEnums", isUsedEnums);
        
        return "product/lib/product_lib_query";
    }
    
    /**
     * 获取库文件信息列表
     * @param mntModuleLib
     * @return Map<String, Object>
     */
    @RequestMapping("/lib/query")
    @ResponseBody
    public Map<String, Object> queryModuleLibInfo(MntModuleLib mntModuleLib, MntProdModule mntProdModule) {
        mntModuleLib.setMntProdModule(mntProdModule);
        mntModuleLib.setDeleteFlag("0");
        List<MntModuleLib> mntModuleLibList = mntModuleLibService.findModuleLibJoinModule(mntModuleLib);
        Map<String, Object> map = new HashMap<>();
        map.put("data", mntModuleLibList);
        map.put("status", "1");
        return map;
    }
    
    /**
     * 库文件信息新增界面跳转
     * @param  model
     * @return String
     */
    @RequiresPermissions("prod:operate")
    @RequestMapping("/lib/add_page")
    public String showMntModuleLibAddPage(Model model) {
        
        List<EnumObject> prodEnums = BaseDataCache.getDataList("PROD_INFO");
        List<EnumObject> verEnums = BaseDataCache.getDataList("PROD_VER");
        List<EnumObject> isUsedEnums = BaseDataCache.getDataList("MODULE_IS_USED");
        List<EnumObject> libTypeEnums = BaseDataCache.getDataList("LIB_TYPE");
        model.addAttribute("libTypeEnums", libTypeEnums);
        model.addAttribute("prodEnums", prodEnums);
        model.addAttribute("verEnums", verEnums);
        model.addAttribute("isUsedEnums", isUsedEnums);
        
        return "product/lib/product_lib_add";
    }
    
    /**
     * 库文件信息保存
     * @param mntModuleLib
     * @return Map<String, Object>
     */
    @RequiresPermissions("prod:operate")
    @RequestMapping("/lib/add")
    @ResponseBody
    public Map<String, Object> saveMntModuleLib(MntModuleLib mntModuleLib) {
        mntModuleLibService.saveMntModuleLib(mntModuleLib);
        Map<String, Object> map = new HashMap<>();
        map.put("status", "1");
        return map;
    }
    
    /**
     * 库文件信息更新界面跳转
     * @param  model
     * @param  libId
     * @return
     */
    @RequiresPermissions("prod:operate")
    @RequestMapping("/lib/update_page/{libId}")
    public String showMntModuleLibUpdatePage(Model model, @PathVariable String libId) {
        
        MntModuleLib mntModuleLib = new MntModuleLib(); 
        mntModuleLib.setDeleteFlag("0");
        mntModuleLib.setLibId(Integer.parseInt(libId));
        List<MntModuleLib> mntModuleLibList = mntModuleLibService.findModuleLibJoinModule(mntModuleLib);
        
        if(mntModuleLibList != null && mntModuleLibList.size() > 0) {
            model.addAttribute("mntModuleLib", mntModuleLibList.get(0));
            
            //关联lib信息列表
            List<MntModuleLib> mLibs = new ArrayList<>();
            MntLibRelation mntLibRelation = new MntLibRelation();
            mntLibRelation.setLibId(mntModuleLibList.get(0).getLibId());
            List<MntLibRelation> relationList = mntModuleLibService.findMntLibRelationList(mntLibRelation);
            for(MntLibRelation temp : relationList) {
                MntModuleLib mLib = new MntModuleLib(); 
                //mLib.setDeleteFlag("0");
                mLib.setLibId(temp.getRelLibId());
                List<MntModuleLib> mntModuleLibs = mntModuleLibService.findModuleLibJoinModule(mLib);
                if(mntModuleLibs != null && mntModuleLibs.size() > 0) {
                    MntModuleLib lib = mntModuleLibs.get(0);
                    lib.setLibDesc(temp.getRelDesc()); //暂时用该字段存放关联描述，用于页面展示数据
                    mLibs.add(lib);
                }
            }
            model.addAttribute("relLibs", mLibs);
        }
        
        List<EnumObject> prodEnums = BaseDataCache.getDataList("PROD_INFO");
        List<EnumObject> verEnums = BaseDataCache.getDataList("PROD_VER");
        List<EnumObject> isUsedEnums = BaseDataCache.getDataList("MODULE_IS_USED");
        List<EnumObject> libTypeEnums = BaseDataCache.getDataList("LIB_TYPE");
        model.addAttribute("libTypeEnums", libTypeEnums);
        model.addAttribute("prodEnums", prodEnums);
        model.addAttribute("verEnums", verEnums);
        model.addAttribute("isUsedEnums", isUsedEnums);
        
        
        return "product/lib/product_lib_update";
    }
    
    /**
     * 库文件信息根据主键更新
     * @param mntModuleLib
     * @return
     */
    @RequiresPermissions("prod:operate")
    @RequestMapping("/lib/update")
    @ResponseBody
    public Map<String, Object> updateMntModuleLib(MntModuleLib mntModuleLib) {
        mntModuleLibService.updateMntModuleLibByLibId(mntModuleLib);
        Map<String, Object> map = new HashMap<>();
        map.put("status", "1");
        return map;
    }
    
    /**
     * 库文件信息根据主键批量删除
     * @param libIds
     * @return Map<String, Object>
     */
    @RequiresPermissions("prod:operate")
    @RequestMapping("/lib/delete/{libIds}")
    @ResponseBody
    public Map<String, Object> deleteMntModuleLibByLibIds(@PathVariable String libIds) {
        mntModuleLibService.deleteMntModuleLibByLibIds(libIds);
        Map<String, Object> map = new HashMap<>();
        map.put("status", "1");
        return map;
    }
    
    /**
     * 产品模块批量导入Excel
     * 
     * @param model
     * @return
     */
    @RequiresPermissions("prod:operate")
    @RequestMapping("/lib/page_import")
    public String batchImportLibPage(Model model) {
        List<EnumObject> prodEnums = BaseDataCache.getDataList("PROD_INFO");
        List<EnumObject> verEnums = BaseDataCache.getDataList("PROD_VER");
        model.addAttribute("prodEnums", prodEnums);
        model.addAttribute("verEnums", verEnums);
        return "product/lib/product_lib_import";
    }
    
    /**
     * 产品模块批量导入Excel
     * 
     * @param model
     * @return
     */
    @RequiresPermissions("prod:operate")
    @RequestMapping("/lib/import")
    @ResponseBody
    public Map<String, Object> batchImportProdModuleLib(@RequestParam("file") MultipartFile file, MntProdModule mntProdModule) {
        Map<String, Object> map = new HashMap<>();
        if (!file.isEmpty()) {
            try {
                //String fileName = file.getOriginalFilename();
                InputStream inputStream = file.getInputStream();
                List<List<String>> excelData = ExcelUtil.readExcelToListBySheetIndex(inputStream, 0);
                
                mntModuleLibService.saveLibImportData(excelData, mntProdModule.getProdId(), mntProdModule.getVerCode());
                
                map.put("status", "1");
                map.put("info", "文件上传解析成功！");
            } catch (Exception e) {
                e.printStackTrace();
                map.put("status", "0");
                map.put("error", "文件上传失败！" + e.getMessage());
            }
        }else {
            map.put("status", "0");
            map.put("error", "请选择需要上传的文件！");
        }
        return map;
    }
    /**
     * 库发布历史
     * @param model
     * @return
     */
    @RequestMapping("/lib/his/{libId}/page")
    public String queryModuleLibHisByLibId(Model model, @PathVariable String libId) {
        MntLibRelHis mntLibRelHis = new MntLibRelHis();
        mntLibRelHis.setLibId(Integer.parseInt(libId));
        mntLibRelHis.setDeleteFlag("0");
        List<MntLibRelHis> mntLibRelHisList = mntLibRelHisService.findLibRelHisJoinList(mntLibRelHis);
        model.addAttribute("mntLibRelHisList", mntLibRelHisList);
        String libName = BaseDataCache.getDataName("LIB_NAME_ENUM", libId);
        model.addAttribute("libName", libName);
        return "product/lib/product_lib_his_list";
    }
    
    /**
     * 库详细信息
     * @param model
     * @return
     */
    @RequestMapping("/lib/info/{libId}/page")
    public String queryModuleLibInfoByLibId(Model model, @PathVariable String libId) {
        
        MntModuleLib mntModuleLib = new MntModuleLib();
        mntModuleLib.setDeleteFlag("0");
        mntModuleLib.setLibId(Integer.parseInt(libId));
        List<MntModuleLib> mntModuleLibList = mntModuleLibService.findModuleLibJoinModule(mntModuleLib);
        
        if(mntModuleLibList != null && mntModuleLibList.size() > 0) {
            model.addAttribute("mntModuleLib", mntModuleLibList.get(0));
            
            //关联lib信息列表
            List<MntModuleLib> mLibs = new ArrayList<>();
            MntLibRelation mntLibRelation = new MntLibRelation();
            mntLibRelation.setLibId(mntModuleLibList.get(0).getLibId());
            List<MntLibRelation> relationList = mntModuleLibService.findMntLibRelationList(mntLibRelation);
            for(MntLibRelation temp : relationList) {
                MntModuleLib mLib = new MntModuleLib(); 
                //mLib.setDeleteFlag("0");
                mLib.setLibId(temp.getRelLibId());
                List<MntModuleLib> mntModuleLibs = mntModuleLibService.findModuleLibJoinModule(mLib);
                if(mntModuleLibs != null && mntModuleLibs.size() > 0) {
                    MntModuleLib lib = mntModuleLibs.get(0);
                    lib.setLibDesc(temp.getRelDesc()); //暂时用该字段存放关联描述，用于页面展示数据
                    mLibs.add(lib);
                }
            }
            model.addAttribute("relLibs", mLibs);
        }
        
        return "product/lib/product_lib_info";
    }
}
