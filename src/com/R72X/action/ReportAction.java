package com.R72X.action;

import java.awt.Font;
import java.util.Collection;
import java.util.List;

import org.jfree.chart.ChartFactory;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.labels.StandardPieSectionLabelGenerator;
import org.jfree.chart.plot.PiePlot;
import org.jfree.chart.title.LegendTitle;
import org.jfree.chart.title.TextTitle;
import org.jfree.data.general.DefaultPieDataset;

import com.R72X.entity.Compact;
import com.R72X.entity.Product;
import com.R72X.entity.Productcategory;
import com.R72X.service.CompactService;
import com.R72X.service.ProductService;
import com.R72X.service.ProductcategoryService;
import com.R72X.util.PageBean;

public class ReportAction {
	   //年度
	   private String year;
	   
	 
	
	   public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	//产品类别ID
	   private String categoryId;
	   
	   
	   
	   public String getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(String categoryId) {
		this.categoryId = categoryId;
	}

	//产品、合同列表
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
	   
		//产品销售年度报表的图
		private JFreeChart chart;
		public JFreeChart getChart() {
			  productcategory=productcategoryService.loadProductcategory(Integer.parseInt(categoryId)); 
			
			chart = ChartFactory.createPieChart(year+"年"+productcategory.getCategoryName()+"类产品销售年度报表", // 图表标题
					getDataSet(), // 数据
					true, // 是否显示图例
					false, // 是否显示工具提示
					false // 是否生成 URL
					);
			// 重新设置图表标题，改变字体
			chart.setTitle(new TextTitle(year+"年度"+productcategory.getCategoryName()+"类产品销售年度报表", new Font("黑体", Font.ITALIC,
							22)));
			// 取得统计图表的第一个图例
			LegendTitle legend = chart.getLegend(0);
			// 修改图例的字体
			legend.setItemFont(new Font("宋体", Font.BOLD, 14));
			
//			LegendTitle legend2 =chart.getLegend(1);
//			legend2.setItemFont(new Font("宋体", Font.BOLD, 14));
			
			// 获得饼图的 Plot 对象
			PiePlot plot = (PiePlot) chart.getPlot();
			plot.setLabelGenerator(new StandardPieSectionLabelGenerator("{1}"));	//设置数值
			plot.setLabelGenerator(new StandardPieSectionLabelGenerator("{2}"));	//设置1--数值,2--百分比

			// 设置饼图各部分的标签字体
			plot.setLabelFont(new Font("隶书", Font.BOLD, 18));
			// 设定背景透明度（0-1.0 之间）
			plot.setBackgroundAlpha(0.9f);
			// 设定前景透明度（0-1.0 之间）
			plot.setForegroundAlpha(0.50f);
			return chart;
		}
		
		
		private DefaultPieDataset getDataSet() {
			DefaultPieDataset dataset = new DefaultPieDataset();
			productList=productService.searchProductByProductcategoryID(Integer.parseInt(categoryId), pageBean);
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
					totalmoney[i]+=compactList.get(j).getSignMoney()*10000;}
				}
			}
			
			for(int m=0,size3=productList.size();m<size3;m++){
				dataset.setValue(productList.get(m).getProductName(), totalmoney[m]);
			}
			return dataset;
		}
		
		
		public String productsaleChart() {
			return "success";
		}
		
		
}
