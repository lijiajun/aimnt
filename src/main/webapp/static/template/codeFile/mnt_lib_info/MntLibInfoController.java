package com.ai.mnt.web.product;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ai.mnt.model.product.MntLibInfo;
import com.ai.mnt.service.product.MntLibInfoService;

/**
 * @Title: MntLibInfoController 
 * @Description: MntLibInfoController ControllerPackage
 * @Author: Auto Generate. HE
 * @Date: 2016-5-11
 */

@Controller
@RequestMapping("/product")
public class MntLibInfoController {

    @Autowired
    MntLibInfoService mntLibInfoService;
    
    /**
     * 库文件信息界面跳转
     * @param  model
     * @return String
     */
    @RequestMapping("/lib/page")
    public String showMntLibInfoPage(Model model) {
        return "product/lib/lib_info";
    }
    
    /**
     * 获取库文件信息列表
     * @param mntLibInfo
     * @return Map<String, Object>
     */
    @RequestMapping("/lib/query")
    @ResponseBody
    public Map<String, Object> getMntLibInfoList(MntLibInfo mntLibInfo) {
        List<MntLibInfo> mntLibInfoList = mntLibInfoService.findMntLibInfoList(mntLibInfo);
        Map<String, Object> map = new HashMap<>();
        map.put("data", mntLibInfoList);
        map.put("status", "1");
        return map;
    }
    
    /**
     * 库文件信息新增界面跳转
     * @param  model
     * @return String
     */
    @RequestMapping("/lib/add_page")
    public String showMntLibInfoAddPage(Model model) {
        return "product/lib/lib_add";
    }
    
    /**
     * 库文件信息保存
     * @param mntLibInfo
     * @return Map<String, Object>
     */
    @RequestMapping("/lib/add")
    @ResponseBody
    public Map<String, Object> saveMntLibInfo(MntLibInfo mntLibInfo) {
        mntLibInfoService.saveMntLibInfo(mntLibInfo);
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
    @RequestMapping("/lib/update_page/{libId}")
    public String showMntLibInfoUpdatePage(Model model, @PathVariable String libId) {
        MntLibInfo mntLibInfo = mntLibInfoService.findMntLibInfoByLibId(Integer.parseInt(libId));
        model.addAttribute("mntLibInfo", mntLibInfo);
        return "product/lib/lib_update";
    }
    
    /**
     * 库文件信息根据主键更新
     * @param mntLibInfo
     * @return
     */
    @RequestMapping("/lib/update")
    @ResponseBody
    public Map<String, Object> updateMntLibInfo(MntLibInfo mntLibInfo) {
        mntLibInfoService.updateMntLibInfoByLibId(mntLibInfo);
        Map<String, Object> map = new HashMap<>();
        map.put("status", "1");
        return map;
    }
    
    /**
     * 库文件信息根据主键批量删除
     * @param libIds
     * @return Map<String, Object>
     */
    @RequestMapping("/lib/delete/{libIds}")
    @ResponseBody
    public Map<String, Object> deleteMntLibInfoByLibIds(@PathVariable String libIds) {
        mntLibInfoService.deleteMntLibInfoByLibIds(libIds);
        Map<String, Object> map = new HashMap<>();
        map.put("status", "1");
        return map;
    }
}
