package com.R72X.entity;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;
import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

/**
 * A data access object (DAO) providing persistence and search support for
 * Problemsolution entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see com.R72X.entity.Problemsolution
 * @author MyEclipse Persistence Tools
 */

public class ProblemsolutionDAO extends HibernateDaoSupport {
	private static final Logger log = LoggerFactory
			.getLogger(ProblemsolutionDAO.class);
	// property constants
	public static final String PROBLEM_NAME = "problemName";
	public static final String PROBLEM_DESC = "problemDesc";
	public static final String SOLUTION_DESC = "solutionDesc";
	public static final String _PSTATE = "PState";

	protected void initDao() {
		// do nothing
	}

	public void save(Problemsolution transientInstance) {
		log.debug("saving Problemsolution instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Problemsolution persistentInstance) {
		log.debug("deleting Problemsolution instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Problemsolution findById(java.lang.Integer id) {
		log.debug("getting Problemsolution instance with id: " + id);
		try {
			Problemsolution instance = (Problemsolution) getHibernateTemplate()
					.get("com.R72X.entity.Problemsolution", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Problemsolution instance) {
		log.debug("finding Problemsolution instance by example");
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
		log.debug("finding Problemsolution instance with property: "
				+ propertyName + ", value: " + value);
		try {
			String queryString = "from Problemsolution as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByProblemName(Object problemName) {
		return findByProperty(PROBLEM_NAME, problemName);
	}

	public List findByProblemDesc(Object problemDesc) {
		return findByProperty(PROBLEM_DESC, problemDesc);
	}

	public List findBySolutionDesc(Object solutionDesc) {
		return findByProperty(SOLUTION_DESC, solutionDesc);
	}

	public List findByPState(Object PState) {
		return findByProperty(_PSTATE, PState);
	}

	public List findAll() {
		log.debug("finding all Problemsolution instances");
		try {
			String queryString = "from Problemsolution";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Problemsolution merge(Problemsolution detachedInstance) {
		log.debug("merging Problemsolution instance");
		try {
			Problemsolution result = (Problemsolution) getHibernateTemplate()
					.merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Problemsolution instance) {
		log.debug("attaching dirty Problemsolution instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Problemsolution instance) {
		log.debug("attaching clean Problemsolution instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static ProblemsolutionDAO getFromApplicationContext(
			ApplicationContext ctx) {
		return (ProblemsolutionDAO) ctx.getBean("ProblemsolutionDAO");
	}
}