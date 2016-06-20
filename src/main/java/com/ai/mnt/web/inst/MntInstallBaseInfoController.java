package com.ai.mnt.web.inst;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ai.mnt.common.cache.BaseDataCache;
import com.ai.mnt.model.common.EnumObject;
import com.ai.mnt.model.inst.MntInstallBaseInfo;
import com.ai.mnt.service.inst.MntInstallBaseInfoService;


@Controller
@RequestMapping("/inst")
public class MntInstallBaseInfoController {

    @Autowired
    MntInstallBaseInfoService mntInstallBaseInfoService;
    
    /**
     * 安装点管理界面跳转
     * @return
     */
    @RequestMapping("/base/page")
    public String showInstallBasePage(Model model) {
        List<EnumObject> deleteFlagEnums = BaseDataCache.getDataList("DELETE_FLAG");
        model.addAttribute("deleteFlagEnums", deleteFlagEnums);
        return "inst/base/base_info";
    }
    
    /**
     * 获取安装点列表
     * @param sysResource
     * @return
     */
    @RequestMapping("/base/query")
    @ResponseBody
    public Map<String, Object> getInstallBaseInfoList(MntInstallBaseInfo mntInstallBaseInfo) {
        List<MntInstallBaseInfo> baseList = mntInstallBaseInfoService.findInstallBaseInfoList(mntInstallBaseInfo);
        Map<String, Object> map = new HashMap<>();
        map.put("data", baseList);
        map.put("status", "1");
        return map;
    }
    
    /**
     * 安装点新增界面跳转
     * @return
     */
    @RequestMapping("/base/page_add")
    public String showInstallBaseInfoAddPage(Model model) {
        List<EnumObject> deleteFlagEnums = BaseDataCache.getDataList("DELETE_FLAG");
        model.addAttribute("deleteFlagEnums", deleteFlagEnums);
        return "inst/base/base_info_add";
    }
    
    /**
     * 保存安装点
     * @param sysResource
     * @return
     */
    @RequestMapping("/base/add")
    @ResponseBody
    public Map<String, Object> saveInstallBaseInfo(MntInstallBaseInfo mntInstallBaseInfo) {
        mntInstallBaseInfoService.saveInstallBaseInfo(mntInstallBaseInfo);
        Map<String, Object> map = new HashMap<>();
        map.put("status", "1");
        return map;
    }
    
    /**
     * 安装点更新界面跳转
     * @return
     */
    @RequestMapping("/base/page_update/{baseId}")
    public String showInstallBaseInfoPage(Model model, @PathVariable String baseId) {
        List<EnumObject> deleteFlagEnums = BaseDataCache.getDataList("DELETE_FLAG");
        MntInstallBaseInfo installBaseInfo = mntInstallBaseInfoService.findInstallBaseInfoByBaseId(Integer.parseInt(baseId));
        model.addAttribute("installBaseInfo", installBaseInfo);
        model.addAttribute("deleteFlagEnums", deleteFlagEnums);
        return "inst/base/base_info_update";
    }
    
    /**
     * 更新安装点
     * @param sysResource
     * @return
     */
    @RequestMapping("/base/update")
    @ResponseBody
    public Map<String, Object> updateInstallBaseInfo(MntInstallBaseInfo mntInstallBaseInfo) {
        mntInstallBaseInfoService.updateInstallBaseInfo(mntInstallBaseInfo);
        Map<String, Object> map = new HashMap<>();
        map.put("status", "1");
        return map;
    }
    
    /**
     * 删除安装点
     * @return
     */
    @RequestMapping("/base/delete/{baseIds}")
    @ResponseBody
    public Map<String, Object> deletemntInstallBaseInfoByIds(@PathVariable String baseIds) {
        mntInstallBaseInfoService.deletemntInstallBaseInfoByIds(baseIds);
        Map<String, Object> map = new HashMap<>();
        map.put("status", "1");
        return map;
    }
}
