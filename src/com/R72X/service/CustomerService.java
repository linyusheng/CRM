package com.R72X.service;

import java.util.List;

import com.R72X.entity.Contactnote;
import com.R72X.entity.Customer;
import com.R72X.entity.CustomerDAO;
import com.R72X.entity.Sellsopportunity;
import com.R72X.util.PageBean;
import com.R72X.util.PageService;

public class CustomerService {
	/**
	 * spring注入DAO
	 */
	private CustomerDAO customerDAO;
	private SellsopportunityService sellsopportunityService;

	public void setCustomerDAO(CustomerDAO customerDAO) {
		this.customerDAO = customerDAO;
	}

	public void setSellsopportunityService(
			SellsopportunityService sellsopportunityService) {
		this.sellsopportunityService = sellsopportunityService;
	}

	/**
	 * 查找
	 */
	public Customer loadCustomer(Integer id) {
		return customerDAO.findById(id);
	}

	/**
	 * 增加或修改
	 */

	public void saveCustomer(Customer customer) {
		customerDAO.merge(customer);
	}

	/**
	 * 删除
	 */
	public void removeCustomer(Integer id) {
		String selectHql = "from Sellsopportunity as s where s.customer.customerId = "
				+ id;
		List<Sellsopportunity> sellsOpportunityColl = customerDAO
				.getHibernateTemplate().find(selectHql);
		for (int i = 0; i < sellsOpportunityColl.size(); i++) {
			sellsopportunityService.removeSellsopportunity(sellsOpportunityColl
					.get(i).getSellsOpportunityId());
		}
		customerDAO.delete(customerDAO.findById(id));
	}

	/**
	 * 分页查找
	 */
	public List<Customer> searchCustomer(String name, PageBean page,
			Integer userId) {
		Object[] params = null;
		String selectHql = null;
		if (name == null || (name.equals(""))) {
			selectHql = "from Customer as c where c.enterprise.enterpriseName not like '#%' and c.user.userId = "
					+ userId;
		} else {
			selectHql = "from Customer as c where c.customerName like '%"
					+ name
					+ "%' and c.enterprise.enterpriseName not like '#%' and c.user.userId = "
					+ userId;
		}
		String countHql = "select count(*) " + selectHql;
		List<Customer> list = PageService.searchByPage(selectHql, countHql,
				params, page, customerDAO);
		return list;
	}
	
}
