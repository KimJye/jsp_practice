package shop_manager;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/productDelete.do")
public class ProductDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String code = request.getParameter("code");

		ProductDAO pDao = ProductDAO.getInstance();
		ProductVO pVO = pDao.selectProductByCode(code);

		request.setAttribute("product", pVO);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/20180511JSP/productDelete.jsp");
		dispatcher.forward(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String code= request.getParameter("code");

		ProductDAO pDao = ProductDAO.getInstance();
		pDao.deleteProduct(code);

		response.sendRedirect("productList.do");
	}

}
