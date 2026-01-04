<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản lý Blog - Mộc Trà Admin</title>
    <link rel="stylesheet" href="../assets/css/base.css">
    <link rel="stylesheet" href="../assets/css/components.css">
    <link rel="stylesheet" href="assets/css/admin.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css">
</head>
<body>
<div class="admin-container">
    <!-- Sidebar -->
    <aside class="admin-sidebar">
        <div class="sidebar-header">
            <div class="admin-logo">
                <img src="../assets/images/logoweb.png" alt="Mộc Trà">
                <h2>Mộc Trà Admin</h2>
            </div>
        </div>

        <nav class="admin-nav">
            <ul>
                <li class="nav-item">
                    <a href="admin-dashboard.jsp">
                        <i class="fas fa-tachometer-alt"></i>
                        <span>Dashboard</span>
                    </a>
                </li>

                <li class="nav-item">
                    <a href="admin-products.jsp">
                        <i class="fas fa-box"></i>
                        <span>Tất cả Sản phẩm</span>
                    </a>
                </li>

                <li class="nav-item">
                    <a href="admin-banners.jsp">
                        <i class="fas fa-images"></i>
                        <span>Quản lý Banner</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="admin-categories.jsp">
                        <i class="fas fa-sitemap"></i>
                        <span>Danh mục Sản phẩm</span>
                    </a>
                </li>

                <li class="nav-item">
                    <a href="admin-orders.jsp">
                        <i class="fas fa-shopping-cart"></i>
                        <span>Đơn hàng</span>
                        <span class="badge">23</span>
                    </a>
                </li>

                <li class="nav-item">
                    <a href="admin-customers.jsp">
                        <i class="fas fa-users"></i>
                        <span>Khách hàng</span>
                    </a>
                </li>

                <li class="nav-item active">
                    <a href="${pageContext.request.contextPath}/admin/blog">
                        <i class="fas fa-newspaper"></i>
                        <span>Tất cả Bài viết</span>
                    </a>

                </li>
                <li class="nav-item">
                    <a href="admin-blog-categories.jsp">
                        <i class="fas fa-folder"></i>
                        <span>Danh mục Blog</span>
                    </a>
                </li>
            </ul>
        </nav>
    </aside>

    <!-- Main Content -->
    <main class="admin-main">
        <!-- Header -->
        <header class="admin-header">
            <div class="header-left">
                <h1>Quản lý Blog</h1>
            </div>

            <div class="header-right">
                <div class="header-search">
                    <i class="fas fa-search"></i>
                    <input id="adminBlogSearch" type="text" name="q" form="blogFilterForm"
                           value="${fn:escapeXml(currentQ)}"
                           placeholder="Tìm kiếm bài viết..."
                           autocomplete="off">
                </div>


                <a href="../index.jsp" class="view-site-btn" target="_blank">
                    <i class="fas fa-external-link-alt"></i>
                    <span>Xem trang web</span>
                </a>
            </div>
        </header>

        <!-- Content -->
        <div class="admin-content">
            <!-- Page Header -->
            <div class="page-header">
                <div class="page-title">
                    <h2>Danh sách bài viết</h2>
                    <p>Quản lý tất cả bài viết blog và nội dung website</p>
                </div>
                <div class="page-actions">
                    <a href="admin-blog-add.jsp" class="btn btn-primary">
                        <i class="fas fa-plus"></i>
                        Thêm bài viết mới
                    </a>
                </div>
            </div>

            <!-- Filters -->
            <div class="filters-section">
                <form id="blogFilterForm" method="get" action="${pageContext.request.contextPath}/admin/blog" class="filter-form">
                    <div class="filters-grid">
                        <div class="filter-group">
                            <label>Danh mục</label>
                            <select id="category-filter" class="form-select" name ="category" onchange="this.form.submit()">
                                <option value="">Tất cả danh mục</option>
                                <c:forEach var="cat" items="${allCategories}">
                                    <option value="${cat.id}" ${currentCategory == cat.id ? 'selected' : ''}>${cat.name}</option>
                                </c:forEach>
                            </select>
                        </div>

                        <div class="filter-group">
                            <label for="status-filter">Trạng thái</label>
                            <select id="status-filter" class="form-select" name = "status" onchange="this.form.submit()">
                                <option value="">Tất cả trạng thái</option>
                                <option value="published" ${currentStatus == 'published' ? 'selected' : ''}>Đã xuất bản</option>
                                <option value="draft" ${currentStatus == 'draft' ? 'selected' : ''}>Bản nháp</option>
                                <option value="archived" ${currentStatus == 'archived' ? 'selected' : ''}>Đã lưu trữ</option>
                            </select>
                        </div>

                        <div class="filter-group">
                            <label for="author-filter">Tác giả</label>
                            <select id="author-filter" class="form-select" name="author" onchange="this.form.submit()">
                                <option value="">Tất cả tác giả</option>
                                <c:forEach var="author" items="${allAuthors}">
                                    <option value="${author.id}" ${currentAuthor == author.id ? 'selected' : ''}>
                                            ${author.displayName}
                                    </option>
                                </c:forEach>
                            </select>
                        </div>

                        <div class="filter-group">
                            <label for="sort-filter">Sắp xếp</label>
                            <select id="sort-filter" class="form-select" name="sort" onchange="this.form.submit()">
                                <option value="date_desc" ${currentSort == 'date_desc' || empty currentSort ? 'selected' : ''}>Mới nhất</option>
                                <option value="date_asc" ${currentSort == 'date_asc' ? 'selected' : ''}>Cũ nhất</option>
                                <option value="title_asc" ${currentSort == 'title_asc' ? 'selected' : ''}>Tên A-Z</option>
                                <option value="title_desc" ${currentSort == 'title_desc' ? 'selected' : ''}>Tên Z-A</option>
                                <option value="views_desc" ${currentSort == 'views_desc' ? 'selected' : ''}>Xem nhiều nhất</option>
                                <option value="views_asc" ${currentSort == 'views_asc' ? 'selected' : ''}>Xem ít nhất</option>
                            </select>
                        </div>
                    </div>
                </form>
            </div>

            <!-- Bulk Actions Bar -->
            <div class="bulk-actions-bar" id="bulkActionsBar">
                <input type="checkbox" class="product-checkbox" id="selectAllPosts">
                <span class="bulk-actions-info">
                    <strong id="selectedCount">0</strong> bài viết được chọn
                </span>
                <div class="bulk-actions-buttons">
                    <button class="btn-bulk btn-bulk-activate" onclick="bulkPublish()">
                        <i class="fas fa-check-circle"></i>
                        Xuất bản
                    </button>
                    <button class="btn-bulk btn-bulk-deactivate" onclick="bulkArchive()">
                        <i class="fas fa-archive"></i>
                        Lưu trữ
                    </button>
                    <button class="btn-bulk btn-bulk-delete" onclick="bulkDelete()">
                        <i class="fas fa-trash"></i>
                        Xóa
                    </button>
                    <button class="btn-bulk btn-bulk-cancel" onclick="cancelSelection()">
                        <i class="fas fa-times"></i>
                        Hủy
                    </button>
                </div>
            </div>

            <!-- Blog Posts Container -->
            <div class="products-container">
                <div class="table-header">
                    <div class="products-count">Tổng số bài viết : <strong>${totalPosts}</strong></div>
                </div>

                <!-- Blog Posts Table -->
                <div class="table-responsive">
                    <table class="orders-table">
                        <thead>
                        <tr>
                            <th style="width: 50px;">
                                <input type="checkbox" class="product-checkbox" id="selectAllCheckbox" onchange="toggleSelectAll(this)">
                            </th>
                            <th style="width: 80px;">Hình ảnh</th>
                            <th>Tiêu đề</th>
                            <th style="width: 130px;">Danh mục</th>
                            <th style="width: 150px;">Tác giả</th>
                            <th style="width: 120px;">Trạng thái</th>
                            <th style="width: 100px;">Lượt xem</th>
                            <th style="width: 120px;">Ngày tạo</th>
                            <th style="width: 130px; text-align: center;">Thao tác</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:if test="${empty posts}">
                            <tr>
                                <td colspan="9" style="text-align: center;">Chưa có bài viết nào</td>
                            </tr>
                        </c:if>
                        <c:forEach var="post" items="${posts}">
                            <tr>
                                <td><input type="checkbox" class="product-checkbox row-checkbox" value="${post.id}" onchange="updateBulkActions()"> </td>

                                <td> <img src="${pageContext.request.contextPath}/${post.featuredImage}" alt="Blog image" class="product-image-thumb"></td>

                                <td>
                                    <div class="product-name-cell">${post.title}</div>
                                    <div class="product-description-cell">
                                            ${empty post.excerpt ? '' : post.excerpt}
                                    </div>
                                </td>

                                <td>
                                    <span class="category-badge health"> ${empty post.categoryId ? 'Chưa phân loại' : categoryMap[post.categoryId]}</span>
                                </td>
                                <td>
                                    <div class="author-name">
                                            ${empty post.author ? '---' : post.author.displayName}
                                    </div>
                                    <small class="author-email">
                                            ${empty post.author ? '' : post.author.email}
                                    </small>
                                </td>

                                <td>
                                    <c:choose>
                                        <c:when test="${post.status.name() == 'PUBLISHED'}">
                                            <span class="status-badge published">ĐÃ XUẤT BẢN</span>
                                        </c:when>
                                        <c:when test="${post.status.name() == 'DRAFT'}">
                                            <span class="status-badge status-pending">BẢN NHÁP</span>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="status-badge status-cancelled">LƯU TRỮ</span>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td>
                                    <div class="views-count">
                                        <i class="fas fa-eye"></i>
                                        <span><fmt:formatNumber value="${post.viewsCount}" pattern="#,###"/></span>
                                    </div>
                                </td>
                                <td>
                                    <div><fmt:formatDate value="${post.createdAtDate}" pattern="dd/MM/yyyy"/></div>
                                    <small><fmt:formatDate value="${post.createdAtDate}" pattern="HH:mm"/></small>
                                </td>

                                <td>
                                    <div class="action-buttons">
                                        <button class="btn-action" title="Xem chi tiết">
                                            <i class="fas fa-eye"></i>
                                        </button>
                                        <button class="btn-action" title="Chỉnh sửa">
                                            <i class="fas fa-edit"></i>
                                        </button>
                                        <button class="btn-action danger" title="Xóa">
                                            <i class="fas fa-trash"></i>
                                        </button>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>

                <!-- Pagination -->
                <div class="pagination-container">
                    <div class="pagination-info">
                        Hiển thị <strong>${fromItem}-${toItem}</strong> trong tổng số <strong>${totalPosts}</strong> bài viết
                    </div>
                    <div class="pagination">
                        <c:forEach begin="1" end="${totalPages}" var="i">
                            <c:url var="pageUrl" value="/admin/blog">
                                <c:param name="page" value="${i}" />
                                <c:if test="${not empty currentQ}">
                                    <c:param name="q" value="${currentQ}" />
                                </c:if>
                                <c:if test="${not empty currentCategory}">
                                    <c:param name="category" value="${currentCategory}" />
                                </c:if>
                                <c:if test="${not empty currentStatus}">
                                    <c:param name="status" value="${currentStatus}" />
                                </c:if>
                                <c:if test="${not empty currentAuthor}">
                                    <c:param name="author" value="${currentAuthor}" />
                                </c:if>
                                <c:if test="${not empty currentSort}">
                                    <c:param name="sort" value="${currentSort}" />
                                </c:if>
                            </c:url>

                            <a href="${pageContext.request.contextPath}${pageUrl}"
                               class="page-link ${currentPage == i ? 'active' : ''}">
                                    ${i}
                            </a>
                        </c:forEach>
                    </div>

                </div>
            </div>
        </div>
    </main>
