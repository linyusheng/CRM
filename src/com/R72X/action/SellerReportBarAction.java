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

public class SellerReportBarAction {

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
	public PageBean getPageBean() {
		return pageBean;
	}
	public void setPageBean(PageBean pageBean) {
		this.pageBean = pageBean;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public List<Compact> getCompactList() {
		return compactList;
	}
	public void setCompactList(List<Compact> compactList) {
		this.compactList = compactList;
	}
	public CompactService getCompactService() {
		return compactService;
	}
	public void setCompactService(CompactService compactService) {
		this.compactService = compactService;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
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
		
		chart = ChartFactory.createBarChart("肉类销量统计图", 
                "季度",//x坐标

                "金额(元)",//y坐标

                getDataSet(),
                PlotOrientation.VERTICAL,
                true,
                false,
                false);

		//图表标题
		Font font = new Font("宋体", Font.BOLD, 16);
		TextTitle title = new TextTitle(year+"度销售人员"+user.getUserName()+"合同业务统计图", new Font("黑体", Font.ITALIC,22));
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
	
	 @SuppressWarnings("deprecation")
	private  CategoryDataset getDataSet() { 
    	 DefaultCategoryDataset dataset = new DefaultCategoryDataset();
    	 
    	 compactList=compactService.searchCompactBySellerID(Integer.parseInt(userId),pageBean);
    	// System.out.print(compactList.get(0).getCompactId());
    	 float[]  seasonmoney=new float[4];
			for(int y=0;y<4;y++){
				seasonmoney[y]=0;
			}
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
		
		dataset.setValue(seasonmoney[0]*10000,"第一季度","第一季度");
		dataset.setValue(seasonmoney[1]*10000,"第二季度","第二季度");
		dataset.setValue(seasonmoney[2]*10000,"第三季度","第三季度");	
		dataset.setValue(seasonmoney[3]*10000,"第四季度","第四季度");
         return dataset; 
     } 	
	
	
	
	
	 public String sellerBarChart(){
		 return "success";
	 }
}
