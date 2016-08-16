package com.ai.mnt.web.product;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ai.mnt.common.cache.BaseDataCache;
import com.ai.mnt.model.common.EnumObject;
import com.ai.mnt.model.product.MntReleaseRec;
import com.ai.mnt.model.product.MntReleaseRecDtl;
import com.ai.mnt.service.product.MntReleaseRecDtlService;
import com.ai.mnt.service.product.MntReleaseRecService;

/**
 * @Title: MntProdControllor 
 * @Description: MntProdControllor
 * @Author: He
 * @Date: 2016-4-14
 */
@Controller
@RequestMapping("/rel")
public class MntReleaseRecController {
    
    @Autowired
    MntReleaseRecService mntReleaseRecService;
    
    @Autowired
    MntReleaseRecDtlService mntReleaseRecDtlService;
    
    /**
     * 产品发布页面
     * @param model
     * @return
     */
    @RequestMapping("/rec/page")
    public String showReleasePage(Model model) {
        List<EnumObject> prodEnums = BaseDataCache.getDataList("PROD_INFO");
        List<EnumObject> verEnums = BaseDataCache.getDataList("PROD_VER");
        model.addAttribute("prodEnums", prodEnums);
        model.addAttribute("verEnums", verEnums);
        return "product/rel/rel_rec";
    }
    
    /**
     * 发布信息查询 
     * @param mntReleaseRec
     * @return
     */
    @RequestMapping("/rec/query")
    @ResponseBody
    public Map<String, Object> queryRelList(@ModelAttribute MntReleaseRec mntReleaseRec) {
        mntReleaseRec.setDeleteFlag("0");
        List<MntReleaseRec> releaseRecList = mntReleaseRecService.findReleaseRecList(mntReleaseRec);
        Map<String, Object> map = new HashMap<>();
        map.put("data", releaseRecList);
        map.put("status", "1");
        return map;
    }
    
    /**
     * 产品发布新增页面
     * @param model
     * @return
     */
    @RequiresPermissions("prod:operate")
    @RequestMapping("/rec/page_add")
    public String showReleaseAddPage(Model model) {
        List<EnumObject> prodEnums = BaseDataCache.getDataList("PROD_INFO");
        List<EnumObject> verEnums = BaseDataCache.getDataList("PROD_VER");
        List<EnumObject> relTypeEnums = BaseDataCache.getDataList("REL_TYPE");
        model.addAttribute("prodEnums", prodEnums);
        model.addAttribute("verEnums", verEnums);
        model.addAttribute("relTypeEnums", relTypeEnums);
        return "product/rel/rel_rec_add";
    }
    
    /**
     * 保存发布信息
     * @param mntReleaseRec
     * @return
     */
    @RequiresPermissions("prod:operate")
    @RequestMapping("/rec/add")
    @ResponseBody
    public Map<String, Object> saveRelRec(MntReleaseRec mntReleaseRec) {
        Map<String, Object> map = new HashMap<>();
        try {
            Thread.sleep(5000);
        } catch (InterruptedException e1) {
            // TODO Auto-generated catch block
            e1.printStackTrace();
        }
        try {
            mntReleaseRecService.saveReleaseRec(mntReleaseRec);
            map.put("status", "1");
        }catch (Exception e) {
            e.printStackTrace();
            map.put("status", "0");
            map.put("msg", "添加失败!" + e.getMessage());
        }
        return map;
    }
    
    /**
     * 产品发布更新页面
     * @param model
     * @return
     */
    @RequiresPermissions("prod:operate")
    @RequestMapping("/rec/page_update/{relId}")
    public String showReleaseUpdatePage(Model model, @PathVariable String relId) {
        MntReleaseRec releaseRec = mntReleaseRecService.findReleaseRecById(Integer.parseInt(relId));
        List<EnumObject> prodEnums = BaseDataCache.getDataList("PROD_INFO");
        List<EnumObject> verEnums = BaseDataCache.getDataList("PROD_VER");
        List<EnumObject> relTypeEnums = BaseDataCache.getDataList("REL_TYPE");
        model.addAttribute("prodEnums", prodEnums);
        model.addAttribute("verEnums", verEnums);
        model.addAttribute("relTypeEnums", relTypeEnums);
        model.addAttribute("releaseRec", releaseRec);
        return "product/rel/rel_rec_update";
    }
    
    /**
     * 更新发布信息
     * @param mntReleaseRec
     * @return
     */
    @RequiresPermissions("prod:operate")
    @RequestMapping("/rec/update")
    @ResponseBody
    public Map<String, Object> updateRelRec(MntReleaseRec mntReleaseRec) {
        
        try {
            Thread.sleep(5000);
        } catch (InterruptedException e1) {
            // TODO Auto-generated catch block
            e1.printStackTrace();
        }
        
        
        mntReleaseRecService.updateReleaseRec(mntReleaseRec);
        Map<String, Object> map = new HashMap<>();
        map.put("status", "1");
        return map;
    }
    
