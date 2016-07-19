package com.ai.mnt.common.util;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;

import com.ai.mnt.model.product.MntLibRelationExt;

public class LogParser {

    
    public static void parserLibDependencyLog() throws Exception {
        
        
        File file = new File("E:\\zl\\yx\\运维平台\\数据导入\\帐处模块信息信息(初稿)\\帐处-NG-库依赖.txt");
        InputStream is = new FileInputStream(file);
        
        InputStreamReader isReader = new InputStreamReader(is);
        
        BufferedReader bis = new BufferedReader(isReader, 1024 * 1024);
        
        
        Map<String, List<String>> libsMap = new HashMap<>();
        
        
        List<MntLibRelationExt> exts = new ArrayList<>();
        
        
        String line = "";
        String libName = "";
        
        int libCount = 0;
        
        while((line = bis.readLine()) != null) {
            
            if(line.contains("ldd: Invalid file type:")) {
                continue;
            }
            
            if(line.endsWith(":") || line.startsWith("LIBRARY_NAME") || line.startsWith("EXECUTABLE_NAME")) {
                
                //无依赖的LIB
                if(libCount == 0 && !"".equals(libName)) {
                    MntLibRelationExt ext = new MntLibRelationExt();
                    ext.setLibName(libName);
                    ext.setRelLibName("无");
                    exts.add(ext);
                }
                
                //业务库
                Pattern pattern = Pattern.compile("\\[(.*?)\\]");
                Matcher m = pattern.matcher(line);
                while(m.find()) {
                    libName = m.group(1).trim();
                }
                libCount = 0;
            }else {
                //依赖业务库
                MntLibRelationExt ext = new MntLibRelationExt();
                ext.setLibName(libName);
                ext.setRelLibName(line.trim());
                exts.add(ext);
                libCount++;
            }
        }
        
        
        for(MntLibRelationExt ext : exts) {
            System.out.println(ext.getLibName() + "--->" + ext.getRelLibName());
        }
        
        bis.close();
        isReader.close();
        is.close();
        
        
        
        Workbook wb = new HSSFWorkbook();
        
        Sheet sheet = wb.createSheet("libdep");
        
        Row row = sheet.createRow(0);
        Cell cell = row.createCell(0);
        cell.setCellValue("库文件名称(必填)");
        Cell cell2 = row.createCell(1);
        cell2.setCellValue("依赖库名称(必填)");
        Cell cell3 = row.createCell(2);
        cell3.setCellValue("依赖描述");
        
        for(int i=0;i<exts.size();i++) {
        
            MntLibRelationExt ext = exts.get(i);
            row = sheet.createRow(i + 1);
            row.createCell(0).setCellValue(ext.getLibName());
            row.createCell(1).setCellValue(ext.getRelLibName());
            row.createCell(2).setCellValue(" ");
        }
        
        
        FileOutputStream fileOut = new FileOutputStream("E:\\zl\\yx\\运维平台\\数据导入\\帐处模块信息信息(初稿)\\依赖库.xls");
        wb.write(fileOut);
        wb.close();
        fileOut.close();
        
        
        
        
        
        
        
    }
    
    
    
    
    
    
    
    
    
    public static void main(String[] args) throws Exception {
        parserLibDependencyLog();
    }

}
