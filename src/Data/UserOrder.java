package Data;

/**
 * UserOrder entity. @author MyEclipse Persistence Tools
 */
public class UserOrder extends AbstractUserOrder implements
		java.io.Serializable {

	// Constructors

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/** default constructor */
	public UserOrder() {
	}

	/** full constructor */
	public UserOrder(UserOrderId id) {
		super(id);
	}

}
