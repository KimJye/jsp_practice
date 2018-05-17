package board_MVC;


import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BoardCheckPassAction implements Action{
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		String url=null;
		String num=request.getParameter("num");
		String pass = request.getParameter("pass");

		BoardDAO bDao = BoardDAO.getInstance();
		BoardVO bvo = bDao.selectOneBoardByNum(num);

		if(bvo.getPass().equals(pass)) {
			url="/20180516JSP/checkSuccess.jsp";
		}else {
			url="/20180516JSP/boardCheckPass.jsp";
			request.setAttribute("message","비밀번호가 틀렸습니다.");
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request,response);
	}
}
