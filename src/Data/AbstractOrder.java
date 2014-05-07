package Data;

import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;

/**
 * AbstractOrder entity provides the base persistence definition of the Order
 * entity. @author MyEclipse Persistence Tools
 */

public abstract class AbstractOrder implements java.io.Serializable {

	// Fields

	private String orderId;
	private Shop shop;
	private Timestamp time;
	private String deliveryAddress;
	private Double overallPrice;
	private String type;
	private Set orderMenus = new HashSet(0);
	private Set userOrders = new HashSet(0);

	// Constructors

	/** default constructor */
	public AbstractOrder() {
	}

	/** minimal constructor */
	public AbstractOrder(String orderId, Shop shop, Timestamp time,
			String deliveryAddress, Double overallPrice, String type) {
		this.orderId = orderId;
		this.shop = shop;
		this.time = time;
		this.deliveryAddress = deliveryAddress;
		this.overallPrice = overallPrice;
		this.type = type;
	}

	/** full constructor */
	public AbstractOrder(String orderId, Shop shop, Timestamp time,
			String deliveryAddress, Double overallPrice, String type,
			Set orderMenus, Set userOrders) {
		this.orderId = orderId;
		this.shop = shop;
		this.time = time;
		this.deliveryAddress = deliveryAddress;
		this.overallPrice = overallPrice;
		this.type = type;
		this.orderMenus = orderMenus;
		this.userOrders = userOrders;
	}

	// Property accessors

	public String getOrderId() {
		return this.orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	public Shop getShop() {
		return this.shop;
	}

	public void setShop(Shop shop) {
		this.shop = shop;
	}

	public Timestamp getTime() {
		return this.time;
	}

	public void setTime(Timestamp time) {
		this.time = time;
	}

	public String getDeliveryAddress() {
		return this.deliveryAddress;
	}

	public void setDeliveryAddress(String deliveryAddress) {
		this.deliveryAddress = deliveryAddress;
	}

	public Double getOverallPrice() {
		return this.overallPrice;
	}

	public void setOverallPrice(Double overallPrice) {
		this.overallPrice = overallPrice;
	}

	public String getType() {
		return this.type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Set getOrderMenus() {
		return this.orderMenus;
	}

	public void setOrderMenus(Set orderMenus) {
		this.orderMenus = orderMenus;
	}

	public Set getUserOrders() {
		return this.userOrders;
	}

	public void setUserOrders(Set userOrders) {
		this.userOrders = userOrders;
	}

}