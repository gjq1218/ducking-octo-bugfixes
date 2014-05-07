package POJO;

import java.util.Set;

/**
 * Menu entity. @author MyEclipse Persistence Tools
 */
public class Menu extends AbstractMenu implements java.io.Serializable {

	// Constructors

	/** default constructor */
	public Menu() {
	}

	/** minimal constructor */
	public Menu(String menuId, String itemName) {
		super(menuId, itemName);
	}

	/** full constructor */
	public Menu(String menuId, String itemName, String category, Double price,
			String pictureId, Set orderMenus) {
		super(menuId, itemName, category, price, pictureId, orderMenus);
	}

}