    /**
     * 删除发布信息
     * @param mntReleaseRec
     * @return
     */
    @RequiresPermissions("prod:operate")
    @RequestMapping("/rec/delete/{relIds}")
    @ResponseBody
    public Map<String, Object> deleteRelRecById(@PathVariable String relIds) {
        mntReleaseRecService.deleteReleaseRec(relIds);
        Map<String, Object> map = new HashMap<>();
        map.put("status", "1");
        return map;
    }
    
    /**
     * 产品发布版本明细--弹出
     * @param model
     * @return
     */
    @RequestMapping("/dtl/{relId}/page")
    public String findRelDtlByRelId(@PathVariable String relId, Model model) {
        MntReleaseRecDtl mntReleaseRecDtl = new MntReleaseRecDtl();
        mntReleaseRecDtl.setRelId(Integer.parseInt(relId));
        List<MntReleaseRecDtl> relDtlList = mntReleaseRecDtlService.findRelDtlList(mntReleaseRecDtl);
        String relCode = BaseDataCache.getDataName("REL_CODE", Integer.parseInt(relId));
        model.addAttribute("relCode", relCode);
        model.addAttribute("relDtlList", relDtlList);
        return "product/rel/rel_dtl_list";
    }
    
    /**
     * 产品发布版本明细
     * @param model
     * @return
     */
    @RequestMapping("/dtl/page")
    public String showRelDtlPage(Model model) {
        List<EnumObject> prodEnums = BaseDataCache.getDataList("PROD_INFO");
        List<EnumObject> verEnums = BaseDataCache.getDataList("PROD_VER");
        List<EnumObject> dtlTypeEnums = BaseDataCache.getDataList("REL_DTL_TYPE");
        List<EnumObject> baseIdEnums = BaseDataCache.getDataList("BASE_NAME_ENUM");
        model.addAttribute("baseIdEnums", baseIdEnums);
        model.addAttribute("prodEnums", prodEnums);
        model.addAttribute("verEnums", verEnums);
        model.addAttribute("dtlTypeEnums", dtlTypeEnums);
        return "product/rel/rel_rec_dtl_query";
    }
    
    /**
     * 发布明细信息查询 
     * @param mntReleaseRec
     * @return
     */
    @RequestMapping("/dtl/query")
    @ResponseBody
    public Map<String, Object> queryRelList(@ModelAttribute MntReleaseRecDtl mntReleaseRecDtl, @ModelAttribute MntReleaseRec mntReleaseRec) {
        mntReleaseRecDtl.setMntReleaseRec(mntReleaseRec);
        mntReleaseRecDtl.setDeleteFlag("0");
        List<MntReleaseRecDtl> releaseRecDtlList = mntReleaseRecDtlService.findRecAndDtlJoinList(mntReleaseRecDtl);
        Map<String, Object> map = new HashMap<>();
        map.put("data", releaseRecDtlList);
        map.put("status", "1");
        return map;
    }
    
    /**
     * 产品发布版本明细新增页面
     * @param model
     * @return
     */
    @RequiresPermissions("prod:operate")
    @RequestMapping("/dtl/page_add")
    public String showRelDtlAddPage(Model model) {
        List<EnumObject> prodEnums = BaseDataCache.getDataList("PROD_INFO");
        List<EnumObject> verEnums = BaseDataCache.getDataList("PROD_VER");
        List<EnumObject> dtlTypeEnums = BaseDataCache.getDataList("REL_DTL_TYPE");
        List<EnumObject> baseIdEnums = BaseDataCache.getDataList("BASE_NAME_ENUM");
        List<EnumObject> relCodeEnums = BaseDataCache.getDataList("REL_CODE");
        model.addAttribute("relCodeEnums", relCodeEnums);
        model.addAttribute("prodEnums", prodEnums);
        model.addAttribute("verEnums", verEnums);
        model.addAttribute("dtlTypeEnums", dtlTypeEnums);
        model.addAttribute("baseIdEnums", baseIdEnums);
        return "product/rel/rel_rec_dtl_add";
    }
    
    /**
     * 发布明细信息新增
     * @param mntReleaseRec
     * @return
     */
    @RequiresPermissions("prod:operate")
    @RequestMapping("/dtl/add1")
    @ResponseBody
    public Map<String, Object> saveRelDtl(MntReleaseRecDtl mntReleaseRecDtl) {
        Map<String, Object> map = new HashMap<>();
        try {
            mntReleaseRecDtlService.saveRelDtl(mntReleaseRecDtl);
            map.put("status", "1");
        }catch (Exception e) {
            e.printStackTrace();
            map.put("status", "0");
            map.put("msg", "添加失败!" + e.getMessage());
        }
        return map;
    }
    
