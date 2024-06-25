package sell;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Base64;
import java.util.UUID;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

//@WebServlet("/sellController.do")  // 주석 처리
public class SellController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        
        // 디버깅 메시지 추가
        System.out.println("SellController doPost 메서드 호출됨");

        String selectedCategory = request.getParameter("selectedCategory");
        String selectedSubcategory = request.getParameter("selectedSubcategory");
                String productName = request.getParameter("productName");
                String productDescription = request.getParameter("productDescription");
                String price = request.getParameter("price");
                String roadAddrPart1 = request.getParameter("roadAddrPart1");

                String photo1 = saveImage(request.getParameter("photo1"));
                String photo2 = saveImage(request.getParameter("photo2"));
                String photo3 = saveImage(request.getParameter("photo3"));
                String photo4 = saveImage(request.getParameter("photo4"));

                String name = (String) request.getSession().getAttribute("name");
                String email = (String) request.getSession().getAttribute("email");
                String phone = (String) request.getSession().getAttribute("phone");

                SellDAO sellDAO = new SellDAO();

                
                try {
                    int categoryId = sellDAO.getCategoryId(selectedCategory);
                    int subCategoryId = sellDAO.getSubcategoryId(selectedSubcategory);
                    int writerId = sellDAO.getUserId(email);

                    sellDAO.saveProduct(productName, categoryId, subCategoryId, Integer.parseInt(price), productDescription, photo1, photo2, photo3, photo4, writerId);

                    response.sendRedirect("../Mainpage.jsp");
                } catch (SQLException e) {
                    e.printStackTrace();
//                    response.sendRedirect("error.jsp");
                    response.sendRedirect(request.getContextPath() + "/error.jsp");  // 경로 수정
                }
    }
    
    private String saveImage(String base64Image) throws IOException {
        if (base64Image == null || base64Image.isEmpty()) {
        	 return "default_image.png"; // 기본 이미지 경로 설정
//            return null;
        }

        String uniqueFileName = UUID.randomUUID().toString() + ".png";
        String filePath = getServletContext().getRealPath("/") + "uploads/" + uniqueFileName;
        File file = new File(filePath);
        file.getParentFile().mkdirs();

        byte[] imageBytes = Base64.getDecoder().decode(base64Image.split(",")[1]);
        try (FileOutputStream fos = new FileOutputStream(file)) {
            fos.write(imageBytes);
        }

        return "uploads/" + uniqueFileName;
        
    }
}
    
  
    
  


