package POJO;

/**
 * UserOrderId entity. @author MyEclipse Persistence Tools
 */
public class UserOrderId extends AbstractUserOrderId implements
		java.io.Serializable {

	// Constructors

	/** default constructor */
	public UserOrderId() {
	}

	/** full constructor */
	public UserOrderId(User user, Order order) {
		super(user, order);
	}

}
