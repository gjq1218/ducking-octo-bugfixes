package Data;

import java.util.List;
import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

/**
 * A data access object (DAO) providing persistence and search support for
 * ShopAdmin entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see Data.ShopAdmin
 * @author MyEclipse Persistence Tools
 */

public class ShopAdminDAO extends HibernateDaoSupport {
	private static final Logger log = LoggerFactory
			.getLogger(ShopAdminDAO.class);
	// property constants
	public static final String SHOPADMIN_PWD = "shopadminPwd";
	public static final String ADMIN_NAME = "adminName";

	protected void initDao() {
		// do nothing
	}

	public void save(ShopAdmin transientInstance) {
		log.debug("saving ShopAdmin instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(ShopAdmin persistentInstance) {
		log.debug("deleting ShopAdmin instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public ShopAdmin findById(java.lang.String id) {
		log.debug("getting ShopAdmin instance with id: " + id);
		try {
			ShopAdmin instance = (ShopAdmin) getHibernateTemplate().get(
					"Data.ShopAdmin", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(ShopAdmin instance) {
		log.debug("finding ShopAdmin instance by example");
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
		log.debug("finding ShopAdmin instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from ShopAdmin as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByShopadminPwd(Object shopadminPwd) {
		return findByProperty(SHOPADMIN_PWD, shopadminPwd);
	}

	public List findByAdminName(Object adminName) {
		return findByProperty(ADMIN_NAME, adminName);
	}

	public List findAll() {
		log.debug("finding all ShopAdmin instances");
		try {
			String queryString = "from ShopAdmin";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public ShopAdmin merge(ShopAdmin detachedInstance) {
		log.debug("merging ShopAdmin instance");
		try {
			ShopAdmin result = (ShopAdmin) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(ShopAdmin instance) {
		log.debug("attaching dirty ShopAdmin instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(ShopAdmin instance) {
		log.debug("attaching clean ShopAdmin instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static ShopAdminDAO getFromApplicationContext(ApplicationContext ctx) {
		return (ShopAdminDAO) ctx.getBean("ShopAdminDAO");
	}
}