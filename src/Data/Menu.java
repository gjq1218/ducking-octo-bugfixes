package Data;

import java.util.Set;

/**
 * Menu entity. @author MyEclipse Persistence Tools
 */
public class Menu extends AbstractMenu implements java.io.Serializable {

	// Constructors

	/**
	 * 
	 */
	private static final long serialVersionUID = -8978405008118147426L;

	/** default constructor */
	public Menu() {
	}

	/** minimal constructor */
	public Menu(String menuId, String itemName) {
		super(menuId, itemName);
	}

	/** full constructor */
	public Menu(String menuId, String itemName, String category, Double price,
			String pictureId, Set<OrderMenu> orderMenus) {
		super(menuId, itemName, category, price, pictureId, orderMenus);
	}

}
