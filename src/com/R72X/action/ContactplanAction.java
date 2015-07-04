package com.R72X.action;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Map;


import com.R72X.entity.Contactplan;
import com.R72X.entity.Enterprise;
import com.R72X.entity.User;
import com.R72X.service.ContactplanService;
import com.R72X.service.EnterpriseService;
import com.R72X.util.PageBean;
import com.opensymphony.xwork2.ActionContext;

public class ContactplanAction {
	private ContactplanService contactplanService;

	public ContactplanService getContactplanService() {
		return contactplanService;
	}

	public void setContactplanService(ContactplanService contactplanService) {
		this.contactplanService = contactplanService;
	}
	
	private Integer id;
	private Integer[] ids;
	private Contactplan contactplan;
	private String keyWord;
	private EnterpriseService enterpriseService;
	List<Enterprise> enterprises = new ArrayList<Enterprise>();

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

	public Contactplan getContactplan() {
		return contactplan;
	}

	public void setContactplan(Contactplan contactplan) {
		this.contactplan = contactplan;
	}
	
	
	public String getKeyWord() {
		return keyWord;
	}

	public void setKeyWord(String keyWord) {
		this.keyWord = keyWord;
	}

	
	public EnterpriseService getEnterpriseService() {
		return enterpriseService;
	}

	public void setEnterpriseService(EnterpriseService enterpriseService) {
		this.enterpriseService = enterpriseService;
	}

	public List<Enterprise> getEnterprises() {
		return enterprises;
	}

	public void setEnterprises(List<Enterprise> enterprises) {
		this.enterprises = enterprises;
	}

	/*
	 * ²éÑ¯¡¢ÐÞ¸Ä¡¢ÐÂÌí¡¢É¾³ý
	 */
	
	public void getEnterprisetmp(){
		enterprises = enterpriseService.searchEnterprise(null,null);
	}
	
	public String load() throws Exception{
		if(id==null){
			getEnterprisetmp();
			return "success";
		}
		getEnterprisetmp();
		contactplan=contactplanService.loadContactplan(id);
		return "success";
	}
	
	public String save() throws Exception{
		if(contactplan.getContactPlanId()==null){
			Map<String,Object> session=(Map)ActionContext.getContext().getSession();
			Integer userId=(Integer)session.get("loginId");
			User user=new User();
			user.setUserId(userId);
			contactplan.setUser(user);			
		}
		contactplanService.saveContactplan(contactplan);
		return "success";
	}
	
	public String remove() throws Exception {
		if(ids==null){return "success";}
		for(int i=0,size=ids.length;i<size;i++){
			contactplanService.removeContactplan(ids[i]);
		}
		return "success";
	}
	
	private Collection<Contactplan> contactplanColl;
	public Collection<Contactplan> getContactplanColl() {
		return contactplanColl;
	}

	public void setContactplanColl(Collection<Contactplan> contactplanColl) {
		this.contactplanColl = contactplanColl;
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
			pageBean=new PageBean();
		}
		contactplanColl=contactplanService.searchContactplan((keyWord==null)?null:keyWord, pageBean);
		return "success";
	}
}
