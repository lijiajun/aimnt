package com.ai.mnt.common.util;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;
import org.apache.poi.xssf.usermodel.XSSFFont;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

/**
 * Title: base tool 
 * Description: Excel operate Company: AI
 * @author H
 * @version 1.0
 */
public class ExcelUtil {

    private static Logger logger = Logger.getLogger(ExcelUtil.class);

    /**
     * Workbook Create
     * @param is
     * @return
     * @throws Exception
     */
    public static Workbook getWorkBook(InputStream is) throws Exception {
        Workbook wb = null;
        try {
            wb = WorkbookFactory.create(is);
        } catch (Exception e) {
            e.printStackTrace();
            logger.error("Excel WorkBook 读取失败！ " + e.getMessage());
            throw new Exception("Excel WorkBook 读取失败！ ");
        }
        return wb;
    }

    /**
     * Workbook Create
     * @param fileName
     * @return
     * @throws Exception
     */
    public Workbook getWorkBook(String fileName) throws Exception {
        Workbook wb = null;
        try {
            wb = WorkbookFactory.create(new File(fileName));
        } catch (Exception e) {
            e.printStackTrace();
            logger.error("Excel WorkBook 读取失败！ " + e.getMessage());
            throw new Exception("Excel WorkBook 读取失败！ ");
        }
        return wb;
    }

    /**
     * 获取excel数据
     * @param is
     * @return
     * @throws Exception
     */
    public static Map<String, List<List<String>>> readExcelToList(InputStream is) throws Exception {
        Map<String, List<List<String>>> excelMap = new HashMap<>();
        Workbook wb = getWorkBook(is);;
        try {
            int sheetCount = wb.getNumberOfSheets();
            for(int i=0; i<sheetCount; i++) {
                List<List<String>> rowList = new ArrayList<>();
                Sheet sheet = wb.getSheetAt(i);
                for (Row row : sheet) {
                    List<String> cellList = new ArrayList<>();
                    for (Cell cell : row) {
                        cellList.add(getCellValue(cell));
                    }
                    rowList.add(cellList);
                }
                excelMap.put(sheet.getSheetName(), rowList);
            }
        } catch (Exception e) {
            e.printStackTrace();
            logger.error("Excel WorkBook 读取失败！ " + e.getMessage());
            throw new Exception("EXCEL 数据读取错误！");
        }finally {
            if(wb != null) {
                try {
                    wb.close();
                } catch (IOException e) {
                    e.printStackTrace();
                    logger.error("Excel WorkBook 关闭失败！ " + e.getMessage());
                    throw new Exception("EXCEL 数据读取错误！");
                }
            }
        }
        return excelMap;
    }
    
    /**
     * 获取对应的sheet索引数据
     * @param is
     * @param sheetNum
     * @return
     * @throws Exception
     */
    public static List<List<String>> readExcelToListBySheetIndex(InputStream is, int sheetIndex) throws Exception {
        List<List<String>> rowList = new ArrayList<>();
        Workbook wb = getWorkBook(is);
        try {
            Sheet sheet = wb.getSheetAt(sheetIndex);
            for (Row row : sheet) {
                List<String> cellList = new ArrayList<>();
                for (Cell cell : row) {
                    cellList.add(getCellValue(cell));
                }
                rowList.add(cellList);
            }
        } catch (Exception e) {
            e.printStackTrace();
            logger.error("Excel WorkBook 读取失败！ " + e.getMessage());
            throw new Exception("EXCEL 数据读取错误！");
        }finally {
            if(wb != null) {
                try {
                    wb.close();
                } catch (IOException e) {
                    e.printStackTrace();
                    logger.error("Excel WorkBook 读取失败！ " + e.getMessage());
                    throw new Exception("EXCEL 数据读取错误！");
                }
            }
        }
        return rowList;
    }
    
    /**
     * 获取sheet 名称对应的数据集
     * @param is
     * @param sheetNum
     * @return
     * @throws Exception
     */
    public static List<List<String>> readExcelToListBySheetIndex(InputStream is, String sheetName) throws Exception {
        List<List<String>> rowList = new ArrayList<>();
        Workbook wb = getWorkBook(is);
        try {
            Sheet sheet = wb.getSheet(sheetName);
            if(sheet == null) {
                throw new Exception(sheetName + " 不存在,请检查导入的EXCEL！");
            }
            for (Row row : sheet) {
                List<String> cellList = new ArrayList<>();
                for (Cell cell : row) {
                    cellList.add(getCellValue(cell));
                }
                rowList.add(cellList);
            }
        } catch (Exception e) {
            e.printStackTrace();
            logger.error("Excel WorkBook 读取失败！ " + e.getMessage());
            throw new Exception("EXCEL 数据读取错误！" + e.getMessage());
        }finally {
            if(wb != null) {
                try {
                    wb.close();
                } catch (IOException e) {
                    e.printStackTrace();
                    logger.error("Excel WorkBook 读取失败！ " + e.getMessage());
                    throw new Exception("EXCEL 数据读取错误！");
                }
            }
        }
        return rowList;
    }

