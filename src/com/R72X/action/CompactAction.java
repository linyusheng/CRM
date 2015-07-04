package com.R72X.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import com.R72X.entity.Compact;
import com.R72X.entity.Enterprise;
import com.R72X.entity.Product;
import com.R72X.entity.Productcategory;
import com.R72X.entity.User;
import com.R72X.service.CompactService;
import com.R72X.service.EnterpriseService;
import com.R72X.service.ProductService;
import com.R72X.service.ProductcategoryService;
import com.R72X.service.UserService;
import com.R72X.util.PageBean;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class CompactAction extends ActionSupport {
	private CompactService compactService;
	private ProductcategoryService productcategoryService;
	private ProductService productService;
	private EnterpriseService enterpriseService;
	private UserService userService;
	int index;
	Productcategory  productcategorytmp;
	private Integer productcategoryId;

	public int getProductcategoryId() {
		return productcategoryId;

	}

	public void setProductcategoryId(int productcategoryId) {
		this.productcategoryId = productcategoryId;
	}

	/**
	 * 文件上传部分
	 * 
	 * @return
	 */
	private String name;
	private File upload;
	private String uploadContentType;
	private String uploadFileName;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public File getUpload() {
		return upload;
	}

	public void setUpload(File upload) {
		this.upload = upload;
	}

	public String getUploadContentType() {
		return uploadContentType;
	}

	public void setUploadContentType(String uploadContentType) {
		this.uploadContentType = uploadContentType;
	}

	public String getUploadFileName() {
		return uploadFileName;
	}

	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}

	public CompactService getCompactService() {
		return compactService;
	}

	public void setCompactService(CompactService compactService) {
		this.compactService = compactService;
	}

	public ProductcategoryService getProductcategoryService() {
		return productcategoryService;
	}

	public void setProductcategoryService(
			ProductcategoryService productcategoryService) {
		this.productcategoryService = productcategoryService;
	}

	public ProductService getProductService() {
		return productService;
	}

	public void setProductService(ProductService productService) {
		this.productService = productService;
	}

	public EnterpriseService getEnterpriseService() {
		return enterpriseService;
	}

	public void setEnterpriseService(EnterpriseService enterpriseService) {
		this.enterpriseService = enterpriseService;
	}

	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	// 对单个对象操作时表示对象的唯一性标识（数据库主键）
	private Integer id;
	// 对一组对象操作时表示所选对象的唯一性标识（数据库主键），并自动生成数组
	private Integer[] ids;
	private Compact compact;

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

	public Compact getCompact() {
		return compact;
	}

	public void setCompact(Compact compact) {
		this.compact = compact;
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
			getEnterprisetmp();
			getProductcategorystmp();
			getUsersetmp();
			getUserretmp();
			products = productService.searchProductByCompact(productcategoryId,null);
		   productsAL = (ArrayList)products;
		    Product producttmp = new Product("请选择产品名称","请选择产品名称");
		    productsAL.add(0, producttmp);
			return "success";
		}
		getEnterprisetmp();
		getProductcategorystmp();
		getUsersetmp();
		getUserretmp();
		products = productService.searchProductByCompact(productcategoryId,null);
		productsAL = (ArrayList)products;
		Product producttmp = new Product("请选择产品名称","请选择产品名称");
		productsAL.add(0, producttmp);
		compact = compactService.loadCompact(id);
		return "success";
	}
	
	
	
	
	public String loadEdit() throws Exception {
		
		if (id == null) {
			getEnterprisetmp();
			enterprises.remove(0);
			getProductcategorystmp();
		    productcategorys.remove(0);
		   if(productcategoryId!=null){
		   for(int i=0;i<productcategorys.size();i++){
			  
			   if(productcategorys.get(i).getProductCategoryId().equals(productcategoryId)){
				  
				   productcategorytmp = productcategorys.get(i);
				   index =i;
				   break;
			   }
			  
		   }
		   productcategorys.remove(index);
		   productcategorys.add(0, productcategorytmp);
		   }
		   
			getUsersetmp();
			userses.remove(0);
			getUserretmp();
			products = productService.searchProductByCompact(productcategoryId,null);
		   productsAL = (ArrayList)products;
		    //Product producttmp = new Product("请选择产品名称","请选择产品名称");
		   // productsAL.add(0, producttmp);
			return "success";
		}
		
		 
		getEnterprisetmp();
		enterprises.remove(0);
		getProductcategorystmp();
		
		productcategorys.remove(0);
		 if(productcategoryId!=null){
		for(int i=0;i<productcategorys.size();i++){
			   if(productcategorys.get(i).getProductCategoryId().equals(productcategoryId)){
				   
				   productcategorytmp = productcategorys.get(i);
				   index =i;
				   break;
			   }
			  
		   }
		   productcategorys.remove(index);
		   productcategorys.add(0, productcategorytmp);
		 }
		getUsersetmp();
		userses.remove(0);
		getUserretmp();
		products = productService.searchProductByCompact(productcategoryId,null);
		productsAL = (ArrayList)products;
		//Product producttmp = new Product("请选择产品名称","请选择产品名称");
		//productsAL.add(0, producttmp);
		compact = compactService.loadCompact(id);
		return "success";
	}
	
	
	

	// 新增和编辑的数据保存操作
	public String save() throws Exception {
		if (compact.getAttachment() != null) { // 对于修改的保存
			if (upload == null) { // 对于没有选择重传文件的操作
				compactService.saveCompact(compact);
				return "success";
			}
			else { // 对于选择了重传文件的操作
				String savePath = "D:\\uploadfile";
				Date date = new Date();
				String newFileName = date.getTime() + uploadFileName;
				File file = new File(savePath);
				if (!file.exists())
					file.mkdirs();
				File filetmp = new File(compact.getAttachment());// 把旧文件删除掉
				filetmp.delete();
				FileUtils.copyFile(upload, new File(file, newFileName));// 把新文件复制过来
				compact.setAttachment(savePath + "\\" + newFileName);
				date.setTime(compact.getEffectTime().getTime());
				date.setMonth(date.getMonth()+ Integer.parseInt((compact.getLastTime())));
				Date datenow = new Date();
				if (datenow.getTime() >= date.getTime()) {
					String tmp = compact.getCompactDesc();
					compact.setCompactDesc("#合同已到期#" + tmp);

				}
				compactService.saveCompact(compact);
				return "success";
			}
		}
		// 对于新增的保存
		String savePath = "D:\\uploadfile";
		Date date = new Date();
		String newFileName = date.getTime() + uploadFileName;
		File file = new File(savePath);
		if (!file.exists())
			file.mkdirs();
		FileUtils.copyFile(upload, new File(file, newFileName));
		compact.setAttachment(savePath + "\\" + newFileName);
		date.setTime(compact.getEffectTime().getTime());
		date.setMonth(date.getMonth()+ Integer.parseInt((compact.getLastTime())));
		Date datenow = new Date();
		if (datenow.getTime() >= date.getTime()) {
			String tmp = compact.getCompactDesc();
			compact.setCompactDesc("#合同已到期#" + tmp);
		}
		compactService.saveCompact(compact);
		return "success";

	}

	// 删除数据操作
	public String remove() throws Exception {
		if (ids == null) {
			return "success";
		}
		for (int i = 0, size = ids.length; i < size; i++) {
			compact = compactService.loadCompact(ids[i]);
			int tmp = Integer.parseInt(compact.getLastTime());
			tmp = 0 - tmp;
			String tmpString = tmp + "";
			compact.setLastTime(tmpString);
			compactService.saveCompact(compact);
		}
		return "success";
	}

	/*--------------------------------------------------------------------
	 * 
	 * 综合查询，支持查询条件、分页
	 * 
	 * -------------------------------------------------------------------
	 */

	// 查询结果集合，用于界面显示。在ONGL表达式中可直接引用本对象
	private Collection<Compact> compactColl;
	private Collection<Compact> compactColl1;

	public Collection<Compact> getCompactColl() {
		return compactColl;
	}

	public void setCompactColl(Collection<Compact> compactColl) {
		this.compactColl = compactColl;
	}

	public Collection<Compact> getCompactColl1() {
		return compactColl1;
	}

	public void setCompactColl1(Collection<Compact> compactColl1) {
		this.compactColl1 = compactColl1;
	}

	/**
	 * 系统分页
	 */
	private String keyWord;

	public String getKeyWord() {
		return keyWord;
	}

	public void setKeyWord(String keyWord) {
		this.keyWord = keyWord;
	}

	/**
	 * s:select标签
	 */

	List<Productcategory> productcategorys = new ArrayList<Productcategory>();
	
	ArrayList<Productcategory> productcategorysAL = new ArrayList<Productcategory>();
	
	
	List<Product> products = new ArrayList<Product>();
	ArrayList<Product> productsAL = new ArrayList<Product>();
	
	List<Enterprise> enterprises = new ArrayList<Enterprise>();
	ArrayList<Enterprise> enterprisesAL = new ArrayList<Enterprise>();
	
	List<User> userses = new ArrayList<User>();
	ArrayList<User> usersesAL = new ArrayList<User>();
	
	
	List<User> userres = new ArrayList<User>();
	ArrayList<Compact> compactAL = new ArrayList<Compact>();
	ArrayList<Compact> compactALOver = new ArrayList<Compact>();
	ArrayList<Compact> compactALNotOver = new ArrayList<Compact>();
	Map<Integer, Date> compactOutdueDate = new HashMap<Integer, Date>();

	public List<Productcategory> getProductcategorys() {
		return productcategorys;
	}

	public void setProductcategorys(List<Productcategory> productcategorys) {
		this.productcategorys = productcategorys;
	}

	public List<Product> getProducts() {
		return products;
	}

	public void setProducts(List<Product> products) {
		this.products = products;
	}

	public List<Enterprise> getEnterprises() {
		return enterprises;
	}

	public void setEnterprises(List<Enterprise> enterprises) {
		this.enterprises = enterprises;
	}

	public List<User> getUserses() {
		return userses;
	}

	public void setUserses(List<User> userses) {
		this.userses = userses;
	}

	public List<User> getUserres() {
		return userres;
	}

	public void setUserres(List<User> userres) {
		this.userres = userres;
	}

	public ArrayList<Compact> getCompactAL() {
		return compactAL;
	}

	public void setCompactAL(ArrayList<Compact> compactAL) {
		this.compactAL = compactAL;
	}

	public ArrayList<Compact> getCompactALOver() {
		return compactALOver;
	}

	public void setCompactALOver(ArrayList<Compact> compactALOver) {
		this.compactALOver = compactALOver;
	}

	public ArrayList<Compact> getCompactALNotOver() {
		return compactALNotOver;
	}

	public void setCompactALNotOver(ArrayList<Compact> compactALNotOver) {
		this.compactALNotOver = compactALNotOver;
	}

	public Map<Integer, Date> getCompactOutdueDate() {
		return compactOutdueDate;
	}

	public void setCompactOutdueDate(Map<Integer, Date> compactOutdueDate) {
		this.compactOutdueDate = compactOutdueDate;
	}

	
	public ArrayList<Productcategory> getProductcategorysAL() {
		return productcategorysAL;
	}

	public void setProductcategorysAL(ArrayList<Productcategory> productcategorysAL) {
		this.productcategorysAL = productcategorysAL;
	}

	public ArrayList<Product> getProductsAL() {
		return productsAL;
	}

	public void setProductsAL(ArrayList<Product> productsAL) {
		this.productsAL = productsAL;
	}

	
	
	
	
	
	public void getProductcategorystmp() {
		productcategorys = productcategoryService.searchProductcategoryByCompact(null, null);
		productcategorysAL = (ArrayList)productcategorys;
		Productcategory productcategorytmp =  new Productcategory("请选择产品类型", "请选择产品类型");
		productcategorysAL.add(0, productcategorytmp);
	}
	
	

	
	public ArrayList<Enterprise> getEnterprisesAL() {
		return enterprisesAL;
	}

	public void setEnterprisesAL(ArrayList<Enterprise> enterprisesAL) {
		this.enterprisesAL = enterprisesAL;
	}
	
	
	

	public ArrayList<User> getUsersesAL() {
		return usersesAL;
	}

	public void setUsersesAL(ArrayList<User> usersesAL) {
		this.usersesAL = usersesAL;
	}
	
	
	
	
	

	public void getProducttmp() {

		products = productService.searchProduct(null, null);

	}
	
	
	
	

	

	public void getEnterprisetmp() {
		enterprises = enterpriseService.searchEnterprise(null, null);
		enterprisesAL = (ArrayList)enterprises;
		Enterprise enterprisetmp =  new Enterprise("请选择签约公司名", "请选择签约公司名","请选择签约公司名");
		enterprisesAL.add(0,enterprisetmp);
	}

	public void getUsersetmp() {

		userses = userService.searchUserseByCompact("销售人员", null);
		usersesAL = (ArrayList)userses;
		User usersetmp =  new User("请选择销售人员", "请选择销售人员","请选择销售人员","请选择销售人员");
		usersetmp.setUserId(null);
		usersesAL.add(0,usersetmp);
	}

	public void getUserretmp() {

		userres = userService.searchUserreByCompact("合同管理员", null);
		
	}
	
	
	
	
	
	


	private PageBean pageBean; // 分页对象

	public PageBean getPageBean() {
		return pageBean;
	}

	public void setPageBean(PageBean pageBean) {
		this.pageBean = pageBean;
	}

	/*
	 * 查询会员信息，支持条件和分页
	 */
	public String search() throws Exception {

		if (pageBean == null) {
			pageBean = new PageBean();
		}
		compactColl = compactService.searchCompact((keyWord == null) ? null
				: keyWord, pageBean);
		compactALNotOver = (ArrayList) compactColl;

		for (int i = 0; i < compactALNotOver.size(); i++) {
			Date date = new Date();
			date.setTime(compactALNotOver.get(i).getEffectTime().getTime());
			date.setMonth(date.getMonth()+ Integer.parseInt((compactALNotOver.get(i).getLastTime())));
			Date datenow = new Date();
		
			if (datenow.getTime() >= date.getTime()) {
				String tmp = compactALNotOver.get(i).getCompactDesc();
				compactALNotOver.get(i).setCompactDesc("#合同已到期#" + tmp);
				compactService.saveCompact(compactALNotOver.get(i));
				compactALNotOver.remove(i);

			}

		}
		return "success";
	}

	public String searchOverdueCompact() throws Exception {

		if (pageBean == null) {
			pageBean = new PageBean();
		}

		compactColl = compactService.searchCompact((keyWord == null) ? null: keyWord, null);
		compactALNotOver = (ArrayList) compactColl;
		compactColl1 = compactService.searchOverdueCompact((keyWord == null) ? null : keyWord, pageBean);
		compactALOver = (ArrayList) compactColl1;

		for (int i = 0; i < compactALNotOver.size(); i++) {
			Date date = new Date();
			date.setTime(compactALNotOver.get(i).getEffectTime().getTime());
			date.setMonth(date.getMonth()+ Integer.parseInt((compactALNotOver.get(i).getLastTime())));
			Date datenow = new Date();
			if (datenow.getTime() >= date.getTime()) {
				String tmp = compactALNotOver.get(i).getCompactDesc();
				compactALNotOver.get(i).setCompactDesc("#合同已到期#" + tmp);
				compactALOver.add(compactALNotOver.get(i));
				compactService.saveCompact(compactALNotOver.get(i));
				compactALNotOver.remove(i);

			}

		}

		for (int i = 0; i < compactALOver.size(); i++)// 得到到期合同的到期日期
		{

			Date datetmp = new Date();
			datetmp.setTime(compactALOver.get(i).getEffectTime().getTime());
			int tmp = Integer.parseInt(compactALOver.get(i).getLastTime());
			datetmp.setMonth(datetmp.getMonth() + tmp);
			compactOutdueDate.put(compactALOver.get(i).getCompactId(), datetmp);

		}

		return "success";
	}

	public String download() throws Exception {
		// 获得服务端本地保存的商品图片的文件路径
		String fileNametmp1 = compact.getAttachment();
		int index = fileNametmp1.lastIndexOf("\\");
		String fileName = fileNametmp1.substring(index + 1);

		String realpath = "D:\\uploadfile";
		String filePath = realpath + "/" + fileName;

		// 获取下载的文件流
		File downFile = new File(filePath);
		InputStream inStream = new FileInputStream(downFile);

		// 告诉Struts 执行完 Action 就行了，不用再去调用结果响应的操作
		ActionContext.getContext().getActionInvocation().getProxy()
				.setExecuteResult(false);
		// 取得 HttpServletResponse
		HttpServletResponse response = ServletActionContext.getResponse();
		// String downFileName = new String(fileName.getBytes("ISO8859-1"),
		// "utf-8");
		response.setHeader("Content-Disposition", "attachment; filename="
				+ java.net.URLEncoder.encode(fileName, "UTF-8"));

		// 输出文件流到客户端
		OutputStream out = response.getOutputStream();
		byte[] buffer = new byte[4096];
		while (inStream.read(buffer) > 0) {
			out.write(buffer);
		}
		out.flush();

		return "";
	}

}
