package com.ai.mnt.web.inst;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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
import com.ai.mnt.model.inst.MntProdRelPlan;
import com.ai.mnt.service.inst.MntProdRelPlanService;

/**
 * @Title: MntProdRelPlanController 
 * @Description: MntProdRelPlanController ControllerPackage
 * @Author: Auto Generate.
 * @Date: 2016-7-25
 */

@Controller
@RequestMapping("/rel")
public class MntProdRelPlanController {

    @Autowired
    MntProdRelPlanService mntProdRelPlanService;
    
    /**
     * 发布计划界面跳转
     * @param  model
     * @return String
     */
    @RequestMapping("/plan/page")
    public String showMntProdRelPlanPage(Model model) {
        List<EnumObject> prodEnums = BaseDataCache.getDataList("PROD_INFO");
        List<EnumObject> verEnums = BaseDataCache.getDataList("PROD_VER");
        List<EnumObject> baseIdEnums = BaseDataCache.getDataList("BASE_NAME_ENUM");
        model.addAttribute("prodEnums", prodEnums);
        model.addAttribute("verEnums", verEnums);
        model.addAttribute("baseIdEnums", baseIdEnums);
        return "inst/plan/rel_plan_query";
    }
    
    /**
     * 获取发布计划列表
     * @param mntProdRelPlan
     * @return Map<String, Object>
     */
    @RequestMapping("/plan/query")
    @ResponseBody
    public Map<String, Object> getMntProdRelPlanList(MntProdRelPlan mntProdRelPlan) {
        mntProdRelPlan.setDeleteFlag("0");
        List<MntProdRelPlan> mntProdRelPlanList = mntProdRelPlanService.findMntProdRelPlanList(mntProdRelPlan);
        Map<String, Object> map = new HashMap<>();
        map.put("data", mntProdRelPlanList);
        map.put("status", "1");
        return map;
    }
    
    /**
     * 发布计划新增界面跳转
     * @param  model
     * @return String
     */
    @RequestMapping("/plan/add_page")
    public String showMntProdRelPlanAddPage(Model model) {
        List<EnumObject> prodEnums = BaseDataCache.getDataList("PROD_INFO");
        List<EnumObject> baseIdEnums = BaseDataCache.getDataList("BASE_NAME_ENUM");
        model.addAttribute("prodEnums", prodEnums);
        model.addAttribute("baseIdEnums", baseIdEnums);
        return "inst/plan/rel_plan_add";
    }
    
    /**
     * 发布计划保存
     * @param mntProdRelPlan
     * @return Map<String, Object>
     */
    @RequestMapping("/plan/add")
    @ResponseBody
    public Map<String, Object> saveMntProdRelPlan(MntProdRelPlan mntProdRelPlan) {
        mntProdRelPlanService.saveMntProdRelPlan(mntProdRelPlan);
        Map<String, Object> map = new HashMap<>();
        map.put("status", "1");
        return map;
    }
    
    /**
     * 发布计划更新界面跳转
     * @param  model
     * @param  id
     * @return
     */
    @RequestMapping("/plan/update_page/{id}")
    public String showMntProdRelPlanUpdatePage(Model model, @PathVariable String id) {
        MntProdRelPlan mntProdRelPlan = mntProdRelPlanService.findMntProdRelPlanById(Integer.parseInt(id));
        model.addAttribute("mntProdRelPlan", mntProdRelPlan);
        
        List<EnumObject> prodEnums = BaseDataCache.getDataList("PROD_INFO");
        List<EnumObject> baseIdEnums = BaseDataCache.getDataList("BASE_NAME_ENUM");
        model.addAttribute("prodEnums", prodEnums);
        model.addAttribute("baseIdEnums", baseIdEnums);
        
        return "inst/plan/rel_plan_update";
    }
    
    /**
     * 发布计划根据主键更新
     * @param mntProdRelPlan
     * @return
     */
    @RequestMapping("/plan/update")
    @ResponseBody
    public Map<String, Object> updateMntProdRelPlan(MntProdRelPlan mntProdRelPlan) {
        mntProdRelPlanService.updateMntProdRelPlanById(mntProdRelPlan);
        Map<String, Object> map = new HashMap<>();
        map.put("status", "1");
        return map;
    }
    
