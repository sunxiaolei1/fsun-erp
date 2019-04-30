package cn.com.fsun.common.utils;

/**
 * 
 * @author Felenwe Lee
 * @date 2012-05-21
 * 
 */
public class PageInfo {

	// fields
	private int pageSize;

	private int currentPage;

	private int totalRecords;

	private int totalPages;

	private int lastRecord;

	private int firstRecord;

	private String sortColumn;

	private String sortType;
	
	private String startDate;
	
	private String endDate;

	public PageInfo() {

	}
	
	public PageInfo(int pagesize,int currentPage,String sortColumn,String sortType){
		this.sortColumn = sortColumn;
		this.sortType = sortType;
		this.pageSize = pagesize;
		if (pagesize <= 0) {
			firstRecord = 0;
			totalPages = 1;
			currentPage = 1;
		} else {
			this.currentPage = currentPage;
			firstRecord = (currentPage-1)*pagesize;
		}
	}

	public PageInfo(int pagesize, int currentPage) {
		this.pageSize = pagesize;
		if (pagesize <= 0) {
			firstRecord = 0;
			totalPages = 1;
			currentPage = 1;
		} else {
			this.currentPage = currentPage;
			firstRecord = (currentPage-1)*pagesize;
		}
	}

//	public PageInfo(int pagesize, int firstRecord, String sortColumn,
//			String sortType) {
//		this.pageSize = pagesize;
//		this.sortColumn = sortColumn;
//		this.sortType = sortType;
//		if (pagesize <= 0) {
//			firstRecord = 0;
//			totalPages = 1;
//			currentPage = 1;
//		} else {
//			this.firstRecord = firstRecord;
//		}
//
//	}

	public PageInfo(int pageSize, int firstRecord, int totalRecords) {
		this.pageSize = pageSize;
		this.totalRecords = totalRecords;
		if (pageSize <= 0) {
			firstRecord = 0;
			lastRecord = totalRecords;
			currentPage = 1;
			totalPages = 1;
		} else {
			this.firstRecord = firstRecord;
			currentPage = countCurrentPage(pageSize, firstRecord);
			totalPages = countTotalPages(pageSize, totalRecords);
			lastRecord = countLastRecord(pageSize, firstRecord, totalRecords);
		}

	}

	private int countTotalPages(int pageSize, int totalRecords) {
		if (0 == pageSize)
			return 1;
		else {
//			System.out.println("pagesize="+pageSize);
			
			if (totalRecords % pageSize == 0) {
				return totalRecords / pageSize;
			} else {
				return totalRecords / pageSize + 1;
			}
		}
	}

	private int countCurrentPage(int pageSize, int firstRecord) {
		if (0 == pageSize)
			return 1;
		else {

			if (firstRecord % pageSize == 0)
				return firstRecord / pageSize;
			else {
				return 1;
			}
		}
	}

	private int countLastRecord(int pagesize, int currentPage, int totalRecords) {
		if (pagesize * currentPage > totalRecords)
			return totalRecords;
		else {
			return pagesize * currentPage;
		}
	}

	// getter and setter
	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getTotalRecords() {
		return totalRecords;
	}

	public void setTotalRecords(int totalRecords) {
		this.totalRecords = totalRecords;
		if (pageSize >= 0 && firstRecord >= 0) {
			currentPage = countCurrentPage(pageSize, firstRecord);
			totalPages = countTotalPages(pageSize, totalRecords);
			lastRecord = countLastRecord(pageSize, firstRecord, totalRecords);
		}
	}

	public int getTotalPages() {
		return totalPages;
	}

	public void setTotalPages(int totalPages) {
		this.totalPages = totalPages;
	}

	public int getLastRecord() {
		return lastRecord;
	}

	public void setLastRecord(int lastRecord) {
		this.lastRecord = lastRecord;
	}

	public int getFirstRecord() {
		return firstRecord;
	}

	public void setFirstRecord(int firstRecord) {
		this.firstRecord = firstRecord;
	}

	public String getSortColumn() {
		return sortColumn;
	}

	public void setSortColumn(String sortColumn) {
		this.sortColumn = sortColumn;
	}

	public String getSortType() {
		return sortType;
	}

	public void setSortType(String sortType) {
		this.sortType = sortType;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public String getEndDate() {
		return endDate;
	}
	
	
}
