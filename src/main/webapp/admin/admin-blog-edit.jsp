<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Chỉnh Sửa Bài Viết</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/admin.css">
</head>
<body>
<div class="admin-container">
    <jsp:include page="common/admin-sidebar.jsp"/>

    <div class="admin-main">
        <h1>Chỉnh Sửa Bài Viết</h1>

        <c:if test="${not empty errorMessage}">
            <div class="alert alert-danger">${errorMessage}</div>
        </c:if>

        <form action="${pageContext.request.contextPath}/admin/edit-blog" method="post">
            <input type="hidden" name="id" value="${post.id}">

            <div class="form-group">
                <label>Tiêu đề *</label>
                <input type="text" name="title" value="${post.title}" required>
            </div>

            <div class="form-group">
                <label>Slug *</label>
                <input type="text" name="slug" value="${post.slug}" required>
            </div>

            <div class="form-group">
                <label>Mô tả ngắn</label>
                <textarea name="excerpt" rows="3">${post.excerpt}</textarea>
            </div>

            <div class="form-group">
                <label>Nội dung</label>
                <textarea name="content" rows="10">${post.content}</textarea>
            </div>

            <div class="form-group">
                <label>Ảnh đại diện</label>
                <input type="text" name="featuredImage" value="${post.featuredImage}">
            </div>

            <div class="form-group">
                <label>Danh mục</label>
                <select name="categoryId">
                    <option value="">-- Không chọn --</option>
                    <c:forEach var="cat" items="${categories}">
                        <option value="${cat.id}" ${post.categoryId == cat.id ? 'selected' : ''}>${cat.name}</option>
                    </c:forEach>
                </select>
            </div>

            <div class="form-group">
                <label>Tác giả</label>
                <select name="authorId">
                    <option value="">-- Không chọn --</option>
                    <c:forEach var="author" items="${authors}">
                        <option value="${author.id}" ${post.authorId == author.id ? 'selected' : ''}>${author.username}</option>
                    </c:forEach>
                </select>
            </div>

            <div class="form-group">
                <label>Trạng thái</label>
                <select name="status">
                    <option value="draft" ${post.status == 'DRAFT' ? 'selected' : ''}>Nháp</option>
                    <option value="published" ${post.status == 'PUBLISHED' ? 'selected' : ''}>Xuất bản</option>
                    <option value="archived" ${post.status == 'ARCHIVED' ? 'selected' : ''}>Lưu trữ</option>
                </select>
            </div>

            <div class="form-group">
                <label>Meta Title</label>
                <input type="text" name="metaTitle" value="${post.metaTitle}">
            </div>

            <div class="form-group">
                <label>Meta Description</label>
                <textarea name="metaDescription" rows="2">${post.metaDescription}</textarea>
            </div>

            <div class="form-group">
                <label>Ngày tạo (Tùy chọn)</label>
                <input type="datetime-local" name="createdAt" value="${post.createdAt}">
            </div>

            <button type="submit" class="btn btn-primary">Cập nhật</button>
            <a href="${pageContext.request.contextPath}/admin/quan-ly-blog.jsp" class="btn btn-secondary">Hủy</a>
        </form>
    </div>
</div>
</body>
</html>
