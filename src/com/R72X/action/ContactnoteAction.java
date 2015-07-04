package com.R72X.action;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Map;

import com.R72X.entity.Contactnote;
import com.R72X.entity.Enterprise;
import com.R72X.entity.User;
import com.R72X.service.ContactnoteService;
import com.R72X.service.EnterpriseService;
import com.R72X.util.PageBean;
import com.opensymphony.xwork2.ActionContext;



public class ContactnoteAction {
	private ContactnoteService contactnoteService;

	public ContactnoteService getContactnoteService() {
		return contactnoteService;
	}

	public void setContactnoteService(ContactnoteService contactnoteService) {
		this.contactnoteService = contactnoteService;
	}
	
	private Integer id;
	private Integer[] ids;
	private Contactnote contactnote;
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

	public Contactnote getContactnote() {
		return contactnote;
	}

	public void setContactnote(Contactnote contactnote) {
		this.contactnote = contactnote;
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
		contactnote=contactnoteService.loadContactnote(id);
		return "success";
	}
	
	public String save() throws Exception{
				
		if(contactnote.getContactNoteId()==null){
			Map<String,Object> session=(Map)ActionContext.getContext().getSession();
			Integer userId=(Integer)session.get("loginId");
			User user=new User();
			user.setUserId(userId);
			contactnote.setUser(user);			
		}
		//id->select->another
		//current-->another
		//updateenterprise->enter id->enterprise->another
		//save(another)
		contactnoteService.saveContactnote(contactnote);
		return "success";
		
	}
	
	public String remove() throws Exception {
		if(ids==null){return "success";}
		for(int i=0,size=ids.length;i<size;i++){
			contactnoteService.removeContactnote(ids[i]);
		}
		return "success";
	}
	
	private Collection<Contactnote> contactnoteColl;
	public Collection<Contactnote> getContactnoteColl() {
		return contactnoteColl;
	}

	public void setContactnoteColl(Collection<Contactnote> contactnoteColl) {
		this.contactnoteColl = contactnoteColl;
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
		contactnoteColl=contactnoteService.searchContactnote((keyWord==null)?null:keyWord, pageBean);
		return "success";
	}
}
