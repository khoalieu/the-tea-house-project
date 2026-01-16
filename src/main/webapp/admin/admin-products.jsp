<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản lý Sản phẩm - Mộc Trà Admin</title>
    <link rel="stylesheet" href="../assets/css/base.css">
    <link rel="stylesheet" href="../assets/css/components.css">
    <link rel="stylesheet" href="assets/css/admin.css">
    <link rel="stylesheet" href="assets/css/admin-add-product.css">
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

                <li class="nav-item active">
                    <a href="${pageContext.request.contextPath}/admin/products">
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

                <li class="nav-item">
                    <a href="admin-blog.jsp">
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
                <h1>Quản lý Sản phẩm</h1>
            </div>
            
            <div class="header-right">
                <div class="header-search">
                    <i class="fas fa-search"></i>
                    <input type="text" placeholder="Tìm kiếm sản phẩm...">
                </div>
                
                <a href="../index.jsp" class="view-site-btn" target="_blank">
                    <i class="fas fa-external-link-alt"></i>
                    <span>Xem trang web</span>
                </a>
            </div>
        </header>
        
        <!-- Content -->
        <div class="admin-content">
            <div class="page-header">
                <div class="page-title">
                    <h2>Danh sách sản phẩm</h2>
                    <p>Quản lý tất cả sản phẩm trà và nguyên liệu pha chế</p>
                </div>
                <div class="page-actions">
                    <a href="${pageContext.request.contextPath}/admin/product/add" class="btn btn-primary">
                        <i class="fas fa-plus"></i> Thêm sản phẩm
                    </a>
                </div>
            </div>

            <form action="products" method="get" class="filters-section">
                <div class="filters-grid">
                    <div class="filter-group">
                        <label for="category-filter">Danh mục</label>
                        <select name="categoryId" id="category-filter" class="form-select" onchange="this.form.submit()">
                            <option value="">Tất cả danh mục</option>
                            <c:forEach var="cat" items="${categoryList}">
                                <option value="${cat.id}" ${currentCategoryId == cat.id ? 'selected' : ''}>${cat.name}</option>
                            </c:forEach>
                        </select>
                    </div>

                    <div class="filter-group">
                        <label for="status-filter">Trạng thái</label>
                        <select name="status" id="status-filter" class="form-select" onchange="this.form.submit()">
                            <option value="">Tất cả trạng thái</option>
                            <option value="active" ${currentStatus == 'active' ? 'selected' : ''}>Đang bán</option>
                            <option value="inactive" ${currentStatus == 'inactive' ? 'selected' : ''}>Ngừng bán</option>
                            <option value="out-of-stock" ${currentStatus == 'out-of-stock' ? 'selected' : ''}>Hết hàng</option>
                        </select>
                    </div>

                    <div class="filter-group">
                        <label for="price-filter">Khoảng giá</label>
                        <select name="maxPrice" id="price-filter" class="form-select" onchange="this.form.submit()">
                            <option value="">Tất cả giá</option>
                            <option value="50000" ${currentMaxPrice == '50000' ? 'selected' : ''}>Dưới 50.000₫</option>
                            <option value="100000" ${currentMaxPrice == '100000' ? 'selected' : ''}>Dưới 100.000₫</option>
                            <option value="200000" ${currentMaxPrice == '200000' ? 'selected' : ''}>Dưới 200.000₫</option>
                        </select>
                    </div>

                    <div class="filter-group">
                        <label for="sort-filter">Sắp xếp</label>
                        <select name="sort" id="sort-filter" class="form-select" onchange="this.form.submit()">
                            <option value="newest" ${currentSort == 'newest' ? 'selected' : ''}>Mới nhất</option>
                            <option value="price-asc" ${currentSort == 'price-asc' ? 'selected' : ''}>Giá thấp đến cao</option>
                            <option value="price-desc" ${currentSort == 'price-desc' ? 'selected' : ''}>Giá cao đến thấp</option>
                            <option value="name-asc" ${currentSort == 'name-asc' ? 'selected' : ''}>Tên A-Z</option>
                        </select>
                    </div>

                    <input type="hidden" name="keyword" value="${currentKeyword}">
                </div>
            </form>
            <input type="hidden" name="keyword" value="${currentKeyword}">
        </div>
        </form>

        <div class="bulk-actions-bar" id="bulkActionsBar">
            <input type="checkbox" class="product-checkbox" id="selectAllProducts">
            <span class="bulk-actions-info">
        <strong id="selectedCount">0</strong> sản phẩm được chọn
    </span>
            <div class="bulk-actions-buttons">
                <button class="btn-bulk btn-bulk-quick-discount" onclick="openQuickDiscountModal()">
                    <i class="fas fa-percentage"></i> Giảm giá nhanh
                </button>
                <button class="btn-bulk btn-bulk-promo" onclick="openPromoModal()">
                    <i class="fas fa-tags"></i> Thêm vào KM
                </button>
                <button class="btn-bulk btn-bulk-activate" onclick="bulkActivate()">
                    <i class="fas fa-check-circle"></i> Kích hoạt
                </button>
                <button class="btn-bulk btn-bulk-deactivate" onclick="bulkDeactivate()">
                    <i class="fas fa-ban"></i> Ngừng bán
                </button>
                <button class="btn-bulk btn-bulk-delete" onclick="bulkDelete()">
                    <i class="fas fa-trash"></i> Xóa
                </button>
                <button class="btn-bulk btn-bulk-cancel" onclick="cancelSelection()">
                    <i class="fas fa-times"></i> Hủy
                </button>
            </div>
        </div>
        <div class="products-container">
            <div class="products-container">
                <div class="table-header">
                    <div class="products-count">Tổng cộng: <strong>${totalProducts} sản phẩm</strong></div>
                </div>

                <div class="table-responsive">
                    <table class="orders-table">
                        <thead>
                        <tr>
                            <th style="width: 50px;">
                                <input type="checkbox" class="product-checkbox" id="selectAllCheckbox" onchange="toggleSelectAll(this)">
                            </th>
                            <th style="width: 80px;">Hình ảnh</th>
                            <th>Tên sản phẩm</th>
                            <th style="width: 120px;">SKU</th>
                            <th style="width: 150px;">Danh mục</th> <th style="width: 120px;">Giá bán</th>
                            <th style="width: 100px;">Tồn kho</th>
                            <th style="width: 120px;">Trạng thái</th>
                            <th style="width: 150px; text-align: center;">Hành động</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="p" items="${productList}">
                            <tr>
                                <td>
                                    <input type="checkbox" class="product-checkbox row-checkbox" value="${p.id}" onchange="updateBulkActions()">
                                </td>
                                <td>
                                    <img src="${pageContext.request.contextPath}/${p.imageUrl}" alt="${p.name}" class="product-image-thumb">
                                </td>
                                <td>
                                    <div class="product-name-cell">${p.name}</div>
                                    <div class="product-description-cell" style="font-size: 0.8rem; color: #666;">
                                            ${p.shortDescription}
                                    </div>
                                </td>
                                <td>${p.sku}</td>
                                <td>
                                    <c:forEach var="c" items="${categoryList}">
                                        <c:if test="${c.id == p.categoryId}">${c.name}</c:if>
                                    </c:forEach>
                                </td>
                                <td>
                                    <div class="product-price-main">
                                        <fmt:formatNumber value="${p.salePrice > 0 ? p.salePrice : p.price}" pattern="#,###"/>₫
                                    </div>
                                    <c:if test="${p.salePrice > 0 && p.salePrice < p.price}">
                                        <div class="product-price-original">
                                            <fmt:formatNumber value="${p.price}" pattern="#,###"/>₫
                                        </div>
                                    </c:if>
                                </td>
                                <td>
                                <span class="${p.stockQuantity > 10 ? 'product-stock-high' : 'product-stock-low'}">
                                        ${p.stockQuantity}
                                </span>
                                </td>
                                <td>
                                <span class="status-badge ${p.status == 'ACTIVE' ? 'status-confirmed' : 'status-cancelled'}">
                                        ${p.status == 'ACTIVE' ? 'Đang bán' : 'Ngừng bán'}
                                </span>
                                </td>
                                <td>
                                    <div class="action-buttons">
                                        <a href="${pageContext.request.contextPath}/chi-tiet-san-pham?id=${p.id}" target="_blank" class="btn-action" title="Xem chi tiết">
                                            <i class="fas fa-eye"></i>
                                        </a>
                                        <a href="${pageContext.request.contextPath}/admin/product/edit?id=${p.id}" class="btn-action" title="Chỉnh sửa">
                                            <i class="fas fa-edit"></i>
                                        </a>
                                        <button class="btn-action danger" title="Xóa" onclick="deleteProduct(${p.id})">
                                            <i class="fas fa-trash"></i>
                                        </button>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>

                <div class="pagination-container">
                    <div class="pagination-info">
                        Trang <strong>${currentPage}</strong> / <strong>${totalPages}</strong>
                    </div>
                    <div class="pagination">
                        <c:if test="${currentPage > 1}">
                            <a href="products?page=${currentPage - 1}&categoryId=${currentCategoryId}&sort=${currentSort}" class="page-btn">
                                <i class="fas fa-chevron-left"></i>
                            </a>
                        </c:if>

                        <c:forEach begin="1" end="${totalPages}" var="i">
                            <a href="products?page=${i}&categoryId=${currentCategoryId}&sort=${currentSort}" class="page-btn ${currentPage == i ? 'active' : ''}">${i}</a>
                        </c:forEach>

                        <c:if test="${currentPage < totalPages}">
                            <a href="products?page=${currentPage + 1}&categoryId=${currentCategoryId}&sort=${currentSort}" class="page-btn">
                                <i class="fas fa-chevron-right"></i>
                            </a>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
    </main>
