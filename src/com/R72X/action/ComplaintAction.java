package com.R72X.action;

import java.sql.Timestamp;
import java.util.Collection;
import java.util.Date;
import java.util.Map;

import com.R72X.entity.Complaint;
import com.R72X.entity.User;
import com.R72X.service.ComplaintService;
import com.R72X.util.PageBean;
import com.opensymphony.xwork2.ActionContext;

public class ComplaintAction {
	private ComplaintService complaintService;
	private Integer id;
	private Integer dealId;
	private Integer[] ids;
	private Complaint complaint;
	private Collection<Complaint> complaintColl;
	private PageBean pageBean;
	private String keyWord;
	
	public Integer getId() {
		return id;
	}
	public Integer[] getIds() {
		return ids;
	}
	public Complaint getComplaint() {
		return complaint;
	}
	public Collection<Complaint> getComplaintColl() {
		return complaintColl;
	}
	public PageBean getPageBean() {
		return pageBean;
	}
	public String getKeyWord() {
		return keyWord;
	}
	public void setComplaintService(ComplaintService complaintService) {
		this.complaintService = complaintService;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getDealId() {
		return dealId;
	}
	public void setDealId(Integer dealId) {
		this.dealId = dealId;
	}
	public void setIds(Integer[] ids) {
		this.ids = ids;
	}
	public void setComplaint(Complaint complaint) {
		this.complaint = complaint;
	}
	public void setComplaintColl(Collection<Complaint> complaintColl) {
		this.complaintColl = complaintColl;
	}
	public void setPageBean(PageBean pageBean) {
		this.pageBean = pageBean;
	}
	public void setKeyWord(String keyWord) {
		this.keyWord = keyWord;
	}
	
	public String load() throws Exception{
		if(id==null){
			return "success";
		}
		complaint=complaintService.loadComplaint(id);
		return "success";
	}
	
	public String save() throws Exception{
		//无论是新增还是修改都更新修改人与时间的状态			
		complaint.setComplaintTime(new Timestamp(new Date().getTime()));
		Map<String,Object> session=(Map)ActionContext.getContext().getSession();
		Integer userId=(Integer)session.get("loginId");
		User user=new User();
		user.setUserId(userId);
		complaint.setUserByServerId(user);
		complaintService.saveComplaint(complaint);
		return "success";
	}
	
	public String remove() throws Exception{
		if(ids==null)return "success";
		for(int i=0,size=ids.length;i<size;i++){
			complaintService.removeComplaint(ids[i]);
		}
		return "success";
	}
	
	public String search() throws Exception{
		if(pageBean==null){
			pageBean=new PageBean();
		}
		complaintColl=complaintService.searchComplaint((keyWord==null)?null:keyWord, pageBean);
		return "success";
	}
	
	public String sign() throws Exception{
		if(id==null){
			return "success";
		}
		
		complaintService.signComplaint(id,dealId);
		return "success";
	}
	
	public String doNothing() throws Exception{		
		return "success";
	}
}
