package com.ai.mnt.web.product;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
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
import com.ai.mnt.common.shiro.UserRealm;
import com.ai.mnt.common.util.ExcelUtil;
import com.ai.mnt.common.util.MntConstant;
import com.ai.mnt.model.common.EnumObject;
import com.ai.mnt.model.product.MntModuleProcRelation;
import com.ai.mnt.model.product.MntProdModule;
import com.ai.mnt.model.product.MntProdProc;
import com.ai.mnt.service.product.MntProdModuleService;
import com.ai.mnt.service.product.MntProdProcService;

/**
 * @Title: MntProdControllor
 * @Description: MntProdControllor
 * @Author: He
 * @Date: 2016-4-14
 */
@Controller
@RequestMapping("/prod")
public class MntProdModuleController {

    @Autowired
    MntProdModuleService mntProdModuleService;

    @Autowired
    MntProdProcService mntProdProcService;

    @Autowired
    UserRealm userRealm;
    
    private Logger logger = Logger.getLogger(MntProdModuleController.class);

    /**
     * 产品模块页面
     * 
     * @param model
     * @return
     */
    @RequestMapping("/module/page")
    public String showModulePage(Model model) {

        List<EnumObject> prodEnums = BaseDataCache.getDataList("PROD_INFO");
        List<EnumObject> verEnums = BaseDataCache.getDataList("PROD_VER");
        List<EnumObject> isUsedEnums = BaseDataCache
                .getDataList("MODULE_IS_USED");
        model.addAttribute("prodEnums", prodEnums);
        model.addAttribute("verEnums", verEnums);
        model.addAttribute("isUsedEnums", isUsedEnums);
        return "product/module/prod_module";
    }

    /**
     * 产品模块查询
     * 
     * @param model
     * @return
     */
    @RequestMapping("/module/query")
    @ResponseBody
    public Map<String, Object> queryModuleList(MntProdModule mntProdModule) {
        mntProdModule.setDeleteFlag("0");
        List<MntProdModule> mntProdModuleList = mntProdModuleService
                .findProdModuleList(mntProdModule);
        Map<String, Object> map = new HashMap<>();
        map.put("data", mntProdModuleList);
        map.put("status", "1");
        return map;
    }

    /**
     * 产品模块页面
     * 
     * @param model
     * @return
     */
    @RequiresPermissions("prod:operate")
    @RequestMapping("/module/page_add")
    public String showModuleAddPage(Model model) {

        List<EnumObject> prodEnums = BaseDataCache.getDataList("PROD_INFO");
        List<EnumObject> verEnums = BaseDataCache.getDataList("PROD_VER");
        List<EnumObject> isUsedEnums = BaseDataCache
                .getDataList("MODULE_IS_USED");
        List<EnumObject> outPutEnums = BaseDataCache
                .getDataList("MODULE_OUTPUT_TYPE");
        model.addAttribute("prodEnums", prodEnums);
        model.addAttribute("verEnums", verEnums);
        model.addAttribute("isUsedEnums", isUsedEnums);
        model.addAttribute("outPutEnums", outPutEnums);

        return "product/module/prod_module_add";
    }

    /**
     * 产品模块添加
     * 
     * @param model
     * @return
     */
    @RequiresPermissions("prod:operate")
    @RequestMapping("/module/add")
    @ResponseBody
    public Map<String, Object> saveModule(MntProdModule mntProdModule) {
        mntProdModuleService.saveMntProdModule(mntProdModule);
        Map<String, Object> map = new HashMap<>();
        map.put("status", "1");
        return map;
    }

    /**
     * 产品模块更新页面
     * 
     * @param model
     * @return
     */
    @RequiresPermissions("prod:operate")
    @RequestMapping("/module/page_update/{moduleId}")
    public String showModuleUpdatePage(Model model,
            @PathVariable String moduleId) {

        MntProdModule prodModule = mntProdModuleService
                .findProdModuleById(Integer.parseInt(moduleId));

        List<EnumObject> prodEnums = BaseDataCache.getDataList("PROD_INFO");
        List<EnumObject> isUsedEnums = BaseDataCache
                .getDataList("MODULE_IS_USED");
        List<EnumObject> outPutEnums = BaseDataCache
                .getDataList("MODULE_OUTPUT_TYPE");
        model.addAttribute("prodEnums", prodEnums);
        model.addAttribute("isUsedEnums", isUsedEnums);
        model.addAttribute("outPutEnums", outPutEnums);
        model.addAttribute("prodModule", prodModule);

        return "product/module/prod_module_update";
    }

    /**
     * 产品模块更新
     * 
     * @param model
     * @return
     */
    @RequiresPermissions("prod:operate")
    @RequestMapping("/module/update")
    @ResponseBody
    public Map<String, Object> updateProdModule(MntProdModule mntProdModule) {

        mntProdModuleService.updateMntProdById(mntProdModule);
        Map<String, Object> map = new HashMap<>();
        map.put("status", "1");
        return map;
    }

