package com.R72X.util;

import java.util.Map;

import com.R72X.action.AchievementBarAction;
import com.R72X.action.AchievementLineAction;
import com.R72X.action.AchievementPieAction;
import com.R72X.action.CommonProblemAction;
import com.R72X.action.CompactAction;
import com.R72X.action.ComplaintAction;
import com.R72X.action.ContactnoteAction;
import com.R72X.action.ContactplanAction;
import com.R72X.action.CustomerAction;
import com.R72X.action.EnterpriseAction;
import com.R72X.action.EnterpriseReportBarAction;
import com.R72X.action.EnterpriseReportLineAction;
import com.R72X.action.EnterpriseReportPieAction;
import com.R72X.action.ProblemSolutionAction;
import com.R72X.action.ProductAction;
import com.R72X.action.ProductcategoryAction;
import com.R72X.action.ReportAction;
import com.R72X.action.SellerReportBarAction;
import com.R72X.action.SellerReportLineAction;
import com.R72X.action.SellerReportPieAction;
import com.R72X.action.ReportBarAction;
import com.R72X.action.ReportLineAction;
import com.R72X.action.SellsopportunityAction;
import com.R72X.action.SellswarnAction;
import com.R72X.action.UserAction;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

public class PermissionInterceptor extends AbstractInterceptor{
	/*
	 * 拦截Action处理的拦截方法
	 */
	public String intercept(ActionInvocation invocation) throws Exception{
		//获取Action数据
		Object object=invocation.getAction();
		
		//获取ActionContext实例
		ActionContext ac=invocation.getInvocationContext();
		Map session=ac.getSession();
		Integer loginId=(Integer)session.get("loginId");
		String loginCategory=(String)session.get("loginCategory");
		boolean isLegal=false;
		
		if(loginId!=null&&loginCategory!=null){
			int cid=getCategoryId(loginCategory);
			switch(cid){
			case 1://系统管理员
				isLegal=object instanceof UserAction;
				break;
			case 2://数据分析人员
				isLegal=(object instanceof ReportAction)
				||(object instanceof SellerReportPieAction)
				||(object instanceof SellerReportBarAction)
				||(object instanceof SellerReportLineAction)
				||(object instanceof ReportBarAction)
				||(object instanceof ReportLineAction)
				||(object instanceof EnterpriseReportBarAction)
				||(object instanceof EnterpriseReportLineAction)
				||(object instanceof EnterpriseReportPieAction)
				||(object instanceof AchievementBarAction)
				||(object instanceof AchievementLineAction)
				||(object instanceof AchievementPieAction);
				
				break;
			case 3://疑难咨询处理人员
				isLegal=object instanceof ProblemSolutionAction;
				break;
			case 4://业务人员
				isLegal=(object instanceof ProductAction)
				||(object instanceof ProductcategoryAction);
				break;
			case 5://合同管理员
				isLegal=object instanceof CompactAction;
				break;
			case 6://客户服务人员
				isLegal=(object instanceof CommonProblemAction)
				||(object instanceof ProblemSolutionAction)
				||(object instanceof ComplaintAction);
				break;
			case 7://投诉处理人员
				isLegal=object instanceof ComplaintAction;
				break;
			case 8://客户管理员
				isLegal=object instanceof EnterpriseAction;
				break;
			case 9://销售人员
				isLegal=(object instanceof EnterpriseAction)
				||(object instanceof CustomerAction)
				||(object instanceof ContactplanAction)
				||(object instanceof ContactnoteAction)
				||(object instanceof SellsopportunityAction)
				||(object instanceof SellswarnAction)
				||(object instanceof ProductAction);
				break;			
			}
			
			if(isLegal){
				return invocation.invoke();
			}
			return "404";
		}
		else{
			ac.put("errorMessage", "您还没登录，请登录！");
			return Action.LOGIN;
		}
		
	}
	
	//public boolean isLegal(String )
	/*
	 * 获取身份对应的编号
	 */
	public Integer getCategoryId(String category){
		if(category.equals("系统管理员"))return 1;
		if(category.equals("数据分析人员"))return 2;
		if(category.equals("疑难咨询处理人员"))return 3;
		if(category.equals("业务人员"))return 4;
		if(category.equals("合同管理员"))return 5;
		if(category.equals("客户服务人员"))return 6;
		if(category.equals("投诉处理人员"))return 7;
		if(category.equals("客户管理员"))return 8;
		if(category.equals("销售人员"))return 9;
		return 0;
	}
}
