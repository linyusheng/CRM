package com.R72X.action;

import java.awt.Font;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

import org.jfree.chart.ChartFactory;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.labels.StandardPieSectionLabelGenerator;
import org.jfree.chart.plot.PiePlot;
import org.jfree.chart.title.LegendTitle;
import org.jfree.chart.title.TextTitle;
import org.jfree.data.general.DefaultPieDataset;

import com.R72X.entity.Compact;
import com.R72X.service.CompactService;

public class AchievementPieAction {

	
	private CompactService compactService;
	private ArrayList<Compact> listcompact = new ArrayList<Compact>();
	private Map<String,Float> mapcompact = new HashMap<String,Float>();
	private Map<String,Float> mapfinalcompact = new HashMap<String,Float>();
	private String inputyear;
	public CompactService getCompactService() {
		return compactService;
	}
	public void setCompactService(CompactService compactService) {
		this.compactService = compactService;
	}
	public ArrayList<Compact> getListcompact() {
		return listcompact;
	}
	public void setListcompact(ArrayList<Compact> listcompact) {
		this.listcompact = listcompact;
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
	
	
	
	
	
	public Map<String, Float> getMapfinalcompact() {
		return mapfinalcompact;
	}
	public void setMapfinalcompact(Map<String, Float> mapfinalcompact) {
		this.mapfinalcompact = mapfinalcompact;
	}





	private JFreeChart chart;

	// 必须提供 getChart() 方法，且由该方法返回 JFreeChart 对象
	public JFreeChart getChart() {
	
		chart = ChartFactory.createPieChart(inputyear+"年"+"公司业绩年度统计图", // 图表标题
				getDataSet(), // 数据
				true, // 是否显示图例
				false, // 是否显示工具提示
				false // 是否生成 URL
				);
		// 重新设置图表标题，改变字体
		chart.setTitle(new TextTitle(inputyear+"年"+"公司业绩年度统计图", new Font("黑体", Font.ITALIC,
						22)));
		// 取得统计图表的第一个图例
		LegendTitle legend = chart.getLegend(0);
		// 修改图例的字体
		legend.setItemFont(new Font("宋体", Font.BOLD, 14));
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
		
		 float[] season=new float[12];
			for(int y=0;y<4;y++){
				season[y]=0;
			}
		
 	 listcompact = (ArrayList)compactService.searchEffectCompact(null, null);
 	 Integer inputyearparse = Integer.parseInt(inputyear)-1900;
 	 for(int i=0;i<listcompact.size();i++){
 	 
 		 if((listcompact.get(i).getEffectTime().getYear() == inputyearparse)){
 			 if(listcompact.get(i).getEffectTime().getMonth()>=0&&listcompact.get(i).getEffectTime().getMonth()<=2)
 			 {
 				 season[0]+=listcompact.get(i).getSignMoney();
 			 }
 			 if(listcompact.get(i).getEffectTime().getMonth()>=3&&listcompact.get(i).getEffectTime().getMonth()<=5)
 			 {
 				 season[1]+=listcompact.get(i).getSignMoney();
 			 }
 			 if(listcompact.get(i).getEffectTime().getMonth()>=6&&listcompact.get(i).getEffectTime().getMonth()<=8)
 			 {
 				 season[2]+=listcompact.get(i).getSignMoney();
 			 }
 			 if(listcompact.get(i).getEffectTime().getMonth()>=9&&listcompact.get(i).getEffectTime().getMonth()<=11)
 			 {
 				 season[3]+=listcompact.get(i).getSignMoney();
 			 }
 			
 		 }
 		 
 	 }
 	dataset.setValue("第一季度",season[0]*10000);
	dataset.setValue("第二季度",season[1]*10000);
	dataset.setValue("第三季度",season[2]*10000);
	dataset.setValue("第四季度",season[3]*10000);

		return dataset;
	}
	
	
	public String achievementpieChart() throws Exception {
		 
		
		   return "success";		
	}
	public String doNothing()
	{
		return "success";
	}
	

}
