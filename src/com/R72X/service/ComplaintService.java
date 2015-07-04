package com.R72X.service;

import java.util.List;

import com.R72X.entity.Complaint;
import com.R72X.entity.ComplaintDAO;
import com.R72X.entity.User;
import com.R72X.util.PageBean;
import com.R72X.util.PageService;

public class ComplaintService {
	private ComplaintDAO complaintDAO;

	public void setComplaintDAO(ComplaintDAO complaintDAO) {
		this.complaintDAO = complaintDAO;
	}
	
	public Complaint loadComplaint(Integer id){
		return complaintDAO.findById(id);
	}
	
	public void saveComplaint(Complaint complaint){
		complaintDAO.merge(complaint);
	}
	
	public void removeComplaint(Integer id){
		complaintDAO.delete(complaintDAO.findById(id));
	}
	
	public List<Complaint> searchComplaint(String complaintProblemName,PageBean page){
		Object[] params=null;
		String selectHql=null;
		if((complaintProblemName==null)||(complaintProblemName.equals(""))){
			selectHql="from Complaint";
		}
		else{
			selectHql="from Complaint as c where c.complaintProblem like '%"+complaintProblemName+"%'";
		}
		String countHql="select count(*) "+selectHql;
		List<Complaint> list=PageService.searchByPage(selectHql, countHql, params, page, complaintDAO);
		return list;
		
	}
	
	public void signComplaint(Integer id,Integer dealId){
		Complaint complaint=complaintDAO.findById(id);
		complaint.setCState("“—¥¶¿Ì");
		User user=new User();
		user.setUserId(dealId);
		complaint.setUserByUserId(user);
		complaintDAO.save(complaint);
	}
	
	/*public List<User> searchUserByAccount(String account){
		Object[] params=null;
		String selectHql=null;
		
		selectHql="from User as u where u.account = '"+account+"'";
		
		String countHql="select count(*) "+selectHql;
		List<User> list=PageService.searchByPage(selectHql, countHql, params, null, complaintDAO);
		return list;
	}*/
	
	
}
