package com.R72X.service;

import java.util.List;

import com.R72X.entity.User;
import com.R72X.entity.UserDAO;
import com.R72X.util.PageBean;
import com.R72X.util.PageService;

public class UserService {
	private UserDAO userDAO;

	public void setUserDAO(UserDAO userDAO) {
		this.userDAO = userDAO;
	}
	
	public User loadUser(Integer id){
		return userDAO.findById(id);
	}
	
	public void saveUser(User user){
		userDAO.merge(user);
	}
	
	public void removeUser(Integer id){
		userDAO.delete(userDAO.findById(id));
	}
	/*
	public List<User> searchUser(String userName, PageBean page){		
		Object[] params=null;
		String selectHql=null;
		if((userName==null)||(userName.equals(""))){
			selectHql="from User as u where u.account !=''";
		}
		else{
			selectHql="from User as u where u.account !='' and u.userName like '%"+userName+"%'";
		}
		String countHql="select count(*) "+selectHql;
		List<User> list=PageService.searchByPage(selectHql, countHql, params, page, userDAO);
		return list;
		
	}*/
	
	public List<User> searchUser(String keyWord,String searchType,PageBean page){		
		Object[] params=null;
		String selectHql=null;
		if((keyWord==null)||(keyWord.equals(""))||searchType==null){
			selectHql="from User as u where u.account !=''";
		}
		else{
			selectHql="from User as u where u.account !='' and u."+searchType+" like '%"+keyWord+"%'";
		}
		String countHql="select count(*) "+selectHql;
		List<User> list=PageService.searchByPage(selectHql, countHql, params, page, userDAO);
		return list;
		
	}
	
	
	public List<User> searchUserByAccount(String account){
		Object[] params=null;
		String selectHql=null;
		
		selectHql="from User as u where u.account = '"+account+"'";
		
		String countHql="select count(*) "+selectHql;
		List<User> list=PageService.searchByPage(selectHql, countHql, params, null, userDAO);
		return list;
	}
	
	public List<User> searchUserseByCompact(String userCategory, PageBean page) {
		Object[] params = null;
		
		//创建HQL查询语句
		String selectHql = null;
		if((userCategory == null) || (userCategory.equals(""))) {
			selectHql = "from User";
		} else {
			selectHql = "from User as r where r.userCategory like '%" + userCategory + "%'";
		}
		
		//创建获取HQL返回记录总行数语句
		String countHql = "select count(*) " + selectHql;
		
		//执行按条件查询和分页支持
		List<User> UserseList = PageService.searchByPage(selectHql, countHql, params, page, userDAO);
		return UserseList;
	}
 
	public List<User> searchUserreByCompact(String userCategory, PageBean page) {
		Object[] params = null;
		
		//创建HQL查询语句
		String selectHql = null;
		if((userCategory == null) || (userCategory.equals(""))) {
			selectHql = "from User";
		} else {
			selectHql = "from User as r where r.userCategory like '%" + userCategory + "%'";
		}
		
		//创建获取HQL返回记录总行数语句
		String countHql = "select count(*) " + selectHql;
		
		//执行按条件查询和分页支持
		List<User> UserreList = PageService.searchByPage(selectHql, countHql, params, page, userDAO);
		return UserreList;
	}
	
	public boolean isAccountExist(String account){
		Object[] params = null;
		String selectHql ="from User as u where u.account='"+account+"'";
		//创建获取HQL返回记录总行数语句
		String countHql = "select count(*) " + selectHql;
		List<User> userList = PageService.searchByPage(selectHql, countHql, params, null, userDAO);
		if(userList.isEmpty()){
			return false;
		}
		else return true;
	}
	
	public User login(String account,String password){
		Object[] params = null;
		String selectHql ="from User as u where u.account='"+account+"' and u.password='"+password+"'";
		//创建获取HQL返回记录总行数语句
		String countHql = "select count(*) " + selectHql;
		List<User> userList = PageService.searchByPage(selectHql, countHql, params, null, userDAO);
		if(userList.isEmpty()){
			return null;
		}
		else return userList.get(0);
	}
	
	public String savePassword(Integer id,String oldPassword,String newPassword){
		User user=userDAO.findById(id);
		if(user.getPassword().equals(oldPassword)){
			user.setPassword(newPassword);
			userDAO.merge(user);
			return "success";
		}
		else{
			return "errorPassword";
		}
		
		
	}
}
