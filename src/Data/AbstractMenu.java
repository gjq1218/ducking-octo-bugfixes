package Data;

import java.util.HashSet;
import java.util.Set;

/**
 * AbstractMenu entity provides the base persistence definition of the Menu
 * entity. @author MyEclipse Persistence Tools
 */

public abstract class AbstractMenu implements java.io.Serializable {

	// Fields

	private String menuId;
	private String itemName;
	private String category;
	private Double price;
	private String pictureId;
	private Set orderMenus = new HashSet(0);

	// Constructors

	/** default constructor */
	public AbstractMenu() {
	}

	/** minimal constructor */
	public AbstractMenu(String menuId, String itemName) {
		this.menuId = menuId;
		this.itemName = itemName;
	}

	/** full constructor */
	public AbstractMenu(String menuId, String itemName, String category,
			Double price, String pictureId, Set orderMenus) {
		this.menuId = menuId;
		this.itemName = itemName;
		this.category = category;
		this.price = price;
		this.pictureId = pictureId;
		this.orderMenus = orderMenus;
	}

	// Property accessors

	public String getMenuId() {
		return this.menuId;
	}

	public void setMenuId(String menuId) {
		this.menuId = menuId;
	}

	public String getItemName() {
		return this.itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public String getCategory() {
		return this.category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public Double getPrice() {
		return this.price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public String getPictureId() {
		return this.pictureId;
	}

	public void setPictureId(String pictureId) {
		this.pictureId = pictureId;
	}

	public Set getOrderMenus() {
		return this.orderMenus;
	}

	public void setOrderMenus(Set orderMenus) {
		this.orderMenus = orderMenus;
	}

}