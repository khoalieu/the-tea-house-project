<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trà Thảo Mộc & Trà Sữa DIY</title>
    <link rel="stylesheet" href="assets/css/main.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css" integrity="sha512-2SwdPD6INVrV/lHTZbO2nodKhrnDdJK9/kg2XD1r9uGqPo1cUbujc+IYdlYdEErWNu69gVcYgdxlmVmzTWnetw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
<jsp:include page="common/header.jsp"></jsp:include>
<main class="main-content">
    <section class="page-header">
        <div class="container">
            <h1>Công Thức & Blog</h1>
            <p>Khám phá các bí kíp pha chế và kiến thức về trà</p>
        </div>
    </section>

    <section class="blog-page-content">
        <div class="container">
            <div class="blog-detail-layout">
                <aside class="blog-sidebar">

                    <div class="sidebar-widget">
                        <h3>Tìm Kiếm Bài Viết</h3>
                        <input type="text" placeholder="Nhập từ khóa..." style="width: 100%; padding: 10px;">
                    </div>

                    <div class="sidebar-widget">
                        <h3>Danh Mục</h3>
                        <ul class="sidebar-list">
                            <li><a href="#">Công Thức Pha Chế (5)</a></li>
                            <li><a href="#">Kiến Thức Về Trà (3)</a></li>
                            <li><a href="#">Nguyên Liệu Mới (2)</a></li>
                        </ul>
                    </div>

                    <div class="sidebar-widget">
                        <h3>Bài Viết Mới Nhất</h3>

                        <div class="recent-post">
                            <img src="https://placehold.co/70x70/ffb74d/white" alt="thumb">
                            <div class="recent-post-info">
                                <a href="#">Cách tự làm trân châu đen tại nhà</a>
                                <span>10/11/2025</span>
                            </div>
                        </div>

                        <div class="recent-post">
                            <img src="https://placehold.co/70x70/cddc39/white" alt="thumb">
                            <div class="recent-post-info">
                                <a href="#">Phân biệt Hồng Trà và Lục Trà</a>
                                <span>09/11/2025</span>
                            </div>
                        </div>
                    </div>

                </aside>
                <div class="blog-post-content">
                    <div class="blog-grid">
                        <div class="blog-card">
                            <img src="assets/images/loi-ich-tra-hoa-cuc.jpg" alt="">
                            <h3>5 Lợi Ích Bất Ngờ Của Trà Hoa Cúc</h3>
                            <div class ="blog-card-meta">
                                <span class="meta-item">
                                    <i class="fa-solid fa-eye"></i>
                                    <span>1.234 Lượt xem</span>
                                </span>
                                <span class="meta-item">
                                    <i class="fa-solid fa-calendar"></i>
                                    <span>11/11/2025</span>
                                </span>
                                <span class="meta-item">
                                    <i class="fa-solid fa-user"></i>
                                    <span>Admin</span>
                                </span>
                            </div>
                            <p>Trà hoa cúc không chỉ là một thức uống thơm ngon, thư giãn mà còn mang lại vô vàn lợi ích
                                cho sức khỏe, đặc biệt là cải thiện giấc ngủ...</p>

                            <a href="chi-tiet-blog-mau.jsp">Đọc Thêm</a>
                        </div>
                        <div class="blog-card">
                            <img src="assets/images/loi-ich-tra-hoa-cuc.jpg" alt="">
                            <h3>5 Lợi Ích Bất Ngờ Của Trà Hoa Cúc</h3>
                            <div class ="blog-card-meta">
                                <span class="meta-item">
                                    <i class="fa-solid fa-eye"></i>
                                    <span>1.234 Lượt xem</span>
                                </span>
                                <span class="meta-item">
                                    <i class="fa-solid fa-calendar"></i>
                                    <span>11/11/2025</span>
                                </span>
                                <span class="meta-item">
                                    <i class="fa-solid fa-user"></i>
                                    <span>Admin</span>
                                </span>
                            </div>
                            <p>Trà hoa cúc không chỉ là một thức uống thơm ngon, thư giãn mà còn mang lại vô vàn lợi ích
                                cho sức khỏe, đặc biệt là cải thiện giấc ngủ...</p>

                            <a href="chi-tiet-blog-mau.jsp">Đọc Thêm</a>
                        </div>
                        <div class="blog-card">
                            <img src="assets/images/loi-ich-tra-hoa-cuc.jpg" alt="">
                            <h3>5 Lợi Ích Bất Ngờ Của Trà Hoa Cúc</h3>
                            <div class ="blog-card-meta">
                                <span class="meta-item">
                                    <i class="fa-solid fa-eye"></i>
                                    <span>1.234 Lượt xem</span>
                                </span>
                                <span class="meta-item">
                                    <i class="fa-solid fa-calendar"></i>
                                    <span>11/11/2025</span>
                                </span>
                                <span class="meta-item">
                                    <i class="fa-solid fa-user"></i>
                                    <span>Admin</span>
                                </span>
                            </div>
                            <p>Trà hoa cúc không chỉ là một thức uống thơm ngon, thư giãn mà còn mang lại vô vàn lợi ích
                                cho sức khỏe, đặc biệt là cải thiện giấc ngủ...</p>

                            <a href="chi-tiet-blog-mau.jsp">Đọc Thêm</a>
                        </div>
                        <div class="blog-card">
                            <img src="assets/images/loi-ich-tra-hoa-cuc.jpg" alt="">
                            <h3>5 Lợi Ích Bất Ngờ Của Trà Hoa Cúc</h3>
                            <div class ="blog-card-meta">
                                <span class="meta-item">
                                    <i class="fa-solid fa-eye"></i>
                                    <span>1.234 Lượt xem</span>
                                </span>
                                <span class="meta-item">
                                    <i class="fa-solid fa-calendar"></i>
                                    <span>11/11/2025</span>
                                </span>
                                <span class="meta-item">
                                    <i class="fa-solid fa-user"></i>
                                    <span>Admin</span>
                                </span>
                            </div>
                            <p>Trà hoa cúc không chỉ là một thức uống thơm ngon, thư giãn mà còn mang lại vô vàn lợi ích
                                cho sức khỏe, đặc biệt là cải thiện giấc ngủ...</p>

                            <a href="chi-tiet-blog-mau.jsp">Đọc Thêm</a>
                        </div>
                        <div class="blog-card">
                            <img src="assets/images/loi-ich-tra-hoa-cuc.jpg" alt="">
                            <h3>5 Lợi Ích Bất Ngờ Của Trà Hoa Cúc</h3>
                            <div class ="blog-card-meta">
                                <span class="meta-item">
                                    <i class="fa-solid fa-eye"></i>
                                    <span>1.234 Lượt xem</span>
                                </span>
                                <span class="meta-item">
                                    <i class="fa-solid fa-calendar"></i>
                                    <span>11/11/2025</span>
                                </span>
                                <span class="meta-item">
                                    <i class="fa-solid fa-user"></i>
                                    <span>Admin</span>
                                </span>
                            </div>
                            <p>Trà hoa cúc không chỉ là một thức uống thơm ngon, thư giãn mà còn mang lại vô vàn lợi ích
                                cho sức khỏe, đặc biệt là cải thiện giấc ngủ...</p>

                            <a href="chi-tiet-blog-mau.jsp">Đọc Thêm</a>
                        </div>
                        <div class="blog-card">
                            <img src="assets/images/loi-ich-tra-hoa-cuc.jpg" alt="">
                            <h3>5 Lợi Ích Bất Ngờ Của Trà Hoa Cúc</h3>
                            <div class ="blog-card-meta">
                                <span class="meta-item">
                                    <i class="fa-solid fa-eye"></i>
                                    <span>1.234 Lượt xem</span>
                                </span>
                                <span class="meta-item">
                                    <i class="fa-solid fa-calendar"></i>
                                    <span>11/11/2025</span>
                                </span>
                                <span class="meta-item">
                                    <i class="fa-solid fa-user"></i>
                                    <span>Admin</span>
                                </span>
                            </div>
                            <p>Trà hoa cúc không chỉ là một thức uống thơm ngon, thư giãn mà còn mang lại vô vàn lợi ích
                                cho sức khỏe, đặc biệt là cải thiện giấc ngủ...</p>

                            <a href="chi-tiet-blog-mau.jsp">Đọc Thêm</a>
                        </div>
                    </div>
                </div>

            </div>
            <div class="pagination">
                <a href="#" class="active">1</a>
                <a href="#">2</a>
                <a href="#">3</a>
                <a href="#">&raquo;</a>
            </div>
        </div>
    </section>
</main>
<jsp:include page="common/footer.jsp"></jsp:include>
<button id="backToTop" class="back-to-top" title="Lên đầu trang">
    <i class="fa-solid fa-chevron-up"></i>
</button>
</body>
</html>