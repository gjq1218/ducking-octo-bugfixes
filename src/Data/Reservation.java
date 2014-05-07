package Data;

import java.sql.Timestamp;
import java.util.Set;

/**
 * Reservation entity. @author MyEclipse Persistence Tools
 */
public class Reservation extends AbstractReservation implements
		java.io.Serializable {

	// Constructors

	/** default constructor */
	public Reservation() {
	}

	/** minimal constructor */
	public Reservation(String reservationId, Shop shop, Timestamp time,
			String peoplenumber) {
		super(reservationId, shop, time, peoplenumber);
	}

	/** full constructor */
	public Reservation(String reservationId, Shop shop, Timestamp time,
			String peoplenumber, Set userReservations) {
		super(reservationId, shop, time, peoplenumber, userReservations);
	}

}
