package com.R72X.entity;

import java.util.HashSet;
import java.util.Set;

/**
 * Productcategory entity. @author MyEclipse Persistence Tools
 */

public class Productcategory implements java.io.Serializable {

	// Fields

	private Integer productCategoryId;
	private String categoryName;
	private String productCategoryDesc;
	private Set products = new HashSet(0);

	// Constructors

	/** default constructor */
	public Productcategory() {
	}

	/** minimal constructor */
	public Productcategory(String categoryName, String productCategoryDesc) {
		this.categoryName = categoryName;
		this.productCategoryDesc = productCategoryDesc;
	}

	/** full constructor */
	public Productcategory(String categoryName, String productCategoryDesc,
			Set products) {
		this.categoryName = categoryName;
		this.productCategoryDesc = productCategoryDesc;
		this.products = products;
	}

	// Property accessors

	public Integer getProductCategoryId() {
		return this.productCategoryId;
	}

	public void setProductCategoryId(Integer productCategoryId) {
		this.productCategoryId = productCategoryId;
	}

	public String getCategoryName() {
		return this.categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public String getProductCategoryDesc() {
		return this.productCategoryDesc;
	}

	public void setProductCategoryDesc(String productCategoryDesc) {
		this.productCategoryDesc = productCategoryDesc;
	}

	public Set getProducts() {
		return this.products;
	}

	public void setProducts(Set products) {
		this.products = products;
	}

}