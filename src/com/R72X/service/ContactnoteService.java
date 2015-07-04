package com.R72X.service;

import java.util.List;
import java.util.Map;

import com.R72X.entity.Contactnote;
import com.R72X.entity.ContactnoteDAO;
import com.R72X.entity.Contactplan;
import com.R72X.util.PageBean;
import com.R72X.util.PageService;
import com.opensymphony.xwork2.ActionContext;



public class ContactnoteService {
	private ContactnoteDAO contactnoteDAO;

	public ContactnoteDAO getContactnoteDAO() {
		return contactnoteDAO;
	}

	public void setContactnoteDAO(ContactnoteDAO contactnoteDAO) {
		this.contactnoteDAO = contactnoteDAO;
	}
	
	/*
	 * 查找
	 */
	public Contactnote loadContactnote(Integer id){
		return contactnoteDAO.findById(id);
	}
	
	/*
	 * 增加或修改
	 */
	public void saveContactnote(Contactnote contactnote){
		contactnoteDAO.merge(contactnote);
	}
	
	/*
	 * 删除
	 */
	public void removeContactnote(Integer id){
		contactnoteDAO.delete(contactnoteDAO.findById(id));
	}
	
	/*
	 * 分页查找
	 */
	public List<Contactnote> searchContactnote(String name,PageBean page){
		Object[] params=null;
		String selectHql=null;
		Map<String,Object> session=(Map)ActionContext.getContext().getSession();
		Integer userId=(Integer)session.get("loginId");
		if((name==null)||(name.equals(""))){
			selectHql="from Contactnote as cn where cn.user.userId = " + userId +" and cn.enterprise.enterpriseName not like '#%'";
		}
		else{
			selectHql="from Contactnote as cn where cn.contactNoteName like '%"+name+"%'  and cn.user.userId = " + userId +" and cn.enterprise.enterpriseName not like '#%'";
		}
		
		String countHql="select count(*) "+selectHql;
		
		List<Contactnote> list=PageService.searchByPage(selectHql, countHql, params, page, contactnoteDAO);
		return list;
	}
	
	public List<Contactnote> searchContactnoteByUser(Integer userId){
		Object[] params=null;
		String selectHql=null;
		if(userId==null){
			return null;
		}
		else{
			selectHql="from Contactnote as cp where cp.user.userId = "+userId;
		}
		
		String countHql="select count(*) "+selectHql;
		
		List<Contactnote> list=PageService.searchByPage(selectHql, countHql, params, null, contactnoteDAO);
		return list;
	}
}
