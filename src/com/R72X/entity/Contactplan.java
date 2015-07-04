package com.R72X.entity;

/**
 * Contactplan entity. @author MyEclipse Persistence Tools
 */

public class Contactplan implements java.io.Serializable {

	// Fields

	private Integer contactPlanId;
	private User user;
	private Enterprise enterprise;
	private String contactPlanName;
	private String contactPlanDesc;

	// Constructors

	/** default constructor */
	public Contactplan() {
	}

	/** full constructor */
	public Contactplan(User user, Enterprise enterprise,
			String contactPlanName, String contactPlanDesc) {
		this.user = user;
		this.enterprise = enterprise;
		this.contactPlanName = contactPlanName;
		this.contactPlanDesc = contactPlanDesc;
	}

	// Property accessors

	public Integer getContactPlanId() {
		return this.contactPlanId;
	}

	public void setContactPlanId(Integer contactPlanId) {
		this.contactPlanId = contactPlanId;
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

	public String getContactPlanName() {
		return this.contactPlanName;
	}

	public void setContactPlanName(String contactPlanName) {
		this.contactPlanName = contactPlanName;
	}

	public String getContactPlanDesc() {
		return this.contactPlanDesc;
	}

	public void setContactPlanDesc(String contactPlanDesc) {
		this.contactPlanDesc = contactPlanDesc;
	}

}