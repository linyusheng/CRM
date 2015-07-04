package com.R72X.entity;

import java.util.Date;

/**
 * Compact entity. @author MyEclipse Persistence Tools
 */

public class Compact implements java.io.Serializable {

	// Fields

	private Integer compactId;
	private User userBySellerId;
	private Product product;
	private User userByRegisterId;
	private Enterprise enterprise;
	private Date signDate; 
	private String lastTime;
	private Float signMoney;
	private Float breakMoney;
	private String payWay;
	private Date effectTime;
	private String compactDesc;
	private String attachment;

	// Constructors
	
	/** default constructor */
	public Compact() {
	}

	/** minimal constructor */
	public Compact(Date signDate, String lastTime, Float signMoney,
			Date effectTime, String compactDesc) {
		this.signDate = signDate;
		this.lastTime = lastTime;
		this.signMoney = signMoney;
		this.effectTime = effectTime;
		this.compactDesc = compactDesc;
		
	}

	/** full constructor */
	public Compact(User userBySellerId, Product product, User userByRegisterId,
			Enterprise enterprise, Date signDate, String lastTime,
			Float signMoney, Float breakMoney, String payWay, Date effectTime,
			String compactDesc, String attachment) {
		this.userBySellerId = userBySellerId;
		this.product = product;
		this.userByRegisterId = userByRegisterId;
		this.enterprise = enterprise;
		this.signDate = signDate;
		this.lastTime = lastTime;
		this.signMoney = signMoney;
		this.breakMoney = breakMoney;
		this.payWay = payWay;
		this.effectTime = effectTime;
		this.compactDesc = compactDesc;
		this.attachment = attachment;
	}

	// Property accessors

	public Integer getCompactId() {
		return this.compactId;
	}

	public void setCompactId(Integer compactId) {
		this.compactId = compactId;
	}

	public User getUserBySellerId() {
		return this.userBySellerId;
	}

	public void setUserBySellerId(User userBySellerId) {
		this.userBySellerId = userBySellerId;
	}

	public Product getProduct() {
		return this.product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public User getUserByRegisterId() {
		return this.userByRegisterId;
	}

	public void setUserByRegisterId(User userByRegisterId) {
		this.userByRegisterId = userByRegisterId;
	}

	public Enterprise getEnterprise() {
		return this.enterprise;
	}

	public void setEnterprise(Enterprise enterprise) {
		this.enterprise = enterprise;
	}

	public Date getSignDate() {
		return this.signDate;
	}

	public void setSignDate(Date signDate) {
		this.signDate = signDate;
	}

	public String getLastTime() {
		return this.lastTime;
	}

	public void setLastTime(String lastTime) {
		this.lastTime = lastTime;
	}

	public Float getSignMoney() {
		return this.signMoney;
	}

	public void setSignMoney(Float signMoney) {
		this.signMoney = signMoney;
	}

	public Float getBreakMoney() {
		return this.breakMoney;
	}

	public void setBreakMoney(Float breakMoney) {
		this.breakMoney = breakMoney;
	}

	public String getPayWay() {
		return this.payWay;
	}

	public void setPayWay(String payWay) {
		this.payWay = payWay;
	}

	public Date getEffectTime() {
		return this.effectTime;
	}

	public void setEffectTime(Date effectTime) {
		this.effectTime = effectTime;
	}

	public String getCompactDesc() {
		return this.compactDesc;
	}

	public void setCompactDesc(String compactDesc) {
		this.compactDesc = compactDesc;
	}

	public String getAttachment() {
		return this.attachment;
	}

	public void setAttachment(String attachment) {
		this.attachment = attachment;
	}

}