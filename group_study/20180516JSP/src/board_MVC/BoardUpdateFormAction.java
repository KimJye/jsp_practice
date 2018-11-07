package board_MVC;


import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BoardUpdateFormAction implements Action{
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		String url ="/20180516JSP/boardUpdate.jsp";

		String num = request.getParameter("num");

		BoardDAO bDao = BoardDAO.getInstance();

		bDao.updateReadCount(num);

		BoardVO bvo = bDao.selectOneBoardByNum(num);

		request.setAttribute("board",bvo);

		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request,response);
	}
}