    /**
     * 发布计划根据主键批量删除
     * @param ids
     * @return Map<String, Object>
     */
    @RequestMapping("/plan/delete/{ids}")
    @ResponseBody
    public Map<String, Object> deleteMntProdRelPlanByIds(@PathVariable String ids) {
        mntProdRelPlanService.deleteMntProdRelPlanByIds(ids);
        Map<String, Object> map = new HashMap<>();
        map.put("status", "1");
        return map;
    }
    
    /**
     * 根据主键查询发布计划详细信息
     * @param model
     * @return
     */
    @RequestMapping("/plan/{id}/page")
    public String queryMntProdRelPlanById(Model model, @PathVariable String id) {
        MntProdRelPlan mntProdRelPlan = new MntProdRelPlan();
        mntProdRelPlan.setId(Integer.parseInt(id));
        List<MntProdRelPlan> mntProdRelPlanList = mntProdRelPlanService.findMntProdRelPlanList(mntProdRelPlan);
        if(mntProdRelPlanList != null && mntProdRelPlanList.size() > 0) { //只会有一条数据
            model.addAttribute("mntProdRelPlan", mntProdRelPlanList.get(0));
        }
        return "inst/plan/rel_plan_info";
    }
    
    /**
     * 发布计划导入页面
     * 
     * @param model
     * @return
     */
    @RequestMapping("/plan/import_page")
    public String batchImportLibPage(Model model) {
        return "inst/plan/rel_plan_import";
    }
    
    /**
     *  发布计划批量导入Excel
     * 
     * @param model
     * @return
     */
    @RequestMapping("/plan/import")
    @ResponseBody
    public Map<String, Object> batchImportRelPlan(@RequestParam("file") MultipartFile file) {
        Map<String, Object> map = new HashMap<>();
        if (!file.isEmpty()) {
            try {
                //String fileName = file.getOriginalFilename();
                InputStream inputStream = file.getInputStream();
                List<List<String>> excelData = ExcelUtil.readExcelToListBySheetIndex(inputStream, 0);
                
                mntProdRelPlanService.batchImportRelPlan(excelData);
                
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
     * daochu发布计划列表
     * @param mntProdRelPlan
     * @throws IOException 
     * @throws FileNotFoundException 
     */
    @RequestMapping("/plan/output")
    @ResponseBody
    public void outputMntProdRelPlanList(MntProdRelPlan mntProdRelPlan) throws FileNotFoundException, IOException {
        mntProdRelPlan.setDeleteFlag("0");
        List<MntProdRelPlan> mntProdRelPlanList = mntProdRelPlanService.findMntProdRelPlanList(mntProdRelPlan);
        System.out.println(mntProdRelPlanList);
        
        String[] sheetName={"发布计划（开发）"};
        String[] title1={"安装点（省份）","计划发布时间","所属产品","产品版本","发布模块","需求（故障）编号","需求（故障）名称","备注"};
        List<String[]> titles=new ArrayList<String[]>();
        titles.add(title1);
        List<String[]> data=new ArrayList<String[]>();
        for (MntProdRelPlan mPlan : mntProdRelPlanList) {
            String strDate = new SimpleDateFormat("yyyy-MM-dd").format(mPlan.getPlanDate()); 
            String remark ;
            if (mPlan.getRemark() == null) {
                remark = "";
            } else {
                remark = mPlan.getRemark();
            }
            String [] data1 = {mPlan.getBaseName(),strDate,mPlan.getProdName(),mPlan.getVerCode(),mPlan.getModuleName(),
                    mPlan.getReqNo(),mPlan.getReqName(),remark};
            data.add(data1);
        }
        
        List<List<String[]>> data_=new ArrayList<List<String[]>>();
        data_.add(data);
        
        ExcelUtil.writeToFile("D:\\发布计划导出表.xls", sheetName, titles, data_);
    }
    
    
    
}
