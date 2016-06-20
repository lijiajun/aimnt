package com.ai.mnt.web.stat;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ai.mnt.common.cache.BaseDataCache;
import com.ai.mnt.common.util.DateUtil;
import com.ai.mnt.model.chart.Chart;
import com.ai.mnt.model.chart.HighChartInstance;
import com.ai.mnt.model.chart.Legend;
import com.ai.mnt.model.chart.Series;
import com.ai.mnt.model.chart.Title;
import com.ai.mnt.model.chart.XAxis;
import com.ai.mnt.model.chart.YAxis;
import com.ai.mnt.model.common.EnumObject;
import com.ai.mnt.model.inst.MntInstallOnlineInfo;
import com.ai.mnt.model.product.FullCalendar;
import com.ai.mnt.model.product.MntReleaseRec;
import com.ai.mnt.service.inst.MntInstallOnlineInfoService;
import com.ai.mnt.service.product.MntReleaseRecDtlService;
import com.ai.mnt.service.product.MntReleaseRecService;

@RequestMapping("/stat")
@Controller
public class StatChartControllor {
    
    
    @Autowired
    MntReleaseRecDtlService mntReleaseRecDtlService;
    
    @Autowired
    MntReleaseRecService mntReleaseRecService;
    
    @Autowired
    MntInstallOnlineInfoService mntInstallOnlineInfoService;
    
    @RequestMapping("/index")
    public String showChartMain(Model model) {
        List<EnumObject> prodEnums = BaseDataCache.getDataList("PROD_INFO");
        List<EnumObject> verEnums = BaseDataCache.getDataList("PROD_VER");
        model.addAttribute("prodEnums", prodEnums);
        model.addAttribute("verEnums", verEnums);
        return "stat/stat_index";
    }
    
    @RequestMapping("/req/prod/{type}")
    @ResponseBody
    public HighChartInstance getStatResForBaseId(MntReleaseRec mntReleaseRec, @PathVariable String type) {
        
        mntReleaseRec.setBeginDate(DateUtil.getMonthBegin(mntReleaseRec.getBeginDate()));
        mntReleaseRec.setEndDate(DateUtil.getMonthEnd(mntReleaseRec.getBeginDate()));
        mntReleaseRec.setDeleteFlag("0");
        List<MntReleaseRec> statList = new ArrayList<>();
        
        String _title = "";
        if("1".equals(type)) {
            statList = mntReleaseRecService.getStatResForProdId(mntReleaseRec);
            _title = "各产品发布需求量统计";
        }else {
            statList = mntReleaseRecService.getStatResForBaseId(mntReleaseRec);
            _title = "各安装点发布需求量统计";
        }
        
        HighChartInstance hchart = new HighChartInstance();
        
        Chart chart = new Chart();
        chart.setType("column");
        chart.setRenderTo("container");
        
        DateFormat df = new SimpleDateFormat("yyyy年MM月");
        String yearmonth = df.format(mntReleaseRec.getBeginDate());
        
        Title title = new Title();
        title.setText(yearmonth + _title);

        Legend legend = new Legend();
        legend.setEnabled(false);
        legend.setLayout("vertical");
        legend.setAlign("right");
        legend.setVerticalAlign("middle");
        //Y轴
        YAxis yAxis = new YAxis();
        Title ytitle = new Title();
        ytitle.setText("发布需求数量(个)");
        yAxis.setTitle(ytitle);
        
        //X轴
        XAxis xAxis = new XAxis();
        String[] categories = new String[statList.size()];
        xAxis.setCategories(categories);
        
        //数据
        List<Series> seriesList = new ArrayList<>();
        Series series = new Series();
        series.setName("需求数量");
        
        int[] data = new int[statList.size()];
        
        for(int i=0; i<statList.size(); i++) {
            MntReleaseRec temp = statList.get(i);
            if("1".equals(type)) {
                categories[i] = temp.getProdName();
            }else if("2".equals(type)) {
                categories[i] = temp.getBaseName();
            }
            data[i] = temp.getDtlCount();
        }
        
        series.setData(data);
        seriesList.add(series);
        
        hchart.setChart(chart);
        hchart.setLegend(legend);
        hchart.setSeries(seriesList);
        hchart.setTitle(title);
        hchart.setxAxis(xAxis);
        hchart.setyAxis(yAxis);
        
        return hchart;
    }
    
    /**
     * 上线日历展示
     * @param mntReleaseRec
     * @param type
     * @return
     */
    @RequestMapping("/online/calendar")
    @ResponseBody
    public List<FullCalendar> getOnlineRec(FullCalendar fullCalendar) {
        MntInstallOnlineInfo mntInstallOnlineInfo = new MntInstallOnlineInfo();
        mntInstallOnlineInfo.setBeginDate(DateUtil.stringToDateShort(fullCalendar.getStart()));
        mntInstallOnlineInfo.setEndDate(DateUtil.stringToDateShort(fullCalendar.getEnd()));
        List<MntInstallOnlineInfo> onlineInfoList = mntInstallOnlineInfoService.getDistinctOnlineDateList(mntInstallOnlineInfo);
        
        List<FullCalendar> fullCalendarList = new ArrayList<>();
        for(MntInstallOnlineInfo temp : onlineInfoList) {
            fullCalendar = new FullCalendar();
            fullCalendar.setId(DateUtil.dateToStringShort(temp.getOnlineDate()));
            fullCalendar.setTitle("上线");
            fullCalendar.setStart(DateUtil.dateToStringShort(temp.getOnlineDate()));
            fullCalendar.setEnd(DateUtil.dateToStringShort(temp.getOnlineDate()));
//            String day = DateUtil.getDay(temp.getOnlineDate());
//            int d = Integer.parseInt(day) % 10;//取个位数字 固定颜色
            fullCalendar.setColor("#FF7256");
            fullCalendarList.add(fullCalendar);
        }
        return fullCalendarList;
    }
    
    @RequestMapping("/online/list/{onlineDate}")
    public String showOnlineRecPage(@PathVariable String onlineDate, Model model) {
        model.addAttribute("onlineDate", onlineDate);
        return "stat/inst_online_list";
    }
}
