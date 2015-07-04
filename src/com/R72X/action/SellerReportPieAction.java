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
import com.R72X.entity.User;
import com.R72X.service.CompactService;
import com.R72X.service.UserService;
import com.R72X.util.PageBean;

public class SellerReportPieAction {
	private UserService userService;  //通过userService获得销售人员列表
	private Collection<User> userColl; //
	private PageBean pageBean; // 分页对象
	private JFreeChart chart;
	private String year;//输入的年份
	private String userId;//销售人员的id
	 private List<Compact> compactList;
	 private CompactService compactService;
	 private User user;
	private String inputyear;
    private String showtype1;
    private String showtype2;
    private String showtype3;

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public CompactService getCompactService() {
		return compactService;
	}

	public void setCompactService(CompactService compactService) {
		this.compactService = compactService;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public PageBean getPageBean() {
		return pageBean;
	}

	public void setPageBean(PageBean pageBean) {
		this.pageBean = pageBean;
	}

	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public Collection<User> getUserColl() {
		return userColl;
	}

	public void setUserColl(Collection<User> userColl) {
		this.userColl = userColl;
	}
	
	public String searchSeller() throws Exception {
		if (pageBean == null) {
			pageBean = new PageBean();
		}
		userColl=userService.searchUserseByCompact("销售人员", null);
		
		return "success";
	}
	
	
	public List<Compact> getCompactList() {
		return compactList;
	}

	public void setCompactList(List<Compact> compactList) {
		this.compactList = compactList;
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

	public JFreeChart getChart() {
		user=userService.loadUser(Integer.parseInt(userId));
		
		chart = ChartFactory.createPieChart(year+"度销售人员"+user.getUserName()+"合同业务统计图", // 图表标题
				getDataSet(), // 数据
				true, // 是否显示图例
				false, // 是否显示工具提示
				false // 是否生成 URL
				);
		// 重新设置图表标题，改变字体
		chart.setTitle(new TextTitle(year+"度销售人员"+user.getUserName()+"合同业务统计图", new Font("黑体", Font.ITALIC,
						22)));
		// 取得统计图表的第一个图例
		LegendTitle legend = chart.getLegend(0);
		// 修改图例的字体
		legend.setItemFont(new Font("宋体", Font.BOLD, 14));
		// 获得饼图的 Plot 对象
		PiePlot plot = (PiePlot) chart.getPlot();
		
		plot.setLabelGenerator(new StandardPieSectionLabelGenerator("{2}"));	//设置1--数值,2--百分比
		// 设置饼图各部分的标签字体
		plot.setLabelFont(new Font("隶书", Font.BOLD, 18));
		plot.setLabelGenerator(new StandardPieSectionLabelGenerator("{2}"));	//设置数值
		// 设定背景透明度（0-1.0 之间）
		plot.setBackgroundAlpha(0.9f);
		// 设定前景透明度（0-1.0 之间）
		plot.setForegroundAlpha(0.50f);
		return chart;
	}
	
	
	// 获取生成统计图的 Dataset
	private DefaultPieDataset getDataSet() {
	  
  
		

		
		//显示每个柱的数值，并修改该数值的字体属性
		

		
		
		
		DefaultPieDataset dataset = new DefaultPieDataset();
		
		 compactList=compactService.searchCompactBySellerID(Integer.parseInt(userId),pageBean);
	    	// System.out.print(compactList.get(0).getCompactId());
	    	 float[]  seasonmoney=new float[4];
				for(int y=0;y<4;y++){
					seasonmoney[y]=0;
				}
		//	 	 Integer inputyearparse = Integer.parseInt(inputyear)-1900;	
			for(int i=0;i<compactList.size();i++){
				if(Integer.parseInt(compactList.get(i).getLastTime())<0){continue;}

				long a1=compactList.get(i).getEffectTime().getTime()/1000;//seconds
				long a2=a1/3600;//hours
				long a3=a2/24;//days
				long a4=a3/365;//years
				if((Integer.parseInt(year)-1970)==a4){
					int month=compactList.get(i).getEffectTime().getMonth()+1;
					
					if(month>=1&&month<=3)
					{seasonmoney[0]+=compactList.get(i).getSignMoney();}
					if(month>=4&&month<=6)
					{seasonmoney[1]+=compactList.get(i).getSignMoney();}
					if(month>=7&&month<=9)
					{seasonmoney[2]+=compactList.get(i).getSignMoney();}
					if(month>=10&&month<=12)
					{seasonmoney[3]+=compactList.get(i).getSignMoney();}
					
				}
				
				
				
			}
			dataset.setValue("第一季度",seasonmoney[0]*10000);
			dataset.setValue("第二季度",seasonmoney[1]*10000);
			dataset.setValue("第三季度",seasonmoney[2]*10000);	
			dataset.setValue("第四季度",seasonmoney[3]*10000);

			return dataset;
	
	
	}
	
	
	 public String sellerPieChart(){
		 return "success";
	 }
	
	
}
