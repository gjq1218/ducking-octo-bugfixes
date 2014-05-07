package Data;

import java.util.Set;

/**
 * Shop entity. @author MyEclipse Persistence Tools
 */
public class Shop extends AbstractShop implements java.io.Serializable {

	// Constructors

	/** default constructor */
	public Shop() {
	}

	/** minimal constructor */
	public Shop(String shopId, String shopName, String shopAddress,
			String startTime, String endTime, String phone) {
		super(shopId, shopName, shopAddress, startTime, endTime, phone);
	}

	/** full constructor */
	public Shop(String shopId, String shopName, String shopAddress,
			String startTime, String endTime, String phone, Set reservations,
			Set shopAdmins, Set orders) {
		super(shopId, shopName, shopAddress, startTime, endTime, phone,
				reservations, shopAdmins, orders);
	}

}
