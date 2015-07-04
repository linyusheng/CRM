package com.R72X.action;

import java.sql.Timestamp;
import java.util.Collection;
import java.util.HashMap;
import java.util.LinkedHashMap;

import com.R72X.entity.Compact;
import com.R72X.entity.Product;
import com.R72X.entity.Productcategory;
import com.R72X.service.ProductService;
import com.R72X.service.ProductcategoryService;

import com.R72X.util.PageBean;
import com.R72X.util.PageService;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;


public class ProductAction {

	private ProductService productService;
	
	public void setProductService (ProductService productService){
		this.productService=productService;
	}
	
	
	private ProductcategoryService productcategoryService;
	   
	   
	   public void setProductcategoryService (ProductcategoryService productcategoryService){
		   this.productcategoryService=productcategoryService;
	   }
	
	/*---------------------------------------------------------------
	 * 
	 * 界面参数，需要对应的get/set方法
	 * 
	 * --------------------------------------------------------------
	 */
	
	//对单个对象操作时表示对象的唯一性标识（数据库主键）
	private Integer id;
	//对一组对象操作时表示所选对象的唯一性标识（数据库主键），并自动生成数组
	private Integer[] ids;
	private Product product;
    private String KeyWord;
    
    ArrayList<Product> productAL = new ArrayList<Product>();
    ArrayList<Product> productALDelete = new ArrayList<Product>();
    ArrayList<Product> productALNotDelete = new ArrayList<Product>();
	
	public ArrayList<Product> getProductAL() {
		return productAL;
	}

	public void setProductAL(ArrayList<Product> productAL) {
		this.productAL = productAL;
	}

	public ArrayList<Product> getProductALDelete() {
		return productALDelete;
	}

	public void setProductALDelete(ArrayList<Product> productALDelete) {
		this.productALDelete = productALDelete;
	}

	public ArrayList<Product> getProductALNotDelete() {
		return productALNotDelete;
	}

	public void setProductALNotDelete(ArrayList<Product> productALNotDelete) {
		this.productALNotDelete = productALNotDelete;
	}

	public void setKeyWord(String KeyWord){
		this.KeyWord=KeyWord;
	}
	
	public String getKeyWord(){
		return KeyWord;
	}
	
	//private String selectbeans;	//产品类别显示用
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer[] getIds() {
		return ids;
	}

	public void setIds(Integer[] ids) {
		this.ids = ids;
	}
	
	public Product getProduct(){
		return product;
	}
	
	public void setProduct(Product product){
		this.product=product;
	}
	
	private Collection<Productcategory> productcategoryColl;
	
	public void setProductcategoryColl(Collection<Productcategory> productcategoryColl){
		this.productcategoryColl=productcategoryColl;
	}
	
	public Collection<Productcategory> getProductcategoryColl(){
		return productcategoryColl;
	}
	
	// 查询结果集合，用于界面显示。在ONGL表达式中可直接引用本对象
	private Collection<Product> productColl;
	
	public Collection<Product> getProductColl(){
		return productColl;
	}
	
	public void setProductColl(Collection<Product> productColl){
		this.productColl=productColl;
	}
	
	
	/*-----------------------------------------------------------------
	 * 
	 * 增删查改处理
	 * 
	 * ----------------------------------------------------------------
	 */
	  
	// 新增和编辑的数据读取操作
	public String load() throws Exception {
		if (id == null) {
			searchcategory();
			return "success";
		}
		searchcategory();
		product=productService.loadProduct(id);
		
		return "success";
	}
	
	// 新增和编辑的数据保存操作
	public String save() throws Exception {
		if((product.getProductTime()==null)||(product.getProductTime().equals("")))
		{product.setProductTime(new Timestamp(System.currentTimeMillis()));}
		
		productService.saveProduct(product);
		return "success";
		
	}
	
	
	// 删除数据操作
	public String remove() throws Exception {
		if(ids==null){return "success";}
		String b="#产品已删除#";
		for (int i = 0, size = ids.length; i < size; i++) {
			product=productService.loadProduct(ids[i]);
			b+=product.getProductDesc();
			product.setProductDesc(b);
			productService.saveProduct(product);
			//productService.removeProduct(ids[i]);	
		}
		return "success";
	}
	
	
	/*--------------------------------------------------------------------
	 * 
	 * 综合查询，支持查询条件、分页
	 * 
	 * -------------------------------------------------------------------
	 */

	
	
	
	/*
	 * 查询条件参数
	 */
	
	
	
	private PageBean pageBean; // 分页对象
	public PageBean getPageBean() {
		return pageBean;
	}

	public void setPageBean(PageBean pageBean) {
		this.pageBean = pageBean;
	}
	
	/*
	 * 查询产品信息，支持条件和分页
	 */
	
	
	public String search() throws Exception {
		if (pageBean == null) {
			pageBean = new PageBean();
		}
		
		String  a;
		productColl=productService.searchProduct((KeyWord==null)?null:KeyWord,pageBean);
//		productAL= (ArrayList)productColl;
//		for(int i=0;i<productAL.size();i++){
//			a=productAL.get(i).getProductDesc();
//			if(a.compareTo("#产品已删除#")==0){productAL.remove(i);}
		
		
		
		
		
		
		return "success";
	}
	
	public String searchcategory() throws Exception {
		if (pageBean == null) {
			pageBean = new PageBean();
		}
		productcategoryColl=productcategoryService.searchProductcategory(null,null);
		return "success";
	}
	
	
}
