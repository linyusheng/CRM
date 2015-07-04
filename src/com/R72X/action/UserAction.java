package com.R72X.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.Collection;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.apache.struts2.ServletActionContext;

import com.R72X.entity.Contactnote;
import com.R72X.entity.Contactplan;
import com.R72X.entity.Customer;
import com.R72X.entity.User;
import com.R72X.service.ContactnoteService;
import com.R72X.service.ContactplanService;
import com.R72X.service.CustomerService;
import com.R72X.service.UserService;
import com.R72X.util.PageBean;
import com.R72X.util.Tool;
import com.opensymphony.xwork2.ActionContext;

public class UserAction {
	private CustomerService customerService;
	private ContactnoteService contactnoteService;
	private ContactplanService contactplanService;	
	private UserService userService;
	private Integer id;
	private Integer[] ids;
	private User user;
	private Collection<User> userColl;
	private PageBean pageBean;
	private String isResetPWD;
	private String keyWord;
	private String searchType;
	
	private String account;
	private String password;
	private String errorMessage;
	private String newPassword;

	public void setCustomerService(CustomerService customerService) {
		this.customerService = customerService;
	}
	public void setContactnoteService(ContactnoteService contactnoteService) {
		this.contactnoteService = contactnoteService;
	}
	public void setContactplanService(ContactplanService contactplanService) {
		this.contactplanService = contactplanService;
	}
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
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
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Collection<User> getUserColl() {
		return userColl;
	}
	public void setUserColl(Collection<User> userColl) {
		this.userColl = userColl;
	}
	public PageBean getPageBean() {
		return pageBean;
	}
	public void setPageBean(PageBean pageBean) {
		this.pageBean = pageBean;
	}
	public String getIsResetPWD() {
		return isResetPWD;
	}
	public void setIsResetPWD(String isResetPWD) {
		this.isResetPWD = isResetPWD;
	}
	public String getKeyWord() {
		return keyWord;
	}
	public void setKeyWord(String keyWord) {
		this.keyWord = keyWord;
	}
	
	public String getAccount() {
		return account;
	}
	public String getPassword() {
		return password;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getErrorMessage() {
		return errorMessage;
	}
	public void setErrorMessage(String errorMessage) {
		this.errorMessage = errorMessage;
	}
	public String getNewPassword() {
		return newPassword;
	}
	public void setNewPassword(String newPassword) {
		this.newPassword = newPassword;
	}
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String load() throws Exception{
		if(id==null){
			return "success";
		}
		user=userService.loadUser(id);
		return "success";
	}
	
	public String save() throws Exception{
		//是否重置密码
		if(user.getUserId()!=null&&isResetPWD!=null&&isResetPWD.endsWith("true")){
			String pwd_md5=Tool.getMD5String(this.user.getAccount());
			this.user.setPassword(pwd_md5);
		}
		if(user.getUserId()==null){
			while(true){
				String account=""+Tool.getAccount(6);
				if(!isAccountExist(account)){
					user.setAccount(account);
					String pwd_md5=Tool.getMD5String(account);
					
					user.setPassword(pwd_md5);
					break;
				}
				
			}
			user.setPhoto("default.png");

		}
		
		userService.saveUser(user);		
		return "success";
	}
	/*
	 * 不是真的删除，只是将帐号密码置空“”
	 */
	public String remove() throws Exception{
		if(ids==null)return "success";		
		
		for(int i=0,size=ids.length;i<size;i++){
			//删除客户联系计划
			List<Contactplan> list=contactplanService.searchContactplanByUser(ids[i]);
			if(!list.isEmpty()){
				for(int j=0,sizej=list.size();j<sizej;j++){
					contactplanService.removeContactplan(((Contactplan)list.get(j)).getContactPlanId());
				}
			}
			
			//删除客户联系记录
			List<Contactnote> noteList=contactnoteService.searchContactnoteByUser(ids[i]);
			if(!noteList.isEmpty()){
				for(int j=0,sizej=noteList.size();j<sizej;j++){
					contactnoteService.removeContactnote(((Contactnote)noteList.get(j)).getContactNoteId());
				}
			}
			
			//删除客户联系人
			List<Customer> customerList=customerService.searchCustomer(null, null, ids[i]);//.searchCustomer(ids[i]);
			if(!customerList.isEmpty()){
				for(int j=0,sizej=customerList.size();j<sizej;j++){
					customerService.removeCustomer(((Customer)customerList.get(j)).getCustomerId());
				}
			}
			
			user=userService.loadUser(ids[i]);
			user.setAccount("");
			user.setPassword("");
			userService.saveUser(user);
			//userService.removeUser(ids[i]);
		}		
		return "success";
	}
	
	public String search() throws Exception{
		if(pageBean==null){
			pageBean=new PageBean();
		}
		
		//userColl=userService.searchUser((keyWord==null)?null:keyWord, pageBean);
		userColl=userService.searchUser((keyWord==null)?null:keyWord,searchType,pageBean);
		return "success";
	}
	
	public boolean isAccountExist(String account) throws Exception{		
		userColl=userService.searchUserByAccount(account);
		if(userColl.isEmpty())return false;
		else return true;
	}	
}
