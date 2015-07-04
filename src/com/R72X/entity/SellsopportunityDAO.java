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
 * Sellsopportunity entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see com.R72X.entity.Sellsopportunity
 * @author MyEclipse Persistence Tools
 */

public class SellsopportunityDAO extends HibernateDaoSupport {
	private static final Logger log = LoggerFactory
			.getLogger(SellsopportunityDAO.class);
	// property constants
	public static final String SELLS_OPPORTUNITY_DESC = "sellsOpportunityDesc";
	public static final String SELLS_OPPORTUNITY_NAME = "sellsOpportunityName";

	protected void initDao() {
		// do nothing
	}

	public void save(Sellsopportunity transientInstance) {
		log.debug("saving Sellsopportunity instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Sellsopportunity persistentInstance) {
		log.debug("deleting Sellsopportunity instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Sellsopportunity findById(java.lang.Integer id) {
		log.debug("getting Sellsopportunity instance with id: " + id);
		try {
			Sellsopportunity instance = (Sellsopportunity) getHibernateTemplate()
					.get("com.R72X.entity.Sellsopportunity", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Sellsopportunity instance) {
		log.debug("finding Sellsopportunity instance by example");
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
		log.debug("finding Sellsopportunity instance with property: "
				+ propertyName + ", value: " + value);
		try {
			String queryString = "from Sellsopportunity as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findBySellsOpportunityDesc(Object sellsOpportunityDesc) {
		return findByProperty(SELLS_OPPORTUNITY_DESC, sellsOpportunityDesc);
	}

	public List findBySellsOpportunityName(Object sellsOpportunityName) {
		return findByProperty(SELLS_OPPORTUNITY_NAME, sellsOpportunityName);
	}

	public List findAll() {
		log.debug("finding all Sellsopportunity instances");
		try {
			String queryString = "from Sellsopportunity";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Sellsopportunity merge(Sellsopportunity detachedInstance) {
		log.debug("merging Sellsopportunity instance");
		try {
			Sellsopportunity result = (Sellsopportunity) getHibernateTemplate()
					.merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Sellsopportunity instance) {
		log.debug("attaching dirty Sellsopportunity instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Sellsopportunity instance) {
		log.debug("attaching clean Sellsopportunity instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static SellsopportunityDAO getFromApplicationContext(
			ApplicationContext ctx) {
		return (SellsopportunityDAO) ctx.getBean("SellsopportunityDAO");
	}
}