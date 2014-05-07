package POJO;

/**
 * AbstractShopAdmin entity provides the base persistence definition of the
 * ShopAdmin entity. @author MyEclipse Persistence Tools
 */

public abstract class AbstractShopAdmin implements java.io.Serializable {

	// Fields

	private String shopadminId;
	private Shop shop;
	private String shopadminPwd;
	private String adminName;

	// Constructors

	/** default constructor */
	public AbstractShopAdmin() {
	}

	/** minimal constructor */
	public AbstractShopAdmin(String shopadminId, String shopadminPwd) {
		this.shopadminId = shopadminId;
		this.shopadminPwd = shopadminPwd;
	}

	/** full constructor */
	public AbstractShopAdmin(String shopadminId, Shop shop,
			String shopadminPwd, String adminName) {
		this.shopadminId = shopadminId;
		this.shop = shop;
		this.shopadminPwd = shopadminPwd;
		this.adminName = adminName;
	}

	// Property accessors

	public String getShopadminId() {
		return this.shopadminId;
	}

	public void setShopadminId(String shopadminId) {
		this.shopadminId = shopadminId;
	}

	public Shop getShop() {
		return this.shop;
	}

	public void setShop(Shop shop) {
		this.shop = shop;
	}

	public String getShopadminPwd() {
		return this.shopadminPwd;
	}

	public void setShopadminPwd(String shopadminPwd) {
		this.shopadminPwd = shopadminPwd;
	}

	public String getAdminName() {
		return this.adminName;
	}

	public void setAdminName(String adminName) {
		this.adminName = adminName;
	}

}