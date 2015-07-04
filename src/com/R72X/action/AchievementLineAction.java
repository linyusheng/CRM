package com.R72X.action;

import java.awt.BasicStroke;
import java.awt.Color;
import java.awt.Font;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

import org.jfree.chart.ChartFactory;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.plot.CategoryPlot;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.chart.renderer.category.LineAndShapeRenderer;
import org.jfree.data.category.CategoryDataset;
import org.jfree.data.category.DefaultCategoryDataset;

import com.R72X.entity.Compact;
import com.R72X.service.CompactService;

public class AchievementLineAction {
	private CompactService compactService;
	private Map<String,Float> mapcompact = new HashMap<String,Float>();
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
	public JFreeChart getChart() {
		chart = ChartFactory.createLineChart(inputyear+"年"+"公司业绩年度统计图", // 图表标题
				inputyear+"年"+"公司业绩年度统计图", // X轴标题
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

		
		
		
		 
		
		String[] line={inputyear+"年"+"公司业绩"};

		
		 
		// 月份
		String[] category={"1月","2月","3月","4月","5月","6月","7月","8月","9月","10月","11月","12月"};
	
		
		
		// 实例化DefaultCategoryDataset对象
		DefaultCategoryDataset dataSet = new DefaultCategoryDataset();
		// 使用循环向数据集合中添加数据
		

		  int i=0;
	
			for (int j = 0; j < category.length; j++) {
				dataSet.addValue(month[j]*10000, line[0],
						category[j]);
			}
			i++;
		
		
		return dataSet;
	}
	
	
	public String achievementLineChart() throws Exception { //生成饼状图的方法
    	
   	
		 
		   return "success";
		
	}
    
}
