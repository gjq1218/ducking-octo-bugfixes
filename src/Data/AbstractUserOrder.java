package Data;

/**
 * AbstractUserOrder entity provides the base persistence definition of the
 * UserOrder entity. @author MyEclipse Persistence Tools
 */

public abstract class AbstractUserOrder implements java.io.Serializable {

	// Fields

	/**
	 * 
	 */
	private static final long serialVersionUID = -6392637341615095863L;
	private UserOrderId id;

	// Constructors

	/** default constructor */
	public AbstractUserOrder() {
	}

	/** full constructor */
	public AbstractUserOrder(UserOrderId id) {
		this.id = id;
	}

	// Property accessors

	public UserOrderId getId() {
		return this.id;
	}

	public void setId(UserOrderId id) {
		this.id = id;
	}

}