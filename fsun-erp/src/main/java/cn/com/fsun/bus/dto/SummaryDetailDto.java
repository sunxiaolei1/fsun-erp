/**  
 * Project Name:fsun-erp  
 * File Name:SummaryDetailDto.java  
 * Package Name:cn.com.fsun.bus.dto  
 * Date:2017年8月27日 
 * Copyright (c) 2017, WFZ All Rights Reserved.  
 *  
*/  
  
package cn.com.fsun.bus.dto;  
/**  
 * ClassName:SummaryDetailDto <br/>  
 * Description: TODO <br/>   
 * @author   lenovo  
 * @version  1.0  
 * @since    JDK 1.7        
 */
public class SummaryDetailDto {

	/**
	 * 总数
	 */
    private int rows;
    
    /**
     * 总价
     */
    private double total;

	public int getRows() {
		return rows;
	}

	public void setRows(int rows) {
		this.rows = rows;
	}

	public double getTotal() {
		return total;
	}

	public void setTotal(double total) {
		this.total = total;
	}
    
    
}
  
