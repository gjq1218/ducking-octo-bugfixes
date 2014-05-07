package POJO;

/**
 * UserOrder entity. @author MyEclipse Persistence Tools
 */
public class UserOrder extends AbstractUserOrder implements
		java.io.Serializable {

	// Constructors

	/** default constructor */
	public UserOrder() {
	}

	/** full constructor */
	public UserOrder(UserOrderId id) {
		super(id);
	}

}
