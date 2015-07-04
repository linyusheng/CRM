package com.R72X.entity;

import java.util.List;
import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

/**
 * A data access object (DAO) providing persistence and search support for
 * Contactplan entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see com.R72X.entity.Contactplan
 * @author MyEclipse Persistence Tools
 */

public class ContactplanDAO extends HibernateDaoSupport {
	private static final Logger log = LoggerFactory
			.getLogger(ContactplanDAO.class);
	// property constants
	public static final String CONTACT_PLAN_NAME = "contactPlanName";
	public static final String CONTACT_PLAN_DESC = "contactPlanDesc";

	protected void initDao() {
		// do nothing
	}

	public void save(Contactplan transientInstance) {
		log.debug("saving Contactplan instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Contactplan persistentInstance) {
		log.debug("deleting Contactplan instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Contactplan findById(java.lang.Integer id) {
		log.debug("getting Contactplan instance with id: " + id);
		try {
			Contactplan instance = (Contactplan) getHibernateTemplate().get(
					"com.R72X.entity.Contactplan", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Contactplan instance) {
		log.debug("finding Contactplan instance by example");
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
		log.debug("finding Contactplan instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Contactplan as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByContactPlanName(Object contactPlanName) {
		return findByProperty(CONTACT_PLAN_NAME, contactPlanName);
	}

	public List findByContactPlanDesc(Object contactPlanDesc) {
		return findByProperty(CONTACT_PLAN_DESC, contactPlanDesc);
	}

	public List findAll() {
		log.debug("finding all Contactplan instances");
		try {
			String queryString = "from Contactplan";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Contactplan merge(Contactplan detachedInstance) {
		log.debug("merging Contactplan instance");
		try {
			Contactplan result = (Contactplan) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Contactplan instance) {
		log.debug("attaching dirty Contactplan instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Contactplan instance) {
		log.debug("attaching clean Contactplan instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static ContactplanDAO getFromApplicationContext(
			ApplicationContext ctx) {
		return (ContactplanDAO) ctx.getBean("ContactplanDAO");
	}
}