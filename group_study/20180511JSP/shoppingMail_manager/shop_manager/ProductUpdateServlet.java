package shop_manager;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class ProductUpdateServlet
 */
@WebServlet("/productUpdate.do")
public class ProductUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String code = request.getParameter("code");

		ProductDAO pDao = ProductDAO.getInstance();
		ProductVO pVO= pDao.selectProductByCode(code);

		request.setAttribute("product",pVO);

		RequestDispatcher dispatcher = request.getRequestDispatcher("20180511JSP/productUpdate.jsp");
		dispatcher.forward(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");

		ServletContext context = getServletContext();
		String path = context.getRealPath("upload");
		String encType = "UTF-8";
		int sizeLimit = 20 * 1024 * 1024;

		MultipartRequest multi = new MultipartRequest(request, path, sizeLimit, encType, new DefaultFileRenamePolicy());

		String code = multi.getParameter("code");
		String name = multi.getParameter("name");
		int price = Integer.parseInt(multi.getParameter("price"));
		String description = multi.getParameter("description");
		String pictureUrl = multi.getFilesystemName("pictureUrl");

		if(pictureUrl==null) {
			pictureUrl=multi.getParameter("nonmakeImg");
		}

		ProductVO pVO = new ProductVO();
		pVO.setCode(Integer.parseInt(code));
		pVO.setName(name);
		pVO.setPrice(price);
		pVO.setDescription(description);
		pVO.setPictureUrl(pictureUrl);

		ProductDAO pDao = ProductDAO.getInstance();
		pDao.updateProduct(pVO);

		response.sendRedirect("productList.do");
	}

}
