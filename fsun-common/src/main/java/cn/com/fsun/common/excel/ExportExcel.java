package cn.com.fsun.common.excel;

import java.io.OutputStream;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.formula.functions.T;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.web.servlet.view.document.AbstractExcelView;

import cn.com.fsun.common.utils.DateUtil;


public class ExportExcel extends AbstractExcelView{
	
	private Object infoList = new Object();

    public Object getInfoList() {
		return infoList;
	}

	public void setInfoList(Object infoList) {
		this.infoList = infoList;
	}

	public ExportExcel() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ExportExcel(Object infoList) {
		super();
		this.infoList = infoList;
	}



	@Override
    protected void buildExcelDocument(Map<String, Object> model,HSSFWorkbook workbook, HttpServletRequest request, HttpServletResponse response)
    	throws Exception {

    	
    	ExcelUtil testExcel = new ExcelUtil();
		try {			
			HashMap<String,String> header = (HashMap<String, String>) model.get("titles");	
			List<T> lt= (List<T>) model.get("data");
			
			//测试3（不带排序）
			//Map<String,List<T>> map=new HashMap<String, List<T>>();
			//map.put("sheet", lt);				
			//Workbook wb = testExcel.writeExcel3(map, null,2,header,infoList.getClass());
			//测试4（带排序）		
			Workbook wb=testExcel.writeExcel4("sheet",lt,1,header,infoList.getClass());			
			response.setContentType("application/vnd.ms-excel");
			String filename = new String((model.get("fileName").toString()+"-"+DateUtil.formateDate(new Date(), "yyyy-MM-dd")).getBytes(),"iso8859-1");
			response.setHeader("Content-disposition", "attachment;filename=" + filename+".xls");
			OutputStream ouputStream = response.getOutputStream();
			wb.write(ouputStream);
			ouputStream.flush();
			ouputStream.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
    }

}
