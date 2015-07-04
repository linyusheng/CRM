package com.R72X.service;

import java.util.List;

import com.R72X.entity.Commonproblem;
import com.R72X.entity.CommonproblemDAO;
import com.R72X.util.PageBean;
import com.R72X.util.PageService;

public class CommonProblemService {
	private CommonproblemDAO commonproblemDAO;
	

	public CommonproblemDAO getCommonproblemDAO() {
		return commonproblemDAO;
	}

	public void setCommonproblemDAO(CommonproblemDAO commonproblemDAO) {
		this.commonproblemDAO = commonproblemDAO;
	}

	/**
	 * 根据主键查找对象
	 * @param id
	 * @return
	 */
	public Commonproblem loadCommonproblem(Integer id){
			return commonproblemDAO.findById(id);
	}
	
	/**
	 * 输入一个CommonProblem，保存
	 * @param commonProblem
	 */
	public void saveCommonproblem(Commonproblem commonProblem){
		commonproblemDAO.merge(commonProblem);
	}
	
	/**
	 * 根据Id删除此CommonProblem
	 * @param id
	 */
	public void removeCommonproblem(Integer id){
		commonproblemDAO.delete(commonproblemDAO.findById(id));
	}
	
	/**
	 * 常见问题库的分页查询和条件查询
	 * @param commonProblemName
	 * @param page
	 * @return
	 */
	public List<Commonproblem> searchCommonProblem(String keyWord,PageBean page){
		Object[] params = null;
		
		//创建HQL查询语句
		String selectHql = null;
		if((keyWord == null) || (keyWord.equals(""))){
			selectHql = "from Commonproblem";
		}
		else {
			selectHql = "from Commonproblem as c where c.commonProblemDesc like '%" + keyWord + "%'"; 
		}
		
		//创建获取HQL返回记录总行数语句
		String countHql = "select count(*)" + selectHql;
		
		//执行按条件查询和分页支持
		List<Commonproblem> com_problemList = PageService.searchByPage(selectHql, countHql, params, page, commonproblemDAO);
		return com_problemList;
	}
}
