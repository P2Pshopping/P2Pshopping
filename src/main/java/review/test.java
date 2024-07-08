//@WebServlet("/review/list")
//public class ReviewListServlet extends HttpServlet {
//    private static final long serialVersionUID = 1L;
//
//    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        int pageSize = 9; // 한 페이지에 보여줄 리뷰 수
//        int currentPage = 1; // 기본 페이지 번호
//        String pageParam = request.getParameter("page");
//
//        if (pageParam != null && !pageParam.isEmpty()) {
//            currentPage = Integer.parseInt(pageParam);
//        }
//
//        int start = (currentPage - 1) * pageSize + 1;
//        int end = currentPage * pageSize;
//
//        ReviewDAO2 dao = new ReviewDAO2();
//        int totalReviews = dao.getReviewCount();
//        List<ReviewDTO> reviews = dao.selectReviews(start, end);
//
//        List<ReviewDTO> likePosts = dao.get3likes();
//        System.out.println("Popular posts: " + likePosts);
//
//        dao.close();
//
//        int totalPages = (int) Math.ceil((double) totalReviews / pageSize);
//
//        System.out.println("totalReviews: " + totalReviews);
//        System.out.println("totalPages: " + totalPages);
//        System.out.println("currentPage: " + currentPage);
//
//        request.setAttribute("reviews", reviews);
//        request.setAttribute("totalPages", totalPages);
//        request.setAttribute("currentPage", currentPage);
//        request.setAttribute("likePosts", likePosts); // 인기글 리스트 설정
//
//        // JSP에 전달하기 전에 리스트 크기 로그 출력
//        System.out.println("Number of likePosts: " + likePosts.size());
//
//        request.getRequestDispatcher("../Board/reviewList.jsp").forward(request, response);
//    }
//}
