package com.R72X.entity;

import java.util.List;
import java.util.Set;
import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

/**
 * A data access object (DAO) providing persistence and search support for
 * Productcategory entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see com.R72X.entity.Productcategory
 * @author MyEclipse Persistence Tools
 */

public class ProductcategoryDAO extends HibernateDaoSupport {
	private static final Logger log = LoggerFactory
			.getLogger(ProductcategoryDAO.class);
	// property constants
	public static final String CATEGORY_NAME = "categoryName";
	public static final String PRODUCT_CATEGORY_DESC = "productCategoryDesc";

	protected void initDao() {
		// do nothing
	}

	public void save(Productcategory transientInstance) {
		log.debug("saving Productcategory instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Productcategory persistentInstance) {
		log.debug("deleting Productcategory instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Productcategory findById(java.lang.Integer id) {
		log.debug("getting Productcategory instance with id: " + id);
		try {
			Productcategory instance = (Productcategory) getHibernateTemplate()
					.get("com.R72X.entity.Productcategory", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Productcategory instance) {
		log.debug("finding Productcategory instance by example");
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
		log.debug("finding Productcategory instance with property: "
				+ propertyName + ", value: " + value);
		try {
			String queryString = "from Productcategory as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByCategoryName(Object categoryName) {
		return findByProperty(CATEGORY_NAME, categoryName);
	}

	public List findByProductCategoryDesc(Object productCategoryDesc) {
		return findByProperty(PRODUCT_CATEGORY_DESC, productCategoryDesc);
	}

	public List findAll() {
		log.debug("finding all Productcategory instances");
		try {
			String queryString = "from Productcategory";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Productcategory merge(Productcategory detachedInstance) {
		log.debug("merging Productcategory instance");
		try {
			Productcategory result = (Productcategory) getHibernateTemplate()
					.merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Productcategory instance) {
		log.debug("attaching dirty Productcategory instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Productcategory instance) {
		log.debug("attaching clean Productcategory instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static ProductcategoryDAO getFromApplicationContext(
			ApplicationContext ctx) {
		return (ProductcategoryDAO) ctx.getBean("ProductcategoryDAO");
	}
}