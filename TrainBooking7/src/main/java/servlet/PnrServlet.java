package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;

import dao.PnrDao;

/**
 * Servlet implementation class PnrServlet
 */
@WebServlet("/PnrServlet")
public class PnrServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PnrServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    static String GeneratePnrNumber() {
		String characters="1234567890";
		Random r=new Random();
		StringBuilder pnr=new StringBuilder();
		boolean exists=false;
		
		
		while(true)
		{

			for(int i=0;i<10;i++)
			{
				pnr.append(characters.charAt(r.nextInt(characters.length())));			
			}
			
			PnrDao pd = new PnrDao();
			exists=pd.checkIfExists(pnr.toString());
			
			if(!exists)
			{
				break;
			}
		}
		return pnr.toString();
		
    }
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String pnr = GeneratePnrNumber();
		PrintWriter out = response.getWriter();
		out.print(pnr);
		
	}
	

}
