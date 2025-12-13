<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chi Tiết Blog - 5 Lợi Ích Của Trà Hoa Cúc</title>
    <link rel="stylesheet" href="assets/css/main.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css" integrity="sha512-2SwdPD6INVrV/lHTZbO2nodKhrnDdJK9/kg2XD1r9uGqPo1cUbujc+IYdlYdEErWNu69gVcYgdxlmVmzTWnetw==" crossorigin="anonymous" referrerpolicy="no-referrer" />    
</head>
<body>
<jsp:include page="common/header.jsp"></jsp:include>
<main class="main-content">
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
            <article class="blog-post-content">

                <h1>5 Lợi Ích Bất Ngờ Của Trà Hoa Cúc Bạn Cần Biết</h1>

                <div class="post-meta">
                    <span>Tác giả: **Admin**</span>
                    <span>Ngày đăng: **11/11/2025**</span>
                    <span>Danh mục: <a href="#">**Kiến Thức Về Trà**</a></span>
                </div>

                <div class="post-featured-image">
                    <img src="assets/images/loi-ich-tra-hoa-cuc.jpg" alt="5 Lợi Ích Của Trà Hoa Cúc">
                </div>

                <div class="post-body">
                    <p>Trà hoa cúc không chỉ là một thức uống thơm ngon, thư giãn mà còn mang lại vô vàn lợi ích cho sức khỏe. (Đây là đoạn trích - excerpt)</p>

                    <p>Từ hàng ngàn năm, hoa cúc đã được sử dụng trong y học cổ truyền như một "thần dược" tự nhiên. Trà hoa cúc mang lại nhiều lợi ích sức khỏe, bao gồm giúp ngủ ngon và giảm căng thẳng, hỗ trợ tiêu hóa, cải thiện sức khỏe tim mạch, có tác dụng thanh nhiệt giải độc cơ thể, và giúp giảm các triệu chứng cảm lạnh. </p>

                    <h2>1. Giúp ngủ ngon và giảm căng thẳng</h2>
                    <p>Đây là lợi ích nổi tiếng nhất. Trà hoa cúc chứa apigenin, một chất chống oxy hóa có tác dụng làm dịu thần kinh, giúp bạn thư giãn và dễ dàng đi vào giấc ngủ sâu hơn.</p>

                    <h2>2. Hỗ trợ tiêu hóa</h2>
                    <p>Giúp làm dịu các vấn đề về tiêu hóa như đầy hơi, khó tiêu, đau bụng và buồn nôn. Trà cũng hỗ trợ nhu động ruột và có thể kháng khuẩn để ngăn chặn vi khuẩn có hại phát triển.</p>

                    <h2>3. Cải thiện sức khỏe tim mạch</h2>
                    <p>Các flavonoid trong trà hoa cúc có thể giúp giảm huyết áp, giảm cholesterol xấu (LDL) và triglyceride, từ đó giảm nguy cơ mắc bệnh tim mạch.</p>

                    <h2>4. Thanh nhiệt và giải độc cơ thể</h2>
                    <p>Trà hoa cúc có tác dụng làm mát gan và thải độc, giúp thanh nhiệt, nhuận gan, hỗ trợ điều trị mụn nhọt và mẩn ngứa do nóng trong người.</p>
                    <blockquote>
                        "Đây là một khối trích dẫn (blockquote) để làm nổi bật một câu nói hay hoặc một lưu ý quan trọng."
                    </blockquote>

                    <h2>5. Giảm triệu chứng cảm lạnh</h2>
                    <p>Trà hoa cúc giúp giảm các triệu chứng của cảm lạnh như đau đầu, nghẹt mũi và ho. Nó cũng giúp tăng cường hệ miễn dịch nhờ chứa các vitamin và khoáng chất có lợi.</p>
                </div>

                <div class="blog-comments-section">
                    <h2 class="comments-title">Bình luận (3)</h2>

                    <div class="comment-form">
                        <form action="/submit-comment" method="post">
                            <input type="hidden" name="post_id" value="[ID_bai_viet_nay]">

                            <div class="form-field">
                                <label for="comment_text">Để lại bình luận của bạn:</label>
                                <textarea id="comment_text" name="comment_text" rows="4"
                                          placeholder="Viết bình luận của bạn ở đây..."></textarea>
                            </div>
                            <button type="submit" class="cta-button">Gửi bình luận</button>
                        </form>
                    </div>

                    <div class="comment-list">

                        <div class="comment-item">
                            <div class="comment-avatar">
                                <img src="https://placehold.co/60x60/eeeeee/white?text=User" alt="Avatar">
                            </div>
                            <div class="comment-content">
                                <div class="comment-author">Nguyễn Văn A</div>
                                <div class="comment-meta">11/11/2025 lúc 10:30</div>
                                <p class="comment-body">
                                    Bài viết rất hay! Cảm ơn bạn đã chia sẻ thông tin hữu ích về trà hoa cúc.
                                </p>
                            </div>
                        </div>

                        <div class="comment-item">
                            <div class="comment-avatar">
                                <img src="https://placehold.co/60x60/eeeeee/white?text=User" alt="Avatar">
                            </div>
                            <div class="comment-content">
                                <div class="comment-author">Trần Thị B</div>
                                <div class="comment-meta">10/11/2025 lúc 15:00</div>
                                <p class="comment-body">
                                    Mình uống trà này mỗi tối và ngủ ngon hơn hẳn.
                                </p>
                            </div>
                        </div>

                    </div> </div> </article>

            </article>

 </div> </div> </main>
<jsp:include page="common/footer.jsp"></jsp:include>
<button id="backToTop" class="back-to-top" title="Lên đầu trang">
    <i class="fa-solid fa-chevron-up"></i>
</button>

</body>
</html>