package Data;

import java.util.HashSet;
import java.util.Set;

/**
 * AbstractUser entity provides the base persistence definition of the User
 * entity. @author MyEclipse Persistence Tools
 */

public abstract class AbstractUser implements java.io.Serializable {

	// Fields

	/**
	 * 
	 */
	private static final long serialVersionUID = -6267525634137519108L;
	private String userId;
	private String userPasscode;
	private String userAddress;
	private String phone;
	private String email;
	private String avatar;
	private String userName;
	private String credit;
	private String level;
	private Set<UserReservation> userReservations = new HashSet<UserReservation>(0);
	private Set<UserOrder> userOrders = new HashSet<UserOrder>(0);

	// Constructors

	/** default constructor */
	public AbstractUser() {
	}

	/** minimal constructor */
	public AbstractUser(String userId, String userPasscode, String email,
			String userName) {
		this.userId = userId;
		this.userPasscode = userPasscode;
		this.email = email;
		this.userName = userName;
	}

	/** full constructor */
	public AbstractUser(String userId, String userPasscode, String userAddress,
			String phone, String email, String avatar, String userName,
			String credit, String level, Set<UserReservation> userReservations, Set<UserOrder> userOrders) {
		this.userId = userId;
		this.userPasscode = userPasscode;
		this.userAddress = userAddress;
		this.phone = phone;
		this.email = email;
		this.avatar = avatar;
		this.userName = userName;
		this.credit = credit;
		this.level = level;
		this.userReservations = userReservations;
		this.userOrders = userOrders;
	}

	// Property accessors

	public String getUserId() {
		return this.userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPasscode() {
		return this.userPasscode;
	}

	public void setUserPasscode(String userPasscode) {
		this.userPasscode = userPasscode;
	}

	public String getUserAddress() {
		return this.userAddress;
	}

	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}

	public String getPhone() {
		return this.phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAvatar() {
		return this.avatar;
	}

	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}

	public String getUserName() {
		return this.userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getCredit() {
		return this.credit;
	}

	public void setCredit(String credit) {
		this.credit = credit;
	}

	public String getLevel() {
		return this.level;
	}

	public void setLevel(String level) {
		this.level = level;
	}

	public Set<UserReservation> getUserReservations() {
		return this.userReservations;
	}

	public void setUserReservations(Set<UserReservation> userReservations) {
		this.userReservations = userReservations;
	}

	public Set<UserOrder> getUserOrders() {
		return this.userOrders;
	}

	public void setUserOrders(Set<UserOrder> userOrders) {
		this.userOrders = userOrders;
	}

}