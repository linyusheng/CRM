package com.R72X.util;

import java.sql.SQLException;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

public class PageService {

	/*
	 * 执行分页查询
	 * 
	 * @selectHql：HQL查询语句
	 * 
	 * @countHql：HQL查询结果总记录数统计
	 * 
	 * @params：查询参数
	 * 
	 * @page：分页对象
	 * 
	 * @dao：数据库访问DAO
	 */
	public static List searchByPage(final String selectHql,
			final String countHql, final Object[] params, final PageBean page,
			HibernateDaoSupport dao) {
		// 没有分页对象，表示不分页查询所有记录
		if (page == null) {
			return dao.getHibernateTemplate().find(selectHql);
		}

		/*
		 * 分页查询部分
		 */
		// 获得查询的总记录数，并设置分页对象
		getTotalCount(countHql, params, page, dao);

		// 执行分页查询
		List list = dao.getHibernateTemplate().executeFind(
		// Hibernate回调函数
				new HibernateCallback() {
					public Object doInHibernate(Session session)
							throws HibernateException, SQLException {
						Query query = session.createQuery(selectHql);
						// 设置参数
						if (params != null) {
							for (int i = 0; i < params.length; i++) {
								query.setParameter(i, params[i]);
							}
						}
						// 设置分页信息，并返回查询结果
						List result = query.setFirstResult(
								(page.getCurrentPage() - 1)
										* page.getPageSize()).setMaxResults(
								page.getPageSize()).list();
						return result;
					}
				});
		return list;
	}

	/*
	 * 计算当前HQL请求返回的总记录数，为分页做准备 HQL格式："select count(*) " + selectHql
	 */
	private static void getTotalCount(final String countHql,
			final Object[] params, final PageBean page, HibernateDaoSupport dao) {
		List list = dao.getHibernateTemplate().find(countHql, params);
		Long count = (Long) list.get(0);
		page.setTotalRow(count.intValue());
	}
}
