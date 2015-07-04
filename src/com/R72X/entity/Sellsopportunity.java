package com.R72X.entity;

import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;

/**
 * Sellsopportunity entity. @author MyEclipse Persistence Tools
 */

public class Sellsopportunity implements java.io.Serializable {

	// Fields

	private Integer sellsOpportunityId;
	private Customer customer;
	private Sellswarn sellswarn;
	private Timestamp nextCallTime;
	private String sellsOpportunityDesc;
	private String sellsOpportunityName;
	private Set sellswarns = new HashSet(0);

	// Constructors

	/** default constructor */
	public Sellsopportunity() {
	}

	/** minimal constructor */
	public Sellsopportunity(Timestamp nextCallTime) {
		this.nextCallTime = nextCallTime;
	}

	/** full constructor */
	public Sellsopportunity(Customer customer, Sellswarn sellswarn,
			Timestamp nextCallTime, String sellsOpportunityDesc,
			String sellsOpportunityName, Set sellswarns) {
		this.customer = customer;
		this.sellswarn = sellswarn;
		this.nextCallTime = nextCallTime;
		this.sellsOpportunityDesc = sellsOpportunityDesc;
		this.sellsOpportunityName = sellsOpportunityName;
		this.sellswarns = sellswarns;
	}

	// Property accessors

	public Integer getSellsOpportunityId() {
		return this.sellsOpportunityId;
	}

	public void setSellsOpportunityId(Integer sellsOpportunityId) {
		this.sellsOpportunityId = sellsOpportunityId;
	}

	public Customer getCustomer() {
		return this.customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public Sellswarn getSellswarn() {
		return this.sellswarn;
	}

	public void setSellswarn(Sellswarn sellswarn) {
		this.sellswarn = sellswarn;
	}

	public Timestamp getNextCallTime() {
		return this.nextCallTime;
	}

	public void setNextCallTime(Timestamp nextCallTime) {
		this.nextCallTime = nextCallTime;
	}

	public String getSellsOpportunityDesc() {
		return this.sellsOpportunityDesc;
	}

	public void setSellsOpportunityDesc(String sellsOpportunityDesc) {
		this.sellsOpportunityDesc = sellsOpportunityDesc;
	}

	public String getSellsOpportunityName() {
		return this.sellsOpportunityName;
	}

	public void setSellsOpportunityName(String sellsOpportunityName) {
		this.sellsOpportunityName = sellsOpportunityName;
	}

	public Set getSellswarns() {
		return this.sellswarns;
	}

	public void setSellswarns(Set sellswarns) {
		this.sellswarns = sellswarns;
	}

}