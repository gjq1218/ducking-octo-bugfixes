package Data;

/**
 * AbstractOrderMenu entity provides the base persistence definition of the
 * OrderMenu entity. @author MyEclipse Persistence Tools
 */

public abstract class AbstractOrderMenu implements java.io.Serializable {

	// Fields

	private OrderMenuId id;

	// Constructors

	/** default constructor */
	public AbstractOrderMenu() {
	}

	/** full constructor */
	public AbstractOrderMenu(OrderMenuId id) {
		this.id = id;
	}

	// Property accessors

	public OrderMenuId getId() {
		return this.id;
	}

	public void setId(OrderMenuId id) {
		this.id = id;
	}

}