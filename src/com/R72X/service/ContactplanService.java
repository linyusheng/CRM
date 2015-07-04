package com.R72X.service;

import java.util.List;
import java.util.Map;


import com.R72X.entity.Contactplan;
import com.R72X.entity.ContactplanDAO;
import com.R72X.util.PageBean;
import com.R72X.util.PageService;
import com.opensymphony.xwork2.ActionContext;

public class ContactplanService {
	private ContactplanDAO contactplanDAO;

	public ContactplanDAO getContactplanDAO() {
		return contactplanDAO;
	}

	public void setContactplanDAO(ContactplanDAO contactplanDAO) {
		this.contactplanDAO = contactplanDAO;
	}
	
	/*
	 * 查找
	 */
	public Contactplan loadContactplan(Integer id){
		return contactplanDAO.findById(id);
	}
	
	/*
	 * 增加或修改
	 */
	public void saveContactplan(Contactplan contactplan){
		contactplanDAO.merge(contactplan);
	}
	
	/*
	 * 删除
	 */
	public void removeContactplan(Integer id){
		contactplanDAO.delete(contactplanDAO.findById(id));
	}
	
	/*
	 * 分页查找
	 */
	public List<Contactplan> searchContactplan(String name,PageBean page){
		Object[] params=null;
		String selectHql=null;
		Map<String,Object> session=(Map)ActionContext.getContext().getSession();
		Integer userId=(Integer)session.get("loginId");
		if((name==null)||(name.equals(""))){
			selectHql="from Contactplan as cp where cp.user.userId = " + userId +" and cp.enterprise.enterpriseName not like '#%'";
		}
		else{
			selectHql="from Contactplan as cp where cp.contactPlanName like '%"+name+"%' and cp.user.userId = " + userId +" and cp.enterprise.enterpriseName not like '#%'" ;
		}
		
		String countHql="select count(*) "+selectHql;
		
		List<Contactplan> list=PageService.searchByPage(selectHql, countHql, params, page, contactplanDAO);
		return list;
	}
	
	public List<Contactplan> searchContactplanByUser(Integer userId){
		Object[] params=null;
		String selectHql=null;
		if(userId==null){
			return null;
		}
		else{
			selectHql="from Contactplan as cp where cp.user.userId = "+userId;
		}
		
		String countHql="select count(*) "+selectHql;
		
		List<Contactplan> list=PageService.searchByPage(selectHql, countHql, params, null, contactplanDAO);
		return list;
	}
}
