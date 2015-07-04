package com.R72X.action;
import java.sql.Timestamp;
import java.util.Collection;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;

import com.R72X.util.PageBean;
import com.R72X.util.PageService;
import com.R72X.entity.Product;
import com.R72X.entity.Productcategory;
import com.R72X.service.ProductService;
import com.R72X.service.ProductcategoryService;



public class ProductcategoryAction {
   private ProductcategoryService productcategoryService;
   
   
   public void setProductcategoryService (ProductcategoryService productcategoryService){
	   this.productcategoryService=productcategoryService;
   }
	
    private ProductService productService;
	
	public void setProductService (ProductService productService){
		this.productService=productService;
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
	
	private Productcategory productcategory;
	private Collection<Productcategory> productcategoryColl;
	private PageBean pageBean; // 分页对象
	private String KeyWord;
	
	/*private String name;
	
	public void setName(String name){
		this.name=name;
	}
	
	public String getName(){
		return name;
	}*/
	
	public void setKeyWord(String KeyWord){
		this.KeyWord=KeyWord;
	}
	
	public String getKeyWord(){
		return KeyWord;
	}
	
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
	
	public Productcategory getProductcategory(){
		return productcategory;
	}
	
	public void setProductcategory (Productcategory productcategory){
		this.productcategory=productcategory;
	}
	
	public void setProductcategoryColl(Collection<Productcategory> productcategoryColl){
		this.productcategoryColl=productcategoryColl;
	}
	
	public Collection<Productcategory> getProductcategoryColl(){
		return productcategoryColl;
	}
	
	public PageBean getPageBean() {
		return pageBean;
	}

	public void setPageBean(PageBean pageBean) {
		this.pageBean = pageBean;
	}
	
	private List<Product> productList;
	
	/*-----------------------------------------------------------------
	 * 
	 * 增删查改处理
	 * 
	 * ----------------------------------------------------------------
	 */
	  
	// 新增和编辑的数据读取操作
	public String load() throws Exception {
		if (id == null) {
			return "success";
		}
		productcategory=productcategoryService.loadProductcategory(id);
	return "success";
	}
	
	// 新增和编辑的数据保存操作
	public String save() throws Exception {
		productcategoryService.saveProductcategory(productcategory);
		return "success";
	}
	

	// 删除数据操作
	public String remove() throws Exception {
		/*if (pageBean == null) {
			pageBean = new PageBean();
		}
		if(name!=null){
		productColl=productService.searchProduct(name,pageBean);}*/
		
		
		if (pageBean == null) {
			pageBean = new PageBean();
		}
		String b1="#产品已删除#";
		String b2="#产品类别已删除#";
		if(ids==null){return "success";}
		for (int i = 0, size = ids.length; i < size; i++) {
			productList=productService.searchProductByProductcategoryID(ids[i], pageBean);
			for(int j=0,size2=productList.size();j<size2;j++){
			Product product2=	productService.loadProduct(productList.get(j).getProductId());
				product2.setProductDesc(b1+product2.getProductDesc());
				productService.saveProduct(product2);	
			}
			
			
		productcategory=	productcategoryService.loadProductcategory(ids[i]);
		productcategory.setProductCategoryDesc(b2+productcategory.getProductCategoryDesc());
		productcategoryService.saveProductcategory(productcategory);
		}
	return "success";
	}
	
	/*
	 * 查询产品信息，支持条件和分页
	 */
	
	
	public String search() throws Exception {
		if (pageBean == null) {
			pageBean = new PageBean();
		}
		productcategoryColl=productcategoryService.searchProductcategory((KeyWord==null)?null:KeyWord,pageBean);
		return "success";
	}
	
}