    /**
     * Cell value
     * @param cell
     * @return
     */
    private static String getCellValue(Cell cell) {
        String cellValue = "";
        switch (cell.getCellType()) {
        case Cell.CELL_TYPE_STRING:
            cellValue = cell.getRichStringCellValue().getString();
            break;
        case Cell.CELL_TYPE_NUMERIC:
            if (org.apache.poi.ss.usermodel.DateUtil.isCellDateFormatted(cell)) {
                cellValue = DateUtil.dateToStringShort(cell.getDateCellValue());
            } else {
                cellValue = String.valueOf(cell.getNumericCellValue());
            }
            break;
        case Cell.CELL_TYPE_BOOLEAN:
            cellValue = String.valueOf(cell.getBooleanCellValue());
            break;
        case Cell.CELL_TYPE_FORMULA:
            cellValue = String.valueOf(cell.getCellFormula());
            break;
        default:
            cellValue = "";
        }
        return cellValue;
    }
    
    /**
     * 将数据写入到Excel文件
     * @param filePath 文件路径
     * @param sheetName 工作表名称
     * @param title 工作表标题栏
     * @param data 工作表数据
     * @throws FileNotFoundException 文件不存在异常
     * @throws IOException IO异常
     */
    public static void writeToFile(String filePath,String[] sheetName,List<? extends Object[]> title,List<? extends List<? extends Object[]>> data) throws FileNotFoundException, IOException{
        //创建并获取工作簿对象
        Workbook wb=getWorkBook( sheetName, title, data);
        //写入到文件
        FileOutputStream out=new FileOutputStream(filePath);
        wb.write(out);
        out.close();
    }
     
    /**
     * 创建工作簿对象<br>
     * <font color="red">工作表名称，工作表标题，工作表数据最好能够对应起来</font><br>
     * 比如三个不同或相同的工作表名称，三组不同或相同的工作表标题，三组不同或相同的工作表数据<br>
     * <b>
     * 注意：<br>
     * 需要为每个工作表指定<font color="red">工作表名称，工作表标题，工作表数据</font><br>
     * 如果工作表的数目大于工作表数据的集合，那么首先会根据顺序一一创建对应的工作表名称和数据集合，然后创建的工作表里面是没有数据的<br>
     * 如果工作表的数目小于工作表数据的集合，那么多余的数据将不会写入工作表中
     * </b>
     * @param sheetName 工作表名称的数组
     * @param title 每个工作表名称的数组集合
     * @param data 每个工作表数据的集合的集合
     * @return Workbook工作簿
     * @throws FileNotFoundException 文件不存在异常
     * @throws IOException IO异常
     */
    public static Workbook getWorkBook(String[] sheetName,List<? extends Object[]> title,List<? extends List<? extends Object[]>> data) throws FileNotFoundException, IOException{
         
        //创建工作簿，支持2007及以后的文档格式
        Workbook wb = new XSSFWorkbook();
        //创建一个工作表sheet
        Sheet sheet = null;
        //申明行
        Row row = null;
        //申明单元格
        Cell cell = null;
        //单元格样式
        CellStyle titleStyle=wb.createCellStyle();
        CellStyle cellStyle=wb.createCellStyle();
        //字体样式
        Font font=wb.createFont();
        //粗体
        font.setBoldweight(XSSFFont.BOLDWEIGHT_BOLD);
        titleStyle.setFont(font);
        //水平居中  
        titleStyle.setAlignment(CellStyle.ALIGN_CENTER);
        //垂直居中  
        titleStyle.setVerticalAlignment(CellStyle.VERTICAL_CENTER);
         
        //水平居中  
        cellStyle.setAlignment(CellStyle.ALIGN_CENTER);
        //垂直居中  
        cellStyle.setVerticalAlignment(CellStyle.VERTICAL_CENTER);
         
        //标题数据
        Object[] title_temp=null;
         
        //行数据
        Object[] rowData=null;
         
        //工作表数据
        List<? extends Object[]> sheetData=null;
         
        //遍历sheet
        for(int sheetNumber=0;sheetNumber<sheetName.length;sheetNumber++){
            //创建工作表
            sheet=wb.createSheet();
            //设置工作表名称
            wb.setSheetName(sheetNumber, sheetName[sheetNumber]);
            //设置标题
            title_temp=title.get(sheetNumber);
            row=sheet.createRow(0);
 
            //写入标题
            for(int i=0;i<title_temp.length;i++){
                cell=row.createCell(i);
                cell.setCellStyle(titleStyle);
                cell.setCellValue(title_temp[i].toString());
            }
             
            try {
                sheetData=data.get(sheetNumber);
            } catch (Exception e) {
                continue;
            }
            //写入行数据
            for(int rowNumber=0;rowNumber<sheetData.size();rowNumber++){
                //如果没有标题栏，起始行就是0，如果有标题栏，行号就应该为1
                row=sheet.createRow(title_temp==null?rowNumber:(rowNumber+1));
                rowData=sheetData.get(rowNumber);
                for(int columnNumber=0;columnNumber<rowData.length;columnNumber++){
                    cell=row.createCell(columnNumber);
                    cell.setCellStyle(cellStyle);
                    cell.setCellValue(rowData[columnNumber].toString());
                }
            }
        }
        return wb;
    }
    
    
    

}
