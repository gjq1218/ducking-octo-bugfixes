package POJO;

import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;

/**
 * AbstractReservation entity provides the base persistence definition of the
 * Reservation entity. @author MyEclipse Persistence Tools
 */

public abstract class AbstractReservation implements java.io.Serializable {

	// Fields

	private String reservationId;
	private Shop shop;
	private Timestamp time;
	private String peoplenumber;
	private Set userReservations = new HashSet(0);

	// Constructors

	/** default constructor */
	public AbstractReservation() {
	}

	/** minimal constructor */
	public AbstractReservation(String reservationId, Shop shop, Timestamp time,
			String peoplenumber) {
		this.reservationId = reservationId;
		this.shop = shop;
		this.time = time;
		this.peoplenumber = peoplenumber;
	}

	/** full constructor */
	public AbstractReservation(String reservationId, Shop shop, Timestamp time,
			String peoplenumber, Set userReservations) {
		this.reservationId = reservationId;
		this.shop = shop;
		this.time = time;
		this.peoplenumber = peoplenumber;
		this.userReservations = userReservations;
	}

	// Property accessors

	public String getReservationId() {
		return this.reservationId;
	}

	public void setReservationId(String reservationId) {
		this.reservationId = reservationId;
	}

	public Shop getShop() {
		return this.shop;
	}

	public void setShop(Shop shop) {
		this.shop = shop;
	}

	public Timestamp getTime() {
		return this.time;
	}

	public void setTime(Timestamp time) {
		this.time = time;
	}

	public String getPeoplenumber() {
		return this.peoplenumber;
	}

	public void setPeoplenumber(String peoplenumber) {
		this.peoplenumber = peoplenumber;
	}

	public Set getUserReservations() {
		return this.userReservations;
	}

	public void setUserReservations(Set userReservations) {
		this.userReservations = userReservations;
	}

}