package com.R72X.action;

import java.awt.Font;
import java.util.Collection;
import java.util.List;

import org.jfree.chart.ChartFactory;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.axis.CategoryAxis;
import org.jfree.chart.axis.NumberAxis;
import org.jfree.chart.labels.ItemLabelAnchor;
import org.jfree.chart.labels.ItemLabelPosition;
import org.jfree.chart.labels.StandardCategoryItemLabelGenerator;
import org.jfree.chart.plot.CategoryPlot;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.chart.renderer.category.BarRenderer3D;
import org.jfree.chart.title.TextTitle;
import org.jfree.data.category.CategoryDataset;
import org.jfree.data.category.DefaultCategoryDataset;
import org.jfree.data.general.DefaultPieDataset;
import org.jfree.ui.TextAnchor;

import com.R72X.entity.Compact;
import com.R72X.entity.Product;
import com.R72X.entity.Productcategory;
import com.R72X.service.CompactService;
import com.R72X.service.ProductService;
import com.R72X.service.ProductcategoryService;
import com.R72X.util.PageBean;
import com.opensymphony.xwork2.ActionSupport;

public class ReportBarAction extends ActionSupport{
 
	
	private String showtype1;
    private String showtype2;
    private String showtype3;
    private String year;
    private String productcategoryName;
    float[]  totalmoney;
    