    /**
     * 保存发布信息
     * @param mntReleaseRec
     * @return
     */
    @RequiresPermissions("prod:operate")
    @RequestMapping("/dtl/add")
    @ResponseBody
    public Map<String, Object> saveReleaseRecWithBaseIds(HttpServletRequest request, MntReleaseRecDtl mntReleaseRecDtl) {
        Map<String, Object> map = new HashMap<>();
        try {
            String[] baseIds = request.getParameterValues("baseIds");
            mntReleaseRecDtlService.saveReleaseRecWithBaseIds(mntReleaseRecDtl, baseIds);
            map.put("status", "1");
        }catch (Exception e) {
            e.printStackTrace();
            map.put("status", "0");
            map.put("msg", "添加失败!" + e.getMessage());
        }
        return map;
    }
    
    /**
     * 产品发布版本明细更新页面
     * @param model
     * @return
     */
    @RequiresPermissions("prod:operate")
    @RequestMapping("/dtl/page_update/{dtlId}")
    public String showRelDtlUpdatePage(Model model, @PathVariable String dtlId) {
        
        MntReleaseRecDtl mntReleaseRecDtl = new MntReleaseRecDtl();
        mntReleaseRecDtl.setDeleteFlag("0");
        mntReleaseRecDtl.setDtlId(Integer.parseInt(dtlId));
        List<MntReleaseRecDtl> releaseRecDtlList = mntReleaseRecDtlService.findRecAndDtlJoinList(mntReleaseRecDtl);
        
        List<EnumObject> prodEnums = BaseDataCache.getDataList("PROD_INFO");
        List<EnumObject> verEnums = BaseDataCache.getDataList("PROD_VER");
        List<EnumObject> dtlTypeEnums = BaseDataCache.getDataList("REL_DTL_TYPE");
        List<EnumObject> baseIdEnums = BaseDataCache.getDataList("BASE_NAME_ENUM");
        List<EnumObject> relCodeEnums = BaseDataCache.getDataList("REL_CODE");
        model.addAttribute("relCodeEnums", relCodeEnums);
        model.addAttribute("prodEnums", prodEnums);
        model.addAttribute("verEnums", verEnums);
        model.addAttribute("dtlTypeEnums", dtlTypeEnums);
        model.addAttribute("baseIdEnums", baseIdEnums);
        if(releaseRecDtlList != null && releaseRecDtlList.size() > 0) {
            model.addAttribute("releaseRecDtl", releaseRecDtlList.get(0));
        }
        return "product/rel/rel_rec_dtl_update";
    }
    
    /**
     * 发布明细信息更新
     * @param mntReleaseRec
     * @return
     */
    @RequiresPermissions("prod:operate")
    @RequestMapping("/dtl/update")
    @ResponseBody
    public Map<String, Object> updateRelDtl(MntReleaseRecDtl mntReleaseRecDtl) {
        mntReleaseRecDtlService.updateRelDtlById(mntReleaseRecDtl);
        Map<String, Object> map = new HashMap<>();
        map.put("status", "1");
        return map;
    }
    
    /**
     * 发布明细信息删除
     * @param mntReleaseRec
     * @return
     */
    @RequiresPermissions("prod:operate")
    @RequestMapping("/dtl/delete/{dtlIds}")
    @ResponseBody
    public Map<String, Object> deleteRelDtlByDtlIds(@PathVariable String dtlIds) {
        mntReleaseRecDtlService.deleteRelDtlByIds(dtlIds);
        Map<String, Object> map = new HashMap<>();
        map.put("status", "1");
        return map;
    }
    
    /**
     * 产品发布版本详细信息
     * @param model
     * @return
     */
    @RequestMapping("/dtl/content/{dtlId}/page")
    public String showRelDtlContent(Model model, @PathVariable String dtlId) {
        
        MntReleaseRecDtl mntReleaseRecDtl = new MntReleaseRecDtl();
        mntReleaseRecDtl.setDtlId(Integer.parseInt(dtlId));
        List<MntReleaseRecDtl> releaseRecDtlList = mntReleaseRecDtlService.findRecAndDtlJoinList(mntReleaseRecDtl);
        //只有一条数据
        if(releaseRecDtlList != null && releaseRecDtlList.size() > 0) {
            model.addAttribute("releaseRecDtl", releaseRecDtlList.get(0));
        }
        return "product/rel/rel_rec_dtl_content";
    }
}
