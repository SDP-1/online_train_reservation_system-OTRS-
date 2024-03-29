package servlet;

import java.io.BufferedReader;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.LogInUser;
import model.TicketDetails;

/**
 * Servlet implementation class showTicketDetailsAndPaymentServlet
 */
@WebServlet("/showTicketDetailsAndPaymentServlet")
public class showTicketDetailsAndPaymentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public showTicketDetailsAndPaymentServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {
	    // Retrieve values from the form
	    int trainNumber = Integer.parseInt(request.getParameter("train_number"));
	    String startPoint = request.getParameter("start_point");
	    String endPoint = request.getParameter("end_point");
	    String reservationDate = request.getParameter("reservation_date");
	    int passengerCount = Integer.parseInt(request.getParameter("passenger_count"));

	    // Check if the user is logged in
	    if (LogInUser.getUserId() > 0) {
	        TicketDetails ticketDetails = new TicketDetails(trainNumber, startPoint, endPoint, reservationDate, passengerCount);
	        request.setAttribute("ticketDetails", ticketDetails);
	        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/views/showTicketDetailsAndPayment.jsp");
	        dispatcher.forward(request, response);
	    } else {
	        // User is not logged in, set a message attribute
	        request.setAttribute("loginMessage", "Please log in to the website.");

	        // Redirect to the login page
	        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/login.jsp");
	        dispatcher.forward(request, response);
	    }
	}


}
