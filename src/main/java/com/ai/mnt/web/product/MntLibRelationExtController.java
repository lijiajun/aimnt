package com.ai.mnt.web.product;

import java.io.InputStream;
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
import com.ai.mnt.model.product.MntLibRelationExt;
import com.ai.mnt.service.product.MntLibRelationExtService;

/**
 * @Title: MntLibRelationExtController 
 * @Description: MntLibRelationExtController ControllerPackage
 * @Author: Auto Generate.
 * @Date: 2016-7-11
 */

@Controller
@RequestMapping("/lib")
public class MntLibRelationExtController {

    @Autowired
    MntLibRelationExtService mntLibRelationExtService;
    
    /**
     * 库文件扩展关联信息界面跳转
     * @param  model
     * @return String
     */
    @RequestMapping("/relation/page")
    public String showMntLibRelationExtPage(Model model) {
        List<EnumObject> prodEnums = BaseDataCache.getDataList("PROD_INFO");
        List<EnumObject> verEnums = BaseDataCache.getDataList("PROD_VER");
        model.addAttribute("prodEnums", prodEnums);
        model.addAttribute("verEnums", verEnums);
        return "product/lib/relation/lib_relation_query";
    }
    
    /**
     * 获取库文件扩展关联信息列表
     * @param mntLibRelationExt
     * @return Map<String, Object>
     */
    @RequestMapping("/relation/query")
    @ResponseBody
    public Map<String, Object> getMntLibRelationExtList(MntLibRelationExt mntLibRelationExt) {
        mntLibRelationExt.setDeleteFlag("0");
        List<MntLibRelationExt> mntLibRelationExtList = mntLibRelationExtService.findMntLibRelationExtList(mntLibRelationExt);
        Map<String, Object> map = new HashMap<>();
        map.put("data", mntLibRelationExtList);
        map.put("status", "1");
        return map;
    }
    
    /**
     * 库文件扩展关联信息新增界面跳转
     * @param  model
     * @return String
     */
    @RequiresPermissions("prod:operate")
    @RequestMapping("/relation/add_page")
    public String showMntLibRelationExtAddPage(Model model) {
        List<EnumObject> prodEnums = BaseDataCache.getDataList("PROD_INFO");
        List<EnumObject> verEnums = BaseDataCache.getDataList("PROD_VER");
        model.addAttribute("prodEnums", prodEnums);
        model.addAttribute("verEnums", verEnums);
        return "product/lib/relation/lib_relation_add";
    }
    
    /**
     * 库文件扩展关联信息保存
     * @param mntLibRelationExt
     * @return Map<String, Object>
     */
    @RequiresPermissions("prod:operate")
    @RequestMapping("/relation/add")
    @ResponseBody
    public Map<String, Object> saveMntLibRelationExt(MntLibRelationExt mntLibRelationExt) {
        mntLibRelationExtService.saveMntLibRelationExt(mntLibRelationExt);
        Map<String, Object> map = new HashMap<>();
        map.put("status", "1");
        return map;
    }
    
    /**
     * 库文件扩展关联信息更新界面跳转
     * @param  model
     * @param  id
     * @return
     */
    @RequestMapping("/relation/update_page/{id}")
    public String showMntLibRelationExtUpdatePage(Model model, @PathVariable String id) {
        
        List<EnumObject> prodEnums = BaseDataCache.getDataList("PROD_INFO");
        List<EnumObject> verEnums = BaseDataCache.getDataList("PROD_VER");
        model.addAttribute("prodEnums", prodEnums);
        model.addAttribute("verEnums", verEnums);
        
        MntLibRelationExt mntLibRelationExt = mntLibRelationExtService.findMntLibRelationExtById(Integer.parseInt(id));
        model.addAttribute("mntLibRelationExt", mntLibRelationExt);
        return "product/lib/relation/lib_relation_update";
    }
    
    /**
     * 库文件扩展关联信息根据主键更新
     * @param mntLibRelationExt
     * @return
     */
    @RequiresPermissions("prod:operate")
    @RequestMapping("/relation/update")
    @ResponseBody
    public Map<String, Object> updateMntLibRelationExt(MntLibRelationExt mntLibRelationExt) {
        mntLibRelationExtService.updateMntLibRelationExtById(mntLibRelationExt);
        Map<String, Object> map = new HashMap<>();
        map.put("status", "1");
        return map;
    }
    
    /**
     * 库文件扩展关联信息根据主键批量删除
     * @param ids
     * @return Map<String, Object>
     */
    @RequiresPermissions("prod:operate")
    @RequestMapping("/relation/delete/{ids}")
    @ResponseBody
    public Map<String, Object> deleteMntLibRelationExtByIds(@PathVariable String ids) {
        mntLibRelationExtService.deleteMntLibRelationExtByIds(ids);
        Map<String, Object> map = new HashMap<>();
        map.put("status", "1");
        return map;
    }
    
    /**
     * 根据主键查询库文件扩展关联信息详细信息
     * @param model
     * @return
     */
    @RequestMapping("/relation/{id}/page")
    public String queryMntLibRelationExtById(Model model, @PathVariable String id) {
        MntLibRelationExt mntLibRelationExt = new MntLibRelationExt();
        mntLibRelationExt.setId(Integer.parseInt(id));
        List<MntLibRelationExt> mntLibRelationExtList = mntLibRelationExtService.findMntLibRelationExtList(mntLibRelationExt);
        if(mntLibRelationExtList != null && mntLibRelationExtList.size() > 0) { //只会有一条数据
            model.addAttribute("mntLibRelationExt", mntLibRelationExtList.get(0));
        }
        return "product/lib/relation/lib_relation_info";
    }
    
    /**
     * 产品模块批量导入Excel
     * 
     * @param model
     * @return
     */
    @RequiresPermissions("prod:operate")
    @RequestMapping("/relation/import_page")
    public String batchImportLibPage(Model model) {
        List<EnumObject> prodEnums = BaseDataCache.getDataList("PROD_INFO");
        List<EnumObject> verEnums = BaseDataCache.getDataList("PROD_VER");
        model.addAttribute("prodEnums", prodEnums);
        model.addAttribute("verEnums", verEnums);
        return "product/lib/relation/lib_relation_import";
    }
    
    /**
     * 产品模块批量导入Excel
     * 
     * @param model
     * @return
     */
    @RequiresPermissions("prod:operate")
    @RequestMapping("/relation/import")
    @ResponseBody
    public Map<String, Object> batchImportProdModuleLib(@RequestParam("file") MultipartFile file, MntLibRelationExt mntLibRelationExt) {
        Map<String, Object> map = new HashMap<>();
        if (!file.isEmpty()) {
            try {
                //String fileName = file.getOriginalFilename();
                InputStream inputStream = file.getInputStream();
                List<List<String>> excelData = ExcelUtil.readExcelToListBySheetIndex(inputStream, 0);
                
                mntLibRelationExtService.saveLibRelationImportData(excelData, mntLibRelationExt.getProdId(), mntLibRelationExt.getVerCode());
                
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
}
