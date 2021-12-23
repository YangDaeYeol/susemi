
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 * Servlet implementation class lectureTestServlet
 */
@WebServlet("/lectureEnroll.do")
@MultipartConfig(
		  fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
		  maxFileSize = 1024 * 1024 * 10,      // 10 MB
		  maxRequestSize = 1024 * 1024 * 100   // 100 MB
		)
public class lectureTestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private static final String CHARSET = "utf-8";
	private static final String ATTACHES_DIR = "C:\\attaches";
	

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public lectureTestServlet() {
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

		request.setCharacterEncoding("utf-8");
		String test1 = request.getParameter("test1");
		String test2 = request.getParameter("test2");
		String tutorComment = request.getParameter("tutorComment");
//		tutorComment
		response.getWriter().append("Served at: ").append(request.getContextPath());

		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding(CHARSET);
		PrintWriter out = response.getWriter();
		String contentType = request.getContentType();

		if (contentType != null && contentType.toLowerCase().startsWith("multipart/")) {
			// getParts()를 통해 Body에 넘어온 데이터들을 각각의 Part로 쪼개어 리턴
			Collection<Part> parts = request.getParts();

			for (Part part : parts) {
				System.out.printf("파라미터 명 : %s, contentType :  %s,  size : %d bytes \n", part.getName(),
						part.getContentType(), part.getSize());

				if (part.getHeader("Content-Disposition").contains("filename=")) {
					String fileName = extractFileName(part.getHeader("Content-Disposition"));

					if (part.getSize() > 0) {
						System.out.printf("업로드 파일 명 : %s  \n", fileName);
						part.write(ATTACHES_DIR + File.separator + fileName);
						part.delete();
					}
				} else {
					String formValue = request.getParameter(part.getName());
					System.out.printf("name : %s, value : %s  \n", part.getName(), formValue);
				}
			}

			out.println("<h1>업로드 완료</h1>");
		}
	}
	
	private String extractFileName(String partHeader) {
        for (String cd : partHeader.split(";")) {
            if (cd.trim().startsWith("filename")) {
                String fileName = cd.substring(cd.indexOf("=") +  1).trim().replace("\"", "");;
                int index = fileName.lastIndexOf(File.separator);
                return fileName.substring(index + 1);
            }
        }
        return null;
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
