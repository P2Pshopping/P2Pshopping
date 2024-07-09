package itemList;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/itemList/image")
public class ImageServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String sfile = req.getParameter("sfile");
        String sDirectory = req.getServletContext().getRealPath("");
//        String sDirectory = req.getServletContext().getRealPath("/uploads");

        // ����� �α� �߰�
        System.out.println("Requested file: " + sfile);
        System.out.println("Directory: " + sDirectory);

        File file = new File(sDirectory, sfile);
        
        // ���� ���� ���� Ȯ�� �α�
        if (file.exists()) {
            System.out.println("File exists: " + file.getAbsolutePath());
            resp.setContentType(getServletContext().getMimeType(file.getName()));
            resp.setContentLength((int) file.length());

            try (FileInputStream in = new FileInputStream(file); 
                 OutputStream out = resp.getOutputStream()) {
                byte[] buffer = new byte[1024];
                int bytesRead;
                while ((bytesRead = in.read(buffer)) != -1) {
                    out.write(buffer, 0, bytesRead);
                }
            }
        } else {
            System.out.println("File not found: " + file.getAbsolutePath());
            resp.sendError(HttpServletResponse.SC_NOT_FOUND);
        }
    }
}


