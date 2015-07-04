package com.R72X.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.R72X.entity.Sellsopportunity;
import com.R72X.entity.Sellswarn;
import com.R72X.entity.SellswarnDAO;
import com.R72X.util.PageBean;
import com.R72X.util.PageService;
import com.opensymphony.xwork2.ActionContext;

public class SellswarnService {
	/**
	 * spring注入DAO
	 */
	private SellswarnDAO sellswarnDAO;
	private SellsopportunityService sellsopportunityService;
	
	public void setSellswarnDAO(SellswarnDAO sellswarnDAO){
		this.sellswarnDAO = sellswarnDAO;
	}
	public void setSellsopportunityService(SellsopportunityService sellsopportunityService){
		this.sellsopportunityService = sellsopportunityService;
	}
	
	/**
	 * 查找
	 */
	public Sellswarn loadSellswarn(Integer id){
		return sellswarnDAO.findById(id);
	}
	
	/**
	 * 增加或修改
	 */
	public void saveSellswarn(Sellswarn sellswarn){
		Sellswarn s = sellswarnDAO.merge(sellswarn);
		String selectHql = "from Sellsopportunity as s where s.sellsOpportunityId = " + s.getSellsopportunity().getSellsOpportunityId();
		List<Sellsopportunity> sellsOpportunityColl = sellswarnDAO.getHibernateTemplate().find(selectHql);
		Sellsopportunity sellsopportunity = new Sellsopportunity();
		for (int i = 0; i < sellsOpportunityColl.size(); i++){
			sellsopportunity = sellsopportunityService.loadSellsopportunityDAO(sellsOpportunityColl.get(i).getSellsOpportunityId());
			sellsopportunity.setSellswarn(s);
			sellsopportunityService.saveSellsopportunity(sellsopportunity);
		}
	}
	
	/**
	 * 删除
	 */
	public void removeSellswarn(Integer id){
		String selectHql = "from Sellsopportunity as s where s.sellswarn.sellsWarnId = " + id;
		List<Sellsopportunity> sellsOpportunityColl = sellswarnDAO.getHibernateTemplate().find(selectHql);
		Sellsopportunity sellsopportunity = new Sellsopportunity();
		for (int i = 0; i < sellsOpportunityColl.size(); i++){
			sellsopportunity = sellsopportunityService.loadSellsopportunityDAO(sellsOpportunityColl.get(i).getSellsOpportunityId());
			sellsopportunity.setSellswarn(null);
			sellsopportunityService.saveSellsopportunity(sellsopportunity);
		}
		sellswarnDAO.delete(sellswarnDAO.findById(id));
	}
	
	/**
	 * 分页按ID查找
	 */
	public List<Sellswarn> searchSellswarnById(String sellswarnName, PageBean page){
		Object[] params = null;
		String selectHql = null;
		Map<String,Object> session=(Map)ActionContext.getContext().getSession();
		Integer userId=(Integer)session.get("loginId");
		Date date = new Date();
		String today = "'" + (date.getYear() + 1900) + "-" + (date.getMonth() + 1) + "-" + date.getDate() + "'";
		if ((sellswarnName == null) || (sellswarnName.equals(""))){
			selectHql = "from Sellswarn as s where s.sellsopportunity.customer.user.userId = " + userId +
			" and s.warnDate > " + today;
		}
		else{
			selectHql = "from Sellswarn as s where s.sellsopportunity.customer.user.userId = " + userId +
			" and s.sellsWarnName like '%" + sellswarnName + "%' and s.warnDate > " + today;
		}
		
		String countHql = "select count(*) " + selectHql;
		
		List<Sellswarn> list = PageService.searchByPage(
				selectHql, countHql, params, page, sellswarnDAO);
		return list;
	}
	
	/**
	 * 分页按日期查找
	 */
	public List<Sellswarn> searchSellswarnByDate(String sellswarnName, PageBean page){
		Object[] params = null;
		String selectHql = null;
		Map<String,Object> session=(Map)ActionContext.getContext().getSession();
		Integer userId=(Integer)session.get("loginId");
		Date date = new Date();
		String today = "'" + (date.getYear() + 1900) + "-" + (date.getMonth() + 1) + "-" + date.getDate() + "'";
		if ((sellswarnName == null) || (sellswarnName.equals(""))){
			selectHql = "from Sellswarn as s where s.sellsopportunity.customer.user.userId = " + 
			userId + " and s.warnDate <= " + today + " order by warnDate desc";
		}
		else{
			selectHql = "from Sellswarn as s where s.sellsopportunity.customer.user.userId = " +
			userId + " and s.sellsWarnName like '%" + sellswarnName + "%' and s.warnDate <= " +
			today + " order by s.warnDate desc";
		}
		
		String countHql = "select count(*) " + selectHql;
		List<Sellswarn> list = PageService.searchByPage(
				selectHql, countHql, params, page, sellswarnDAO);
		return list;
	}
}