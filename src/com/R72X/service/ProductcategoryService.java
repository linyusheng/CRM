package com.R72X.service;
import java.util.List;


import com.R72X.entity.ProductDAO;
import com.R72X.entity.Productcategory;
import com.R72X.util.PageBean;
import com.R72X.util.PageService;
import com.R72X.entity.ProductcategoryDAO;



public class ProductcategoryService {
    private ProductcategoryDAO productcategoryDAO;
    
    
    public void setProductcategoryDAO(ProductcategoryDAO productcategoryDAO) {
		this.productcategoryDAO = productcategoryDAO;	
		}	

   
   
    
    
    /*
     * 根据主键ID查找对象
     */
    
    public Productcategory loadProductcategory(Integer id){
    	return  productcategoryDAO.findById(id);
    }
	

	/*
	 * 执行新增对象或修改对象的保存操作
	 */
    
    public void saveProductcategory(Productcategory productcategory){
    	productcategoryDAO.merge(productcategory);
    }
    
    
    
    /*
	 * 根据主键ID删除数据库中对象
	 */
    
    public void removeProductcategory(Integer id){
    	
    	
    	productcategoryDAO.delete(productcategoryDAO.findById(id));
    }
    

    /*
	 * 按条件查询和分页支持
	 * 
	 * 根据产品类别名称执行模糊匹配查找，通过Page对象执行分页。
	 * 
	 * @categoryName:产品类别名称
	 * @page:分页对象
	 * 
	 */
    
    
    public   List<Productcategory> searchProductcategory(String string ,PageBean page){
    	 Object[] params = null;
 		
 		//创建HQL查询语句
 		String selectHql = null;
 		if((string == null) || (string.equals(""))) {
 			selectHql = "from Productcategory as r where r.productCategoryDesc not like '#产品类别已删除#%' ";
 		} else {
			selectHql = "from Productcategory as r where r.categoryName like '%" + string + "%' and r.productCategoryDesc not like '#产品类别已删除#%' " ;
		}
 		
 		//创建获取HQL返回记录总行数语句
		String countHql = "select count(*) " + selectHql;
 		
		//执行按条件查询和分页支持
		List<Productcategory> productcategoryList = PageService.searchByPage(selectHql, countHql, params, page, productcategoryDAO);
		return productcategoryList;
 		
    }
    
    public List<Productcategory> searchProductcategoryByCompact(Integer integer, PageBean page) {
		Object[] params = null;
		
		//创建HQL查询语句
		String selectHql = null;
		if((integer == null) || (integer.equals(""))) {
			selectHql = "from Productcategory as r where r.productCategoryDesc not like '#产品类别已删除#%' ";
		} else {
			selectHql = "from Productcategory as r where r.productCategoryDesc not like '#产品类别已删除#%' ";
		}
		
		//创建获取HQL返回记录总行数语句
		String countHql = "select count(*) " + selectHql;
		
		//执行按条件查询和分页支持
		List<Productcategory> productcategoryList = PageService.searchByPage(selectHql, countHql, params, page, productcategoryDAO);
		return productcategoryList;
  }
    
    
    
    
}
