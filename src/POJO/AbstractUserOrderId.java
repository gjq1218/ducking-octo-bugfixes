package POJO;

/**
 * AbstractUserOrderId entity provides the base persistence definition of the
 * UserOrderId entity. @author MyEclipse Persistence Tools
 */

public abstract class AbstractUserOrderId implements java.io.Serializable {

	// Fields

	private User user;
	private Order order;

	// Constructors

	/** default constructor */
	public AbstractUserOrderId() {
	}

	/** full constructor */
	public AbstractUserOrderId(User user, Order order) {
		this.user = user;
		this.order = order;
	}

	// Property accessors

	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Order getOrder() {
		return this.order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}

	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof AbstractUserOrderId))
			return false;
		AbstractUserOrderId castOther = (AbstractUserOrderId) other;

		return ((this.getUser() == castOther.getUser()) || (this.getUser() != null
				&& castOther.getUser() != null && this.getUser().equals(
				castOther.getUser())))
				&& ((this.getOrder() == castOther.getOrder()) || (this
						.getOrder() != null && castOther.getOrder() != null && this
						.getOrder().equals(castOther.getOrder())));
	}

	public int hashCode() {
		int result = 17;

		result = 37 * result
				+ (getUser() == null ? 0 : this.getUser().hashCode());
		result = 37 * result
				+ (getOrder() == null ? 0 : this.getOrder().hashCode());
		return result;
	}

}