package com.ai.mnt.web.product;

import java.util.Date;
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
import com.ai.mnt.model.product.MntProd;
import com.ai.mnt.model.product.MntProdVersion;
import com.ai.mnt.service.product.MntProdService;
import com.ai.mnt.service.product.MntProdVerService;

/**
 * @Title: MntProdControllor 
 * @Description: MntProdControllor
 * @Author: He
 * @Date: 2016-4-16
 */
@Controller
@RequestMapping("/prod")
public class MntProdController {
    
    @Autowired
    MntProdService mntProdService;
    
    @Autowired
    MntProdVerService mntProdVerService;
    
    /**
     * 产品信息页面
     * @param model
     * @return
     */
    @RequiresPermissions("prod:query")
    @RequestMapping("/info/page")
    public String showProdPage(Model model) {
        return "product/info/prod_info";
    }
    
    @RequiresPermissions("prod:add")
    @RequestMapping("/info/page_add")
    public String showProdAdd(Model model) {
        return "product/info/prod_add";
    }
    
    @RequiresPermissions("prod:add")
    @RequestMapping("/info/add")
    @ResponseBody
    public Map<String, String> addProd(MntProd mntProd) {
        mntProdService.saveMntProd(mntProd);
        Map<String, String> map = new HashMap<>();
        map.put("status", "1");
        return map;
    }
    
    /**
     * 获取有效的产品列表
     * @param model
     * @return
     */
    @RequestMapping("/info/query")
    @ResponseBody
    public Map<Object, Object> findAllProdList() {
        MntProd mntProd = new MntProd();
        mntProd.setDeleteFlag("0");
        List<MntProd> mntProds = mntProdService.findMntProdList(mntProd);
        Map<Object, Object> map = new HashMap<>();
        map.put("data", mntProds);
        return map;
    }
    
    /**
     * 获取产品版本列表刷新表格
     * @param pid
     * @return
     */
    @RequiresPermissions("prod:query")
    @RequestMapping("/ver/query/{pid}")
    @ResponseBody
    public Map<Object, Object> findProdVerListByPid(@PathVariable String pid) {
        Integer iPid = Integer.parseInt(pid);
        if("-1".equals(pid)) {
            iPid = null;
        }
        List<MntProdVersion> list = mntProdVerService.findProdVerListByPid(iPid);
        Map<Object, Object> map = new HashMap<>();
        map.put("data", list);
        return map;
    }
    
    /**
     * 产品修改页面
     * @param model
     * @param pid
     * @return
     */
    @RequiresPermissions("prod:operate")
    @RequestMapping("/info/page_update/{pid}")
    public String showProdModi(Model model, @PathVariable String pid) {
        Integer iPid = Integer.parseInt(pid);
        MntProd mntProd = mntProdService.findMntProdById(iPid);
        model.addAttribute("mntProd", mntProd);
        return "product/info/prod_update";
    }
    
    @RequiresPermissions("prod:operate")
    @RequestMapping("/info/update")
    @ResponseBody
    public Map<String, String> modifyProd(MntProd mntProd) {
        mntProd.setModifier("Modifier");
        mntProd.setModifyDate(new Date());
        mntProdService.updateMntProdById(mntProd);
        Map<String, String> map = new HashMap<>();
        map.put("status", "1");
        return map;
    }
    
    @RequiresPermissions("prod:operate")
    @RequestMapping("/info/delete/{pid}")
    @ResponseBody
    public Map<String, String> deleteProd(@PathVariable String pid) {
        Integer iPid = Integer.parseInt(pid);
        mntProdService.deleteMntProdById(iPid);
        Map<String, String> map = new HashMap<>();
        map.put("status", "1");
        return map;
    }
    
    /**
     * 产品版本信息新增页面跳转
     * @param model
     * @return
     */
    @RequiresPermissions("prod:operate")
    @RequestMapping("/ver/page_add")
    public String showProdVerAddPage(Model model) {
        List<EnumObject> prodEnums = BaseDataCache.getDataList("PROD_INFO");
        model.addAttribute("prodEnums", prodEnums);
        return "product/info/prod_version_add";
    }
    
    /**
     * 产品版本信息新增
     * @param mntProd
     * @return
     */
    @RequiresPermissions("prod:operate")
    @RequestMapping("/ver/add")
    @ResponseBody
    public Map<String, String> saveProdVerInfo(MntProdVersion mntProdVersion) {
        mntProdVersion.setDeleteFlag("0");
        mntProdVerService.saveMntProdVer(mntProdVersion);
        Map<String, String> map = new HashMap<>();
        map.put("status", "1");
        return map;
    }
    
    /**
     * 产品版本信息更新页面跳转
     * @param model
     * @return
     */
    @RequiresPermissions("prod:operate")
    @RequestMapping("/ver/page_update/{verId}")
    public String showProdVerUpdatePage(Model model, @PathVariable String verId) {
        MntProdVersion mntProdVersion = mntProdVerService.findProdVerListByVerId(Integer.parseInt(verId));
        List<EnumObject> prodEnums = BaseDataCache.getDataList("PROD_INFO");
        model.addAttribute("mntProdVersion", mntProdVersion);
        model.addAttribute("prodEnums", prodEnums);
        return "product/info/prod_version_update";
    }
    
    /**
     * 产品版本信息更新
     * @param mntProd
     * @return
     */
    @RequiresPermissions("prod:operate")
    @RequestMapping("/ver/update")
    @ResponseBody
    public Map<String, String> updateProdVerInfo(MntProdVersion mntProdVersion) {
        mntProdVerService.updateMntProdVer(mntProdVersion);
        Map<String, String> map = new HashMap<>();
        map.put("status", "1");
        return map;
    }
    
    @RequiresPermissions("prod:operate")
    @RequestMapping("/ver/delete/{verId}")
    @ResponseBody
    public Map<String, String> deleteProdVerInfo(@PathVariable String verId) {
        mntProdVerService.deleteMntProdVerById(Integer.parseInt(verId));
        Map<String, String> map = new HashMap<>();
        map.put("status", "1");
        return map;
    }
    
}
