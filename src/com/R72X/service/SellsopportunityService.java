package com.R72X.service;

import java.util.List;
import java.util.Map;

import com.R72X.entity.Sellsopportunity;
import com.R72X.entity.SellsopportunityDAO;
import com.R72X.entity.Sellswarn;
import com.R72X.util.PageBean;
import com.R72X.util.PageService;
import com.opensymphony.xwork2.ActionContext;

public class SellsopportunityService {
	/**
	 * spring注入DAO
	 */
	private SellsopportunityDAO sellsopportunityDAO;
	private SellswarnService sellswarnService;
	
	public void setSellsopportunityDAO(SellsopportunityDAO sellsopportunityDAO){
		this.sellsopportunityDAO = sellsopportunityDAO;
	}
	public void setSellswarnService(SellswarnService sellswarnService){
		this.sellswarnService = sellswarnService;
	}
	
	/**
	 * 查找
	 */
	public Sellsopportunity loadSellsopportunityDAO(Integer id){
		return sellsopportunityDAO.findById(id);
	}
	
	/**
	 * 增加或修改
	 */
	public void saveSellsopportunity(Sellsopportunity sellsopportunity){
		sellsopportunityDAO.merge(sellsopportunity);
	}
	
	/**
	 * 删除
	 */
	public void removeSellsopportunity(Integer id){
		String selectHql = "from Sellswarn as s where s.sellsopportunity.sellsOpportunityId = " + id;
		List<Sellswarn> sellsWarnColl = sellsopportunityDAO.getHibernateTemplate().find(selectHql);
		if (sellsWarnColl.size() != 0)
			sellswarnService.removeSellswarn(sellsWarnColl.get(0).getSellsWarnId());
		sellsopportunityDAO.delete(sellsopportunityDAO.findById(id));
	}
	
	/**
	 * 分页查找
	 */
	public List<Sellsopportunity> searchSellsopportunity(String sellsOpportunityName,PageBean page){
		Object[] params = null;
		String selectHql = null;
		Map<String,Object> session=(Map)ActionContext.getContext().getSession();
		Integer userId=(Integer)session.get("loginId");
		if ((sellsOpportunityName == null) || (sellsOpportunityName.equals(""))){
			selectHql = "from Sellsopportunity as s where s.customer.user.userId = " + userId;
		}
		else{
			selectHql = "from Sellsopportunity as s where s.sellsOpportunityName like '%"
				+ sellsOpportunityName + "%' and s.customer.user.userId = " + userId;
		}
		
		String countHql = "select count(*) " + selectHql;
		
		List<Sellsopportunity> list = PageService.searchByPage(
				selectHql, countHql, params, page, sellsopportunityDAO);
		return list;
	}
}