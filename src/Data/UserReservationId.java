package Data;

/**
 * UserReservationId entity. @author MyEclipse Persistence Tools
 */
public class UserReservationId extends AbstractUserReservationId implements
		java.io.Serializable {

	// Constructors

	/** default constructor */
	public UserReservationId() {
	}

	/** full constructor */
	public UserReservationId(User user, Reservation reservation) {
		super(user, reservation);
	}

}
