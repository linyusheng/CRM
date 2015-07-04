package com.R72X.service;

import java.util.List;

import com.R72X.entity.Problemsolution;
import com.R72X.entity.ProblemsolutionDAO;
import com.R72X.util.PageBean;
import com.R72X.util.PageService;

public class ProblemSolutionService {
	private ProblemsolutionDAO problemsolutionDAO;

	public ProblemsolutionDAO getProblemsolutionDAO() {
		return problemsolutionDAO;
	}

	public void setProblemsolutionDAO(ProblemsolutionDAO problemsolutionDAO) {
		this.problemsolutionDAO = problemsolutionDAO;
	}
	
	public Problemsolution loadProblemsolution(Integer id){
		return problemsolutionDAO.findById(id);
	}
	
	public void saveProblemsolution(Problemsolution problemsolution){
		problemsolutionDAO.merge(problemsolution);
	}
	
	public void removeProblemsolution(Integer id){
		problemsolutionDAO.delete(problemsolutionDAO.findById(id));
	}
	
	public List<Problemsolution> searchstate(String stateWord,PageBean page){
		Object[] params = null;
		
		//创建HQL查询语句
		String selectHql = null;
		if((stateWord == null) || (stateWord.equals(""))){
			selectHql = " from Problemsolution";
		}
		else {
			selectHql = " from Problemsolution as p where p.PState like '%" + stateWord + "%'"; 
		}
		
		//创建获取HQL返回记录总行数语句
		String countHql = "select count(*)" + selectHql;
		
		//执行按条件查询和分页支持
		List<Problemsolution> PS_List = PageService.searchByPage(selectHql, countHql, params, page, problemsolutionDAO);
		return PS_List;
	}
	
	public List<Problemsolution> searchProblemsolution(String problemSolutionName,PageBean page){
		Object[] params = null;
		
		//创建HQL查询语句
		String selectHql = null;
		if((problemSolutionName == null) || (problemSolutionName.equals(""))){
			selectHql = " from Problemsolution";
		}
		else {
			selectHql = " from Problemsolution as p where p.problemName like '%" + problemSolutionName + "%'"; 
		}
		
		//创建获取HQL返回记录总行数语句
		String countHql = "select count(*)" + selectHql;
		
		//执行按条件查询和分页支持
		List<Problemsolution> PS_List = PageService.searchByPage(selectHql, countHql, params, page, problemsolutionDAO);
		return PS_List;
	}
}
