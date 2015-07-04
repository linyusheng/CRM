package com.R72X.entity;

import java.sql.Timestamp;
import java.util.List;
import java.util.Set;
import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

/**
 * A data access object (DAO) providing persistence and search support for
 * Sellswarn entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.R72X.entity.Sellswarn
 * @author MyEclipse Persistence Tools
 */

public class SellswarnDAO extends HibernateDaoSupport {
	private static final Logger log = LoggerFactory
			.getLogger(SellswarnDAO.class);
	// property constants
	public static final String SELLS_WARN_NAME = "sellsWarnName";
	public static final String WARN_DESC = "warnDesc";
	public static final String WARN_STATE = "warnState";

	protected void initDao() {
		// do nothing
	}

	public void save(Sellswarn transientInstance) {
		log.debug("saving Sellswarn instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Sellswarn persistentInstance) {
		log.debug("deleting Sellswarn instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Sellswarn findById(java.lang.Integer id) {
		log.debug("getting Sellswarn instance with id: " + id);
		try {
			Sellswarn instance = (Sellswarn) getHibernateTemplate().get(
					"com.R72X.entity.Sellswarn", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Sellswarn instance) {
		log.debug("finding Sellswarn instance by example");
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
		log.debug("finding Sellswarn instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Sellswarn as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findBySellsWarnName(Object sellsWarnName) {
		return findByProperty(SELLS_WARN_NAME, sellsWarnName);
	}

	public List findByWarnDesc(Object warnDesc) {
		return findByProperty(WARN_DESC, warnDesc);
	}

	public List findByWarnState(Object warnState) {
		return findByProperty(WARN_STATE, warnState);
	}

	public List findAll() {
		log.debug("finding all Sellswarn instances");
		try {
			String queryString = "from Sellswarn";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Sellswarn merge(Sellswarn detachedInstance) {
		log.debug("merging Sellswarn instance");
		try {
			Sellswarn result = (Sellswarn) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Sellswarn instance) {
		log.debug("attaching dirty Sellswarn instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Sellswarn instance) {
		log.debug("attaching clean Sellswarn instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static SellswarnDAO getFromApplicationContext(ApplicationContext ctx) {
		return (SellswarnDAO) ctx.getBean("SellswarnDAO");
	}
}