</div>

<div id="promoModal" class="modal-overlay">
    <div class="modal-content">
        <div class="modal-header">
            <h3>Thêm vào chương trình KM</h3>
            <span class="close-modal" onclick="closePromoModal()">&times;</span>
        </div>
        <div class="modal-body">
            <p>Bạn đang chọn <strong id="promoSelectedCount" class="highlight-text">0</strong> sản phẩm.</p>
            <div class="form-group">
                <label for="promoSelect">Chọn chương trình áp dụng:</label>
                <select id="promoSelect" class="form-select full-width">
                    <option value="">-- Chọn chương trình --</option>

                    <c:forEach var="promo" items="${activePromos}">
                        <option value="${promo.id}">🔥 ${promo.name}</option>
                    </c:forEach>
                </select>
            </div>
        </div>
        <div class="modal-footer">
            <button class="btn btn-secondary" onclick="closePromoModal()">Hủy</button>
            <button class="btn btn-primary" onclick="submitAddToPromo()">Lưu thay đổi</button>
        </div>
    </div>
</div>

<!-- Quick Discount Modal -->
<div id="quickDiscountModal" class="modal-overlay">
    <div class="modal-content">
        <div class="modal-header">
            <h3>Giảm giá nhanh</h3>
            <span class="close-modal" onclick="closeQuickDiscountModal()">&times;</span>
        </div>
        <div class="modal-body">
            <p>Bạn đang chọn <strong id="discountSelectedCount" class="highlight-text">0</strong> sản phẩm.</p>
            
            <div class="form-group">
                <label>Loại giảm giá:</label>
                <div class="radio-group">
                    <label class="radio-label">
                        <input type="radio" name="discountType" value="percent" checked>
                        <span>Giảm theo phần trăm (%)</span>
                    </label>
                    <label class="radio-label">
                        <input type="radio" name="discountType" value="amount">
                        <span>Giảm số tiền cố định (₫)</span>
                    </label>
                </div>
            </div>
            
            <div class="form-group">
                <label for="discountValue">Nhập % giảm giá:</label>
                <input type="number" id="discountValue" class="form-input full-width" 
                       placeholder="Ví dụ: 15" min="0" max="100">
            </div>
        </div>
        <div class="modal-footer">
            <button class="btn btn-secondary" onclick="closeQuickDiscountModal()">Hủy</button>
            <button class="btn btn-primary" onclick="submitQuickDiscount()">Áp dụng</button>
        </div>
    </div>
