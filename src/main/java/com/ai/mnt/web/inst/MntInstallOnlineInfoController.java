package com.ai.mnt.web.inst;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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

import com.ai.mnt.common.cache.BaseDataCache;
import com.ai.mnt.common.util.DateUtil;
import com.ai.mnt.common.util.ExcelUtil;
import com.ai.mnt.model.common.EnumObject;
import com.ai.mnt.model.inst.MntInstallOnlineInfo;
import com.ai.mnt.model.product.MntReleaseRec;
import com.ai.mnt.model.product.MntReleaseRecDtl;
import com.ai.mnt.service.inst.MntInstallOnlineInfoService;
import com.ai.mnt.service.product.MntReleaseRecService;

/**
 * @Title: MntInstallOnlineInfoController 
 * @Description: MntInstallOnlineInfoController ControllerPackage
 * @Author: Auto Generate. HE
 * @Date: 2016-5-23
 */

@Controller
@RequestMapping("/inst")
public class MntInstallOnlineInfoController {

    @Autowired
    MntInstallOnlineInfoService mntInstallOnlineInfoService;
    
    @Autowired
    MntReleaseRecService mntReleaseRecService;
    
    /**
     * 安装点上线信息界面跳转
     * @param  model
     * @return String
     */
    @RequestMapping("/online/page")
    public String showMntInstallOnlineInfoPage(Model model) {
        List<EnumObject> prodEnums = BaseDataCache.getDataList("PROD_INFO");
        List<EnumObject> verEnums = BaseDataCache.getDataList("PROD_VER");
        List<EnumObject> baseIdEnums = BaseDataCache.getDataList("BASE_NAME_ENUM");
        List<EnumObject> isOnlinedEnums = BaseDataCache.getDataList("IS_ONLINED");
        model.addAttribute("prodEnums", prodEnums);
        model.addAttribute("verEnums", verEnums);
        model.addAttribute("baseIdEnums", baseIdEnums);
        model.addAttribute("isOnlinedEnums", isOnlinedEnums);
        return "inst/online/inst_online_query";
    }
    
    /**
     * 获取安装点上线信息列表
     * @param mntInstallOnlineInfo
     * @return Map<String, Object>
     */
    @RequestMapping("/online/query")
    @ResponseBody
    public Map<String, Object> getMntInstallOnlineInfoList(MntInstallOnlineInfo mntInstallOnlineInfo,
            MntReleaseRecDtl mntReleaseRecDtl) {
        mntInstallOnlineInfo.setDeleteFlag("0");
        mntInstallOnlineInfo.setMntReleaseRecDtl(mntReleaseRecDtl);
        List<MntInstallOnlineInfo> mntInstallOnlineInfoList = 
                mntInstallOnlineInfoService.findOnlineInfoListJoinRelDtl(mntInstallOnlineInfo);
        Map<String, Object> map = new HashMap<>();
        map.put("data", mntInstallOnlineInfoList);
        map.put("status", "1");
        return map;
    }
    
    /**
     * 安装点上线信息新增界面跳转
     * @param  model
     * @return String
     */
    @RequestMapping("/online/add_page")
    public String showMntInstallOnlineInfoAddPage(Model model) {
        List<EnumObject> prodEnums = BaseDataCache.getDataList("PROD_INFO");
        List<EnumObject> baseIdEnums = BaseDataCache.getDataList("BASE_NAME_ENUM");
        List<EnumObject> isOnlinedEnums = BaseDataCache.getDataList("IS_ONLINED");
        List<EnumObject> isFaultEnums = BaseDataCache.getDataList("IS_FAULT");
        List<EnumObject> isRemoteSupportEnums = BaseDataCache.getDataList("IS_REMOTE_SUPPORT");
        List<EnumObject> isOnsiteSupportEnums = BaseDataCache.getDataList("IS_ONSITE_SUPPORT");
        model.addAttribute("prodEnums", prodEnums);
        model.addAttribute("baseIdEnums", baseIdEnums);
        model.addAttribute("isOnlinedEnums", isOnlinedEnums);
        model.addAttribute("isFaultEnums", isFaultEnums);
        model.addAttribute("isRemoteSupportEnums", isRemoteSupportEnums);
        model.addAttribute("isOnsiteSupportEnums", isOnsiteSupportEnums);
        return "inst/online/inst_online_add";
    }
    
