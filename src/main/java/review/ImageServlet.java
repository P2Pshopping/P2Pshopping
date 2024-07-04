package review;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

//@WebServlet("/images/*")
public class ImageServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String filename = request.getPathInfo().substring(1); // 요청 경로에서 파일명을 추출
        // 여기서는 /uploads 디렉토리를 경로에 포함하지 않음
        String uploadPath = getServletContext().getRealPath("/") + filename;
        File file = new File(uploadPath);

        // 디버그 메시지 추가
        System.out.println("Requested file: " + filename);
        System.out.println("Full file path: " + file.getAbsolutePath());

        if (file.exists()) {
            response.setContentType(getServletContext().getMimeType(file.getName()));
            response.setContentLength((int) file.length());

            try (FileInputStream in = new FileInputStream(file);
                 OutputStream out = response.getOutputStream()) {
                byte[] buffer = new byte[1024];
                int bytesRead;
                while ((bytesRead = in.read(buffer)) != -1) {
                    out.write(buffer, 0, bytesRead);
                }
            }
        } else {
            // 파일이 없을 때 디버그 메시지 추가
            System.out.println("File not found: " + file.getAbsolutePath());
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
        }
    }
}

