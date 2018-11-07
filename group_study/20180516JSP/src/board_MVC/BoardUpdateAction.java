package board_MVC;


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BoardUpdateAction implements Action{
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		BoardVO bvo = new BoardVO();
		bvo.setNum(Integer.parseInt(request.getParameter("num")));
		bvo.setName(request.getParameter("name"));
		bvo.setPass(request.getParameter("pass"));
		bvo.setEmail(request.getParameter("email"));
		bvo.setTitle(request.getParameter("title"));
		bvo.setContent(request.getParameter("content"));

		BoardDAO bDao = BoardDAO.getInstance();
		bDao.updateBoard(bvo);

		new BoardListAction().execute(request, response);
	}
}
