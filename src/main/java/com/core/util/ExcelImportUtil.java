package com.core.util;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import java.io.InputStream;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by  liujs  2017/10/21
 */
public class ExcelImportUtil {
    private final static String excel2003L =".xls";
    private final static String excel2007U =".xlsx";

    /**
     * 描述：获取IO流中的数据，组装成List<List<Object>>对象
     * @param in,fileName
     * @return
     * @throws IOException
     */
    public List<List<Object>> getBankListByExcel(InputStream in, String fileName) throws Exception{
        List<List<Object>> list = null;

        //创建Excel工作薄
        Workbook work = this.getWorkbook(in,fileName);
        if(null == work){
            throw new Exception("创建Excel工作薄为空！");
        }
        Sheet sheet = null;
        Row row = null;
        Cell cell = null;

        list = new ArrayList<List<Object>>();
        //遍历Excel中所有的sheet
        for (int i = 0; i < work.getNumberOfSheets(); i++) {
            sheet = work.getSheetAt(i);
            if(sheet==null){continue;}

            //遍历当前sheet中的所有行
            for (int j = sheet.getFirstRowNum(); j < sheet.getLastRowNum(); j++) {
                row = sheet.getRow(j);
                if(row==null||row.getFirstCellNum()==j){continue;}

                //遍历所有的列
                List<Object> li = new ArrayList<Object>();
                for (int y = row.getFirstCellNum(); y < row.getLastCellNum(); y++) {
                    cell = row.getCell(y);
                    li.add(this.getCellValue(cell));
                }
                list.add(li);
            }
        }
        work.close();
        return list;
    }


    /**
     * 描述：获取IO流中的数据，组装成List<List<Object>>对象
     * @param in,fileName
     * @return
     * @throws IOException
     * */
    public  List<Map<String,Object>> getBankListMapByExcel(InputStream in, String fileName) throws Exception{

        //创建Excel工作薄
        Workbook work = this.getWorkbook(in,fileName);
        if(null == work){
            throw new Exception("创建Excel工作薄为空！");
        }
        Sheet sheet = null;
        Row row = null;
        Cell cell = null;

        List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
        List<String> heardList = new ArrayList<>();

        //遍历Excel中所有的sheet
        for (int i = 0; i < work.getNumberOfSheets(); i++) {
            sheet = work.getSheetAt(i);
            if(sheet == null){continue;}

            //获取第一行
            row = sheet.getRow(1);
            if (row == null){continue;}
            for (int c = row.getFirstCellNum();c< row.getLastCellNum();c++) {
                heardList.add(row.getCell(c).toString());
            }

            //遍历当前sheet中的所有行忽略第一行表头
            for (int j = sheet.getFirstRowNum()+2; j <= sheet.getLastRowNum(); j++) {
                row = sheet.getRow(j);
                if(row==null){continue;}
                //遍历所有的列
                Map<String,Object> map = new HashMap<>();
                for (int y = row.getFirstCellNum(); y < row.getLastCellNum(); y++) {
                    if (!this.getCellValue(row.getCell(y)).equals("")) {
                        map.put(heardList.get(y), this.getCellValue(row.getCell(y)));
                    }
                }
                list.add(map);
            }
        }
        work.close();
        return list;
    }


    /**
     * 描述：根据文件后缀，自适应上传文件的版本
     * @param inStr,fileName
     * @return
     * @throws Exception
     */
    public  Workbook getWorkbook(InputStream inStr,String fileName) throws Exception{
        Workbook wb = null;
        String fileType = fileName.substring(fileName.lastIndexOf("."));
        if(excel2003L.equals(fileType)){
            wb = new HSSFWorkbook(inStr);
        }else if(excel2007U.equals(fileType)){
            wb = new XSSFWorkbook(inStr);
        }else{
            throw new Exception("解析的文件格式有误！");
        }
        return wb;
    }

    /**
     * 描述：对表格中数值进行格式化
     * @param cell
     * @return
     */
    public  Object getCellValue(Cell cell){
        Object value = null;
        DecimalFormat df = new DecimalFormat("0");
        SimpleDateFormat sdf = new SimpleDateFormat("yyy-MM-dd");
        DecimalFormat df2 = new DecimalFormat("0.00");
        if (cell==null){
            return "";
        }


        switch (cell.getCellType()) {
            case Cell.CELL_TYPE_STRING:
                value = cell.getRichStringCellValue().getString();
                break;
            case Cell.CELL_TYPE_NUMERIC:
                if("General".equals(cell.getCellStyle().getDataFormatString())){
                    value = df.format(cell.getNumericCellValue());
                }else if("m/d/yy".equals(cell.getCellStyle().getDataFormatString())){
                    value = sdf.format(cell.getDateCellValue());
                }else{
                    value = df2.format(cell.getNumericCellValue());
                }
                break;
            case Cell.CELL_TYPE_BOOLEAN:
                value = cell.getBooleanCellValue();
                break;
            case Cell.CELL_TYPE_BLANK:
                value = "";
                break;
            default:
                break;
        }
        return value;
    }

}
