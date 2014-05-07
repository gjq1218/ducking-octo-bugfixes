package POJO;

/**
 * AbstractUserReservationId entity provides the base persistence definition of
 * the UserReservationId entity. @author MyEclipse Persistence Tools
 */

public abstract class AbstractUserReservationId implements java.io.Serializable {

	// Fields

	private User user;
	private Reservation reservation;

	// Constructors

	/** default constructor */
	public AbstractUserReservationId() {
	}

	/** full constructor */
	public AbstractUserReservationId(User user, Reservation reservation) {
		this.user = user;
		this.reservation = reservation;
	}

	// Property accessors

	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Reservation getReservation() {
		return this.reservation;
	}

	public void setReservation(Reservation reservation) {
		this.reservation = reservation;
	}

	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof AbstractUserReservationId))
			return false;
		AbstractUserReservationId castOther = (AbstractUserReservationId) other;

		return ((this.getUser() == castOther.getUser()) || (this.getUser() != null
				&& castOther.getUser() != null && this.getUser().equals(
				castOther.getUser())))
				&& ((this.getReservation() == castOther.getReservation()) || (this
						.getReservation() != null
						&& castOther.getReservation() != null && this
						.getReservation().equals(castOther.getReservation())));
	}

	public int hashCode() {
		int result = 17;

		result = 37 * result
				+ (getUser() == null ? 0 : this.getUser().hashCode());
		result = 37
				* result
				+ (getReservation() == null ? 0 : this.getReservation()
						.hashCode());
		return result;
	}

}