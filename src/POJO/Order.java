package POJO;

import java.sql.Timestamp;
import java.util.Set;

/**
 * Order entity. @author MyEclipse Persistence Tools
 */
public class Order extends AbstractOrder implements java.io.Serializable {

	// Constructors

	/** default constructor */
	public Order() {
	}

	/** minimal constructor */
	public Order(String orderId, Shop shop, Timestamp time,
			String deliveryAddress, Double overallPrice, String type) {
		super(orderId, shop, time, deliveryAddress, overallPrice, type);
	}

	/** full constructor */
	public Order(String orderId, Shop shop, Timestamp time,
			String deliveryAddress, Double overallPrice, String type,
			Set orderMenus, Set userOrders) {
		super(orderId, shop, time, deliveryAddress, overallPrice, type,
				orderMenus, userOrders);
	}

}
