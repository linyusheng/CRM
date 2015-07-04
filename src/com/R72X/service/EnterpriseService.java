package com.R72X.service;

import java.util.List;

import com.R72X.entity.Customer;
import com.R72X.entity.CustomerDAO;
import com.R72X.entity.Enterprise;
import com.R72X.entity.EnterpriseDAO;
import com.R72X.util.PageBean;
import com.R72X.util.PageService;

public class EnterpriseService {
	/**
	 * spring注入
	 */
	private EnterpriseDAO enterpriseDAO;
	private CustomerService customerService;
	
	public void setEnterpriseDAO(EnterpriseDAO enterpriseDAO){
		this.enterpriseDAO = enterpriseDAO;
	}	


	public void setCustomerService(CustomerService customerService) {
		this.customerService = customerService;
	}


	/**
	 * 查找
	 */	
	public Enterprise loadEnterprise(Integer id){
		return enterpriseDAO.findById(id);
	}
	
	/**
	 * 增加或修改
	 */	
	public void saveEnterprise(Enterprise enterprise){
		enterpriseDAO.merge(enterprise);
	}
	
	/**
	 * 删除
	 */
	public void removeEnterprise(Integer id){
		removeCustomerByEnterpriseId(id);
		
	}
	public void removeCustomerByEnterpriseId(Integer enterpriseId){
		String selectHql = "from Customer as c where c.enterprise.enterpriseId = " + enterpriseId ;
		List<Customer> list = enterpriseDAO.getHibernateTemplate().find(selectHql);
		for (int i = 0; i < list.size(); i++) {
			customerService.removeCustomer(list.get(i).getCustomerId());
		}
	}

	
	/**
	 * 分页查找
	 */
	public List<Enterprise> searchEnterprise(String name,PageBean page){
		Object[] params=null;
		String selectHql = null;
		if(name==null||(name.equals(""))){
			selectHql="from Enterprise as e where e.enterpriseName not like '#%'";
		}
		else{
			selectHql="from Enterprise as e where e.enterpriseName like '%" + name 
			+"%' and e.enterpriseName not like '#%'";
		}
		
		String countHql = "select count(*) "+ selectHql;
		
		List<Enterprise> list = PageService.searchByPage(selectHql, countHql, params, page, enterpriseDAO);
		return list;
	}	
	
}