</div>

<script>
    // Toggle select all checkboxes
    function toggleSelectAll(checkbox) {
        const rowCheckboxes = document.querySelectorAll('.row-checkbox');
        const bulkActionsCheckbox = document.getElementById('selectAllProducts');
        
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
        const bulkActionsCheckbox = document.getElementById('selectAllProducts');
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
    document.getElementById('selectAllProducts').addEventListener('change', function() {
        const selectAllCheckbox = document.getElementById('selectAllCheckbox');
        selectAllCheckbox.checked = this.checked;
        toggleSelectAll(this);
    });
    
    // Bulk actions functions
    function bulkActivate() {
        const selectedProducts = getSelectedProducts();
        if (selectedProducts.length === 0) return;
        
        if (confirm(`Bạn có chắc muốn kích hoạt ${selectedProducts.length} sản phẩm đã chọn?`)) {
            console.log('Activating products:', selectedProducts);
            // Add your activation logic here
            alert(`Đã kích hoạt ${selectedProducts.length} sản phẩm!`);
            cancelSelection();
        }
    }
    
    function bulkDeactivate() {
        const selectedProducts = getSelectedProducts();
        if (selectedProducts.length === 0) return;
        
        if (confirm(`Bạn có chắc muốn ngừng bán ${selectedProducts.length} sản phẩm đã chọn?`)) {
            console.log('Deactivating products:', selectedProducts);
            // Add your deactivation logic here
            alert(`Đã ngừng bán ${selectedProducts.length} sản phẩm!`);
            cancelSelection();
        }
    }
    
    function bulkDelete() {
        const selectedProducts = getSelectedProducts();
        if (selectedProducts.length === 0) return;
        
        if (confirm(`CẢNH BÁO: Bạn có chắc muốn xóa ${selectedProducts.length} sản phẩm đã chọn? Hành động này không thể hoàn tác!`)) {
            console.log('Deleting products:', selectedProducts);
            // Add your deletion logic here
            alert(`Đã xóa ${selectedProducts.length} sản phẩm!`);
            cancelSelection();
        }
    }
    
    function cancelSelection() {
        const rowCheckboxes = document.querySelectorAll('.row-checkbox');
        const selectAllCheckbox = document.getElementById('selectAllCheckbox');
        const bulkActionsCheckbox = document.getElementById('selectAllProducts');
        
        rowCheckboxes.forEach(cb => {
            cb.checked = false;
        });
        
        selectAllCheckbox.checked = false;
        bulkActionsCheckbox.checked = false;
        selectAllCheckbox.indeterminate = false;
        updateBulkActions();
    }
    
    function getSelectedProducts() {
        const rowCheckboxes = document.querySelectorAll('.row-checkbox');
        const selected = [];
        
        rowCheckboxes.forEach((checkbox) => {
            if (checkbox.checked) {
                selected.push(checkbox.value);
            }
        });
        return selected;
    }
    // --- LOGIC MODAL KHUYẾN MÃI ---

// 1. Mở Modal
function openPromoModal() {
    const selectedIds = getSelectedProducts();
    
    // Kiểm tra xem đã chọn sản phẩm chưa
    if (selectedIds.length === 0) {
        alert("Vui lòng chọn ít nhất 1 sản phẩm!");
        return;
    }

    // Cập nhật số lượng vào text trong Modal
    document.getElementById('promoSelectedCount').textContent = selectedIds.length;
    
    // Hiển thị Modal
    document.getElementById('promoModal').classList.add('active');
}

// 2. Đóng Modal
function closePromoModal() {
    document.getElementById('promoModal').classList.remove('active');
    // Reset dropdown về mặc định nếu cần
    document.getElementById('promoSelect').value = ""; 
}

// 3. Xử lý nút Lưu (Submit)
function submitAddToPromo() {
    const promotionId = document.getElementById('promoSelect').value;
    const selectedProductIds = getSelectedProducts(); // Hàm này lấy từ code cũ

    if (!promotionId) {
        alert("Vui lòng chọn một chương trình khuyến mãi!");
        return;
    }

    // --- GỬI AJAX VỀ SERVER (JSP/Servlet) ---
    // Ví dụ code gửi dữ liệu đi:
    console.log("Đang thêm sản phẩm:", selectedProductIds, "vào KM ID:", promotionId);
    
    /* fetch('add-products-to-promotion', {
        method: 'POST',
        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        body: `productIds=${selectedProductIds.join(',')}&promoId=${promotionId}`
    }).then(...) 
    */

    // Giả lập thành công cho giao diện Demo
    alert(`Đã thêm thành công ${selectedProductIds.length} sản phẩm vào chương trình!`);
    
    // Đóng modal và hủy chọn
    closePromoModal();
    cancelSelection(); // Hàm này hủy các checkbox (đã có ở code cũ)
}

// Đóng modal khi click ra ngoài vùng trắng
window.onclick = function(event) {
    const modal = document.getElementById('promoModal');
    if (event.target == modal) {
        closePromoModal();
    }
}

// --- LOGIC MODAL GIẢM GIÁ NHANH ---

// 1. Mở Modal Giảm Giá Nhanh
function openQuickDiscountModal() {
    const selectedIds = getSelectedProducts();
    
    // Kiểm tra xem đã chọn sản phẩm chưa
    if (selectedIds.length === 0) {
        alert("Vui lòng chọn ít nhất 1 sản phẩm!");
        return;
    }

    // Cập nhật số lượng vào text trong Modal
    document.getElementById('discountSelectedCount').textContent = selectedIds.length;
    
    // Hiển thị Modal
    document.getElementById('quickDiscountModal').classList.add('active');
}

// 2. Đóng Modal Giảm Giá Nhanh
function closeQuickDiscountModal() {
    document.getElementById('quickDiscountModal').classList.remove('active');
    // Reset giá trị input về mặc định nếu cần
    document.getElementById('discountValue').value = ""; 
    document.querySelector('input[name="discountType"][value="percent"]').checked = true;
}

// 3. Xử lý nút Áp dụng (Submit Giảm Giá Nhanh)
function submitQuickDiscount() {
    const discountType = document.querySelector('input[name="discountType"]:checked').value;
    const discountValue = document.getElementById('discountValue').value;
    const selectedProductIds = getSelectedProducts(); // Hàm này lấy từ code cũ

    if (selectedProductIds.length === 0) {
        alert("Vui lòng chọn ít nhất 1 sản phẩm!");
        return;
    }

    if (!discountValue) {
        alert("Vui lòng nhập giá trị giảm giá!");
        return;
    }

    // --- GỬI AJAX VỀ SERVER (JSP/Servlet) ---
    // Ví dụ code gửi dữ liệu đi:
    console.log("Đang áp dụng giảm giá:", selectedProductIds, "Giảm giá:", discountValue, "%");
    
    /* fetch('apply-quick-discount', {
        method: 'POST',
        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        body: `productIds=${selectedProductIds.join(',')}&discountType=${discountType}&discountValue=${discountValue}`
    }).then(...) 
    */

    // Giả lập thành công cho giao diện Demo
    alert(`Đã áp dụng giảm giá thành công cho ${selectedProductIds.length} sản phẩm!`);
    
    // Đóng modal và hủy chọn
    closeQuickDiscountModal();
    cancelSelection(); // Hàm này hủy các checkbox (đã có ở code cũ)
}

window.onclick = function(event) {
    const modal = document.getElementById('quickDiscountModal');
    if (event.target == modal) {
        closeQuickDiscountModal();
    }
}
    function deleteProduct(productId) {
        if (confirm("Bạn có chắc chắn muốn xóa sản phẩm này? Hành động này không thể hoàn tác!")) {
            fetch('${pageContext.request.contextPath}/admin/product/delete?id=' + productId, {
                method: 'POST'
            })
                .then(response => {
                    if (response.ok) {
                        alert("Đã xóa sản phẩm thành công!");
                        location.reload();
                    } else {
                        alert("Xóa thất bại. Vui lòng thử lại.");
                    }
                })
                .catch(error => console.error('Error:', error));
        }
    }
    function submitAddToPromo() {
        const promotionId = document.getElementById('promoSelect').value;
        const selectedProductIds = getSelectedProducts(); // Mảng ID [1, 5, 8...]

        if (!promotionId) {
            alert("Vui lòng chọn một chương trình khuyến mãi!");
            return;
        }

        if (selectedProductIds.length === 0) {
            alert("Vui lòng chọn sản phẩm!");
            return;
        }

        // Gửi AJAX về Servlet AdminAddPromoServlet
        const params = new URLSearchParams();
        params.append('promoId', promotionId);
        params.append('productIds', selectedProductIds.join(',')); // Biến mảng thành chuỗi "1,5,8"

        fetch('${pageContext.request.contextPath}/admin/promotion/add-products', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded'
            },
            body: params
        })
            .then(response => {
                if (response.ok) {
                    alert("✅ Đã thêm sản phẩm vào chương trình thành công!");
                    closePromoModal();
                    cancelSelection(); // Bỏ chọn checkbox
                    location.reload(); // Tải lại trang để cập nhật nếu cần
                } else {
                    alert("❌ Có lỗi xảy ra. Vui lòng thử lại.");
                }
            })
            .catch(error => {
                console.error('Error:', error);
                alert("Lỗi kết nối server.");
            });
    }
</script>
</body>
</html>
