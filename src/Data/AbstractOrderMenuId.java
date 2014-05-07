package Data;

/**
 * AbstractOrderMenuId entity provides the base persistence definition of the
 * OrderMenuId entity. @author MyEclipse Persistence Tools
 */

public abstract class AbstractOrderMenuId implements java.io.Serializable {

	// Fields

	private Order order;
	private Menu menu;

	// Constructors

	/** default constructor */
	public AbstractOrderMenuId() {
	}

	/** full constructor */
	public AbstractOrderMenuId(Order order, Menu menu) {
		this.order = order;
		this.menu = menu;
	}

	// Property accessors

	public Order getOrder() {
		return this.order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}

	public Menu getMenu() {
		return this.menu;
	}

	public void setMenu(Menu menu) {
		this.menu = menu;
	}

	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof AbstractOrderMenuId))
			return false;
		AbstractOrderMenuId castOther = (AbstractOrderMenuId) other;

		return ((this.getOrder() == castOther.getOrder()) || (this.getOrder() != null
				&& castOther.getOrder() != null && this.getOrder().equals(
				castOther.getOrder())))
				&& ((this.getMenu() == castOther.getMenu()) || (this.getMenu() != null
						&& castOther.getMenu() != null && this.getMenu()
						.equals(castOther.getMenu())));
	}

	public int hashCode() {
		int result = 17;

		result = 37 * result
				+ (getOrder() == null ? 0 : this.getOrder().hashCode());
		result = 37 * result
				+ (getMenu() == null ? 0 : this.getMenu().hashCode());
		return result;
	}

}