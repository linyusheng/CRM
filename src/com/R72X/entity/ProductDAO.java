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
 * Product entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.R72X.entity.Product
 * @author MyEclipse Persistence Tools
 */

public class ProductDAO extends HibernateDaoSupport {
	private static final Logger log = LoggerFactory.getLogger(ProductDAO.class);
	// property constants
	public static final String PRODUCT_NAME = "productName";
	public static final String PRODUCT_DESC = "productDesc";

	protected void initDao() {
		// do nothing
	}

	public void save(Product transientInstance) {
		log.debug("saving Product instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Product persistentInstance) {
		log.debug("deleting Product instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Product findById(java.lang.Integer id) {
		log.debug("getting Product instance with id: " + id);
		try {
			Product instance = (Product) getHibernateTemplate().get(
					"com.R72X.entity.Product", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Product instance) {
		log.debug("finding Product instance by example");
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
		log.debug("finding Product instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Product as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByProductName(Object productName) {
		return findByProperty(PRODUCT_NAME, productName);
	}

	public List findByProductDesc(Object productDesc) {
		return findByProperty(PRODUCT_DESC, productDesc);
	}

	public List findAll() {
		log.debug("finding all Product instances");
		try {
			String queryString = "from Product";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Product merge(Product detachedInstance) {
		log.debug("merging Product instance");
		try {
			Product result = (Product) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Product instance) {
		log.debug("attaching dirty Product instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Product instance) {
		log.debug("attaching clean Product instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static ProductDAO getFromApplicationContext(ApplicationContext ctx) {
		return (ProductDAO) ctx.getBean("ProductDAO");
	}
}