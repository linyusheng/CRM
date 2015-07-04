package com.R72X.filter;

import org.hibernate.FlushMode;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.support.OpenSessionInViewFilter;

/**
 * SSH集成时Hibernate提交的BUG修复
 * 
 * 此过滤器保证在用户每次HTTP请求时，Hibernate的Session一直打开，并且自动开启和提交事务。
 * 
 * @author zzy
 * 
 */
public class FixOpenSessionInViewFilter extends OpenSessionInViewFilter {

	public FixOpenSessionInViewFilter() {
		super.setFlushMode(FlushMode.AUTO);
	}

	protected void closeSession(Session session, SessionFactory sessionFactory) {
		// 刷新数据
		session.flush();

		// 提交事务
		try {
			session.getTransaction().commit();
		} catch (HibernateException e) {
			// e.printStackTrace();
		}

		// 关闭Hibernate Session
		super.closeSession(session, sessionFactory);
	}
}
