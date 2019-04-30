package cn.com.fsun.common.dto;

import java.io.Serializable;
import java.util.Date;

import org.apache.commons.lang.builder.ToStringBuilder;

/**
 * 
 *<br><b>类描述:</b>
 *<pre>所示PO的父类</pre>
 *这个类适用于easyui
 */
public class BaseDto implements Serializable
{
	//用于判别是否分页
	private Boolean pagination = true;
	/**
	 * 用于时间段查询
	 */
	private String startDate;
	private String endDate;

	/**
	 * 用于数据表格分页
	 */
	private Integer rows;
	private Integer page;
	
	/**
	 * 用于字段排序
	 */
	private String sort;
	private String order;
	
	/**
	 * 分组
	 */
	private String groupBy;
	
    public String toString() {
        return ToStringBuilder.reflectionToString(this);
    }


	public Integer getRows() {
		return rows;
	}

	public void setRows(Integer rows) {
		this.rows = rows;
	}

	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	public String getSort() {
		return sort;
	}

	public void setSort(String sort) {
		this.sort = sort;
	}

	public String getOrder() {
		return order;
	}

	public void setOrder(String order) {
		this.order = order;
	}

	public Boolean getPagination() {
		return pagination;
	}

	public void setPagination(Boolean pagination) {
		this.pagination = pagination;
	}

	public void setGroupBy(String groupBy) {
		this.groupBy = groupBy;
	}

	public String getGroupBy() {
		return groupBy;
	}
	
	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

}
