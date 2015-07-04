package com.R72X.action;

import java.util.Collection;

import com.R72X.entity.Enterprise;
import com.R72X.service.EnterpriseService;
import com.R72X.util.PageBean;

public class EnterpriseAction {
	private EnterpriseService enterpriseService;
	
	public void setEnterpriseService(EnterpriseService enterpriseService){
		this.enterpriseService = enterpriseService;
	}

	private Integer id;
	private Integer[] ids;
	private Enterprise enterprise;
	private String keyWord;

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
	public Enterprise getEnterprise() {
		return enterprise;
	}
	public void setEnterprise(Enterprise enterprise) {
		this.enterprise = enterprise;
	}
	
	public String getKeyWord() {
		return keyWord;
	}
	public void setKeyWord(String keyWord) {
		this.keyWord = keyWord;
	}
	/**
	 * 查询、修改、增加、删除
	 */
	public String load() throws Exception{
		if(id==null){
			return "success";
		}
		enterprise = enterpriseService.loadEnterprise(id);
		return "success";
	}
	
	public String save() throws Exception{
		enterpriseService.saveEnterprise(enterprise);
		return "success";
	}
	
	public String remove() throws Exception{
		if(ids==null)
			return "success";
		for(int i=0,size = ids.length;i<size;i++){
			enterpriseService.removeEnterprise(ids[i]);
			removeEnterpriseByMark(ids[i],'#');
		}
		return "success";
	}
	public void removeEnterpriseByMark(Integer id,char mark){
		enterpriseService.loadEnterprise(id).setEnterpriseName
		(mark + enterpriseService.loadEnterprise(id).getEnterpriseName());
	}
	
	private Collection<Enterprise> enterpriseColl;
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
		enterpriseColl = enterpriseService.searchEnterprise((keyWord==null)?null:keyWord, pageBean);
		return "success";
	}
	
}
