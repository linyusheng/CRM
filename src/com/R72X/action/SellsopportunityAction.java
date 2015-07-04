package com.R72X.action;

import java.util.*;

import com.R72X.entity.Customer;
import com.R72X.entity.Sellsopportunity;
import com.R72X.service.CustomerService;
import com.R72X.service.SellsopportunityService;
import com.R72X.util.PageBean;
import com.opensymphony.xwork2.ActionContext;

public class SellsopportunityAction {
	/**
	 * Spring注入Service
	 */
	private SellsopportunityService sellsopportunityService;
	private CustomerService customerService;
	
	private Integer id;
	private Integer[] ids;
	private Sellsopportunity sellsopportunity;
	private String keyWord;
	
	private Collection<Sellsopportunity> sellsopportunityColl;
	private List<Customer> customers = new ArrayList<Customer>();
	
	private PageBean pageBean;
	
	public void setSellsopportunityService(SellsopportunityService sellsopportunityService){
		this.sellsopportunityService = sellsopportunityService;
	}
	
	public void setCustomerService(CustomerService customerService) {
		this.customerService = customerService;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer[] getIds() {
		return ids;
	}

	public void setIds(Integer[] ids) {
		this.ids = ids;
	}

	public Sellsopportunity getSellsopportunity() {
		return sellsopportunity;
	}
	
	public void setSellsopportunity(Sellsopportunity sellsopportunity) {
		this.sellsopportunity = sellsopportunity;
	}
	
	public String getKeyWord() {
		return keyWord;
	}
	
	public void setKeyWord(String keyWord) {
		this.keyWord = keyWord;
	}
	
	public Collection<Sellsopportunity> getSellsopportunityColl(){
		return sellsopportunityColl;
	}
	
	public void setSellsopportunityColl(Collection<Sellsopportunity> sellsopportunityColl){
		this.sellsopportunityColl = sellsopportunityColl;
	}
	
	public List<Customer> getCustomers() {
		return customers;
	}

	public void setCustomers(List<Customer> customers) {
		this.customers = customers;
	}

	public PageBean getPageBean(){
		return pageBean;
	}
	
	public void setPageBean(PageBean pageBean){
		this.pageBean = pageBean;
	}

	/**
	 * 查找
	 * @return
	 * @throws Exception
	 */
	public String load() throws Exception{
		getCustomertmp();
		if (id == null){
			return "success";
		}
		sellsopportunity = sellsopportunityService.loadSellsopportunityDAO(id);
		return "success";
	}
	
	/**
	 * 增加或修改
	 * @return
	 * @throws Exception
	 */
	public String save() throws Exception{
		sellsopportunityService.saveSellsopportunity(sellsopportunity);
		return "success";
	}
	
	/**
	 * 删除
	 * @return
	 * @throws Exception
	 */
	public String remove() throws Exception{
		if (ids == null)
			return "success";
		for (int i = 0, size = ids.length; i < size; i++){
			sellsopportunityService.removeSellsopportunity(ids[i]);
		}
		return "success";
	}
	
	public String search() throws Exception{
		if (pageBean == null){
			pageBean = new PageBean();
		}
		sellsopportunityColl = sellsopportunityService.searchSellsopportunity(
				((keyWord == null)?null:keyWord), pageBean);
		return "success";
	}
	
	public void getCustomertmp(){
		Map<String,Object> session=(Map)ActionContext.getContext().getSession();
		Integer userId=(Integer)session.get("loginId");
		customers = customerService.searchCustomer(null, null, userId);
	}
}