    /**
     * 安装点上线信息保存
     * @param mntInstallOnlineInfo
     * @return Map<String, Object>
     */
    @RequestMapping("/online/add")
    @ResponseBody
    public Map<String, Object> saveMntInstallOnlineInfo(MntInstallOnlineInfo mntInstallOnlineInfo) {
        mntInstallOnlineInfoService.saveMntInstallOnlineInfo(mntInstallOnlineInfo);
        Map<String, Object> map = new HashMap<>();
        map.put("status", "1");
        return map;
    }
    
    /**
     * 安装点上线信息更新界面跳转
     * @param  model
     * @param  onlineId
     * @return
     */
    @RequestMapping("/online/update_page/{onlineId}")
    public String showMntInstallOnlineInfoUpdatePage(Model model, @PathVariable String onlineId) {
        MntInstallOnlineInfo mntInstallOnlineInfo = mntInstallOnlineInfoService.findMntInstallOnlineInfoByOnlineId(Integer.parseInt(onlineId));
        model.addAttribute("mntInstallOnlineInfo", mntInstallOnlineInfo);
        
        List<EnumObject> prodEnums = BaseDataCache.getDataList("PROD_INFO");
        List<EnumObject> baseIdEnums = BaseDataCache.getDataList("BASE_NAME_ENUM");
        List<EnumObject> isOnlinedEnums = BaseDataCache.getDataList("IS_ONLINED");
        List<EnumObject> isFaultEnums = BaseDataCache.getDataList("IS_FAULT");
        List<EnumObject> isRemoteSupportEnums = BaseDataCache.getDataList("IS_REMOTE_SUPPORT");
        List<EnumObject> isOnsiteSupportEnums = BaseDataCache.getDataList("IS_ONSITE_SUPPORT");
        model.addAttribute("prodEnums", prodEnums);
        model.addAttribute("baseIdEnums", baseIdEnums);
        model.addAttribute("isOnlinedEnums", isOnlinedEnums);
        model.addAttribute("isFaultEnums", isFaultEnums);
        model.addAttribute("isRemoteSupportEnums", isRemoteSupportEnums);
        model.addAttribute("isOnsiteSupportEnums", isOnsiteSupportEnums);
        
        return "inst/online/inst_online_update";
    }
    
    /**
     * 安装点上线信息根据主键更新
     * @param mntInstallOnlineInfo
     * @return
     */
    @RequestMapping("/online/update")
    @ResponseBody
    public Map<String, Object> updateMntInstallOnlineInfo(MntInstallOnlineInfo mntInstallOnlineInfo) {
        mntInstallOnlineInfoService.updateMntInstallOnlineInfoByOnlineId(mntInstallOnlineInfo);
        Map<String, Object> map = new HashMap<>();
        map.put("status", "1");
        return map;
    }
    
    /**
     * 安装点上线信息根据主键批量删除
     * @param onlineIds
     * @return Map<String, Object>
     */
    @RequestMapping("/online/delete/{onlineIds}")
    @ResponseBody
    public Map<String, Object> deleteMntInstallOnlineInfoByOnlineIds(@PathVariable String onlineIds) {
        mntInstallOnlineInfoService.deleteMntInstallOnlineInfoByOnlineIds(onlineIds);
        Map<String, Object> map = new HashMap<>();
        map.put("status", "1");
        return map;
    }
    
    /**
     * 根据主键查询安装点上线信息详细信息
     * @param model
     * @return
     */
    @RequestMapping("/online/{onlineId}/page")
    public String queryMntInstallOnlineInfoByOnlineId(Model model, @PathVariable String onlineId) {
        MntInstallOnlineInfo mntInstallOnlineInfo = new MntInstallOnlineInfo();
        mntInstallOnlineInfo.setOnlineId(Integer.parseInt(onlineId));
        List<MntInstallOnlineInfo> mntInstallOnlineInfoList = mntInstallOnlineInfoService.findMntInstallOnlineInfoList(mntInstallOnlineInfo);
        if(mntInstallOnlineInfoList != null && mntInstallOnlineInfoList.size() > 0) { //只会有一条数据
            model.addAttribute("mntInstallOnlineInfo", mntInstallOnlineInfoList.get(0));
        }
        return "inst/online/inst_online_info";
    }
    
