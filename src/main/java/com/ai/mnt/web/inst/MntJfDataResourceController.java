package com.ai.mnt.web.inst;

import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.ai.mnt.model.inst.MntJfDataResource;
import com.ai.mnt.service.inst.MntJfDataResourceService;

/**
 * @Title: MntJfDataResourceController 
 * @Description: MntJfDataResourceController ControllerPackage
 * @Author: Auto Generate.
 * @Date: 2016-10-13
 */

@Controller
@RequestMapping("/inst")
public class MntJfDataResourceController {

    @Autowired
    MntJfDataResourceService mntJfDataResourceService;
    
    /**
     * 计费数据源界面跳转
     * @param  model
     * @return String
     */
    @RequestMapping("/jf_ds/page")
    public String showMntJfDataResourcePage(Model model) {
        return "inst/jf_ds/inst_jf_ds_query";
    }
    
    /**
     * 获取计费数据源列表
     * @param mntJfDataResource
     * @return Map<String, Object>
     */
    @RequestMapping("/jf_ds/query")
    @ResponseBody
    public Map<String, Object> getMntJfDataResourceList(MntJfDataResource mntJfDataResource) {
        mntJfDataResource.setDeleteFlag("0");
        List<MntJfDataResource> mntJfDataResourceList = mntJfDataResourceService.findMntJfDataResourceList(mntJfDataResource);
        Map<String, Object> map = new HashMap<>();
        map.put("data", mntJfDataResourceList);
        map.put("status", "1");
        return map;
    }
    
    /**
     * 计费数据源新增界面跳转
     * @param  model
     * @return String
     */
    @RequestMapping("/jf_ds/add_page")
    public String showMntJfDataResourceAddPage(Model model) {
        List<EnumObject> isFaultEnums = BaseDataCache.getDataList("IS_FAULT");
        model.addAttribute("isFaultEnums", isFaultEnums);
        return "inst/jf_ds/inst_jf_ds_add";
    }
    
    /**
     * 计费数据源保存
     * @param mntJfDataResource
     * @return Map<String, Object>
     */
    @RequestMapping("/jf_ds/add")
    @ResponseBody
    public Map<String, Object> saveMntJfDataResource(MntJfDataResource mntJfDataResource) {
        mntJfDataResourceService.saveMntJfDataResource(mntJfDataResource);
        Map<String, Object> map = new HashMap<>();
        map.put("status", "1");
        return map;
    }
    
    /**
     * 计费数据源更新界面跳转
     * @param  model
     * @param  id
     * @return
     */
    @RequestMapping("/jf_ds/update_page/{id}")
    public String showMntJfDataResourceUpdatePage(Model model, @PathVariable String id) {
        MntJfDataResource mntJfDataResource = mntJfDataResourceService.findMntJfDataResourceById(Integer.parseInt(id));
        List<EnumObject> isFaultEnums = BaseDataCache.getDataList("IS_FAULT");
        model.addAttribute("isFaultEnums", isFaultEnums);
        model.addAttribute("mntJfDataResource", mntJfDataResource);
        return "inst/jf_ds/inst_jf_ds_update";
    }
    
    /**
     * 计费数据源根据主键更新
     * @param mntJfDataResource
     * @return
     */
    @RequestMapping("/jf_ds/update")
    @ResponseBody
    public Map<String, Object> updateMntJfDataResource(MntJfDataResource mntJfDataResource) {
        mntJfDataResourceService.updateMntJfDataResourceById(mntJfDataResource);
        Map<String, Object> map = new HashMap<>();
        map.put("status", "1");
        return map;
    }
    
    /**
     * 计费数据源根据主键批量删除
     * @param ids
     * @return Map<String, Object>
     */
    @RequestMapping("/jf_ds/delete/{ids}")
    @ResponseBody
    public Map<String, Object> deleteMntJfDataResourceByIds(@PathVariable String ids) {
        mntJfDataResourceService.deleteMntJfDataResourceByIds(ids);
        Map<String, Object> map = new HashMap<>();
        map.put("status", "1");
        return map;
    }
    
    /**
     * 根据主键查询计费数据源详细信息
     * @param model
     * @return
     */
    @RequestMapping("/jf_ds/{id}/page")
    public String queryMntJfDataResourceById(Model model, @PathVariable String id) {
        MntJfDataResource mntJfDataResource = new MntJfDataResource();
        mntJfDataResource.setId(Integer.parseInt(id));
        List<MntJfDataResource> mntJfDataResourceList = mntJfDataResourceService.findMntJfDataResourceList(mntJfDataResource);
        if(mntJfDataResourceList != null && mntJfDataResourceList.size() > 0) { //只会有一条数据
            model.addAttribute("mntJfDataResource", mntJfDataResourceList.get(0));
        }
        return "inst/jf_ds/inst_jf_ds_info";
    }
    
    /**
     * 上线反馈导入页面
     * 
     * @param model
     * @return
     */
    @RequestMapping("/jf_ds/import_page")
    public String batchImportJfDsPage(Model model) {
        List<EnumObject> baseIdEnums = BaseDataCache.getDataList("BASE_NAME_ENUM");
        model.addAttribute("baseIdEnums", baseIdEnums);
        return "inst/jf_ds/inst_js_ds_import";
    }
    
    /**
     * 产品模块批量导入Excel
     * 
     * @param model
     * @return
     */
    @RequestMapping("/jf_ds/import")
    @ResponseBody
    public Map<String, Object> importOnlineData(@RequestParam("file") MultipartFile file, MntJfDataResource mntJfDataResource) {
        Map<String, Object> map = new HashMap<>();
        if (!file.isEmpty()) {
            try {
                //String fileName = file.getOriginalFilename();
                InputStream inputStream = file.getInputStream();
                List<List<String>> excelData = ExcelUtil.readExcelToListBySheetIndex(inputStream, 0);
                
                mntJfDataResourceService.importJfDsData(excelData, mntJfDataResource.getBaseId());
                
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
