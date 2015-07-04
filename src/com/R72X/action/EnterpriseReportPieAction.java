package com.R72X.action;

import java.awt.Font;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.apache.struts2.components.Set;
import org.jfree.chart.ChartFactory;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.axis.CategoryAxis;
import org.jfree.chart.axis.NumberAxis;
import org.jfree.chart.labels.ItemLabelAnchor;
import org.jfree.chart.labels.ItemLabelPosition;
import org.jfree.chart.labels.StandardCategoryItemLabelGenerator;
import org.jfree.chart.labels.StandardPieSectionLabelGenerator;
import org.jfree.chart.plot.CategoryPlot;
import org.jfree.chart.plot.PiePlot;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.chart.renderer.category.BarRenderer3D;
import org.jfree.chart.title.LegendTitle;
import org.jfree.chart.title.TextTitle;
import org.jfree.data.category.CategoryDataset;
import org.jfree.data.category.DefaultCategoryDataset;
import org.jfree.data.general.DefaultPieDataset;
import org.jfree.ui.TextAnchor;

import com.R72X.entity.Compact;
import com.R72X.entity.Enterprise;
import com.R72X.service.CompactService;
import com.R72X.service.EnterpriseService;

public class EnterpriseReportPieAction {
	private CompactService compactService;
	private EnterpriseService enterpriseService;
	private ArrayList<Enterprise> enterpriseColl = new ArrayList<Enterprise>();
	private Map<String,Float> mapcompact = new HashMap<String,Float>();
    private ArrayList<Compact> listcompact = new ArrayList<Compact>();
    private ArrayList<Compact> listoverduecompact = new ArrayList<Compact>();
	private String inputyear;
	private String enterpriseNamejsp;
    private String enterpriseNamename;
    private String showtype1;
    private String showtype2;
    private String showtype3;
   
	
	
	
	private JFreeChart chart;
	
	// 必须提供 getChart() 方法，且由该方法返回 JFreeChart 对象
	
	public JFreeChart getChart() {
	
		chart = ChartFactory.createPieChart(inputyear+"年"+enterpriseNamename+"产品交易金额统计图", // 图表标题
				getDataSet(), // 数据
				true, // 是否显示图例
				false, // 是否显示工具提示
				false // 是否生成 URL
				);
		// 重新设置图表标题，改变字体
		chart.setTitle(new TextTitle(inputyear+"年"+enterpriseNamename+"产品交易金额统计图", new Font("黑体", Font.ITALIC,
						22)));
		// 取得统计图表的第一个图例
		LegendTitle legend = chart.getLegend(0);
		// 修改图例的字体
		legend.setItemFont(new Font("宋体", Font.BOLD, 14));
		
//		LegendTitle legend2 =chart.getLegend(1);
//		legend2.setItemFont(new Font("宋体", Font.BOLD, 14));
		
		// 获得饼图的 Plot 对象
		PiePlot plot = (PiePlot) chart.getPlot();

		plot.setLabelGenerator(new StandardPieSectionLabelGenerator("{2}"));	//设置数值
		// 设置饼图各部分的标签字体
		plot.setLabelFont(new Font("隶书", Font.BOLD, 18));
		// 设定背景透明度（0-1.0 之间）
		plot.setBackgroundAlpha(0.9f);
		// 设定前景透明度（0-1.0 之间）
		plot.setForegroundAlpha(0.50f);
		return chart;
	}
	
	
	


	// 获取生成统计图的 Dataset
	private DefaultPieDataset getDataSet() {
	  
		DefaultPieDataset dataset = new DefaultPieDataset();
		
		
		Collection<Float> values = mapcompact.values();
		  Collection<String> keys =mapcompact.keySet();
		 // keys = (ArrayList)mapcompact.keySet();
		  java.util.Iterator<Float> iterator = values.iterator();
		  java.util.Iterator<String> iteratorkey = keys.iterator();
		  while(iteratorkey.hasNext()){
				
			  dataset.setValue(iteratorkey.next(), iterator.next());
				}
		 
		return dataset;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	public String getEnterpriseNamename() {
		return enterpriseNamename;
	}


	public void setEnterpriseNamename(String enterpriseNamename) {
		this.enterpriseNamename = enterpriseNamename;
	}


	public CompactService getCompactService() {
		return compactService;
	}
	public void setCompactService(CompactService compactService) {
		this.compactService = compactService;
	}
	public EnterpriseService getEnterpriseService() {
		return enterpriseService;
	}
	public void setEnterpriseService(EnterpriseService enterpriseService) {
		this.enterpriseService = enterpriseService;
	}
	public ArrayList<Enterprise> getEnterpriseColl() {
		return enterpriseColl;
	}
	public void setEnterpriseColl(ArrayList<Enterprise> enterpriseColl) {
		this.enterpriseColl = enterpriseColl;
	}
	
	public Map<String, Float> getMapcompact() {
		return mapcompact;
	}
	public void setMapcompact(Map<String, Float> mapcompact) {
		this.mapcompact = mapcompact;
	}
	public String getInputyear() {
		return inputyear;
	}
	public void setInputyear(String inputyear) {
		this.inputyear = inputyear;
	}
	public String getEnterpriseNamejsp() {
		return enterpriseNamejsp;
	}
	public void setEnterpriseNamejsp(String enterpriseNamejsp) {
		this.enterpriseNamejsp = enterpriseNamejsp;
	}
	
	public ArrayList<Compact> getListcompact() {
		return listcompact;
	}
	public void setListcompact(ArrayList<Compact> listcompact) {
		this.listcompact = listcompact;
	}
	
	public ArrayList<Compact> getListoverduecompact() {
		return listoverduecompact;
	}
	public void setListoverduecompact(ArrayList<Compact> listoverduecompact) {
		this.listoverduecompact = listoverduecompact;
	}
	
	


	


	


	


	


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


	public String getEnterpriseName() throws Exception {
		 
		
		enterpriseColl =(ArrayList)enterpriseService.searchEnterprise(null, null);
		return "success";
	}
	
	
	
	
	
   


     public String enterprisesalepiechart() throws Exception { //生成饼状图的方法
    	
    	 
    	
    	 
	   listcompact = (ArrayList)compactService.searchEffectCompact(null, null);
	   Integer inputyearparse = Integer.parseInt(inputyear)-1900;
	   
	   for(int i=0;i<listcompact.size();i++){
		   
		   if((listcompact.get(i).getEffectTime().getYear() == inputyearparse)&&(listcompact.get(i).getEnterprise().getEnterpriseId() == Integer.parseInt(enterpriseNamejsp))){
			   
			  
			   
			   if(!mapcompact.containsKey(listcompact.get(i).getProduct().getProductcategory().getCategoryName())){
			    	
				  
			    	mapcompact.put(listcompact.get(i).getProduct().getProductcategory().getCategoryName(),listcompact.get(i).getSignMoney()*10000);
			        
			    }
			    else{
			    	Float add = listcompact.get(i).getSignMoney()*10000;
			    	Float base = mapcompact.get(listcompact.get(i).getProduct().getProductcategory().getCategoryName());
			    	add = base+add;
			    	mapcompact.put(listcompact.get(i).getProduct().getProductcategory().getCategoryName(), add);
			    
			    }
			    enterpriseNamename = listcompact.get(i).getEnterprise().getEnterpriseName();  
		   }
	   }
	  
	 
	  
	  
	 

	  
	 
	   return "success";
	}
     
    
	
	
}
