package com.ai.mnt.web.inst;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ai.mnt.common.cache.BaseDataCache;
import com.ai.mnt.model.common.EnumObject;
import com.ai.mnt.model.inst.MntProdRelPlan;
import com.ai.mnt.model.inst.MntReqTrack;
import com.ai.mnt.service.inst.MntReqTrackService;


/**
 * @Title: MntReqTrackController 
 * @Description: MntReqTrackController ControllerPackage
 * @Author: Auto Generate.
 * @Date: 2016-7-27
 */

@Controller
@RequestMapping("/inst")
public class MntReqTrackController {

    @Autowired
    MntReqTrackService mntReqTrackService;
    
    @InitBinder
    protected void initBinder(WebDataBinder binder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
    }
    
    
    /**
     * 部门需求故障跟踪界面跳转
     * @param  model
     * @return String
     */
    @RequestMapping("/track/page")
    public String showMntReqTrackPage(Model model) {
        List<EnumObject> prodEnums = BaseDataCache.getDataList("PROD_INFO");
        List<EnumObject> baseIdEnums = BaseDataCache.getDataList("BASE_NAME_ENUM");
        model.addAttribute("prodEnums", prodEnums);
        model.addAttribute("baseIdEnums", baseIdEnums);
        return "inst/track/req_track_query";
    }
    
    /**
     * 获取部门需求故障跟踪列表
     * @param mntReqTrack
     * @return Map<String, Object>
     */
    @RequestMapping("/track/query")
    @ResponseBody
    public Map<String, Object> getMntReqTrackList(MntReqTrack mntReqTrack) {
        mntReqTrack.setDeleteFlag("0");
        List<MntReqTrack> mntReqTrackList = mntReqTrackService.findMntReqTrackList(mntReqTrack);
        Map<String, Object> map = new HashMap<>();
        map.put("data", mntReqTrackList);
        map.put("status", "1");
        return map;
    }
    
    /**
     * 部门需求故障跟踪新增界面跳转
     * @param  model
     * @return String
     */
    @RequestMapping("/track/add_page")
    public String showMntReqTrackAddPage(Model model) {
        List<EnumObject> baseIdEnums = BaseDataCache.getDataList("BASE_NAME_ENUM");
        model.addAttribute("baseIdEnums", baseIdEnums);
        
        List<EnumObject> prodEnums = BaseDataCache.getDataList("PROD_INFO");
        model.addAttribute("prodEnums", prodEnums);

        List<EnumObject> bizEnums = BaseDataCache.getDataList("BIZ_TYPE");
        model.addAttribute("bizEnums", bizEnums);
        return "inst/track/req_track_add";
    }
    
    /**
     * 部门需求故障跟踪保存
     * @param mntReqTrack
     * @return Map<String, Object>
     */
    @RequestMapping("/track/add")
    @ResponseBody
    public Map<String, Object> saveMntReqTrack(MntReqTrack mntReqTrack) {
        System.out.println(mntReqTrack.getProdName());
        mntReqTrackService.saveMntReqTrack(mntReqTrack);
        Map<String, Object> map = new HashMap<>();
        map.put("status", "1");
        return map;
    }
    
    /**
     * 部门需求故障跟踪更新界面跳转
     * @param  model
     * @param  trackId
     * @return
     */
    @RequestMapping("/track/update_page/{trackId}")
    public String showMntReqTrackUpdatePage(Model model, @PathVariable String trackId) {
        MntReqTrack mntReqTrack = mntReqTrackService.findMntReqTrackByTrackId(Integer.parseInt(trackId));
        model.addAttribute("mntReqTrack", mntReqTrack);
        
        List<EnumObject> baseIdEnums = BaseDataCache.getDataList("BASE_NAME_ENUM");
        model.addAttribute("baseIdEnums", baseIdEnums);
        
        List<EnumObject> prodEnums = BaseDataCache.getDataList("PROD_INFO");
        model.addAttribute("prodEnums", prodEnums);
        
        List<EnumObject> bizEnums = BaseDataCache.getDataList("BIZ_TYPE");
        model.addAttribute("bizEnums", bizEnums);

        return "inst/track/req_track_update";
    }
    
    /**
     * 部门需求故障跟踪根据主键更新
     * @param mntReqTrack
     * @return
     */
    @RequestMapping("/track/update")
    @ResponseBody
    public Map<String, Object> updateMntReqTrack(MntReqTrack mntReqTrack) {
        mntReqTrackService.updateMntReqTrackByTrackId(mntReqTrack);
        Map<String, Object> map = new HashMap<>();
        map.put("status", "1");
        return map;
    }
    
    /**
     * 部门需求故障跟踪根据主键批量删除
     * @param trackIds
     * @return Map<String, Object>
     */
    @RequestMapping("/track/delete/{trackIds}")
    @ResponseBody
    public Map<String, Object> deleteMntReqTrackByTrackIds(@PathVariable String trackIds) {
        mntReqTrackService.deleteMntReqTrackByTrackIds(trackIds);
        Map<String, Object> map = new HashMap<>();
        map.put("status", "1");
        return map;
    }
    
    /**
     * 根据主键查询部门需求故障跟踪详细信息
     * @param model
     * @return
     */
    @RequestMapping("/track/{trackId}/page")
    public String queryMntReqTrackByTrackId(Model model, @PathVariable String trackId) {
        MntReqTrack mntReqTrack = new MntReqTrack();
        mntReqTrack.setTrackId(Integer.parseInt(trackId));
        List<MntReqTrack> mntReqTrackList = mntReqTrackService.findMntReqTrackList(mntReqTrack);
        if(mntReqTrackList != null && mntReqTrackList.size() > 0) { //只会有一条数据
            model.addAttribute("mntReqTrack", mntReqTrackList.get(0));
        }
        return "inst/track/req_track_info";
    }
    //统计 
    @RequestMapping("/track/stats_page")
   // @ResponseBody
    public String statsMntReqTrack(Model model){
        
        return "inst/track/req_track_stats";
    }
    
}
