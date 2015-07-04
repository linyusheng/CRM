package com.R72X.action;

import java.awt.Font;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

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
import org.jfree.ui.TextAnchor;

import com.R72X.entity.Compact;

import com.R72X.service.CompactService;


public class AchievementBarAction {
	private CompactService compactService;
	private Map<String,Float> mapcompact = new HashMap<String,Float>();
	private Map<String,Float> mapfinalcompact = new HashMap<String,Float>();
    private ArrayList<Compact> listcompact = new ArrayList<Compact>();
	private String inputyear;
    private String showtype1;
    private String showtype2;
    private String showtype3;
    
	public CompactService getCompactService() {
		return compactService;
	}
	public void setCompactService(CompactService compactService) {
		this.compactService = compactService;
	}
	public Map<String, Float> getMapcompact() {
		return mapcompact;
	}
	public void setMapcompact(Map<String, Float> mapcompact) {
		this.mapcompact = mapcompact;
	}
	
	public Map<String, Float> getMapfinalcompact() {
		return mapfinalcompact;
	}
	public void setMapfinalcompact(Map<String, Float> mapfinalcompact) {
		this.mapfinalcompact = mapfinalcompact;
	}
	public ArrayList<Compact> getListcompact() {
		return listcompact;
	}
	public void setListcompact(ArrayList<Compact> listcompact) {
		this.listcompact = listcompact;
	}
	public String getInputyear() {
		return inputyear;
	}
	public void setInputyear(String inputyear) {
		this.inputyear = inputyear;
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
    
    
	private JFreeChart chart;

	// 必须提供 getChart() 方法，且由该方法返回 JFreeChart 对象
	public JFreeChart getChart() throws Exception {
		chart = ChartFactory.createBarChart(inputyear+"年"+"公司业绩年度统计图", 
                "季度",
                "金额（元）",
                getDataSet(),
                PlotOrientation.VERTICAL,
                true,
                false,
                false);

		//图表标题
		Font font = new Font("宋体", Font.BOLD, 16);
		TextTitle title = new TextTitle(inputyear+"年"+"公司业绩年度统计图", new Font("黑体", Font.ITALIC,22));
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
	
	
	


	 private CategoryDataset getDataSet() throws Exception { 
    	 DefaultCategoryDataset dataset = new DefaultCategoryDataset();

    	 float[] month=new float[12];
			for(int y=0;y<12;y++){
				month[y]=0;
			}
		
    	 listcompact = (ArrayList)compactService.searchEffectCompact(null, null);
    	 Integer inputyearparse = Integer.parseInt(inputyear)-1900;
    	 for(int i=0;i<listcompact.size();i++){
    	 
    		 if((listcompact.get(i).getEffectTime().getYear() == inputyearparse)){
    			 if(listcompact.get(i).getEffectTime().getMonth()==0)
    			 {
    				 month[0]+=listcompact.get(i).getSignMoney();
    			 }
    			 if(listcompact.get(i).getEffectTime().getMonth()==1)
    			 {
    				 month[1]+=listcompact.get(i).getSignMoney();
    			 }
    			 if(listcompact.get(i).getEffectTime().getMonth()==2)
    			 {
    				 month[2]+=listcompact.get(i).getSignMoney();
    			 }
    			 if(listcompact.get(i).getEffectTime().getMonth()==3)
    			 {
    				 month[3]+=listcompact.get(i).getSignMoney();
    			 }
    			 if(listcompact.get(i).getEffectTime().getMonth()==4)
    			 {
    				 month[4]+=listcompact.get(i).getSignMoney();
    			 }
    			 if(listcompact.get(i).getEffectTime().getMonth()==5)
    			 {
    				 month[5]+=listcompact.get(i).getSignMoney();
    			 }
    			 if(listcompact.get(i).getEffectTime().getMonth()==6)
    			 {
    				 month[6]+=listcompact.get(i).getSignMoney();
    			 }
    			 if(listcompact.get(i).getEffectTime().getMonth()==7)
    			 {
    				 month[7]+=listcompact.get(i).getSignMoney();
    			 }
    			 if(listcompact.get(i).getEffectTime().getMonth()==8)
    			 {
    				 month[8]+=listcompact.get(i).getSignMoney();
    			 }
    			 if(listcompact.get(i).getEffectTime().getMonth()==9)
    			 {
    				 month[9]+=listcompact.get(i).getSignMoney();
    			 }
    			 if(listcompact.get(i).getEffectTime().getMonth()==10)
    			 {
    				 month[10]+=listcompact.get(i).getSignMoney();
    			 }
    			 if(listcompact.get(i).getEffectTime().getMonth()==11)
    			 {
    				 month[11]+=listcompact.get(i).getSignMoney();
    			 }
    		 }
    		 
    	 }
 		dataset.setValue(month[0]*10000,"1月","1月");
		dataset.setValue(month[1]*10000,"2月","2月");
		dataset.setValue(month[2]*10000,"3月","3月");	
		dataset.setValue(month[3]*10000,"4月","4月");
 		dataset.setValue(month[4]*10000,"5月","5月");
		dataset.setValue(month[5]*10000,"6月","6月");
		dataset.setValue(month[6]*10000,"7月","7月");	
		dataset.setValue(month[7]*10000,"8月","8月");
 		dataset.setValue(month[8]*10000,"9月","9月");
		dataset.setValue(month[9]*10000,"10月","10月");
		dataset.setValue(month[10]*10000,"11月","11月");	
		dataset.setValue(month[11]*10000,"12月","12月");

         return dataset; 
     } 	
	 
	 
	 public String achievementBarChart() throws Exception { //生成饼状图的方法
	    	

		 
		   return "success";
		
	}
}


