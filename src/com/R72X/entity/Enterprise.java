package com.R72X.entity;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * Enterprise entity. @author MyEclipse Persistence Tools
 */

public class Enterprise implements java.io.Serializable {

	// Fields

	private Integer enterpriseId;
	private String bossName;
	private String enterpriseName;
	private String phoneNumber;
	private String fax;
	private String address;
	private Date establishDate;
	private Set contactplans = new HashSet(0);
	private Set contactnotes = new HashSet(0);
	private Set compacts = new HashSet(0);
	private Set customers = new HashSet(0);

	// Constructors

	/** default constructor */
	public Enterprise() {
	}

	/** minimal constructor */
	public Enterprise(String bossName, String enterpriseName, String phoneNumber) {
		this.bossName = bossName;
		this.enterpriseName = enterpriseName;
		this.phoneNumber = phoneNumber;
	}

	/** full constructor */
	public Enterprise(String bossName, String enterpriseName,
			String phoneNumber, String fax, String address, Date establishDate,
			Set contactplans, Set contactnotes, Set compacts, Set customers) {
		this.bossName = bossName;
		this.enterpriseName = enterpriseName;
		this.phoneNumber = phoneNumber;
		this.fax = fax;
		this.address = address;
		this.establishDate = establishDate;
		this.contactplans = contactplans;
		this.contactnotes = contactnotes;
		this.compacts = compacts;
		this.customers = customers;
	}

	// Property accessors

	public Integer getEnterpriseId() {
		return this.enterpriseId;
	}

	public void setEnterpriseId(Integer enterpriseId) {
		this.enterpriseId = enterpriseId;
	}

	public String getBossName() {
		return this.bossName;
	}

	public void setBossName(String bossName) {
		this.bossName = bossName;
	}

	public String getEnterpriseName() {
		return this.enterpriseName;
	}

	public void setEnterpriseName(String enterpriseName) {
		this.enterpriseName = enterpriseName;
	}

	public String getPhoneNumber() {
		return this.phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getFax() {
		return this.fax;
	}

	public void setFax(String fax) {
		this.fax = fax;
	}

	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Date getEstablishDate() {
		return this.establishDate;
	}

	public void setEstablishDate(Date establishDate) {
		this.establishDate = establishDate;
	}

	public Set getContactplans() {
		return this.contactplans;
	}

	public void setContactplans(Set contactplans) {
		this.contactplans = contactplans;
	}

	public Set getContactnotes() {
		return this.contactnotes;
	}

	public void setContactnotes(Set contactnotes) {
		this.contactnotes = contactnotes;
	}

	public Set getCompacts() {
		return this.compacts;
	}

	public void setCompacts(Set compacts) {
		this.compacts = compacts;
	}

	public Set getCustomers() {
		return this.customers;
	}

	public void setCustomers(Set customers) {
		this.customers = customers;
	}

}