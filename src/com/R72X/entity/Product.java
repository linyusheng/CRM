package com.R72X.entity;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * Product entity. @author MyEclipse Persistence Tools
 */

public class Product implements java.io.Serializable {

	// Fields

	private Integer productId;
	private Productcategory productcategory;
	private String productName;
	private String productDesc;
	private Date productTime;
	private Set compacts = new HashSet(0);

	// Constructors

	/** default constructor */
	public Product() {
	}

	/** minimal constructor */
	public Product(String productName, String productDesc) {
		this.productName = productName;
		this.productDesc = productDesc;
	}

	/** full constructor */
	public Product(Productcategory productcategory, String productName,
			String productDesc, Date productTime, Set compacts) {
		this.productcategory = productcategory;
		this.productName = productName;
		this.productDesc = productDesc;
		this.productTime = productTime;
		this.compacts = compacts;
	}

	// Property accessors

	public Integer getProductId() {
		return this.productId;
	}

	public void setProductId(Integer productId) {
		this.productId = productId;
	}

	public Productcategory getProductcategory() {
		return this.productcategory;
	}

	public void setProductcategory(Productcategory productcategory) {
		this.productcategory = productcategory;
	}

	public String getProductName() {
		return this.productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getProductDesc() {
		return this.productDesc;
	}

	public void setProductDesc(String productDesc) {
		this.productDesc = productDesc;
	}

	public Date getProductTime() {
		return this.productTime;
	}

	public void setProductTime(Date productTime) {
		this.productTime = productTime;
	}

	public Set getCompacts() {
		return this.compacts;
	}

	public void setCompacts(Set compacts) {
		this.compacts = compacts;
	}

}