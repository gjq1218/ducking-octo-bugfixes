package Data;

import java.util.List;
import org.hibernate.LockMode;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

/**
 * A data access object (DAO) providing persistence and search support for
 * UserReservation entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see Data.UserReservation
 * @author MyEclipse Persistence Tools
 */

public class UserReservationDAO extends HibernateDaoSupport {
	private static final Logger log = LoggerFactory
			.getLogger(UserReservationDAO.class);

	// property constants

	protected void initDao() {
		// do nothing
	}

	public void save(UserReservation transientInstance) {
		log.debug("saving UserReservation instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(UserReservation persistentInstance) {
		log.debug("deleting UserReservation instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public UserReservation findById(Data.UserReservationId id) {
		log.debug("getting UserReservation instance with id: " + id);
		try {
			UserReservation instance = (UserReservation) getHibernateTemplate()
					.get("Data.UserReservation", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(UserReservation instance) {
		log.debug("finding UserReservation instance by example");
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
		log.debug("finding Account instance with property: " + propertyName
				+ ", value: " + value);
		try {
			DetachedCriteria cr = DetachedCriteria.forClass(UserReservation.class);
			cr.add(Restrictions.like(propertyName, value));
			
			return getHibernateTemplate().findByCriteria(cr);

		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}

	}

	public List findAll() {
		log.debug("finding all UserReservation instances");
		try {
			String queryString = "from UserReservation";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public UserReservation merge(UserReservation detachedInstance) {
		log.debug("merging UserReservation instance");
		try {
			UserReservation result = (UserReservation) getHibernateTemplate()
					.merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(UserReservation instance) {
		log.debug("attaching dirty UserReservation instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(UserReservation instance) {
		log.debug("attaching clean UserReservation instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static UserReservationDAO getFromApplicationContext(
			ApplicationContext ctx) {
		return (UserReservationDAO) ctx.getBean("UserReservationDAO");
	}
}