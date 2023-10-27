package servlet;

import java.io.IOException;

import dao.CitiesDao;
import entity.RouteResult;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CityServlet
 */
@WebServlet("/")
public class RouteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public RouteServlet() {
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
		RouteResult result;
		CitiesDao cd = new CitiesDao();
		result = cd.getAllCities();
		request.setAttribute("result", result);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/booking.jsp");
		dispatcher.forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
//		doGet(request, response);
		RouteResult result;
		CitiesDao cd = new CitiesDao();
		result = cd.getAllCities();
		request.setAttribute("result", result);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/booking.jsp");
		dispatcher.forward(request, response);
	}

}
