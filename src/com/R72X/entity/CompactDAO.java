package com.R72X.entity;

import java.util.Date;
import java.util.List;
import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

/**
 * A data access object (DAO) providing persistence and search support for
 * Compact entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.R72X.entity.Compact
 * @author MyEclipse Persistence Tools
 */

public class CompactDAO extends HibernateDaoSupport {
	private static final Logger log = LoggerFactory.getLogger(CompactDAO.class);
	// property constants
	public static final String LAST_TIME = "lastTime";
	public static final String SIGN_MONEY = "signMoney";
	public static final String BREAK_MONEY = "breakMoney";
	public static final String PAY_WAY = "payWay";
	public static final String COMPACT_DESC = "compactDesc";
	public static final String ATTACHMENT = "attachment";

	protected void initDao() {
		// do nothing
	}

	public void save(Compact transientInstance) {
		log.debug("saving Compact instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Compact persistentInstance) {
		log.debug("deleting Compact instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Compact findById(java.lang.Integer id) {
		log.debug("getting Compact instance with id: " + id);
		try {
			Compact instance = (Compact) getHibernateTemplate().get(
					"com.R72X.entity.Compact", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Compact instance) {
		log.debug("finding Compact instance by example");
		try {
			List results = getHibernateTemplate().findByExample(instance);
			log.debug("find by example successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}

	public List findByProperty(String propertyName, Object value) {
		log.debug("finding Compact instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Compact as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByLastTime(Object lastTime) {
		return findByProperty(LAST_TIME, lastTime);
	}

	public List findBySignMoney(Object signMoney) {
		return findByProperty(SIGN_MONEY, signMoney);
	}

	public List findByBreakMoney(Object breakMoney) {
		return findByProperty(BREAK_MONEY, breakMoney);
	}

	public List findByPayWay(Object payWay) {
		return findByProperty(PAY_WAY, payWay);
	}

	public List findByCompactDesc(Object compactDesc) {
		return findByProperty(COMPACT_DESC, compactDesc);
	}

	public List findByAttachment(Object attachment) {
		return findByProperty(ATTACHMENT, attachment);
	}

	public List findAll() {
		log.debug("finding all Compact instances");
		try {
			String queryString = "from Compact";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Compact merge(Compact detachedInstance) {
		log.debug("merging Compact instance");
		try {
			Compact result = (Compact) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Compact instance) {
		log.debug("attaching dirty Compact instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Compact instance) {
		log.debug("attaching clean Compact instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static CompactDAO getFromApplicationContext(ApplicationContext ctx) {
		return (CompactDAO) ctx.getBean("CompactDAO");
	}
}