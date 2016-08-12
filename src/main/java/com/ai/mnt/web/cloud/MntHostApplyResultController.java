package com.ai.mnt.web.cloud;

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

import com.ai.mnt.common.util.ExcelUtil;
import com.ai.mnt.model.cloud.MntHostApplyResult;
import com.ai.mnt.service.cloud.MntHostApplyResultService;

/**
 * @Title: MntHostApplyResultController 
 * @Description: MntHostApplyResultController ControllerPackage
 * @Author: Auto Generate.
 * @Date: 2016-8-11
 */

@Controller
@RequestMapping("/cloud")
public class MntHostApplyResultController {

    @Autowired
    MntHostApplyResultService mntHostApplyResultService;
    
    /**
     * 云主机申请结果界面跳转
     * @param  model
     * @return String
     */
    @RequestMapping("/host/page")
    public String showMntHostApplyResultPage(Model model) {
        return "cloud/host/cloud_host_query";
    }
    
    /**
     * 获取云主机申请结果列表
     * @param mntHostApplyResult
     * @return Map<String, Object>
     */
    @RequestMapping("/host/query")
    @ResponseBody
    public Map<String, Object> getMntHostApplyResultList(MntHostApplyResult mntHostApplyResult) {
        List<MntHostApplyResult> mntHostApplyResultList = mntHostApplyResultService.findMntHostApplyResultList(mntHostApplyResult);
        Map<String, Object> map = new HashMap<>();
        map.put("data", mntHostApplyResultList);
        map.put("status", "1");
        return map;
    }
    
    /**
     * 云主机申请结果新增界面跳转
     * @param  model
     * @return String
     */
    @RequestMapping("/host/add_page")
    public String showMntHostApplyResultAddPage(Model model) {
        return "cloud/host/cloud_host_add";
    }
    
    /**
     * 云主机申请结果保存
     * @param mntHostApplyResult
     * @return Map<String, Object>
     */
    @RequestMapping("/host/add")
    @ResponseBody
    public Map<String, Object> saveMntHostApplyResult(MntHostApplyResult mntHostApplyResult) {
        mntHostApplyResultService.saveMntHostApplyResult(mntHostApplyResult);
        Map<String, Object> map = new HashMap<>();
        map.put("status", "1");
        return map;
    }
    
    /**
     * 云主机申请结果更新界面跳转
     * @param  model
     * @param  id
     * @return
     */
    @RequestMapping("/host/update_page/{id}")
    public String showMntHostApplyResultUpdatePage(Model model, @PathVariable String id) {
        MntHostApplyResult mntHostApplyResult = mntHostApplyResultService.findMntHostApplyResultById(Integer.parseInt(id));
        model.addAttribute("mntHostApplyResult", mntHostApplyResult);
        return "cloud/host/cloud_host_update";
    }
    
    /**
     * 云主机申请结果根据主键更新
     * @param mntHostApplyResult
     * @return
     */
    @RequestMapping("/host/update")
    @ResponseBody
    public Map<String, Object> updateMntHostApplyResult(MntHostApplyResult mntHostApplyResult) {
        mntHostApplyResultService.updateMntHostApplyResultById(mntHostApplyResult);
        Map<String, Object> map = new HashMap<>();
        map.put("status", "1");
        return map;
    }
    
    /**
     * 云主机申请结果根据主键批量删除
     * @param ids
     * @return Map<String, Object>
     */
    @RequestMapping("/host/delete/{ids}")
    @ResponseBody
    public Map<String, Object> deleteMntHostApplyResultByIds(@PathVariable String ids) {
        mntHostApplyResultService.deleteMntHostApplyResultByIds(ids);
        Map<String, Object> map = new HashMap<>();
        map.put("status", "1");
        return map;
    }
    
    /**
     * 根据主键查询云主机申请结果详细信息
     * @param model
     * @return
     */
    @RequestMapping("/host/{id}/page")
    public String queryMntHostApplyResultById(Model model, @PathVariable String id) {
        MntHostApplyResult mntHostApplyResult = new MntHostApplyResult();
        mntHostApplyResult.setId(Integer.parseInt(id));
        List<MntHostApplyResult> mntHostApplyResultList = mntHostApplyResultService.findMntHostApplyResultList(mntHostApplyResult);
        if(mntHostApplyResultList != null && mntHostApplyResultList.size() > 0) { //只会有一条数据
            model.addAttribute("mntHostApplyResult", mntHostApplyResultList.get(0));
        }
        return "cloud/host/cloud_host_info";
    }
    
    /**
     * 云主机信息导入页面
     * 
     * @param model
     * @return
     */
    @RequestMapping("/host/import_page")
    public String batchImportHost(Model model) {
        return "cloud/host/cloud_host_import";
    }
    
    /**
     * 云主机批量导入Excel
     * 
     * @param model
     * @return
     */
    @RequestMapping("/host/import")
    @ResponseBody
    public Map<String, Object> importHostData(@RequestParam("file") MultipartFile file) {
        Map<String, Object> map = new HashMap<>();
        if (!file.isEmpty()) {
            try {
                //String fileName = file.getOriginalFilename();
                InputStream inputStream = file.getInputStream();
                List<List<String>> excelData = ExcelUtil.readExcelToListBySheetIndex(inputStream, "申请结果");
                
                mntHostApplyResultService.importHostData(excelData);
                
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
