package Data;

import java.util.Set;

/**
 * User entity. @author MyEclipse Persistence Tools
 */
public class User extends AbstractUser implements java.io.Serializable {

	// Constructors

	/**
	 * 
	 */
	private static final long serialVersionUID = 7457647445538339786L;

	/** default constructor */
	public User() {
	}

	/** minimal constructor */
	public User(String userId, String userPasscode, String email,
			String userName) {
		super(userId, userPasscode, email, userName);
	}

	/** full constructor */
	public User(String userId, String userPasscode, String userAddress,
			String phone, String email, String avatar, String userName,
			String credit, String level, Set<UserReservation> userReservations, Set<UserOrder> userOrders) {
		super(userId, userPasscode, userAddress, phone, email, avatar,
				userName, credit, level, userReservations, userOrders);
	}

}