    /**
     * 产品模块删除
     * 
     * @param model
     * @return
     */
    @RequiresPermissions("prod:operate")
    @RequestMapping("/module/delete/{moduleIds}")
    @ResponseBody
    public Map<String, Object> deleteProdModule(@PathVariable String moduleIds) {
        mntProdModuleService.deleteMntProdByIds(moduleIds);
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
    @RequestMapping("/module/page_import")
    public String batchImportProdModulePage(Model model) {
        List<EnumObject> prodEnums = BaseDataCache.getDataList("PROD_INFO");
        List<EnumObject> verEnums = BaseDataCache.getDataList("PROD_VER");
        model.addAttribute("prodEnums", prodEnums);
        model.addAttribute("verEnums", verEnums);
        return "product/module/prod_module_import";
    }

    /**
     * 产品模块批量导入Excel
     * 
     * @param model
     * @return
     */
    @RequiresPermissions("prod:operate")
    @RequestMapping("/module/import")
    @ResponseBody
    public Map<String, Object> batchImportProdModule(@RequestParam("file") MultipartFile file, MntProdModule mntProdModule) {
        Map<String, Object> map = new HashMap<>();
        if (!file.isEmpty()) {
            try {
                //String fileName = file.getOriginalFilename();
                InputStream inputStream = file.getInputStream();
                List<List<String>> excelData = ExcelUtil.readExcelToListBySheetIndex(inputStream, 0);
                
                mntProdModuleService.saveModuleImportData(excelData, mntProdModule.getProdId(), mntProdModule.getVerCode());
                
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
     * 进程页面
     * 
     * @param model
     * @return
     */
    @RequestMapping("/module/proc/page")
    public String showProcPage(Model model) {

        List<EnumObject> prodEnums = BaseDataCache.getDataList("PROD_INFO");
        List<EnumObject> verEnums = BaseDataCache.getDataList("PROD_VER");
        model.addAttribute("prodEnums", prodEnums);
        model.addAttribute("verEnums", verEnums);

        return "product/module/prod_module_proc";
    }

    /**
     * 产品模块进程查询
     * 
     * @param model
     * @return
     */
    @RequestMapping("/module/proc/query")
    @ResponseBody
    public Map<String, Object> queryProcList(MntProdProc mntProdProc,
            MntProdModule mntProdModule) {
        mntProdProc.setDeleteFlag("0");
        mntProdProc.setMntProdModule(mntProdModule);
        List<MntProdProc> mntProdProcList = mntProdProcService.findModuleAndProcJoinList(mntProdProc);
        Map<String, Object> map = new HashMap<>();
        map.put("data", mntProdProcList);
        map.put("status", "1");
        return map;
    }

    /**
     * 进程新增页面
     * 
     * @param model
     * @return
     */
    @RequiresPermissions("prod:operate")
    @RequestMapping("/module/proc/page_add")
    public String showProcAddPage(Model model) {
        List<EnumObject> prodEnums = BaseDataCache.getDataList("PROD_INFO");
        model.addAttribute("prodEnums", prodEnums);
        return "product/module/prod_module_proc_add";
    }

    /**
     * 保存进程信息
     * 
     * @param mntReleaseRec
     * @return
     */
    @RequiresPermissions("prod:operate")
    @RequestMapping("/module/proc/add")
    @ResponseBody
    public Map<String, Object> saveModuleProcWithModuleIds(
            HttpServletRequest request, MntProdProc mntProdProc) {
        String[] moduleIds = request.getParameterValues("moduleId");
        mntProdProcService.saveModuleProcWithModuleIds(mntProdProc, moduleIds);
        Map<String, Object> map = new HashMap<>();
        map.put("status", "1");
        return map;
    }

    /**
     * 进程更新页面
     * 
     * @param model
     * @return
     */
    @RequiresPermissions("prod:operate")
    @RequestMapping("/module/proc/page_update/{procId}")
    public String showProcUpdatePage(Model model, @PathVariable String procId) {
        MntProdProc mntProdProc = new MntProdProc();
        mntProdProc.setProcId(Integer.parseInt(procId));
        List<MntProdProc> mntProdProcList = mntProdProcService
                .findModuleAndProcJoinList(mntProdProc);
        List<EnumObject> prodEnums = BaseDataCache.getDataList("PROD_INFO");
        model.addAttribute("prodEnums", prodEnums);
        if (mntProdProcList != null && mntProdProcList.size() > 0) { // 只会有一条数据
            model.addAttribute("mntProdProc", mntProdProcList.get(0));
        }
        return "product/module/prod_module_proc_update";
    }

    /**
     * 更新进程信息
     * 
     * @param mntReleaseRec
     * @return
     */
    @RequiresPermissions("prod:operate")
    @RequestMapping("/module/proc/update")
    @ResponseBody
    public Map<String, Object> updateModuleProc(HttpServletRequest request,
            MntProdProc mntProdProc) {
        String[] moduleIds = request.getParameterValues("moduleId");
        mntProdProcService.updateModuleProcWithModuleIds(mntProdProc, moduleIds);
        Map<String, Object> map = new HashMap<>();
        map.put("status", "1");
        return map;
    }

    /**
     * 获取进程所属的模块
     * 
     * @param mntReleaseRec
     * @return
     */
    @RequestMapping("/module/proc/relation/{procId}")
    @ResponseBody
    public List<MntModuleProcRelation> getModuleProcRelationListByProcId(
            @PathVariable String procId) {
        MntModuleProcRelation moduleProcRelation = new MntModuleProcRelation();
        moduleProcRelation.setProcId(Integer.parseInt(procId));
        List<MntModuleProcRelation> moduleProcRelationList = mntProdProcService.getModuleProcRelationList(moduleProcRelation);
        return moduleProcRelationList;
    }

    /**
     * 进程删除
     * 
     * @param mntReleaseRec
     * @return
     */
    @RequiresPermissions("prod:operate")
    @RequestMapping("/module/proc/delete/{procIds}")
    @ResponseBody
    public Map<String, Object> deleteRelDtlByDtlIds(@PathVariable String procIds) {
        mntProdProcService.deleteMntProdProcByIds(procIds);
        Map<String, Object> map = new HashMap<>();
        map.put("status", "1");
        return map;
    }

    /**
     * 根据模块获取对应的进程列表
     * 
     * @param model
     * @return
     */
    @RequestMapping("/module/procList/{moduleId}/page")
    public String findProcListByModuleId(Model model,
            @PathVariable String moduleId) {
        MntProdModule prodModule = mntProdModuleService
                .findProdModuleById(Integer.parseInt(moduleId));
        List<MntProdProc> mntProdProcList = mntProdProcService.findProdProcListByModuleId(Integer.parseInt(moduleId));
        model.addAttribute("prodModule", prodModule);
        model.addAttribute("mntProdProcList", mntProdProcList);
        return "product/module/prod_module_proc_list";
    }

    /**
     * 模块详细信息
     * 
     * @param model
     * @return
     */
    @RequestMapping("/module/{moduleId}/page")
    public String queryModuleContentByProcId(Model model,
            @PathVariable String moduleId) {
        MntProdModule mntProdProc = new MntProdModule();
        mntProdProc.setModuleId(Integer.parseInt(moduleId));
        List<MntProdModule> mntProdModuleList = mntProdModuleService.findProdModuleList(mntProdProc);
        if (mntProdModuleList != null && mntProdModuleList.size() > 0) { // 只会有一条数据
            model.addAttribute("prodModule", mntProdModuleList.get(0));
        }
        return "product/module/prod_module_content";
    }

    /**
     * 进程信息
     * 
     * @param model
     * @return
     */
    @RequestMapping("/module/proc/{procId}/page")
    public String queryProcContentByProcId(Model model,
            @PathVariable String procId) {
        MntProdProc mntProdProc = new MntProdProc();
        mntProdProc.setProcId(Integer.parseInt(procId));
        List<MntProdProc> mntProdProcList = mntProdProcService.findModuleAndProcJoinList(mntProdProc);
        if (mntProdProcList != null && mntProdProcList.size() > 0) { // 只会有一条数据
            model.addAttribute("mntProdProc", mntProdProcList.get(0));
        }
        return "product/module/prod_module_proc_content";
    }

    /**
     * 产品模块批量导入Excel模板下载
     * 
     * @param model
     * @return
     */
    @RequiresPermissions("prod:operate")
    @RequestMapping("/module/down/{filename}")
    public void downLoadModuleTemplete(@PathVariable String filename,
            HttpSession session, HttpServletResponse response) {
        try {
            filename = filename + ".xls";
            String filePath = MntConstant.TEMPLETE_PATH  + "product/" + filename;
            String abPath = session.getServletContext().getRealPath(filePath);
            File file = new File(abPath);
            InputStream fis = new BufferedInputStream(new FileInputStream(file));
            response.reset();
            response.addHeader("Content-Disposition", "attachment;filename=" + new String(filename.getBytes(), "iso-8859-1"));
            response.addHeader("Content-Length", "" + file.length());
            OutputStream toClient = new BufferedOutputStream(response.getOutputStream());
            response.setContentType("application/octet-stream");
            byte[] buffer = new byte[1024 * 1024 * 8];
            int i = -1;
            while ((i = fis.read(buffer)) != -1) {
                toClient.write(buffer, 0, i);
            }
            fis.close();
            toClient.flush();
            toClient.close();
        } catch (Exception e) {
            e.printStackTrace();
            logger.error("下载失败！" + e.getMessage());
        }
    }
}
