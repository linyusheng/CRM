package com.R72X.entity;

import java.util.Date;

/**
 * Contactnote entity. @author MyEclipse Persistence Tools
 */

public class Contactnote implements java.io.Serializable {

	// Fields

	private Integer contactNoteId;
	private User user;
	private Enterprise enterprise;
	private String contactNoteName;
	private Date contactDate;
	private String contactDesc;

	// Constructors

	/** default constructor */
	public Contactnote() {
	}

	/** minimal constructor */
	public Contactnote(Date contactDate) {
		this.contactDate = contactDate;
	}

	/** full constructor */
	public Contactnote(User user, Enterprise enterprise,
			String contactNoteName, Date contactDate, String contactDesc) {
		this.user = user;
		this.enterprise = enterprise;
		this.contactNoteName = contactNoteName;
		this.contactDate = contactDate;
		this.contactDesc = contactDesc;
	}

	// Property accessors

	public Integer getContactNoteId() {
		return this.contactNoteId;
	}

	public void setContactNoteId(Integer contactNoteId) {
		this.contactNoteId = contactNoteId;
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

	public String getContactNoteName() {
		return this.contactNoteName;
	}

	public void setContactNoteName(String contactNoteName) {
		this.contactNoteName = contactNoteName;
	}

	public Date getContactDate() {
		return this.contactDate;
	}

	public void setContactDate(Date contactDate) {
		this.contactDate = contactDate;
	}

	public String getContactDesc() {
		return this.contactDesc;
	}

	public void setContactDesc(String contactDesc) {
		this.contactDesc = contactDesc;
	}

}