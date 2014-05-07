package Data;

/**
 * OrderMenuId entity. @author MyEclipse Persistence Tools
 */
public class OrderMenuId extends AbstractOrderMenuId implements
		java.io.Serializable {

	// Constructors

	/** default constructor */
	public OrderMenuId() {
	}

	/** full constructor */
	public OrderMenuId(Order order, Menu menu) {
		super(order, menu);
	}

}
