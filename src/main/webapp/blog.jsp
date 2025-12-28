<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
                        <form action="blog" method="get">
                            <input type="text" name="q" value="${param.q}"
                                   placeholder="Nhập từ khóa..." style="width: 100%; padding: 10px;">
                        </form>
                    </div>

                    <div class="sidebar-widget">
                        <h3>Danh Mục</h3>
                        <ul class="sidebar-list">
                            <li>
                                <a href="blog" class="${mode == 'all' ? 'active' : ''}">Tất Cả</a>
                            </li>

                            <c:forEach var="c" items="${categories}">
                                <li>
                                    <a href="blog?cat=${c.slug}" class="${c.slug == cat ? 'active' : ''}">
                                            ${c.name} (<c:out value="${categoryCountMap[c.id]}" default="0"/>)
                                    </a>
                                </li>
                            </c:forEach>

                        </ul>
                    </div>

                    <div class="sidebar-widget">
                        <h3>Bài Viết Mới Nhất</h3>
                        <c:forEach var="r" items="${recentPosts}">
                            <div class="recent-post">
                                <img src="${r.featuredImage}" alt="thumb">
                                <div class="recent-post-info">
                                    <a href="blog-detail?slug=${r.slug}">${r.title}</a>
                                    <span>${recent[r.id]}</span>
                                </div>
                            </div>
                        </c:forEach>
                    </div>

                </aside>
                <div class="blog-post-content">
                    <div class="blog-grid">

                        <c:if test="${empty blogs}">
                            <p style="text-align:center; width:100%;">${emptyMessage}</p>
                        </c:if>


                        <c:forEach var="b" items="${blogs}">
                            <div class="blog-card">
                                <img src="${empty b.featuredImage ? 'https://placehold.co/600x400' : b.featuredImage}" alt=""/>
                                <h3>${b.title}</h3>

                                <div class="blog-card-meta">
                                    <span class="meta-item">
                                        <i class="fa-solid fa-eye"></i>
                                        <span>${b.viewsCount} Lượt xem</span>
                                    </span>

                                    <span class="meta-item">
                                        <i class="fa-solid fa-calendar"></i>
                                        <span>${dateMap[b.id]}</span>
                                    </span>

                                    <span class="meta-item">
                                        <i class="fa-solid fa-user"></i>
                                        <span>Admin</span>
                                    </span>
                                </div>
                                <p>${empty b.excerpt ? '(Chưa có mô tả)' : b.excerpt}</p>

                                <a href="${pageContext.request.contextPath}/blog-detail?slug=${b.slug}">Đọc Thêm</a>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>

            <c:if test="${totalPages > 1}">
                <div class="pagination">
                    <c:forEach begin="1" end="${totalPages}" var="i">

                        <c:choose>
                            <c:when test="${mode == 'search'}">
                                <a href="blog?page=${i}&q=${q}" class="${currentPage == i ? 'active' : ''}">${i}</a>
                            </c:when>

                            <c:when test="${mode == 'cat'}">
                                <a href="blog?page=${i}&cat=${cat}" class="${currentPage == i ? 'active' : ''}">${i}</a>
                            </c:when>

                            <c:otherwise>
                                <a href="blog?page=${i}" class="${currentPage == i ? 'active' : ''}">${i}</a>
                            </c:otherwise>
                        </c:choose>

                    </c:forEach>
                </div>
            </c:if>

        </div>
    </section>
</main>
<jsp:include page="common/footer.jsp"></jsp:include>
<button id="backToTop" class="back-to-top" title="Lên đầu trang">
    <i class="fa-solid fa-chevron-up"></i>
</button>
</body>
</html>