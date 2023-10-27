package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import dao.BookingDao;
import entity.Booking;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;
/**
 * Servlet implementation class BookingServlet
 */
@WebServlet("/BookingServlet")
public class BookingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public BookingServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=UTF-8");
		try (PrintWriter out = response.getWriter()) {
			/* TODO output your page here. You may use following sample code. */
			String pnr = request.getParameter("pnr");
			String fname = request.getParameter("fname");
			String lname = request.getParameter("lname");
			String phone = request.getParameter("phone");
			String from = request.getParameter("from");
			String to = request.getParameter("to");
			int amount = Integer.parseInt(request.getParameter("amount"));
			String from_date=request.getParameter("from_date");
			String to_date=request.getParameter("to_date");
	        Date today_date = new Date(System.currentTimeMillis());
			
			// Calling Dao Method
			Booking b = new Booking(pnr, fname, lname, phone, from, to, today_date, from_date, to_date, amount);

			BookingDao bd = new BookingDao();
			Boolean bool = bd.addBooking(b);
			
			if (bool == true) {
				out.print("success");
			} else {
				out.print("failure");
			}

		}
	}

}
