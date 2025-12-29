<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>
        <title>${not empty post.metaTitle ? post.metaTitle : post.title}</title>
    </title>
    <link rel="stylesheet" href="assets/css/main.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css" integrity="sha512-2SwdPD6INVrV/lHTZbO2nodKhrnDdJK9/kg2XD1r9uGqPo1cUbujc+IYdlYdEErWNu69gVcYgdxlmVmzTWnetw==" crossorigin="anonymous" referrerpolicy="no-referrer" />    
</head>
<body>
<jsp:include page="common/header.jsp"></jsp:include>
<main class="main-content">
    <div class="container">

        <div class="blog-detail-layout">
        <%-- search + bar = rêcnt--%>
            <jsp:include page="common/blog-sidebar.jsp"></jsp:include>

            <article class="blog-post-content">

                <h1><c:out value="${post.title}" /></h1>

                <div class="post-meta">
                    <span>Tác giả: <b>Admin</b></span>
                    <span>Ngày đăng: <b>${postDate}</b></span>
                    <span>
                        Danh mục:
                        <b>
                            <c:out value="${not empty postCategory ? postCategory.name : 'Chưa phân loại'}" />
                        </b>
                    </span>
                    <span>Lượt xem: <b>${post.viewsCount}</b></span>
                </div>

                <div class="post-featured-image">
                    <img src="${post.featuredImage}"
                         alt="<c:out value='${post.title}'/>">
                </div>

                <div class="post-body">
                    <c:if test="${not empty post.excerpt}">
                        <p><i><c:out value="${post.excerpt}" /></i></p>
                    </c:if>

                    <c:out value="${post.content}" escapeXml="false"/>
                </div>

                <div id="comments" class="blog-comments-section">
                    <h2 class="comments-title">Bình luận (${commentsCount})</h2>

                    <c:if test="${not empty commentError}">
                        <p style="color:#c00; margin:10px 0;">${commentError}</p>
                    </c:if>

                    <div class="comment-form">
                        <form action="${pageContext.request.contextPath}/chi-tiet-blog" method="post">
                            <input type="hidden" name="slug" value="${post.slug}">

                            <div class="form-field">
                                <label for="comment_text">Để lại bình luận của bạn:</label>
                                <textarea id="comment_text" name="comment_text" rows="4"
                                          placeholder="Viết bình luận của bạn ở đây..."></textarea>
                            </div>
                            <button type="submit" class="cta-button">Gửi bình luận</button>
                        </form>
                    </div>

                    <div class="comment-list">
                        <c:if test="${empty comments}">
                            <p>Chưa có bình luận nào.</p>
                        </c:if>

                        <c:forEach var="cm" items="${comments}">
                            <div class="comment-item">
                                <div class="comment-avatar">
                                    <img src="https://placehold.co/60x60/eeeeee/white?text=User" alt="Avatar">
                                </div>
                                <div class="comment-content">
                                    <div class="comment-author">User ${cm.userId}</div>
                                    <div class="comment-meta">${commentDateMap[cm.id]}</div>
                                    <p class="comment-body">
                                        <c:out value="${cm.commentText}"/>
                                    </p>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>

            </article>

 </div> </div> </main>
<jsp:include page="common/footer.jsp"></jsp:include>
<button id="backToTop" class="back-to-top" title="Lên đầu trang">
    <i class="fa-solid fa-chevron-up"></i>
</button>

</body>
</html>