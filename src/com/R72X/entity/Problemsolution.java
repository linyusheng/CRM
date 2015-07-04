package com.R72X.entity;

import java.sql.Timestamp;
import java.util.Date;

/**
 * Problemsolution entity. @author MyEclipse Persistence Tools
 */

public class Problemsolution implements java.io.Serializable {

	// Fields

	private Integer problemId;
	private User userByProSolverId;
	private User userByServerId;
	private String problemName;
	private String problemDesc;
	private Timestamp submitDate;
	private Date solutionDate;
	private String solutionDesc;
	private String PState;

	// Constructors

	/** default constructor */
	public Problemsolution() {
	}

	/** full constructor */
	public Problemsolution(User userByProSolverId, User userByServerId,
			String problemName, String problemDesc, Timestamp submitDate,
			Date solutionDate, String solutionDesc, String PState) {
		this.userByProSolverId = userByProSolverId;
		this.userByServerId = userByServerId;
		this.problemName = problemName;
		this.problemDesc = problemDesc;
		this.submitDate = submitDate;
		this.solutionDate = solutionDate;
		this.solutionDesc = solutionDesc;
		this.PState = PState;
	}

	// Property accessors

	public Integer getProblemId() {
		return this.problemId;
	}

	public void setProblemId(Integer problemId) {
		this.problemId = problemId;
	}

	public User getUserByProSolverId() {
		return this.userByProSolverId;
	}

	public void setUserByProSolverId(User userByProSolverId) {
		this.userByProSolverId = userByProSolverId;
	}

	public User getUserByServerId() {
		return this.userByServerId;
	}

	public void setUserByServerId(User userByServerId) {
		this.userByServerId = userByServerId;
	}

	public String getProblemName() {
		return this.problemName;
	}

	public void setProblemName(String problemName) {
		this.problemName = problemName;
	}

	public String getProblemDesc() {
		return this.problemDesc;
	}

	public void setProblemDesc(String problemDesc) {
		this.problemDesc = problemDesc;
	}

	public Timestamp getSubmitDate() {
		return this.submitDate;
	}

	public void setSubmitDate(Timestamp submitDate) {
		this.submitDate = submitDate;
	}

	public Date getSolutionDate() {
		return this.solutionDate;
	}

	public void setSolutionDate(Date solutionDate) {
		this.solutionDate = solutionDate;
	}

	public String getSolutionDesc() {
		return this.solutionDesc;
	}

	public void setSolutionDesc(String solutionDesc) {
		this.solutionDesc = solutionDesc;
	}

	public String getPState() {
		return this.PState;
	}

	public void setPState(String PState) {
		this.PState = PState;
	}

}