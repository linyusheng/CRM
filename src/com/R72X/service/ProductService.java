package com.R72X.service;
import java.util.List;



import com.R72X.entity.Product;
import com.R72X.entity.ProductDAO;
import com.R72X.util.PageBean;
import com.R72X.util.PageService;


public class ProductService {

	 private ProductDAO productDAO;
	 
	 /*  public ProductDAO getProductDAO() {
	  *	 return productDAO;
		 }
      */ 
		public void setProductDAO(ProductDAO productDAO) {
			this.productDAO = productDAO;	
			}	
   


  /*
   * 根据主键ID查找对象
   */

    public  Product loadProduct(Integer id){
    	return  productDAO.findById(id);
    }

	/*
	 * 执行新增对象或修改对象的保存操作
	 */
    
    public void saveProduct(Product product){
    	 productDAO.merge(product);
    }
    
    
	/*
	 * 根据主键ID删除数据库中对象
	 */
    
    public void removeProduct(Integer id){
    	productDAO.delete(productDAO.findById(id));
    }
    
    
    /*
	 * 按条件查询和分页支持
	 * 
	 * 根据产品名称执行模糊匹配查找，通过Page对象执行分页。
	 * 
	 * @productName:产品名称
	 * @page:分页对象
	 * 
	 */
    
    
    public List<Product> searchProduct(String  string, PageBean page){
        Object[] params = null;
		
		//创建HQL查询语句
		String selectHql = null;
		if((string == null) || (string.equals(""))) {
			selectHql = "from Product as r where r.productDesc not like '#产品已删除#%'";
		} else {
			selectHql = "from Product as r where r.productName like '%" + string + "%' and r.productDesc not like '#产品已删除#%' ";
		}
		
		//创建获取HQL返回记录总行数语句
		String countHql = "select count(*) " + selectHql;
		
		//执行按条件查询和分页支持
		List<Product> productList = PageService.searchByPage(selectHql, countHql, params, page, productDAO);
		return productList;			
    }
    
    
    public List<Product> searchProductByCompact(Integer integer, PageBean page) {
		Object[] params = null;
		
		//创建HQL查询语句
		String selectHql = null;
		if((integer == null) || (integer.equals(""))) {
			selectHql = "from Product as r where  r.productDesc not like '#产品已删除#%' ";
		} else {
			selectHql = "from Product as r where  r.productDesc not like '#产品已删除#%' and  r.productcategory.productCategoryId = "+integer;
		}
		
		//创建获取HQL返回记录总行数语句
		String countHql = "select count(*) " + selectHql;
		
		//执行按条件查询和分页支持
		List<Product> productList = PageService.searchByPage(selectHql, countHql, params, page, productDAO);
		return productList;
}
    
    public List<Product> searchProductByProductcategoryID(Integer integer, PageBean page) {
		Object[] params = null;
		
		//创建HQL查询语句
		String selectHql = null;
		if((integer == null) || (integer.equals(""))) {
			selectHql = "from Product as r where  r.productDesc not like '#产品已删除#%' ";
		} else {
			selectHql = "from Product as r where  r.productDesc not like '#产品已删除#%' and  r.productcategory.productCategoryId = "+integer;
		}
		
		//创建获取HQL返回记录总行数语句
		String countHql = "select count(*) " + selectHql;
		
		//执行按条件查询和分页支持
		List<Product> productList = PageService.searchByPage(selectHql, countHql, params, page, productDAO);
		return productList;
}
    
}