	public String getShowtype1() {
		return showtype1;
	}
	public void setShowtype1(String showtype1) {
		this.showtype1 = showtype1;
	}
	public String getShowtype2() {
		return showtype2;
	}
	public void setShowtype2(String showtype2) {
		this.showtype2 = showtype2;
	}
	public String getShowtype3() {
		return showtype3;
	}
	public void setShowtype3(String showtype3) {
		this.showtype3 = showtype3;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
    
	public String getProductcategoryName() {
		return productcategoryName;
	}
	public void setProductcategoryName(String productcategoryName) {
		this.productcategoryName = productcategoryName;
	}





	//产品类别ID
	   private String categoryId;
	   
	   
	   
	   public String getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(String categoryId) {
		this.categoryId = categoryId;
	}
	
	
	
	
	
	
	
	 private List<Product> productList;
	   private List<Compact> compactList;
	   
	   //合同的Service
	   private CompactService compactService;
	   
	   public CompactService getCompactService() {
			return compactService;
		}

		public void setCompactService(CompactService compactService) {
			this.compactService = compactService;
		}
	   
	   private Productcategory productcategory;
		
	   public Productcategory getProductcategory() {
			return productcategory;
		}

		public void setProductcategory(Productcategory productcategory) {
			this.productcategory = productcategory;
		}

		//产品的Service
	    private ProductService productService;
		
		public void setProductService (ProductService productService){
			this.productService=productService;
		}
	   
	   //产品类别的Service
	   private ProductcategoryService productcategoryService;
     
	   public void setProductcategoryService (ProductcategoryService productcategoryService){
		   this.productcategoryService=productcategoryService;
	   }
	   
	    //产品类别的Collection
	    private Collection<Productcategory> productcategoryColl;
		
		public void setProductcategoryColl(Collection<Productcategory> productcategoryColl){
			this.productcategoryColl=productcategoryColl;
		}
		
		public Collection<Productcategory> getProductcategoryColl(){
			return productcategoryColl;
		}
	   
		//找出所有的产品类别
		private PageBean pageBean; // 分页对象
		public PageBean getPageBean() {
			return pageBean;
		}
		
		
		
		
		 private JFreeChart chart;

			// 必须提供 getChart() 方法，且由该方法返回 JFreeChart 对象
		 
			public JFreeChart getChart() {
				
				 productcategory=productcategoryService.loadProductcategory(Integer.parseInt(categoryId)); 
				chart = ChartFactory.createBarChart(year+"年"+productcategory.getCategoryName()+"类产品销售年度报表", 
		                "产品名称",
		                "金额（元）",
		                getDataSet(),
		                PlotOrientation.VERTICAL,
		                true,
		                false,
		                false);

				//图表标题
				Font font = new Font("宋体", Font.BOLD, 16);
				TextTitle title = new TextTitle(year+"年度"+productcategory.getCategoryName()+"类产品销售年度报表", new Font("黑体", Font.ITALIC,22));
				chart.setTitle(title); //标题

				CategoryPlot plot = chart.getCategoryPlot();
				
				//显示每个柱的数值，并修改该数值的字体属性
				BarRenderer3D renderer = new BarRenderer3D();
				renderer.setBaseItemLabelGenerator(new StandardCategoryItemLabelGenerator());
				renderer.setBaseItemLabelsVisible(true);
				//默认的数字显示在柱子中，通过如下两句可调整数字的显示
				//注意：此句很关键，若无此句，那数字的显示会被覆盖，给人数字没有显示出来的问题
				renderer.setBasePositiveItemLabelPosition(new ItemLabelPosition(ItemLabelAnchor.OUTSIDE12, TextAnchor.BASELINE_LEFT));
				renderer.setItemLabelAnchorOffset(10D);
				plot.setRenderer(renderer);
				
				CategoryAxis domainAxis = plot.getDomainAxis();
				//X轴坐标上的文字
				domainAxis.setTickLabelFont(new Font("sans-serif", Font.PLAIN, 14));
				//X轴坐标标题
				domainAxis.setLabelFont(new Font("宋体", Font.PLAIN, 14));
				
				NumberAxis numberaxis = (NumberAxis) plot.getRangeAxis();
				//Y轴坐标上的文字
				numberaxis.setTickLabelFont(new Font("sans-serif", Font.PLAIN, 14));
				//Y轴坐标标题
				numberaxis.setLabelFont(new Font("黑体", Font.PLAIN, 14));
				//图表底部乱码
				chart.getLegend().setItemFont(new Font("宋体", Font.PLAIN, 14));
				
				return chart;
			}
			
			private CategoryDataset getDataSet() { 
		    	 DefaultCategoryDataset dataset = new DefaultCategoryDataset();
		    	 //dataset.addValue(610, "广州", "猪肉");
		    	// dataset.addValue(220, "广州", "牛肉");
		    	//dataset.addValue(530, "广州", "鸡肉");
		    	// dataset.addValue(340, "广州", "鱼肉"); 
		    	 
		    	 
					
					
					for(int m=0,size3=productList.size();m<size3;m++){
						dataset.addValue(totalmoney[m],productcategoryName,productList.get(m).getProductName());
					}
					  return dataset; 
		           } 	
		
		
		
		
		
		public String searchcategory() throws Exception {
			if (pageBean == null) {
				pageBean = new PageBean();
			}
			productcategoryColl=productcategoryService.searchProductcategory(null,null);
			return "success";
		}
		
		
		
		public String productsaleBarChart() throws Exception{
			
			productList=productService.searchProductByProductcategoryID(Integer.parseInt(categoryId), pageBean);
//			for(int e=0;e<productList.size();e++){
//				System.out.println(productList.get(e).getProductName());
//			}
			totalmoney=new float[365];
			for(int y=0;y<365;y++){
				totalmoney[y]=0;
			}
	//		productList=productService.searchProductByProductcategoryID(categoryId, pageBean);
	
			for(int i=0,size=productList.size();i<size;i++){
				//System.out.print(productList.get(i).getProductId());
				compactList=compactService.searchCompactByProductID(productList.get(i).getProductId(), pageBean);
				for(int j=0,size2=compactList.size();j<size2;j++){
					if(Integer.parseInt(compactList.get(j).getLastTime())<0){continue;}
					long a1=compactList.get(j).getEffectTime().getTime()/1000;//seconds
					long a2=a1/3600;//hours
					long a3=a2/24;//days
					long a4=a3/365;//years
					if((Integer.parseInt(year)-1970)==a4){
					totalmoney[i]+=compactList.get(j).getSignMoney()*10000;
					productcategoryName = compactList.get(j).getProduct().getProductcategory().getCategoryName();
					}
				}
			}
			return "success";
		}
		
		
		
		
	
}
