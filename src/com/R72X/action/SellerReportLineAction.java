package com.R72X.action;

import java.awt.BasicStroke;
import java.awt.Color;
import java.awt.Font;
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
import com.R72X.entity.User;
import com.R72X.service.CompactService;
import com.R72X.service.UserService;
import com.R72X.util.PageBean;

public class SellerReportLineAction {

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
		chart = ChartFactory.createLineChart(year+"度销售人员"+user.getUserName()+"合同业务统计图", // 图表标题
				year+"度销售人员"+user.getUserName()+"合同业务统计图", // X轴标题
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
		
		
		
		 
		
		String[] line={"销售人员"+user.getUserName()};

		 
		// 类别
		String[] category={"第一季度","第二季度","第三季度","第四季度"};
	
		
		// 实例化DefaultCategoryDataset对象
		DefaultCategoryDataset dataSet = new DefaultCategoryDataset();
		// 使用循环向数据集合中添加数据
		
		 
		  int i=0;
	
			for (int j = 0; j < category.length; j++) {
				dataSet.addValue(seasonmoney[j]*10000, line[0],
						category[j]);
			}
			i++;
		
		
		return dataSet;
	}
	
	
	
	 public String sellerLineChart(){
		 return "success";
	 }
	
	
}
