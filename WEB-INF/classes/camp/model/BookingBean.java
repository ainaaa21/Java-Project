package camp.model;

import java.sql.Date;

public class BookingBean {
	private int bookId;
	private Date checkIn;
	private Date checkOut;
	private String addOn;
	private int custId;
	private String campType;
	private double campPrice;

	public BookingBean() {
	}

	public int getBookId() {
		return bookId;
	}

	public void setBookId(int bookId) {
		this.bookId = bookId;
	}

	public Date getCheckIn() {
		return checkIn;
	}

	public void setCheckIn(Date checkIn) {
		this.checkIn = checkIn;
	}

	public Date getCheckOut() {
		return checkOut;
	}

	public void setCheckOut(Date checkOut) {
		this.checkOut = checkOut;
	}

	public String getAddOn() {
		return addOn;
	}

	public void setAddOn(String addOn) {
		this.addOn = addOn;
	}

	public int getCustId() {
		return custId;
	}

	public void setCustId(int custId) {
		this.custId = custId;
	}

	public String getCampType() {
		return campType;
	}

	public void setCampType(String campType) {
		this.campType = campType;
	}

	public double getCampPrice() {
		return campPrice;
	}

	public void setCampPrice(double campPrice) {
		this.campPrice = campPrice;
	}
}