    /**
     * 获取安装点上线信息列表
     * @param mntInstallOnlineInfo
     * @return Map<String, Object>
     */
    @RequestMapping("/online/list/{onlineDate}")
    @ResponseBody
    public Map<String, Object> getOnlineInfoListByOnlineDate(@PathVariable String onlineDate) {
        MntInstallOnlineInfo mntInstallOnlineInfo = new MntInstallOnlineInfo();
        Date _onlineDate = DateUtil.stringToDateShort(onlineDate);
        mntInstallOnlineInfo.setOnlineDate(_onlineDate);
        mntInstallOnlineInfo.setIsOnlined("1");
        List<MntInstallOnlineInfo> mntInstallOnlineInfoList = 
                mntInstallOnlineInfoService.findOnlineInfoListJoinRelDtl(mntInstallOnlineInfo);
        //过滤出真正的上线时间
        List<MntInstallOnlineInfo> resultList = new ArrayList<>();
        for(MntInstallOnlineInfo temp : mntInstallOnlineInfoList) {
            if(temp.getOnlineDate() != null && !temp.getOnlineDate().equals(_onlineDate)) {
                continue;
            }
            if(temp.getOnlineDate() == null && 
                    temp.getDelayOnlineDate() != null &&
                    !temp.getDelayOnlineDate().equals(_onlineDate)) {
                continue;
            }
            if(temp.getDelayOnlineDate() == null && 
                    temp.getOnlineDate() == null &&
                    temp.getPlanOnlineDate() != null &&
                    !temp.getPlanOnlineDate().equals(_onlineDate)) {
                continue;
            }
            resultList.add(temp);
        }
        Map<String, Object> map = new HashMap<>();
        map.put("data", resultList);
        map.put("status", "1");
        return map;
    }
    
    
    /**
     * 获取安装点未上线信息列表
     * @param mntInstallOnlineInfo
     * @return Map<String, Object>
     */
    @RequestMapping("/notonline/list/{onlineDate}")
    @ResponseBody
    public Map<String, Object> getNotOnlineInfoListByOnlineDate(@PathVariable String onlineDate) {
        MntInstallOnlineInfo mntInstallOnlineInfo = new MntInstallOnlineInfo();
        Date _onlineDate = DateUtil.stringToDateShort(onlineDate);
        mntInstallOnlineInfo.setOnlineDate(_onlineDate);
        List<MntInstallOnlineInfo> mntInstallNotOnlineInfoList = 
                mntInstallOnlineInfoService.findNotOnlineInfoListJoinRelDtl(mntInstallOnlineInfo);
        //过滤出真正的上线时间
       /* List<MntInstallOnlineInfo> resultList = new ArrayList<>();
        for(MntInstallOnlineInfo temp : mntInstallOnlineInfoList) {
            if(temp.getOnlineDate() != null && !temp.getOnlineDate().equals(_onlineDate)) {
                continue;
            }
            if(temp.getOnlineDate() == null && 
                    temp.getDelayOnlineDate() != null &&
                    !temp.getDelayOnlineDate().equals(_onlineDate)) {
                continue;
            }
            if(temp.getDelayOnlineDate() == null && 
                    temp.getOnlineDate() == null &&
                    temp.getPlanOnlineDate() != null &&
                    !temp.getPlanOnlineDate().equals(_onlineDate)) {
                continue;
            }
            resultList.add(temp);
        }*/
        Map<String, Object> map = new HashMap<>();
        map.put("data", mntInstallNotOnlineInfoList);
        map.put("status", "1");
        return map;
    }
    /**
     * 上线反馈导入页面
     * 
     * @param model
     * @return
     */
    @RequestMapping("/online/import_page")
    public String batchImportLibPage(Model model) {
        List<EnumObject> baseIdEnums = BaseDataCache.getDataList("BASE_NAME_ENUM");
        model.addAttribute("baseIdEnums", baseIdEnums);
        return "inst/online/inst_online_import";
    }
    
