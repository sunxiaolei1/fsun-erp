package cn.com.fsun.common.excel;

import java.beans.IntrospectionException;
import java.beans.PropertyDescriptor;
import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.DateUtil;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import cn.com.fsun.common.constants.ExcelConstants;

public class ExcelUtil {
	
	
	/**
	 * 通过反射获取子类确定的泛型类
	 
	public <T> ExcelUtil(Class<T> clazz) {
		Field[] fields = clazz.getDeclaredFields();
		System.out.println(fields.length);
	}*/
	
	
	public static <T> void main(String[] args) {
		ExcelUtil testExcel = new ExcelUtil();
		try {
			/***导入测试*/
			// Map<String, List<Map<String, Object>>> ml = testExcel.readExcel(new FileInputStream(new File("E:/1.xlsx")));
			//InputStream is = new FileInputStream(new File("E:/1.xlsx"));
			// 测试 1
			/*String[] names = new String[] { "name", "api_order_id", "order_id", "start_time", "money" };
			System.out.println("names:" + names.length);
			Map<String, List<Map<String, Object>>> ml = testExcel.readExcel(is, names,1);
			for (Map.Entry<String, List<Map<String, Object>>> map : ml.entrySet()) {
				System.out.println(map.getKey());
				List<Map<String, Object>> lm = map.getValue();
				for (int j = 0; j < lm.size(); j++) {
					System.out.println(lm.get(j));
				}
			}
			
			Workbook wb=testExcel.writeExcel(ml,null);
			FileOutputStream fileOut = new FileOutputStream("E:/workbook.xls");
			wb.write(fileOut);
			fileOut.close();*/
			
			// 测试 2
			/*Map<String, List<Object[]>> ml = testExcel.readExcel(is,0);
			for (Map.Entry<String, List<Object[]>> map : ml.entrySet()) {
				String key = map.getKey();
				System.out.println("key:" + key);
				List<Object[]> lo = map.getValue();
				for (int j = 0; j < lo.size(); j++) {
					Object[] obj = lo.get(j);
					for (int x = 0; x < obj.length; x++) {
						System.out.println(obj[x]);
					}
				}
			}
			String[] columnName=new String[]{"id","count","ip","failCount","password","username"};
			InputStream is = new FileInputStream(new File("E:/workbookT.xls"));
			testExcel.readExcel2(is, columnName, 2, UserDto.class);
			*/
			
			/***导出测试
			HashMap<String,String> header = new HashMap<String,String>();
			header.put("id", "id");
			header.put("code", "数量");
			header.put("realname", "网络地址");
			header.put("email", "失败次数");
			header.put("password", "密码");
			header.put("username", "用户名");
			
			List<UserDto> lt=new ArrayList<UserDto>();
			UserDto bean=new UserDto();
			bean.setId("111111111");
			bean.setCode("100");
			bean.setEmail("127.0.0.1");
			bean.setRealname("0");
			bean.setPassword("123456");
			bean.setUsername("admin");
			lt.add(bean);
			UserDto bean2=new UserDto();
			bean2.setId("22222222");
			bean2.setEmail("1002");
			bean2.setRealname("127.0.0.1");
			bean2.setCode("2");
			bean2.setPassword("1234562");
			bean2.setUsername("admin2");
			lt.add(bean2);
			Map<String,List<UserDto>> map=new HashMap<String, List<UserDto>>();
			map.put("sheet", lt);
			
			//测试3（不带排序）
//			Workbook wb=testExcel.writeExcel3(map, null,2,header,UserDto.class);
			//测试4（带排序）
			Workbook wb=testExcel.writeExcel4("sheet",lt,2,header,UserDto.class);
			FileOutputStream fileOut = new FileOutputStream("E:/workbookT.xls");
			wb.write(fileOut);
			fileOut.close();
			*/
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 
	 * @description 字段不排序的情况
	 * @return void
	 * @param sheet
	 * @param header
	 * @param c
	 * @update 2013-8-12
	 */
	public static <T> void buildHeader2(HSSFSheet sheet,Map header,Class<T> c){
		// Header字体   
        Font font = sheet.getWorkbook().createFont();   
        font.setBoldweight((short)Font.BOLDWEIGHT_BOLD); 


        // 单元格样式   
        HSSFCellStyle headerCellStyle = sheet.getWorkbook()   
                .createCellStyle();  
        
        headerCellStyle.setAlignment(CellStyle.ALIGN_CENTER);   
        headerCellStyle.setVerticalAlignment(CellStyle.VERTICAL_CENTER);   
        headerCellStyle.setWrapText(true);   
        headerCellStyle.setFont(font);   
        headerCellStyle.setBorderBottom(CellStyle.BORDER_THIN); 
        headerCellStyle.setBorderLeft(CellStyle.BORDER_THIN); 
        headerCellStyle.setBorderRight(CellStyle.BORDER_THIN); 
        headerCellStyle.setBorderTop(CellStyle.BORDER_THIN);

        // 创建字段标题   
        HSSFRow rowHeader = sheet.createRow((short)1);   
        rowHeader.setHeight((short) 500);  
        
        Field[] fields = c.getDeclaredFields();
        int k=0;
        for (int j = k; j < fields.length; j++) {
        	 if(!header.containsKey(fields[j].getName())){
        		 continue;
        	 }
        	 HSSFCell cell1 = rowHeader.createCell((short)k + 0); 
        	 String fieldName = (String)header.get(fields[j].getName());
        	 cell1.setCellValue(fieldName);   
        	 cell1.setCellStyle(headerCellStyle);   
        	 k++;
        }
	}
	
	/**
	 * 
	 * @description 字段排序的情况
	 * @return void
	 * @param sheet
	 * @param header
	 * @param c
	 * @update 2013-8-12
	 */
	public static <T> void buildHeader(HSSFSheet sheet,Map<String,String> header,Class<T> c){
		// Header字体   
        Font font = sheet.getWorkbook().createFont();   
        font.setBoldweight((short)Font.BOLDWEIGHT_BOLD); 


        // 单元格样式   
        HSSFCellStyle headerCellStyle = sheet.getWorkbook()   
                .createCellStyle();  
        
        headerCellStyle.setAlignment(CellStyle.ALIGN_CENTER);   
        headerCellStyle.setVerticalAlignment(CellStyle.VERTICAL_CENTER);   
        headerCellStyle.setWrapText(true);   
        headerCellStyle.setFont(font);   
        headerCellStyle.setBorderBottom(CellStyle.BORDER_THIN); 
        headerCellStyle.setBorderLeft(CellStyle.BORDER_THIN); 
        headerCellStyle.setBorderRight(CellStyle.BORDER_THIN); 
        headerCellStyle.setBorderTop(CellStyle.BORDER_THIN);

        // 创建字段标题   
        HSSFRow rowHeader = sheet.createRow((short)0);   
        rowHeader.setHeight((short) 500);  
        sheet.setDefaultColumnWidth(18);
        List<Field> fields = Arrays.asList(c.getDeclaredFields());
		List<String> fieldNames = packgeFieldName(fields);
        int k=0;
        for (int i = 0; i < fieldNames.size(); i++) {
        	if(header.containsKey(fieldNames.get(i))){
        		HSSFCell cell1 = rowHeader.createCell((short)k + 0); 
	        	String fieldName = (String)header.get(fieldNames.get(i));
	        	cell1.setCellValue(fieldName);   
	        	cell1.setCellStyle(headerCellStyle);   
	        	k++;
        	}
		}
	}
	
	/**
	 * @description 字段排序的情况
	 * @return Workbook
	 * @param sheetName 表格名称
	 * @param list
	 * @param lineIndex 从第几行开始
	 * @param header 标题行
	 * @param c
	 * @return
	 * @throws IntrospectionException 
	 * @throws InvocationTargetException 
	 * @throws IllegalAccessException 
	 * @throws IllegalArgumentException 
	 * @update 2013-8-12
	 */
	public <T> Workbook writeExcel4(String sheetName,List<T> list,int lineIndex,Map<String,String> header,Class<?> c) throws Exception {
		HSSFWorkbook wb= new HSSFWorkbook();
		if(list==null){
			return null;
		}
		HSSFSheet sheet = wb.createSheet(sheetName);
		this.buildHeader(sheet, header, c);
		List<Field> fields = Arrays.asList(c.getDeclaredFields());
		List<String> fieldNames = packgeFieldName(fields);
		
		Row row = null;
		Object obj = null;		
		
		T t  = null;
		int k =0;
		for (int i = 0; i < list.size(); i++) {
			t = list.get(i);
			row=sheet.createRow(lineIndex+i);
			k =0;
			for (int tt = 0; tt < fieldNames.size(); tt++) {
	        	if(header.containsKey(fieldNames.get(tt))){
					obj = new PropertyDescriptor(fieldNames.get(tt), c).getReadMethod().invoke(t);											
					row.createCell(k).setCellValue(obj!=null?String.valueOf(obj):"");
					k++;
	        	}
			}
		}
		return  wb;
	}
	
	public static List<String> packgeFieldName(List<Field> fields){
		List<String> fieldNames = new ArrayList<String>();
		for(Field field : fields){
			fieldNames.add(field.getName());
		}
		return fieldNames;
	}
	
	/**
	 * @description 字段不排序的情况
	 * @return Workbook
	 * @param ml
	 * @param suffix
	 * @param lineIndex
	 * @param header
	 * @param c
	 * @return
	 * @update 2013-8-12
	 */
	
	public <T> Workbook writeExcel3(Map<String,List<T>> ml, String suffix,int lineIndex,Map header,Class<?> c) {
		HSSFWorkbook wb= new HSSFWorkbook();
		if(ml==null){
			return null;
		}
		
		HSSFSheet sheet = wb.createSheet("sheet");
		
		this.buildHeader(sheet, header, c);
		
		for (Map.Entry<String, List<T>> map : ml.entrySet()) {
			String key = map.getKey();
//			Sheet sheet=wb.createSheet(key);
			List<T> list = map.getValue();
			for (int i = 0; i < list.size(); i++) {
				T t = list.get(i);
//				Class<?> c = t.getClass();
				Field[] fields = c.getDeclaredFields();
				Row row=sheet.createRow(lineIndex+i);
				int k=0;
				for (int j = k; j < fields.length; j++) {
					try {
//						String fieldName = (String)header.get(fields[j].getName());
						if(!header.containsKey(fields[j].getName())){
							continue;
						}
						PropertyDescriptor pd = new PropertyDescriptor(fields[j].getName(), c);
						Method method = pd.getReadMethod(); //get 读
						// Method method = pd.getWriteMethod();//set 写
						Object obj = method.invoke(t);
						String cellValue=String.valueOf(obj);
						Cell cell=row.createCell(k);
						if("null".equals(cellValue)){
							cell.setCellValue("");
						}else{
							cell.setCellValue(String.valueOf(obj));
						}
						k++;
						//System.out.println(obj+"j:"+j);
					} catch (Exception e) {
						e.printStackTrace();
						return null;
					}
				}
			}
		}
		return  wb;
	}

	/**
	 * @description 用一句话说明这个方法做什么
	 * @return Workbook
	 * @param ml
	 * @param suffix
	 * @param lineIndex
	 * @return
	 * @update 2013-8-12
	 */
	 
	public <T> Workbook writeExcel2(Map<String,List<T>> ml, String suffix,int lineIndex) {
		Workbook wb=null;
		if(ml==null){
			return null;
		}
		if(null!=suffix && suffix.endsWith("xlsx")){
			//xlsx
			wb=new XSSFWorkbook();
		}else{
			wb=new HSSFWorkbook();
			//xls
		}
		for (Map.Entry<String, List<T>> map : ml.entrySet()) {
			String key = map.getKey();
			Sheet sheet=wb.createSheet(key);
			List<T> list = map.getValue();
			for (int i = 0; i < list.size(); i++) {
				T t = list.get(i);
				Class<?> c = t.getClass();
				Field[] fields = c.getDeclaredFields();
				Row row=sheet.createRow(lineIndex+i);
				for (int j = 0; j < fields.length; j++) {
					try {
						PropertyDescriptor pd = new PropertyDescriptor(fields[j].getName(), c);
						Method method = pd.getReadMethod(); //get 读
						// Method method = pd.getWriteMethod();//set 写
						Object obj = method.invoke(t);
						String cellValue=String.valueOf(obj);
						Cell cell=row.createCell(j);
						if("null".equals(cellValue)){
							cell.setCellValue("");
						}else{
							cell.setCellValue(String.valueOf(obj));
						}
						//System.out.println(obj+"j:"+j);
					} catch (Exception e) {
						e.printStackTrace();
						return null;
					}
				}
			}
		}
		return  wb;
	}
	
	
	/**
	 * @description 用一句话说明这个方法做什么
	 * @return Workbook
	 * @param ml
	 * @param suffix
	 * @param lineIndex
	 * @return
	 * @update 2013-8-12
	 */
	public Workbook writeExcel(Map<String, List<Map<String, Object>>> ml,String suffix,int lineIndex){
		Workbook wb=null;
		if(ml==null){
			return null;
		}
		if(null!=suffix && suffix.endsWith("xlsx")){
			//xlsx
			wb=new XSSFWorkbook();
		}else{
			wb=new HSSFWorkbook();
			//xls
		}
		for (Map.Entry<String, List<Map<String, Object>>> map : ml.entrySet()) {
			String key=map.getKey();
			Sheet sheet=wb.createSheet(key);
			List<Map<String, Object>> lm=map.getValue();
			for(int i=0;i<lm.size();i++){
				Row row=sheet.createRow(lineIndex+i);
				Map<String,Object> mapCell=lm.get(i);
				int colume=0;
				for(Object value:mapCell.values()){
					Cell cell=row.createCell(colume);
					if(value instanceof java.util.Date || value instanceof java.sql.Date){ //日期转换
						try {
							cell.setCellValue(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(value.toString()));
						} catch (ParseException e) {
							e.printStackTrace();
						}
					}else if(value instanceof Integer){ //数字转换
						cell.setCellValue((Integer)value);
					}else{
						cell.setCellValue(String.valueOf(value)); //其他转换成String
					}
					colume++;
				}
			}
		}
		return wb;
	}
	


	/**
	 * @description 读取xls,xlsx
	 * @return Map<String,List<Object[]>>
	 * @param is
	 * @param readline
	 * @return
	 * @update 2013-8-12
	 */
	public Map<String, List<Object[]>> readExcel(InputStream is,int readline) {
		Workbook wb = null;
		Map<String, List<Object[]>> mapList = null;
		List<Object[]> listArray = null;
		Object[] values = null;
		try {
			// 创建workbook对象
			wb = WorkbookFactory.create(is);
			// 获取sheet页数
			int Sheets = wb.getNumberOfSheets();
			if (Sheets > 0) {
				mapList = new HashMap<String, List<Object[]>>();
			}
			for (int i = 0; i < Sheets; i++) {
				// 每一页
				listArray = new ArrayList<Object[]>();
				// 创建sheet
				Sheet sheet = wb.getSheetAt(i);
				// 总行数
				int rowNum = sheet.getLastRowNum();
				System.out.println("rowNum:" + rowNum);
				for (int j = readline; j < rowNum; j++) {
					// 行
					Row row = sheet.getRow(j);
					// cess
					int cessNum = row.getLastCellNum();
					// 每一行
					values = new Object[cessNum]; // 列数

					//System.out.println("cessNum:" + cessNum);
					for (int x = 0; x < cessNum; x++) {
						Cell cell = row.getCell(x);
						// 判断类型
						switch (cell.getCellType()) {

						case Cell.CELL_TYPE_STRING:
							values[x] = cell.getRichStringCellValue().getString();
							break;
						case Cell.CELL_TYPE_NUMERIC:
							if (DateUtil.isCellDateFormatted(cell)) {
								values[x] = cell.getDateCellValue();
							} else {
								values[x] = cell.getNumericCellValue();
							}
							break;
						case Cell.CELL_TYPE_BOOLEAN:
							values[x] = cell.getBooleanCellValue();
							break;
						case Cell.CELL_TYPE_FORMULA:
							values[x] = cell.getCellFormula();
							break;
						default:
							values[x] = "";
						}
					}
					listArray.add(values);
				}
				mapList.put(wb.getSheetName(i), listArray);
			}
			return mapList;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}finally{
			if (is != null) {
				try {
					is.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}

	/**
	 * @description 读取xls,xlsx（读取指定name的字段）
	 * @return Map<String,List<Map<String,Object>>>
	 * @param is
	 * @param names
	 * @param readline
	 * @return
	 * @update 2013-8-12
	 */
	public Map<String, List<Map<String, Object>>> readExcel(InputStream is, String[] names, int readline) {
		Workbook wb = null;
		Map<String, List<Map<String, Object>>> mapList = null;
		List<Map<String, Object>> listMap = null;
		Map<String, Object> map = null;
		try {
			// 创建workbook对象
			wb = WorkbookFactory.create(is);
			// 获取sheet页数
			int Sheets = wb.getNumberOfSheets();
			if (Sheets > 0) {
				mapList = new HashMap<String, List<Map<String, Object>>>();
			}
			for (int i = 0; i < Sheets; i++) {
				// 每一页
				listMap = new ArrayList<Map<String, Object>>();
				// 创建sheet
				Sheet sheet = wb.getSheetAt(i);
				// 总行数
				int rowNum = sheet.getLastRowNum();
				System.out.println("rowNum:" + rowNum);
				for (int j = readline; j < rowNum; j++) {
					// 每一行
					map = new HashMap<String, Object>();
					// 行
					Row row = sheet.getRow(j);
					// cess
					int cessNum = row.getLastCellNum();
					
					//System.out.println("cessNum:" + cessNum);
					for (int x = 0; x < cessNum; x++) {
						Cell cell = row.getCell(x);
						// 判断类型
						switch (cell.getCellType()) {

						case Cell.CELL_TYPE_STRING:
							map.put(names[x], cell.getRichStringCellValue().getString());
							break;
						case Cell.CELL_TYPE_NUMERIC:
							if (DateUtil.isCellDateFormatted(cell)) {
								map.put(names[x], cell.getDateCellValue());
							} else {
								map.put(names[x], cell.getNumericCellValue());
							}
							break;
						case Cell.CELL_TYPE_BOOLEAN:
							map.put(names[x], cell.getBooleanCellValue());
							break;
						case Cell.CELL_TYPE_FORMULA:
							map.put(names[x], cell.getCellFormula());
							break;
						default:
							map.put(names[x], null);
						}
					}
					listMap.add(map);
				}
				mapList.put(wb.getSheetName(i), listMap);
			}
			return mapList;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}finally{
			if (is != null) {
				try {
					is.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}

	/**
	 * @description 反射
	 * @return Map<String,List<T>>
	 * @param is
	 * @param names
	 * @param readline
	 * @param bean
	 * @return
	 * @update 2013-8-12
	 */
	public <T> Map<String, List<T>>  readExcel(InputStream is,String[] names, int readline,Class<T> bean){
		Workbook wb = null;
		Map<String, List<T>> mapList = null;
		List<T> listMap = null;
		T t = null;
		try {
			// 创建workbook对象
			wb = WorkbookFactory.create(is);
			// 获取sheet页数
			int Sheets = wb.getNumberOfSheets();
			if (Sheets > 0) {
				mapList = new HashMap<String, List<T>>();
			}
			for (int i = 0; i < Sheets; i++) {
				// 每一页
				listMap = new ArrayList<T>();
				// 创建sheet
				Sheet sheet = wb.getSheetAt(i);
				// 总行数
				int rowNum = sheet.getLastRowNum();
				System.out.println("rowNum:" + rowNum);
				for (int j = readline; j < rowNum; j++) {
					// 每一行
					t = bean.newInstance(); //bean
					// 行
					Row row = sheet.getRow(j);
					// cess
					int cessNum = row.getLastCellNum();
					
					//System.out.println("cessNum:" + cessNum);
					for (int x = 0; x < cessNum; x++) {
						Cell cell = row.getCell(x);
						PropertyDescriptor propertyDes=new PropertyDescriptor(names[x], t.getClass());
						Method method=propertyDes.getWriteMethod();
						// 判断类型
						switch (cell.getCellType()) {

						case Cell.CELL_TYPE_STRING:
							method.invoke(t, cell.getRichStringCellValue().getString());
							break;
						case Cell.CELL_TYPE_NUMERIC:
							if (DateUtil.isCellDateFormatted(cell)) {
								method.invoke(t, cell.getDateCellValue());
							} else {
								method.invoke(t, cell.getNumericCellValue());
							}
							break;
						case Cell.CELL_TYPE_BOOLEAN:
							method.invoke(t, cell.getBooleanCellValue());
							break;
						case Cell.CELL_TYPE_FORMULA:
							method.invoke(t, cell.getCellFormula());
							break;
						default:
							//map.put(names[x], null);
						}
					}
					listMap.add(t);
				}
				mapList.put(wb.getSheetName(i), listMap);
			}
			return mapList;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}finally{
			if (is != null) {
				try {
					is.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}
	
	/**
	 * @description 反射
	 * @return Map<String,List<T>>
	 * @param is
	 * @param names
	 * @param readline
	 * @param bean
	 * @return
	 * @update 2013-8-12
	 */
	public <T> List<T>  readExcel2(InputStream is,String[] names, int readline,Class<T> bean){
		Workbook wb = null;
		List<T> listMap = null;
		T t = null;
		try {
			// 创建workbook对象
			wb = WorkbookFactory.create(is);
			// 获取sheet页数
			int Sheets = wb.getNumberOfSheets();
			if (Sheets <= 0) {
				return null;
			}
			for (int i = 0; i < Sheets; i++) {
				// 每一页
				listMap = new ArrayList<T>();
				// 创建sheet
				Sheet sheet = wb.getSheetAt(i);
				// 总行数
				int rowNum = sheet.getLastRowNum()+1;
				System.out.println("rowNum:" + rowNum);
				for (int j = readline; j < rowNum; j++) {
					// 每一行
					t = bean.newInstance(); //bean
					// 行
					Row row = sheet.getRow(j);
					// cess
					int cessNum = row.getLastCellNum();
					for (int x = 0; x < cessNum; x++) {
						Cell cell = row.getCell(x);
						String cellValue = ConvertCellStr(cell);
						BeanUtils.setProperty(t, names[x],cellValue);
					}
					listMap.add(t);
				}
			}
			return listMap;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}finally{
			if (is != null) {
				try {
					is.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}
	
	/**
	 * 获取exel中的虚拟机用户信息
	 * @param <T>
	 * @param is
	 * @param names
	 * @param readline 第0行为字段名称
	 * @param bean
	 * @return
	 */
	public <T> List<T>  readExcel3(InputStream is,String[] names, int readline,Class<T> bean){
		Workbook wb = null;
		List<T> listMap = new ArrayList<T>();
		T t = null;
		try {
			// 创建workbook对象
			wb = WorkbookFactory.create(is);
			// 获取sheet页数
			int Sheets = wb.getNumberOfSheets();
			if (Sheets <= 0) {
				return null;
			}
			for (int i = 0; i < Sheets; i++) {
				// 每一页				
				// 创建sheet
				Sheet sheet = wb.getSheetAt(i);
				// 总行数
				int rowNum = sheet.getLastRowNum()+1;
				//System.out.println("rowNum:" + rowNum);				
				if(rowNum!=1){
					boolean formatTure = true;
					for (int j = readline; j < rowNum && formatTure; j++) {
						// 每一行
						t = bean.newInstance(); //bean
						// 行
						Row row = sheet.getRow(j);
						// cess
						//int cessNum = row.getLastCellNum();
						int cessNum = names.length;						
						if(j==0){
							for (int x = 0; x < cessNum; x++) {
								Cell cell = row.getCell(x);
								if(cell==null){
									formatTure = false;
									break;
								}
								String cellValue = ConvertCellStr(cell);
								Map<String, String> vmuserMap= ExcelConstants.header_vmuser();
								if(cellValue==null||!vmuserMap.get(names[x]).equals(cellValue.trim())){
									formatTure = false;
									break;
								}
							}
						}else{
							boolean dataError  = false;
							for (int x = 0; x < cessNum && !dataError; x++) {
								Cell cell = row.getCell(x);
								if(cell==null){
									dataError =true;
									continue;
								}
								String cellValue = ConvertCellStr(cell);
								if(cellValue==null || cellValue.trim().equals("")){
									dataError =true;
									continue;
								}
								BeanUtils.setProperty(t, names[x],cellValue.trim());
							}
							if(!dataError){
								listMap.add(t);
							}
							
						}
						
					}
				}
				
			}
			return listMap;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}finally{
			if (is != null) {
				try {
					is.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}
	
	/**
	 * 把单元格内的类型转换至String类型
	 */
	public static String ConvertCellStr(Cell cell) {
		String cellStr = null;
		switch (cell.getCellType()) {
			case Cell.CELL_TYPE_STRING:
				// 读取String
				cellStr = cell.getStringCellValue().toString();
				break;
			case Cell.CELL_TYPE_BOOLEAN:
				// 得到Boolean对象的方法
				cellStr = String.valueOf(cell.getBooleanCellValue());
				break;
			case Cell.CELL_TYPE_NUMERIC:
				// 先看是否是日期格式
				if (DateUtil.isCellDateFormatted(cell)) {
					// 读取日期格式
					cellStr = cell.getDateCellValue().toString();
	
				} else {
					// 读取数字
					cellStr = String.valueOf(cell.getNumericCellValue());
				}
				break;
			case Cell.CELL_TYPE_FORMULA:
				// 读取公式
				cellStr = cell.getCellFormula().toString();
				break;
		}
		return cellStr;
	}
}
