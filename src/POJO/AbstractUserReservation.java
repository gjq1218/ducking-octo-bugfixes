package POJO;

/**
 * AbstractUserReservation entity provides the base persistence definition of
 * the UserReservation entity. @author MyEclipse Persistence Tools
 */

public abstract class AbstractUserReservation implements java.io.Serializable {

	// Fields

	private UserReservationId id;

	// Constructors

	/** default constructor */
	public AbstractUserReservation() {
	}

	/** full constructor */
	public AbstractUserReservation(UserReservationId id) {
		this.id = id;
	}

	// Property accessors

	public UserReservationId getId() {
		return this.id;
	}

	public void setId(UserReservationId id) {
		this.id = id;
	}

}