    /**
     * 产品模块批量导入Excel
     * 
     * @param model
     * @return
     */
    @RequestMapping("/online/import")
    @ResponseBody
    public Map<String, Object> importOnlineData(@RequestParam("file") MultipartFile file, MntInstallOnlineInfo mntInstallOnlineInfo) {
        Map<String, Object> map = new HashMap<>();
        if (!file.isEmpty()) {
            try {
                //String fileName = file.getOriginalFilename();
                InputStream inputStream = file.getInputStream();
                List<List<String>> excelData = ExcelUtil.readExcelToListBySheetIndex(inputStream, 0);
                
                mntInstallOnlineInfoService.importOnlineData(excelData, mntInstallOnlineInfo.getBaseId());
                
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
     * 上线版本明细--弹出
     * @param model
     * @return
     */
    @RequestMapping("/online /{relId}/pagedtl")   
    public String findRelByRelCode(@PathVariable Integer relId, Model model) {
     
        //MntReleaseRec mntReleaseRec = new MntReleaseRec();
       // mntReleaseRec.setRelId(relId);
       // List<MntReleaseRec> relList = mntReleaseRecService.findReleaseRecByRelCode(relCode);
        MntReleaseRec mntReleaseRec = mntReleaseRecService.findReleaseRecById(relId);
        model.addAttribute("mntReleaseRec", mntReleaseRec);
        String prodIdTxt = BaseDataCache.getDataName("PROD_INFO", mntReleaseRec.getProdId());
        model.addAttribute("prodIdTxt", prodIdTxt);
        String relTypeTxt = BaseDataCache.getDataName("REL_TYPE", mntReleaseRec.getRelType());
        model.addAttribute("relTypeTxt", relTypeTxt);
        /* if(relList != null && relList.size() > 0) {
            model.addAttribute("relList", relList.get(0));
        }
        Integer relType = relList.get(0).getRelType();
        Integer prodId = relList.get(0).getProdId();
        String relTypeTxt = BaseDataCache.getDataName("REL_TYPE", relType);
        String prodIdTxt = BaseDataCache.getDataName("PROD_INFO", prodId);
        
        model.addAttribute("relTypeTxt", relTypeTxt);
        model.addAttribute("prodIdTxt", prodIdTxt);*/
        
        return "inst/online/inst_online_dtl_list";
    }
   
    /**
     * daochu发布计划列表
     * @param mntProdRelPlan
     * @throws IOException 
     * @throws FileNotFoundException 
     */
    @RequestMapping("/online/output")
    @ResponseBody
    public void outputMntProdOnlineInfoList(MntInstallOnlineInfo mntInstallOnlineInfo ,
            MntReleaseRecDtl mntReleaseRecDtl) throws FileNotFoundException, IOException {
       System.out.println("我是一条可爱的分界线======================");
        mntInstallOnlineInfo.setDeleteFlag("0");
        mntInstallOnlineInfo.setMntReleaseRecDtl(mntReleaseRecDtl);
        List<MntInstallOnlineInfo> mntInstallOnlineInfoList = 
                mntInstallOnlineInfoService.findOnlineInfoListJoinRelDtl(mntInstallOnlineInfo);
        
        
        String[] sheetName={"上线反馈（现场）"};
        String[] title1={"计划上线时间","上线系统","系统版本","是否需申请R&D现场支持","是否需申请R&D远程支持","上线模块","上线发布版本号",
                "上线需求或缺陷ID","上线需求或缺陷描述","延期上线日期","实际上线日期","是否出现故障",
                "未上线原因","备注"};
        List<String[]> titles=new ArrayList<String[]>();
        titles.add(title1);
        
        
        List<String[]> data=new ArrayList<String[]>();
        for (MntInstallOnlineInfo mntOnline : mntInstallOnlineInfoList) {
            String strPlanOnlineDate = new SimpleDateFormat("yyyy-MM-dd").format(mntOnline.getPlanOnlineDate()); 
           
            //延期上线日期判断是否为空
            String strDelayOnlineDate; 
            if (mntOnline.getDelayOnlineDate() == null) {
                strDelayOnlineDate = " ";
            } else {
                strDelayOnlineDate =  new SimpleDateFormat("yyyy-MM-dd").format(mntOnline.getDelayOnlineDate()); 
            }
            
            //判断上线日期是否为空
            String strOnlineDate ;
            if (mntOnline.getOnlineDate() == null) {
                strOnlineDate = "";
            } else {
                strOnlineDate = new SimpleDateFormat("yyyy-MM-dd").format(mntOnline.getOnlineDate());
            }
            //备注判断
            String remark;
            if (mntOnline.getOnlineRemark() == null ) {
                 remark = " ";
            }else {
                remark = mntOnline.getOnlineRemark();
            }
            //为上线原因判断
            String unonlineReason ;
            if (mntOnline.getUnOnlineReason() == null) {
                unonlineReason = " ";
            } else {
                unonlineReason = mntOnline.getUnOnlineReason();
            }
            String [] data1 = {strPlanOnlineDate,mntOnline.getProdName(),mntOnline.getVerCode(),
                    mntOnline.getIsOnsiteSupportTxt(),mntOnline.getIsRemoteSupportTxt(),
                    mntOnline.getModuleName(),mntOnline.getRelCode(),mntOnline.getMntReleaseRecDtl().getDtlCode(),
                    mntOnline.getMntReleaseRecDtl().getDtlName(),strDelayOnlineDate,strOnlineDate,
                    mntOnline.getIsFaultTxt(),unonlineReason,remark};
            data.add(data1);
        }
        List<List<String[]>> data_=new ArrayList<List<String[]>>();
        data_.add(data);
        
        ExcelUtil.writeToFile("D:\\上线反馈导出表.xls", sheetName, titles, data_);
    }
    
    
}