</div>

<script>
    // Toggle select all checkboxes
    function toggleSelectAll(checkbox) {
        const rowCheckboxes = document.querySelectorAll('.row-checkbox');
        const bulkActionsCheckbox = document.getElementById('selectAllPosts');

        rowCheckboxes.forEach(cb => {
            cb.checked = checkbox.checked;
        });

        bulkActionsCheckbox.checked = checkbox.checked;
        updateBulkActions();
    }

    // Update bulk actions bar
    function updateBulkActions() {
        const rowCheckboxes = document.querySelectorAll('.row-checkbox');
        const selectAllCheckbox = document.getElementById('selectAllCheckbox');
        const bulkActionsCheckbox = document.getElementById('selectAllPosts');
        const bulkActionsBar = document.getElementById('bulkActionsBar');
        const selectedCount = document.getElementById('selectedCount');

        const checkedCount = Array.from(rowCheckboxes).filter(cb => cb.checked).length;
        const totalCount = rowCheckboxes.length;

        // Update count
        selectedCount.textContent = checkedCount;

        // Show/hide bulk actions bar
        if (checkedCount > 0) {
            bulkActionsBar.classList.add('active');
        } else {
            bulkActionsBar.classList.remove('active');
        }

        // Update select all checkbox state
        if (checkedCount === totalCount) {
            selectAllCheckbox.checked = true;
            bulkActionsCheckbox.checked = true;
            selectAllCheckbox.indeterminate = false;
        } else if (checkedCount > 0) {
            selectAllCheckbox.checked = false;
            bulkActionsCheckbox.checked = false;
            selectAllCheckbox.indeterminate = true;
        } else {
            selectAllCheckbox.checked = false;
            bulkActionsCheckbox.checked = false;
            selectAllCheckbox.indeterminate = false;
        }
    }

    // Sync bulk actions bar checkbox with table header checkbox
    document.getElementById('selectAllPosts').addEventListener('change', function() {
        const selectAllCheckbox = document.getElementById('selectAllCheckbox');
        selectAllCheckbox.checked = this.checked;
        toggleSelectAll(this);
    });

    // Bulk actions functions
    function bulkPublish() {
        const selectedPosts = getSelectedPosts();
        if (selectedPosts.length === 0) return;

        if (confirm(`Bạn có chắc muốn xuất bản ${selectedPosts.length} bài viết đã chọn?`)) {
            console.log('Publishing posts:', selectedPosts);
            // Add your publish logic here
            alert(`Đã xuất bản ${selectedPosts.length} bài viết!`);
            cancelSelection();
        }
    }

    function bulkArchive() {
        const selectedPosts = getSelectedPosts();
        if (selectedPosts.length === 0) return;

        if (confirm(`Bạn có chắc muốn lưu trữ ${selectedPosts.length} bài viết đã chọn?`)) {
            console.log('Archiving posts:', selectedPosts);
            // Add your archive logic here
            alert(`Đã lưu trữ ${selectedPosts.length} bài viết!`);
            cancelSelection();
        }
    }

    function bulkDelete() {
        const selectedPosts = getSelectedPosts();
        if (selectedPosts.length === 0) return;

        if (confirm(`CẢNH BÁO: Bạn có chắc muốn xóa ${selectedPosts.length} bài viết đã chọn? Hành động này không thể hoàn tác!`)) {
            console.log('Deleting posts:', selectedPosts);
            // Add your deletion logic here
            alert(`Đã xóa ${selectedPosts.length} bài viết!`);
            cancelSelection();
        }
    }

    function cancelSelection() {
        const rowCheckboxes = document.querySelectorAll('.row-checkbox');
        const selectAllCheckbox = document.getElementById('selectAllCheckbox');
        const bulkActionsCheckbox = document.getElementById('selectAllPosts');

        rowCheckboxes.forEach(cb => {
            cb.checked = false;
        });

        selectAllCheckbox.checked = false;
        bulkActionsCheckbox.checked = false;
        selectAllCheckbox.indeterminate = false;
        updateBulkActions();
    }

    function getSelectedPosts() {
        return Array.from(document.querySelectorAll('.row-checkbox:checked'))
            .map(cb => parseInt(cb.value, 10))
            .filter(id => !isNaN(id));
    }
    (function () {
        const input = document.getElementById('adminBlogSearch');
        const form  = document.getElementById('blogFilterForm');
        if (!input || !form) return;

        let t;

        input.addEventListener('input', function () {
            clearTimeout(t);

            const v = input.value;
            // đang ở khoảng trắng thì chưa submit
            if (/\s$/.test(v)) return;

            t = setTimeout(() => form.submit(), 900);
        });
    })();

</script>
</body>
</html>

