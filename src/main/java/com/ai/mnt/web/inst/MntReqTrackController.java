package com.ai.mnt.web.inst;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
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
import com.ai.mnt.model.inst.MntReqTrack;
import com.ai.mnt.model.inst.ReqSummaryStat;
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
        List<EnumObject> prodEnums = BaseDataCache.getDataList("PROD_NAME");
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
        
        List<EnumObject> prodEnums = BaseDataCache.getDataList("PROD_NAME");
        model.addAttribute("prodEnums", prodEnums);

        List<EnumObject> bizEnums = BaseDataCache.getDataList("BIZ_TYPE");
        model.addAttribute("bizEnums", bizEnums);
        
        //List<EnumObject> biz
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
        
        List<EnumObject> prodEnums = BaseDataCache.getDataList("PROD_NAME");
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
    //@ResponseBody         // ajax 取数据的时候
    public String statsMntReqTrack(Model model,MntReqTrack mntReqTrack){
        List<MntReqTrack> summaryStat = mntReqTrackService.getReqSummaryStat(mntReqTrack);
        List<MntReqTrack> prodCountList = mntReqTrackService.findListStatisticsByProdName(mntReqTrack);
        Map<String, List<ReqSummaryStat>> statMap = new HashMap<>();
        int [] countMap = new int[7];
        buildSummaryData(statMap, summaryStat);
        
        calProd(prodCountList, countMap);
        model.addAttribute("statMap", statMap);
        model.addAttribute("prodCount", countMap) ;
        
        
        return "inst/track/req_track_stats" ;
    }
    
    private void calProd(List<MntReqTrack>prodCountList,int countMap[]){
        
        for (MntReqTrack pcl :prodCountList) {
          if (pcl.getProdName().contains("帐管")) {
              countMap[1] = pcl.getCount();
        }else if (pcl.getProdName().contains("帐处")) {
            countMap[2] = pcl.getCount();
        }else if (pcl.getProdName().contains("OpenBilling")) {
            countMap[3] = pcl.getCount();
        }else if (pcl.getProdName().contains("VB60计费系统")) {
            countMap[4] = pcl.getCount();
        }else if (pcl.getProdName().contains("VB60帐务处理")) {
            countMap[5] = pcl.getCount();
        }else  {
            countMap[6] = pcl.getCount();
        }
            
        }
       for (int i = 1; i < countMap.length; i++) {
        countMap[0]+=countMap[i];
        System.out.println(countMap[i]);
    }
    }
    
   /* @RequestMapping("/track/stas")
    @ResponseBody
    public Map<String, Object> stasMntReqTrack2(MntReqTrack mntReqTrack) {
        
        return null; 
      
    }*/
    
    /**
     * 构建汇总数据
     * @param statMap
     * @param summaryStat
     */
    private void buildSummaryData(Map<String, List<ReqSummaryStat>> statMap,
            List<MntReqTrack> summaryStat) {
        
        Map<String, List<MntReqTrack>> trackMap = new HashMap<>();
        for(MntReqTrack reqTrack : summaryStat) {
            List<MntReqTrack> mntReqTracks = trackMap.get(reqTrack.getBaseName());
            if(mntReqTracks == null) {
                mntReqTracks = new ArrayList<>();
                mntReqTracks.add(reqTrack);
                trackMap.put(reqTrack.getBaseName(), mntReqTracks);
            }else {
                mntReqTracks.add(reqTrack);
            }
        }
       
        for (Map.Entry<String, List<MntReqTrack>> entry : trackMap.entrySet()) {
            
            List<MntReqTrack> mntReqTracks = entry.getValue();    //得到相同省份的List表
            
            ReqSummaryStat zgStat = new ReqSummaryStat();   //六个对象 帐管 帐处等等
            zgStat.setProdOrder(1);
            ReqSummaryStat zcStat = new ReqSummaryStat();
            zcStat.setProdOrder(2);
            ReqSummaryStat jfStat = new ReqSummaryStat();
            jfStat.setProdOrder(3);
            ReqSummaryStat zfVbStat = new ReqSummaryStat();
            zfVbStat.setProdOrder(4);
            ReqSummaryStat zcVbStat = new ReqSummaryStat();
            zcVbStat.setProdOrder(5);
            ReqSummaryStat otherStat = new ReqSummaryStat();
            otherStat.setProdOrder(6);
            
            List<ReqSummaryStat> stats = new ArrayList<>();   //将六个对象依次放入list中
            stats.add(zgStat);
            stats.add(zcStat);
            stats.add(jfStat);
            stats.add(zfVbStat);
            stats.add(zcVbStat);
            stats.add(otherStat);
            
            int count1 = 0;
            for(MntReqTrack reqTrack : mntReqTracks) {  //对相同省份的list遍历
                if("帐管".equals(reqTrack.getProdName())) {
                    setValue(zgStat, reqTrack);
                }else if("帐处".equals(reqTrack.getProdName())) {
                    setValue(zcStat, reqTrack);
                }else if("OpenBilling".equals(reqTrack.getProdName())) {
                    setValue(jfStat, reqTrack);
                }else if("VB60计费系统".equals(reqTrack.getProdName())) {
                    setValue(zfVbStat, reqTrack);
                }else if("VB60帐务处理".equals(reqTrack.getProdName())) {
                    setValue(zcVbStat, reqTrack);
                }else {
                    setValue(otherStat, reqTrack);
                }
                
                count1 += reqTrack.getCount() ;   //计算每个省份的需求数量
               
            }
            for(ReqSummaryStat stat : stats){
                stat.setBaseTotalCount(count1);
            }
            statMap.put(entry.getKey(), stats);
        }
    }

    private void setValue(ReqSummaryStat stat, MntReqTrack reqTrack) {
        stat.setProdName(reqTrack.getProdName());
        stat.setBaseName(reqTrack.getBaseName());
        
        if("产品部SCCB".equals(reqTrack.getBizSts())) {
            stat.setSccbCount(stat.getSccbCount() + reqTrack.getCount());
        }else if("需求分析".equals(reqTrack.getBizSts())) {
            stat.setReqAnalyCount(stat.getReqAnalyCount() + reqTrack.getCount());
        }else if("开发".equals(reqTrack.getBizSts())) {
            stat.setDevCount(stat.getDevCount() + reqTrack.getCount());
        }else if("测试".equals(reqTrack.getBizSts())) {
            stat.setQaCount(stat.getQaCount() + reqTrack.getCount());
        }
    }
    
    
    
}
