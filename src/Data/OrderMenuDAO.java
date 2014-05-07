package Data;

import java.util.List;
import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

/**
 * A data access object (DAO) providing persistence and search support for
 * OrderMenu entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see Data.OrderMenu
 * @author MyEclipse Persistence Tools
 */

public class OrderMenuDAO extends HibernateDaoSupport {
	private static final Logger log = LoggerFactory
			.getLogger(OrderMenuDAO.class);

	// property constants

	protected void initDao() {
		// do nothing
	}

	public void save(OrderMenu transientInstance) {
		log.debug("saving OrderMenu instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(OrderMenu persistentInstance) {
		log.debug("deleting OrderMenu instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public OrderMenu findById(Data.OrderMenuId id) {
		log.debug("getting OrderMenu instance with id: " + id);
		try {
			OrderMenu instance = (OrderMenu) getHibernateTemplate().get(
					"Data.OrderMenu", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(OrderMenu instance) {
		log.debug("finding OrderMenu instance by example");
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
		log.debug("finding OrderMenu instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from OrderMenu as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findAll() {
		log.debug("finding all OrderMenu instances");
		try {
			String queryString = "from OrderMenu";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public OrderMenu merge(OrderMenu detachedInstance) {
		log.debug("merging OrderMenu instance");
		try {
			OrderMenu result = (OrderMenu) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(OrderMenu instance) {
		log.debug("attaching dirty OrderMenu instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(OrderMenu instance) {
		log.debug("attaching clean OrderMenu instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static OrderMenuDAO getFromApplicationContext(ApplicationContext ctx) {
		return (OrderMenuDAO) ctx.getBean("OrderMenuDAO");
	}
}