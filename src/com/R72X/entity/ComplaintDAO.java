package com.R72X.entity;

import java.sql.Timestamp;
import java.util.List;
import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

/**
 * A data access object (DAO) providing persistence and search support for
 * Complaint entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.R72X.entity.Complaint
 * @author MyEclipse Persistence Tools
 */

public class ComplaintDAO extends HibernateDaoSupport {
	private static final Logger log = LoggerFactory
			.getLogger(ComplaintDAO.class);
	// property constants
	public static final String COMPLAINT_PROBLEM = "complaintProblem";
	public static final String COMPLAINT_PROBLEM_DESC = "complaintProblemDesc";
	public static final String SOLVER_ID = "solverId";
	public static final String COMPLAINT_NAME = "complaintName";
	public static final String COMPLAINT_NUMBER = "complaintNumber";
	public static final String _CSTATE = "CState";

	protected void initDao() {
		// do nothing
	}

	public void save(Complaint transientInstance) {
		log.debug("saving Complaint instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Complaint persistentInstance) {
		log.debug("deleting Complaint instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Complaint findById(java.lang.Integer id) {
		log.debug("getting Complaint instance with id: " + id);
		try {
			Complaint instance = (Complaint) getHibernateTemplate().get(
					"com.R72X.entity.Complaint", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Complaint instance) {
		log.debug("finding Complaint instance by example");
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
		log.debug("finding Complaint instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Complaint as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByComplaintProblem(Object complaintProblem) {
		return findByProperty(COMPLAINT_PROBLEM, complaintProblem);
	}

	public List findByComplaintProblemDesc(Object complaintProblemDesc) {
		return findByProperty(COMPLAINT_PROBLEM_DESC, complaintProblemDesc);
	}

	public List findBySolverId(Object solverId) {
		return findByProperty(SOLVER_ID, solverId);
	}

	public List findByComplaintName(Object complaintName) {
		return findByProperty(COMPLAINT_NAME, complaintName);
	}

	public List findByComplaintNumber(Object complaintNumber) {
		return findByProperty(COMPLAINT_NUMBER, complaintNumber);
	}

	public List findByCState(Object CState) {
		return findByProperty(_CSTATE, CState);
	}

	public List findAll() {
		log.debug("finding all Complaint instances");
		try {
			String queryString = "from Complaint";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Complaint merge(Complaint detachedInstance) {
		log.debug("merging Complaint instance");
		try {
			Complaint result = (Complaint) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Complaint instance) {
		log.debug("attaching dirty Complaint instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Complaint instance) {
		log.debug("attaching clean Complaint instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static ComplaintDAO getFromApplicationContext(ApplicationContext ctx) {
		return (ComplaintDAO) ctx.getBean("ComplaintDAO");
	}
}