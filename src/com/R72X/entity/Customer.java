package com.R72X.entity;

import java.util.HashSet;
import java.util.Set;

/**
 * Customer entity. @author MyEclipse Persistence Tools
 */

public class Customer implements java.io.Serializable {

	// Fields

	private Integer customerId;
	private User user;
	private Enterprise enterprise;
	private String customerName;
	private String personalNumber;
	private String position;
	private String hobby;
	private Set sellsopportunities = new HashSet(0);

	// Constructors

	/** default constructor */
	public Customer() {
	}

	/** minimal constructor */
	public Customer(String customerName) {
		this.customerName = customerName;
	}

	/** full constructor */
	public Customer(User user, Enterprise enterprise, String customerName,
			String personalNumber, String position, String hobby,
			Set sellsopportunities) {
		this.user = user;
		this.enterprise = enterprise;
		this.customerName = customerName;
		this.personalNumber = personalNumber;
		this.position = position;
		this.hobby = hobby;
		this.sellsopportunities = sellsopportunities;
	}

	// Property accessors

	public Integer getCustomerId() {
		return this.customerId;
	}

	public void setCustomerId(Integer customerId) {
		this.customerId = customerId;
	}

	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Enterprise getEnterprise() {
		return this.enterprise;
	}

	public void setEnterprise(Enterprise enterprise) {
		this.enterprise = enterprise;
	}

	public String getCustomerName() {
		return this.customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public String getPersonalNumber() {
		return this.personalNumber;
	}

	public void setPersonalNumber(String personalNumber) {
		this.personalNumber = personalNumber;
	}

	public String getPosition() {
		return this.position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public String getHobby() {
		return this.hobby;
	}

	public void setHobby(String hobby) {
		this.hobby = hobby;
	}

	public Set getSellsopportunities() {
		return this.sellsopportunities;
	}

	public void setSellsopportunities(Set sellsopportunities) {
		this.sellsopportunities = sellsopportunities;
	}

}