package com.R72X.entity;

/**
 * Commonproblem entity. @author MyEclipse Persistence Tools
 */

public class Commonproblem implements java.io.Serializable {

	// Fields

	private Integer commonProblemId;
	private User user;
	private String commonProblemName;
	private String commonProblemDesc;
	private String commonSolutionDesc;

	// Constructors

	/** default constructor */
	public Commonproblem() {
	}

	/** full constructor */
	public Commonproblem(User user, String commonProblemName,
			String commonProblemDesc, String commonSolutionDesc) {
		this.user = user;
		this.commonProblemName = commonProblemName;
		this.commonProblemDesc = commonProblemDesc;
		this.commonSolutionDesc = commonSolutionDesc;
	}

	// Property accessors

	public Integer getCommonProblemId() {
		return this.commonProblemId;
	}

	public void setCommonProblemId(Integer commonProblemId) {
		this.commonProblemId = commonProblemId;
	}

	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getCommonProblemName() {
		return this.commonProblemName;
	}

	public void setCommonProblemName(String commonProblemName) {
		this.commonProblemName = commonProblemName;
	}

	public String getCommonProblemDesc() {
		return this.commonProblemDesc;
	}

	public void setCommonProblemDesc(String commonProblemDesc) {
		this.commonProblemDesc = commonProblemDesc;
	}

	public String getCommonSolutionDesc() {
		return this.commonSolutionDesc;
	}

	public void setCommonSolutionDesc(String commonSolutionDesc) {
		this.commonSolutionDesc = commonSolutionDesc;
	}

}