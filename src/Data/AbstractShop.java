package Data;

import java.util.HashSet;
import java.util.Set;

/**
 * AbstractShop entity provides the base persistence definition of the Shop
 * entity. @author MyEclipse Persistence Tools
 */

public abstract class AbstractShop implements java.io.Serializable {

	// Fields

	private String shopId;
	private String shopName;
	private String shopAddress;
	private String startTime;
	private String endTime;
	private String phone;
	private Set reservations = new HashSet(0);
	private Set shopAdmins = new HashSet(0);
	private Set orders = new HashSet(0);

	// Constructors

	/** default constructor */
	public AbstractShop() {
	}

	/** minimal constructor */
	public AbstractShop(String shopId, String shopName, String shopAddress,
			String startTime, String endTime, String phone) {
		this.shopId = shopId;
		this.shopName = shopName;
		this.shopAddress = shopAddress;
		this.startTime = startTime;
		this.endTime = endTime;
		this.phone = phone;
	}

	/** full constructor */
	public AbstractShop(String shopId, String shopName, String shopAddress,
			String startTime, String endTime, String phone, Set reservations,
			Set shopAdmins, Set orders) {
		this.shopId = shopId;
		this.shopName = shopName;
		this.shopAddress = shopAddress;
		this.startTime = startTime;
		this.endTime = endTime;
		this.phone = phone;
		this.reservations = reservations;
		this.shopAdmins = shopAdmins;
		this.orders = orders;
	}

	// Property accessors

	public String getShopId() {
		return this.shopId;
	}

	public void setShopId(String shopId) {
		this.shopId = shopId;
	}

	public String getShopName() {
		return this.shopName;
	}

	public void setShopName(String shopName) {
		this.shopName = shopName;
	}

	public String getShopAddress() {
		return this.shopAddress;
	}

	public void setShopAddress(String shopAddress) {
		this.shopAddress = shopAddress;
	}

	public String getStartTime() {
		return this.startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public String getEndTime() {
		return this.endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

	public String getPhone() {
		return this.phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Set getReservations() {
		return this.reservations;
	}

	public void setReservations(Set reservations) {
		this.reservations = reservations;
	}

	public Set getShopAdmins() {
		return this.shopAdmins;
	}

	public void setShopAdmins(Set shopAdmins) {
		this.shopAdmins = shopAdmins;
	}

	public Set getOrders() {
		return this.orders;
	}

	public void setOrders(Set orders) {
		this.orders = orders;
	}

}