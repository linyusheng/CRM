package com.R72X.entity;

import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;

/**
 * Sellswarn entity. @author MyEclipse Persistence Tools
 */

public class Sellswarn implements java.io.Serializable {

	// Fields

	private Integer sellsWarnId;
	private Sellsopportunity sellsopportunity;
	private String sellsWarnName;
	private Timestamp warnDate;
	private String warnDesc;
	private String warnState;
	private Set sellsopportunities = new HashSet(0);

	// Constructors

	/** default constructor */
	public Sellswarn() {
	}

	/** minimal constructor */
	public Sellswarn(Timestamp warnDate) {
		this.warnDate = warnDate;
	}

	/** full constructor */
	public Sellswarn(Sellsopportunity sellsopportunity, String sellsWarnName,
			Timestamp warnDate, String warnDesc, String warnState,
			Set sellsopportunities) {
		this.sellsopportunity = sellsopportunity;
		this.sellsWarnName = sellsWarnName;
		this.warnDate = warnDate;
		this.warnDesc = warnDesc;
		this.warnState = warnState;
		this.sellsopportunities = sellsopportunities;
	}

	// Property accessors

	public Integer getSellsWarnId() {
		return this.sellsWarnId;
	}

	public void setSellsWarnId(Integer sellsWarnId) {
		this.sellsWarnId = sellsWarnId;
	}

	public Sellsopportunity getSellsopportunity() {
		return this.sellsopportunity;
	}

	public void setSellsopportunity(Sellsopportunity sellsopportunity) {
		this.sellsopportunity = sellsopportunity;
	}

	public String getSellsWarnName() {
		return this.sellsWarnName;
	}

	public void setSellsWarnName(String sellsWarnName) {
		this.sellsWarnName = sellsWarnName;
	}

	public Timestamp getWarnDate() {
		return this.warnDate;
	}

	public void setWarnDate(Timestamp warnDate) {
		this.warnDate = warnDate;
	}

	public String getWarnDesc() {
		return this.warnDesc;
	}

	public void setWarnDesc(String warnDesc) {
		this.warnDesc = warnDesc;
	}

	public String getWarnState() {
		return this.warnState;
	}

	public void setWarnState(String warnState) {
		this.warnState = warnState;
	}

	public Set getSellsopportunities() {
		return this.sellsopportunities;
	}

	public void setSellsopportunities(Set sellsopportunities) {
		this.sellsopportunities = sellsopportunities;
	}

}