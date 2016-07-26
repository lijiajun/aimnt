package com.ai.mnt.web.log;

import java.io.BufferedOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.ai.mnt.common.util.LogParser;

@Controller
@RequestMapping("/parser")
public class LogParserController {
    
    private static Logger logger = Logger.getLogger(LogParserController.class);
    
    
    /**
     * 上传并解析ldd输出的库依赖信息并直接转换成Excel下载
     * 
     * @param model
     * @return
     */
    @RequiresPermissions("prod:operate")
    @RequestMapping("/ldd/down")
    public void parserLddLog(@RequestParam("file") MultipartFile file,
            HttpServletResponse response) {
        Map<String, Object> map = new HashMap<>();
        if (!file.isEmpty()) {
            try {
                String fileName = file.getOriginalFilename();
                
                if(fileName.indexOf(".") == -1 ) {
                    throw new Exception("上传文件格式有问题(仅支持txt或TXT文件)，请检查！");
                }
                String suffix = fileName.substring(fileName.indexOf(".")).replaceFirst(".", "");
                if(!"txt".equals(suffix) && !"TXT".equals(suffix)) {
                    throw new Exception("上传文件格式有问题(支持txt或TXT文件)，请检查！");
                }
                
                String outName = fileName.substring(0, fileName.lastIndexOf(".")) + ".xls";
                response.reset();
                response.addHeader("Content-Disposition", "attachment;filename=" + new String(outName.getBytes(), "iso-8859-1"));
                //response.addHeader("Content-Length", "" + file.getSize());
                response.setContentType("application/x-msdownload");
                
                InputStream inputStream = file.getInputStream();
                OutputStream os = new BufferedOutputStream(response.getOutputStream());
//                OutputStream os = response.getOutputStream();
                LogParser.downLddExcel(inputStream, os);
                
            } catch (Exception e) {
                e.printStackTrace();
                logger.error(e.getMessage());
                map.put("status", "0");
                map.put("error", "文件解析失败！" + e.getMessage());
                try {
                    OutputStream os = new BufferedOutputStream(response.getOutputStream());
                    os.write(("文件解析失败！" + e.getMessage()).getBytes());
                    os.flush();
                    os.close();
                } catch (IOException e1) {
                    // TODO Auto-generated catch block
                    e1.printStackTrace();
                }
            }
        }else {
            map.put("status", "0");
            map.put("error", "请选择需要上传解析的文件！");
            OutputStream os;
            try {
                os = new BufferedOutputStream(response.getOutputStream());
                os.write(("请选择需要上传解析的文件！").getBytes());
                logger.error("请选择需要上传解析的文件！");
                os.flush();
                os.close();
            } catch (IOException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
    }
    
    
}
