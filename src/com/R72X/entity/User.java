package com.R72X.entity;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * User entity. @author MyEclipse Persistence Tools
 */

public class User implements java.io.Serializable {

	// Fields

	private Integer userId;
	private String userName;
	private String userCategory;
	private String account;
	private String password;
	private Date birthday;
	private String nativePlace;
	private String sex;
	private String email;
	private String photo;
	
	private Set contactplans = new HashSet(0);
	private Set compactsForSellerId = new HashSet(0);
	private Set contactnotes = new HashSet(0);
	private Set customers = new HashSet(0);
	private Set problemsolutionsForProSolverId = new HashSet(0);
	private Set complaintsForUserId = new HashSet(0);
	private Set compactsForRegisterId = new HashSet(0);
	private Set complaintsForServerId = new HashSet(0);
	private Set problemsolutionsForServerId = new HashSet(0);
	private Set commonproblems = new HashSet(0);

	// Constructors

	/** default constructor */
	public User() {
	}

	/** minimal constructor */
	public User(String userName, String userCategory, String account,
			String password) {
		this.userName = userName;
		this.userCategory = userCategory;
		this.account = account;
		this.password = password;
	}

	/** full constructor */
	public User(String userName, String userCategory, String account,
			String password, Date birthday, String nativePlace, String sex,
			String email, Set contactplans, Set compactsForSellerId,
			Set contactnotes, Set customers,
			Set problemsolutionsForProSolverId, Set complaintsForUserId,
			Set compactsForRegisterId, Set complaintsForServerId,
			Set problemsolutionsForServerId, Set commonproblems) {
		this.userName = userName;
		this.userCategory = userCategory;
		this.account = account;
		this.password = password;
		this.birthday = birthday;
		this.nativePlace = nativePlace;
		this.sex = sex;
		this.email = email;
		this.contactplans = contactplans;
		this.compactsForSellerId = compactsForSellerId;
		this.contactnotes = contactnotes;
		this.customers = customers;
		this.problemsolutionsForProSolverId = problemsolutionsForProSolverId;
		this.complaintsForUserId = complaintsForUserId;
		this.compactsForRegisterId = compactsForRegisterId;
		this.complaintsForServerId = complaintsForServerId;
		this.problemsolutionsForServerId = problemsolutionsForServerId;
		this.commonproblems = commonproblems;
	}

	// Property accessors

	public Integer getUserId() {
		return this.userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return this.userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserCategory() {
		return this.userCategory;
	}

	public void setUserCategory(String userCategory) {
		this.userCategory = userCategory;
	}

	public String getAccount() {
		return this.account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Date getBirthday() {
		return this.birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public String getNativePlace() {
		return this.nativePlace;
	}

	public void setNativePlace(String nativePlace) {
		this.nativePlace = nativePlace;
	}

	public String getSex() {
		return this.sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}


	public Set getContactplans() {
		return this.contactplans;
	}

	public void setContactplans(Set contactplans) {
		this.contactplans = contactplans;
	}

	public Set getCompactsForSellerId() {
		return this.compactsForSellerId;
	}

	public void setCompactsForSellerId(Set compactsForSellerId) {
		this.compactsForSellerId = compactsForSellerId;
	}

	public Set getContactnotes() {
		return this.contactnotes;
	}

	public void setContactnotes(Set contactnotes) {
		this.contactnotes = contactnotes;
	}

	public Set getCustomers() {
		return this.customers;
	}

	public void setCustomers(Set customers) {
		this.customers = customers;
	}

	public Set getProblemsolutionsForProSolverId() {
		return this.problemsolutionsForProSolverId;
	}

	public void setProblemsolutionsForProSolverId(
			Set problemsolutionsForProSolverId) {
		this.problemsolutionsForProSolverId = problemsolutionsForProSolverId;
	}

	public Set getComplaintsForUserId() {
		return this.complaintsForUserId;
	}

	public void setComplaintsForUserId(Set complaintsForUserId) {
		this.complaintsForUserId = complaintsForUserId;
	}

	public Set getCompactsForRegisterId() {
		return this.compactsForRegisterId;
	}

	public void setCompactsForRegisterId(Set compactsForRegisterId) {
		this.compactsForRegisterId = compactsForRegisterId;
	}

	public Set getComplaintsForServerId() {
		return this.complaintsForServerId;
	}

	public void setComplaintsForServerId(Set complaintsForServerId) {
		this.complaintsForServerId = complaintsForServerId;
	}

	public Set getProblemsolutionsForServerId() {
		return this.problemsolutionsForServerId;
	}

	public void setProblemsolutionsForServerId(Set problemsolutionsForServerId) {
		this.problemsolutionsForServerId = problemsolutionsForServerId;
	}

	public Set getCommonproblems() {
		return this.commonproblems;
	}

	public void setCommonproblems(Set commonproblems) {
		this.commonproblems = commonproblems;
	}

}