package Data;

/**
 * ShopAdmin entity. @author MyEclipse Persistence Tools
 */
public class ShopAdmin extends AbstractShopAdmin implements
		java.io.Serializable {

	// Constructors

	/** default constructor */
	public ShopAdmin() {
	}

	/** minimal constructor */
	public ShopAdmin(String shopadminId, String shopadminPwd) {
		super(shopadminId, shopadminPwd);
	}

	/** full constructor */
	public ShopAdmin(String shopadminId, Shop shop, String shopadminPwd,
			String adminName) {
		super(shopadminId, shop, shopadminPwd, adminName);
	}

}
