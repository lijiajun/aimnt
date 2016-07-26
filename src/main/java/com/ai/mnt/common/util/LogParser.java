package com.ai.mnt.common.util;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.log4j.Logger;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;

import com.ai.mnt.model.product.MntLibRelationExt;

public class LogParser {

    private static Logger logger = Logger.getLogger(LogParser.class);
    
    
    public static List<MntLibRelationExt> parserLddLibDependencyLog(InputStream is) throws Exception {
        
        InputStreamReader isReader = new InputStreamReader(is);
        BufferedReader bis = new BufferedReader(isReader, 1024 * 1024);
        
        //数据集合
        List<MntLibRelationExt> exts = new ArrayList<>();
        try {
            
            String line = "";
            String libName = "";
            int libCount = 0;
            while ((line = bis.readLine()) != null) {
                if (line.contains("ldd: Invalid file type:")
                        || "".equals(line.trim())) {
                    continue;
                }
                if (line.endsWith(":") || line.startsWith("LIBRARY_NAME")
                        || line.startsWith("EXECUTABLE_NAME")) {
                    // 无依赖的LIB
                    if (libCount == 0 && !"".equals(libName)) {
                        MntLibRelationExt ext = new MntLibRelationExt();
                        ext.setLibName(libName);
                        ext.setRelLibName("无");
                        exts.add(ext);
                    }
                    // 业务库
                    Pattern pattern = Pattern.compile("\\[(.*?)\\]");
                    Matcher m = pattern.matcher(line);
                    while (m.find()) {
                        libName = m.group(1).trim();
                    }
                    libCount = 0;
                } else {
                    // 依赖业务库
                    MntLibRelationExt ext = new MntLibRelationExt();
                    ext.setLibName(libName);
                    ext.setRelLibName(line.trim());
                    exts.add(ext);
                    libCount++;
                }
            }
        }catch (Exception e) {
            throw new Exception("上传文件解析出错，请检查！");
        }finally {
            if(bis != null) {
                try {
                    bis.close();
                } catch (IOException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                }
            }
            if(isReader != null) {
                try {
                    isReader.close();
                } catch (IOException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                }
            }
            if(is != null) {
                try {
                    is.close();
                } catch (IOException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                }
            }
        }
        
        return exts;
    }
    
    
    public static void downLddExcel(InputStream is, OutputStream os) throws Exception  {
        
        List<MntLibRelationExt> exts = parserLddLibDependencyLog(is);
        
        Workbook wb = new HSSFWorkbook();
        try {
            Sheet sheet = wb.createSheet("ldd_libdep");
            Row row = sheet.createRow(0);
            Cell cell = row.createCell(0);
            cell.setCellValue("库文件名称(必填)");
            Cell cell2 = row.createCell(1);
            cell2.setCellValue("依赖库名称(必填)");
            Cell cell3 = row.createCell(2);
            cell3.setCellValue("依赖描述");
            for (int i = 0; i < exts.size(); i++) {
                MntLibRelationExt ext = exts.get(i);
                row = sheet.createRow(i + 1);
                row.createCell(0).setCellValue(ext.getLibName());
                row.createCell(1).setCellValue(ext.getRelLibName());
                row.createCell(2).setCellValue(" ");
                
                logger.info(ext.getLibName() + "--->" + ext.getRelLibName());
                
            }
            logger.info("=====================================================");
            wb.write(os);
        } catch (IOException e) {
            e.printStackTrace();
        }finally {
            if(wb != null) {
                wb.close();
                os.flush();
                os.close();
            }
        }
    }
    
    
    public static void parserLibDependencyLog(String filePath) throws Exception {
        
        File file = new File(filePath);
        InputStream is = new FileInputStream(file);
        InputStreamReader isReader = new InputStreamReader(is);
        BufferedReader bis = new BufferedReader(isReader, 1024 * 1024);
        List<MntLibRelationExt> exts = new ArrayList<>();
        String line = "";
        String libName = "";
        int libCount = 0;
        while ((line = bis.readLine()) != null) {
            if (line.contains("ldd: Invalid file type:")
                    || "".equals(line.trim())) {
                continue;
            }
            if (line.endsWith(":") || line.startsWith("LIBRARY_NAME")
                    || line.startsWith("EXECUTABLE_NAME")) {
                // 无依赖的LIB
                if (libCount == 0 && !"".equals(libName)) {
                    MntLibRelationExt ext = new MntLibRelationExt();
                    ext.setLibName(libName);
                    ext.setRelLibName("无");
                    exts.add(ext);
                }
                // 业务库
                Pattern pattern = Pattern.compile("\\[(.*?)\\]");
                Matcher m = pattern.matcher(line);
                while (m.find()) {
                    libName = m.group(1).trim();
                }
                libCount = 0;
            } else {
                // 依赖业务库
                MntLibRelationExt ext = new MntLibRelationExt();
                ext.setLibName(libName);
                ext.setRelLibName(line.trim());
                exts.add(ext);
                libCount++;
            }
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
        for (int i = 0; i < exts.size(); i++) {
            MntLibRelationExt ext = exts.get(i);
            row = sheet.createRow(i + 1);
            row.createCell(0).setCellValue(ext.getLibName());
            row.createCell(1).setCellValue(ext.getRelLibName());
            row.createCell(2).setCellValue(" ");
            
            System.out.println(ext.getLibName() + "--->" + ext.getRelLibName());
        }
        FileOutputStream fileOut = new FileOutputStream(filePath.replaceAll(".txt", "").replaceAll(".TXT", "") + ".xls");
        wb.write(fileOut);
        wb.close();
        fileOut.close();
        
        logger.info("解析完成，生成excel成功！");
        
    }

    public static void main(String[] args) throws Exception {
        
        String filePath = "C:\\Users\\matrix\\Desktop\\帐处模块信息信息(初稿)\\帐处模块信息信息(初稿)\\帐处-NG-库依赖.txt";
        
        parserLibDependencyLog(filePath);
    }

}
