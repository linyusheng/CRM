package com.R72X.action;

import java.util.Collection;
import java.util.Map;

import com.R72X.entity.Customer;
import com.R72X.entity.Enterprise;
import com.R72X.entity.User;
import com.R72X.service.CustomerService;
import com.R72X.service.EnterpriseService;
import com.R72X.util.PageBean;
import com.opensymphony.xwork2.ActionContext;

public class CustomerAction {
	
	private CustomerService customerService;
	private EnterpriseService enterpriseService;

	private Integer id;
	private Integer[] ids;
	private Customer customer;
	private String keyWord;
	private Integer loginId;

	private Collection<Customer> customerColl;
	private Collection<Enterprise> enterpriseColl;
	
	public CustomerService getCustomerService() {
		return customerService;
	}
	public void setCustomerService(CustomerService customerService) {
		this.customerService = customerService;
	}		
	
	public EnterpriseService getEnterpriseService() {
		return enterpriseService;
	}
	public void setEnterpriseService(EnterpriseService enterpriseService) {
		this.enterpriseService = enterpriseService;
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

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public String getKeyWord() {
		return keyWord;
	}
	public void setKeyWord(String keyWord) {
		this.keyWord = keyWord;
	}
	public Integer getLoginId() {
		return loginId;
	}
	public void setLoginId(Integer loginId) {
		this.loginId = loginId;
	}
	/**
	 * 查询、修改、增加、删除
	 */
	public String load() throws Exception {
		if (id == null) {
			return "success";
		}
		searchEnterprise();
		customer = customerService.loadCustomer(id);
		return "success";
	}

	public String save() throws Exception {
		if(customer.getCustomerId()==null){
			Map<String,Object> session=(Map)ActionContext.getContext().getSession();
			Integer userId=(Integer)session.get("loginId");
			User user=new User();
			user.setUserId(userId);
			customer.setUser(user);
		}
		customerService.saveCustomer(customer);
		return "success";
	}

	public String remove() throws Exception {
		if(ids==null)
			return "success";
		for (int i = 0, size = ids.length; i < size; i++) {
			customerService.removeCustomer(ids[i]);
		}
		return "success";
	}
	
	public Collection<Customer> getCustomerColl() {
		return customerColl;
	}

	public void setCustomerColl(Collection<Customer> customerColl) {
		this.customerColl = customerColl;
	}	
	
	public Collection<Enterprise> getEnterpriseColl() {
		return enterpriseColl;
	}
	public void setEnterpriseColl(Collection<Enterprise> enterpriseColl) {
		this.enterpriseColl = enterpriseColl;
	}

	private PageBean pageBean;

	public PageBean getPageBean() {
		return pageBean;
	}

	public void setPageBean(PageBean pageBean) {
		this.pageBean = pageBean;
	}
	
	public String search() throws Exception{
		if(pageBean==null){
			pageBean = new PageBean();
		}
		Map<String,Object> session=(Map)ActionContext.getContext().getSession();
		Integer userId=(Integer)session.get("loginId");
		customerColl = customerService.searchCustomer((keyWord==null)?null:keyWord,pageBean,userId);	
		return "success";
	}
	public String searchEnterprise() throws Exception{
		if(pageBean==null){
			pageBean = new PageBean();
		}
		enterpriseColl = enterpriseService.searchEnterprise(null, null);
		return "success";
	}
}
