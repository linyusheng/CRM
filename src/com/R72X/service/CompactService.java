package com.R72X.service;

import java.util.List;

import com.R72X.entity.Compact;
import com.R72X.entity.CompactDAO;
import com.R72X.entity.Contactnote;
import com.R72X.util.PageBean;
import com.R72X.util.PageService;

public class CompactService {
	private CompactDAO compactDAO;

	public void setCompactDAO(CompactDAO compactDAO) {
		this.compactDAO = compactDAO;
	}

	/*
	 * 根据主键ID查找对象
	 */
	public Compact loadCompact(Integer id) {
		return compactDAO.findById(id);
	}

	/*
	 * 执行新增对象或修改对象的保存操作
	 */
	public void saveCompact(Compact compact) {
		compactDAO.merge(compact);
	}

	/*
	 * 根据主键ID删除数据库中对象
	 */
	public void removeCompact(Integer id) {
		compactDAO.delete(compactDAO.findById(id));
	}

	/*
	 * 按条件查询和分页支持
	 * 
	 * 根据会员姓名执行模糊匹配查找，通过Page对象执行分页。
	 * 
	 * @loginName：会员登录账号
	 * 
	 * @page:分页对象
	 */

	public List<Compact> searchCompact(String keyword, PageBean page) {
		Object[] params = null;
		String selectHql = null;
		if ((keyword == null) || (keyword.equals(""))) {
			selectHql = "from Compact as r where r.lastTime > 0 and r.compactDesc not like '#合同已到期#%'";
		} else {
			selectHql = "from Compact as r where r.lastTime > 0 and r.compactDesc not like '#合同已到期#%' and r.enterprise.enterpriseName like '%"
					+ keyword + "%'";
		}

		String countHql = "select count(*) " + selectHql;

		List<Compact> list = PageService.searchByPage(selectHql, countHql,
				params, page, compactDAO);
		return list;
	}

	public List<Compact> searchOverdueCompact(String keyword, PageBean page) {
		Object[] params = null;
		String selectHql = null;

		if ((keyword == null) || (keyword.equals(""))) {
			selectHql = "from Compact as r where r.lastTime > 0 and r.compactDesc like '#合同已到期#%'";
		} else {
			selectHql = "from Compact as r where r.lastTime > 0 and r.compactDesc like '#合同已到期#%' and r.enterprise.enterpriseName like '%"
					+ keyword + "%'";
		}

		String countHql = "select count(*) " + selectHql;

		List<Compact> list = PageService.searchByPage(selectHql, countHql,
				params, page, compactDAO);
		return list;
	}

	public List<Compact> searchEffectCompact(String keyword, PageBean page) {
		Object[] params = null;
		String selectHql = null;

		if ((keyword == null) || (keyword.equals(""))) {
			selectHql = "from Compact as r where r.lastTime > 0 order by r.effectTime desc";
		} else {
			selectHql = "from Compact as r where r.lastTime > 0 order by r.effectTime desc";
		}

		String countHql = "select count(*) " + selectHql;

		List<Compact> list = PageService.searchByPage(selectHql, countHql,
				params, page, compactDAO);
		return list;
	}

	public List<Compact> searchCompactByProductID(Integer integer, PageBean page) {
		Object[] params = null;

		// 创建HQL查询语句
		String selectHql = null;
		if ((integer == null) || (integer.equals(""))) {
			selectHql = "from Compact";
		} else {
			selectHql = "from Compact as r where r.product.productId like '%"
					+ integer + "%'";
		}

		// 创建获取HQL返回记录总行数语句
		String countHql = "select count(*) " + selectHql;

		// 执行按条件查询和分页支持
		List<Compact> compactList = PageService.searchByPage(selectHql,
				countHql, params, page, compactDAO);
		return compactList;
	}

	public List<Compact> searchCompactBySellerID(Integer integer, PageBean page) {
		Object[] params = null;
		String selectHql = null;
		if ((integer == null) || (integer.equals(""))) {
			selectHql = "from Compact ";
		} else {
			selectHql = "from Compact as r where  r.userBySellerId.userId like '%"
					+ integer + "%'";
		}

		String countHql = "select count(*) " + selectHql;

		List<Compact> list = PageService.searchByPage(selectHql, countHql,
				params, page, compactDAO);
		return list;
	}

}
