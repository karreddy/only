package entity;

import java.sql.Date;

public class Booking {


	int id;
	String pnr;
	String fname;
	String lname;
	String phone;
	String from;
	String to;
	String from_date;
	String to_date;
	Date booking_date;
	int amount;
	
	
	public String getFrom_date() {
		return from_date;
	}

	public void setFrom_date(String from_date) {
		this.from_date = from_date;
	}

	public String getTo_date() {
		return to_date;
	}

	public void setTo_date(String to_date) {
		this.to_date = to_date;
	}


	public Date getBooking_date() {
		return booking_date;
	}

	public void setBooking_date(Date booking_date) {
		this.booking_date = booking_date;
	}

	public Booking() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Booking(String pnr, String fname, String lname, String phone, String from, String to,  Date booking_date, String from_date, String to_date,int amount) {
		
		this.from_date=from_date;
		this.to_date=to_date;
		this.booking_date=booking_date;
		this.pnr=pnr;
		this.fname = fname;
		this.lname = lname;
		this.phone = phone;
		this.from = from;
		this.to = to;
		this.amount = amount;
	}

	public String getPnr() {
		return pnr;
	}

	public void setPnr(String pnr) {
		this.pnr = pnr;
	}

	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	
	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	public String getLname() {
		return lname;
	}

	public void setLname(String lname) {
		this.lname = lname;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getFrom() {
		return from;
	}

	public void setFrom(String from) {
		this.from = from;
	}

	public String getTo() {
		return to;
	}

	public void setTo(String to) {
		this.to = to;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	
}
