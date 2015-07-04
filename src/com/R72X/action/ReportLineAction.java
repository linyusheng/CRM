package com.R72X.action;

import java.awt.BasicStroke;
import java.awt.Color;
import java.awt.Font;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.jfree.chart.ChartFactory;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.plot.CategoryPlot;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.chart.renderer.category.LineAndShapeRenderer;
import org.jfree.data.category.CategoryDataset;
import org.jfree.data.category.DefaultCategoryDataset;

import com.R72X.entity.Compact;
import com.R72X.entity.Product;
import com.R72X.entity.Productcategory;
import com.R72X.service.CompactService;
import com.R72X.service.ProductService;
import com.R72X.service.ProductcategoryService;
import com.R72X.util.PageBean;

public class ReportLineAction {

	
	private String showtype1;
    private String showtype2;
    private String showtype3;
    private String year;
    private String productcategoryName;
    
    
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
		
		public String searchcategory() throws Exception {
			if (pageBean == null) {
				pageBean = new PageBean();
			}
			productcategoryColl=productcategoryService.searchProductcategory(null,null);
			return "success";
		}
		
		
		
		
		 private JFreeChart chart;

			// 必须提供 getChart() 方法，且由该方法返回 JFreeChart 对象
			public JFreeChart getChart() {
				 productcategory=productcategoryService.loadProductcategory(Integer.parseInt(categoryId)); 
				chart = ChartFactory.createLineChart(year+"年度"+productcategory.getCategoryName()+"类产品销售年度报表", // 图表标题
						"产品名称", // X轴标题
						"金额（元）", // Y轴标题
						createDataSet(), // 绘图数据集
						PlotOrientation.VERTICAL, // 绘制方向
						true, // 是否显示图例
						true, // 是否采用标准生成器
						false // 是否生成超链接
						);

				// 设置标题字体
				chart.getTitle().setFont(new Font("黑体", Font.ITALIC,22));
				// 设置图例类别字体
				chart.getLegend().setItemFont(new Font("宋体", Font.BOLD, 15));
				chart.setBackgroundPaint(new Color(192, 228, 106)); // 设置背景色
				// 获取绘图区对象
				CategoryPlot plot = chart.getCategoryPlot();
				plot.getDomainAxis().setLabelFont(new Font("宋体", Font.BOLD, 14));
				// 设置横轴字体
				plot.getDomainAxis().setTickLabelFont(new Font("宋体", Font.BOLD, 14));
				// 设置坐标轴标尺值字体
				plot.getRangeAxis().setLabelFont(new Font("宋体", Font.BOLD, 14));
				// 设置纵轴字体
				plot.setBackgroundPaint(Color.WHITE);
				// 设置绘图区背景色
				plot.setRangeGridlinePaint(Color.RED);
				// 设置水平方向背景线颜色
				plot.setRangeGridlinesVisible(true);
				// 设置是否显示水平方向背景线,默认值为true
				plot.setDomainGridlinePaint(Color.RED);
				// 设置垂直方向背景线颜色
				plot.setDomainGridlinesVisible(true);
				// 设置是否显示垂直方向背景线,默认值为false
				// 获取折线对象
				LineAndShapeRenderer renderer = (LineAndShapeRenderer) plot
						.getRenderer();
				BasicStroke realLine = new BasicStroke(1.6f); // 设置实线
				float dashes[] = { 8.0f }; // 定义虚线数组
				BasicStroke brokenLine = new BasicStroke(1.6f, // 线条粗细
						BasicStroke.CAP_SQUARE, // 端点风格
						BasicStroke.JOIN_MITER, // 折点风格
						8.f, // 折点处理办法
						dashes, // 虚线数组
						0.0f); // 虚线偏移量
				renderer.setSeriesStroke(1, brokenLine);
				// 利用虚线绘制
				renderer.setSeriesStroke(2, brokenLine);
				// 利用虚线绘制
				renderer.setSeriesStroke(3, realLine);
				// 利用实线绘制
				return chart;
			}

			/**
			 * 获取一个演示用的组合数据集对象
			 * 
			 * @return
			 */
			public CategoryDataset createDataSet() {
				// 图例名称
				
				
				
				productList=productService.searchProductByProductcategoryID(Integer.parseInt(categoryId), pageBean);
//				for(int e=0;e<productList.size();e++){
//					System.out.println(productList.get(e).getProductName());
//				}
				float[]  totalmoney=new float[365];
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
				String[] line={"产品名称"};
				ArrayList<String> category=new ArrayList<String>();
				for(int m=0,size3=productList.size();m<size3;m++){
					 category.add(productList.get(m).getProductName());
				}
				DefaultCategoryDataset dataSet = new DefaultCategoryDataset();
				
				for(int m=0,size3=productList.size();m<size3;m++){
					
				         for (int j = 0; j < category.size(); j++) {
					             dataSet.addValue(totalmoney[j], line[0],category.get(j));
					         }
				   }
				
				return dataSet;
		}
		
		
		
		
		public String productsaleLineChart() {
			return "success";
		}
		
}
