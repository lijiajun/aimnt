package com.ai.mnt.web.req;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ai.mnt.model.req.MntReqTrack;
import com.ai.mnt.service.req.MntReqTrackService;

/**
 * @Title: MntReqTrackController 
 * @Description: MntReqTrackController ControllerPackage
 * @Author: Auto Generate.
 * @Date: 2016-7-27
 */

@Controller
@RequestMapping("/req")
public class MntReqTrackController {

    @Autowired
    MntReqTrackService mntReqTrackService;
    
    /**
     * 部门需求故障跟踪界面跳转
     * @param  model
     * @return String
     */
    @RequestMapping("/track/page")
    public String showMntReqTrackPage(Model model) {
        return "req/track/req_track_query";
    }
    
    /**
     * 获取部门需求故障跟踪列表
     * @param mntReqTrack
     * @return Map<String, Object>
     */
    @RequestMapping("/track/query")
    @ResponseBody
    public Map<String, Object> getMntReqTrackList(MntReqTrack mntReqTrack) {
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
        return "req/track/req_track_add";
    }
    
    /**
     * 部门需求故障跟踪保存
     * @param mntReqTrack
     * @return Map<String, Object>
     */
    @RequestMapping("/track/add")
    @ResponseBody
    public Map<String, Object> saveMntReqTrack(MntReqTrack mntReqTrack) {
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
        return "req/track/req_track_update";
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
        return "req/track/req_track_info";
    }
}
