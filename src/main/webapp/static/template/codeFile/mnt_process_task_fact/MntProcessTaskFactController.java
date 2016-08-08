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

import com.ai.mnt.model.inst.MntProcessTaskFact;
import com.ai.mnt.service.inst.MntProcessTaskFactService;

/**
 * @Title: MntProcessTaskFactController 
 * @Description: MntProcessTaskFactController ControllerPackage
 * @Author: Auto Generate.
 * @Date: 2016-8-4
 */

@Controller
@RequestMapping("/inst")
public class MntProcessTaskFactController {

    @Autowired
    MntProcessTaskFactService mntProcessTaskFactService;
    
    /**
     * 进程任务执行情况界面跳转
     * @param  model
     * @return String
     */
    @RequestMapping("/fact/page")
    public String showMntProcessTaskFactPage(Model model) {
        return "inst/fact/inst_fact_query";
    }
    
    /**
     * 获取进程任务执行情况列表
     * @param mntProcessTaskFact
     * @return Map<String, Object>
     */
    @RequestMapping("/fact/query")
    @ResponseBody
    public Map<String, Object> getMntProcessTaskFactList(MntProcessTaskFact mntProcessTaskFact) {
        List<MntProcessTaskFact> mntProcessTaskFactList = mntProcessTaskFactService.findMntProcessTaskFactList(mntProcessTaskFact);
        Map<String, Object> map = new HashMap<>();
        map.put("data", mntProcessTaskFactList);
        map.put("status", "1");
        return map;
    }
    
    /**
     * 进程任务执行情况新增界面跳转
     * @param  model
     * @return String
     */
    @RequestMapping("/fact/add_page")
    public String showMntProcessTaskFactAddPage(Model model) {
        return "inst/fact/inst_fact_add";
    }
    
    /**
     * 进程任务执行情况保存
     * @param mntProcessTaskFact
     * @return Map<String, Object>
     */
    @RequestMapping("/fact/add")
    @ResponseBody
    public Map<String, Object> saveMntProcessTaskFact(MntProcessTaskFact mntProcessTaskFact) {
        mntProcessTaskFactService.saveMntProcessTaskFact(mntProcessTaskFact);
        Map<String, Object> map = new HashMap<>();
        map.put("status", "1");
        return map;
    }
    
    /**
     * 进程任务执行情况更新界面跳转
     * @param  model
     * @param  id
     * @return
     */
    @RequestMapping("/fact/update_page/{id}")
    public String showMntProcessTaskFactUpdatePage(Model model, @PathVariable String id) {
        MntProcessTaskFact mntProcessTaskFact = mntProcessTaskFactService.findMntProcessTaskFactById(Integer.parseInt(id));
        model.addAttribute("mntProcessTaskFact", mntProcessTaskFact);
        return "inst/fact/inst_fact_update";
    }
    
    /**
     * 进程任务执行情况根据主键更新
     * @param mntProcessTaskFact
     * @return
     */
    @RequestMapping("/fact/update")
    @ResponseBody
    public Map<String, Object> updateMntProcessTaskFact(MntProcessTaskFact mntProcessTaskFact) {
        mntProcessTaskFactService.updateMntProcessTaskFactById(mntProcessTaskFact);
        Map<String, Object> map = new HashMap<>();
        map.put("status", "1");
        return map;
    }
    
    /**
     * 进程任务执行情况根据主键批量删除
     * @param ids
     * @return Map<String, Object>
     */
    @RequestMapping("/fact/delete/{ids}")
    @ResponseBody
    public Map<String, Object> deleteMntProcessTaskFactByIds(@PathVariable String ids) {
        mntProcessTaskFactService.deleteMntProcessTaskFactByIds(ids);
        Map<String, Object> map = new HashMap<>();
        map.put("status", "1");
        return map;
    }
    
    /**
     * 根据主键查询进程任务执行情况详细信息
     * @param model
     * @return
     */
    @RequestMapping("/fact/{id}/page")
    public String queryMntProcessTaskFactById(Model model, @PathVariable String id) {
        MntProcessTaskFact mntProcessTaskFact = new MntProcessTaskFact();
        mntProcessTaskFact.setId(Integer.parseInt(id));
        List<MntProcessTaskFact> mntProcessTaskFactList = mntProcessTaskFactService.findMntProcessTaskFactList(mntProcessTaskFact);
        if(mntProcessTaskFactList != null && mntProcessTaskFactList.size() > 0) { //只会有一条数据
            model.addAttribute("mntProcessTaskFact", mntProcessTaskFactList.get(0));
        }
        return "inst/fact/inst_fact_info";
    }
}
