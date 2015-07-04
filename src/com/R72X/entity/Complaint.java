package com.R72X.entity;

import java.sql.Timestamp;

/**
 * Complaint entity. @author MyEclipse Persistence Tools
 */

public class Complaint implements java.io.Serializable {

	// Fields

	private Integer complaintId;
	private User userByServerId;
	private User userByUserId;
	private String complaintProblem;
	private String complaintProblemDesc;
	private Timestamp complaintTime;
	private Integer solverId;
	private String complaintName;
	private String complaintNumber;
	private String CState;

	// Constructors

	/** default constructor */
	public Complaint() {
	}

	/** minimal constructor */
	public Complaint(String complaintProblem, String complaintProblemDesc,
			Timestamp complaintTime) {
		this.complaintProblem = complaintProblem;
		this.complaintProblemDesc = complaintProblemDesc;
		this.complaintTime = complaintTime;
	}

	/** full constructor */
	public Complaint(User userByServerId, User userByUserId,
			String complaintProblem, String complaintProblemDesc,
			Timestamp complaintTime, Integer solverId, String complaintName,
			String complaintNumber, String CState) {
		this.userByServerId = userByServerId;
		this.userByUserId = userByUserId;
		this.complaintProblem = complaintProblem;
		this.complaintProblemDesc = complaintProblemDesc;
		this.complaintTime = complaintTime;
		this.solverId = solverId;
		this.complaintName = complaintName;
		this.complaintNumber = complaintNumber;
		this.CState = CState;
	}

	// Property accessors

	public Integer getComplaintId() {
		return this.complaintId;
	}

	public void setComplaintId(Integer complaintId) {
		this.complaintId = complaintId;
	}

	public User getUserByServerId() {
		return this.userByServerId;
	}

	public void setUserByServerId(User userByServerId) {
		this.userByServerId = userByServerId;
	}

	public User getUserByUserId() {
		return this.userByUserId;
	}

	public void setUserByUserId(User userByUserId) {
		this.userByUserId = userByUserId;
	}

	public String getComplaintProblem() {
		return this.complaintProblem;
	}

	public void setComplaintProblem(String complaintProblem) {
		this.complaintProblem = complaintProblem;
	}

	public String getComplaintProblemDesc() {
		return this.complaintProblemDesc;
	}

	public void setComplaintProblemDesc(String complaintProblemDesc) {
		this.complaintProblemDesc = complaintProblemDesc;
	}

	public Timestamp getComplaintTime() {
		return this.complaintTime;
	}

	public void setComplaintTime(Timestamp complaintTime) {
		this.complaintTime = complaintTime;
	}

	public Integer getSolverId() {
		return this.solverId;
	}

	public void setSolverId(Integer solverId) {
		this.solverId = solverId;
	}

	public String getComplaintName() {
		return this.complaintName;
	}

	public void setComplaintName(String complaintName) {
		this.complaintName = complaintName;
	}

	public String getComplaintNumber() {
		return this.complaintNumber;
	}

	public void setComplaintNumber(String complaintNumber) {
		this.complaintNumber = complaintNumber;
	}

	public String getCState() {
		return this.CState;
	}

	public void setCState(String CState) {
		this.CState = CState;
	}

}