package com.R72X.entity;

import java.util.Date;
import java.util.List;
import java.util.Set;
import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

/**
 * A data access object (DAO) providing persistence and search support for
 * Enterprise entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.R72X.entity.Enterprise
 * @author MyEclipse Persistence Tools
 */

public class EnterpriseDAO extends HibernateDaoSupport {
	private static final Logger log = LoggerFactory
			.getLogger(EnterpriseDAO.class);
	// property constants
	public static final String BOSS_NAME = "bossName";
	public static final String ENTERPRISE_NAME = "enterpriseName";
	public static final String PHONE_NUMBER = "phoneNumber";
	public static final String FAX = "fax";
	public static final String ADDRESS = "address";

	protected void initDao() {
		// do nothing
	}

	public void save(Enterprise transientInstance) {
		log.debug("saving Enterprise instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Enterprise persistentInstance) {
		log.debug("deleting Enterprise instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Enterprise findById(java.lang.Integer id) {
		log.debug("getting Enterprise instance with id: " + id);
		try {
			Enterprise instance = (Enterprise) getHibernateTemplate().get(
					"com.R72X.entity.Enterprise", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Enterprise instance) {
		log.debug("finding Enterprise instance by example");
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
		log.debug("finding Enterprise instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Enterprise as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByBossName(Object bossName) {
		return findByProperty(BOSS_NAME, bossName);
	}

	public List findByEnterpriseName(Object enterpriseName) {
		return findByProperty(ENTERPRISE_NAME, enterpriseName);
	}

	public List findByPhoneNumber(Object phoneNumber) {
		return findByProperty(PHONE_NUMBER, phoneNumber);
	}

	public List findByFax(Object fax) {
		return findByProperty(FAX, fax);
	}

	public List findByAddress(Object address) {
		return findByProperty(ADDRESS, address);
	}

	public List findAll() {
		log.debug("finding all Enterprise instances");
		try {
			String queryString = "from Enterprise";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Enterprise merge(Enterprise detachedInstance) {
		log.debug("merging Enterprise instance");
		try {
			Enterprise result = (Enterprise) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Enterprise instance) {
		log.debug("attaching dirty Enterprise instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Enterprise instance) {
		log.debug("attaching clean Enterprise instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static EnterpriseDAO getFromApplicationContext(ApplicationContext ctx) {
		return (EnterpriseDAO) ctx.getBean("EnterpriseDAO");
	}
}