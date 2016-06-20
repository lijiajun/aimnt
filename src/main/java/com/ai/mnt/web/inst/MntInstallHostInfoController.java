package com.ai.mnt.web.inst;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ai.mnt.service.inst.MntInstallBaseInfoService;


@Controller
@RequestMapping("/inst")
public class MntInstallHostInfoController {

    @Autowired
    MntInstallBaseInfoService mntInstallBaseInfoService;
    
    /**
     * 安装点主机拓扑展示界面跳转
     * @return
     */
    @RequestMapping("/host/page")
    public String showHostInfoPage(Model model) {
        return "inst/host/inst_host_info";
    }
    

    /**
     * 安装点主机拓扑展示界面跳转
     * @return
     */
    @RequestMapping("/host/edit")
    public String showHostInfoEditPage(Model model) {
        return "inst/host/inst_host_edit";
    }
    
}
