package com.R72X.util;

public class PageBean {
	private int totalRow; // 进行分页所有记录的总行数
	private int pageSize = 10; // 每页显示的总行数
	private int currentPage = 1; // 当前页号，默认为1
	private int totalPage; // 分页后的总页数

	public PageBean() {
		
	}

	public int getTotalPage() {
		return totalPage;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setTotalRow(int totalRows) {
		this.totalRow = totalRows;
		// 重新计算总页数
		calcTotalPage();
	}

	public void setTotalPage(int totalPages) {
		this.totalPage = totalPages;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
		
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
		// 重新计算总页数
		calcTotalPage();
	}

	public int getTotalRow() {
		return totalRow;
	}

	/*
	 * 计算总页数
	 */
	private void calcTotalPage() {
		totalPage = totalRow / pageSize;
		int mod = totalRow % pageSize;
		if (mod > 0) {
			totalPage++; // 最后一页记录数不够，总页数加上一页
		}
		// 限制当前页值在1到总页数之间
		if (currentPage > totalPage) {
			this.currentPage = totalPage;
		}
		if (currentPage <= 0) {
			this.currentPage = 1;
		}
	}

}
