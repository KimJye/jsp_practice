package fileupload;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
@MultipartConfig
@WebServlet("/fileupload/upload.do")
public class UploadServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html; utf-8");
        response.setCharacterEncoding("utf-8");
        PrintWriter out = response.getWriter();

        String savePath = "upload";

        int uploadFileSizeLimit = 5 *1024 * 1024;
        String encType="UTF-8";

        ServletContext context = getServletContext();
        String uploadFilePath = context.getRealPath(savePath);
        System.out.println("서버상의 실제 디렉토리:");
        System.out.println(uploadFilePath);

        try {
        	MultipartRequest multi = new MultipartRequest(
        			request,
        			uploadFilePath,
        			uploadFileSizeLimit,
        			encType,
        			new DefaultFileRenamePolicy());
        	String fileName = multi.getFilesystemName("uploadFile");

        	if(fileName==null) {
        		System.out.print("파일 업로드 되지 않았음");
        	}else {
        		out.println("<br> 글쓴이 : "+multi.getParameter("name"));
        		out.println("<br>제  &nbsp; 목:"+multi.getParameter("title"));
        		out.println("<br> 파일명 : "+fileName);
        	}
        }catch(Exception e) {
        	System.out.print("예외 발생 :"+e);
        }
    }
}
