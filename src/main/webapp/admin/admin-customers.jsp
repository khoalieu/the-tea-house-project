<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản lý Khách hàng - Mộc Trà Admin</title>
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
    <jsp:include page="/common/admin-sidebar.jsp">
        <jsp:param name="activePage" value="customer" />
    </jsp:include>

    <!-- Main Content -->
    <main class="admin-main">
        <!-- Header -->
        <header class="admin-header">
            <div class="header-left">
                <h1>Quản lý Khách hàng</h1>
            </div>

            <div class="header-right">
                <div class="header-search">
                    <i class="fas fa-search"></i>
                    <input type="text" placeholder="Tìm kiếm khách hàng...">
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
                    <h2>Danh sách khách hàng</h2>
                    <p>Quản lý thông tin và hoạt động của khách hàng</p>
                </div>
            </div>

            <!-- Filters -->
            <div class="filters-section">
                <div class="filters-grid">
                    <div class="filter-group">
                        <label for="status-filter">Trạng thái</label>
                        <select id="status-filter" class="form-select">
                            <option value="">Tất cả trạng thái</option>
                            <option value="new">Khách hàng mới</option>
                            <option value="active">Đang hoạt động</option>
                            <option value="vip">VIP</option>
                            <option value="inactive">Không hoạt động</option>
                        </select>
                    </div>

                    <div class="filter-group">
                        <label for="orders-filter">Số đơn hàng</label>
                        <select id="orders-filter" class="form-select">
                            <option value="">Tất cả</option>
                            <option value="0">Chưa mua hàng</option>
                            <option value="1-5">1-5 đơn</option>
                            <option value="6-10">6-10 đơn</option>
                            <option value="10+">Trên 10 đơn</option>
                        </select>
                    </div>

                    <div class="filter-group">
                        <label for="spending-filter">Tổng chi tiêu</label>
                        <select id="spending-filter" class="form-select">
                            <option value="">Tất cả</option>
                            <option value="0-500000">Dưới 500.000₫</option>
                            <option value="500000-1000000">500.000₫ - 1.000.000₫</option>
                            <option value="1000000+">Trên 1.000.000₫</option>
                        </select>
                    </div>

                    <div class="filter-group">
                        <label for="sort-filter">Sắp xếp</label>
                        <select id="sort-filter" class="form-select">
                            <option value="newest">Mới nhất</option>
                            <option value="oldest">Cũ nhất</option>
                            <option value="name-asc">Tên A-Z</option>
                            <option value="name-desc">Tên Z-A</option>
                            <option value="orders-desc">Nhiều đơn hàng</option>
                            <option value="spending-desc">Chi tiêu cao</option>
                        </select>
                    </div>
                </div>
            </div>

            <!-- Bulk Actions Bar -->
            <div class="bulk-actions-bar" id="bulkActionsBar">
                <input type="checkbox" class="product-checkbox" id="selectAllCustomers">
                <span class="bulk-actions-info">
                    <strong id="selectedCount">0</strong> khách hàng được chọn
                </span>
                <div class="bulk-actions-buttons">
                    <button class="btn-bulk btn-bulk-activate" onclick="bulkActivate()">
                        <i class="fas fa-user-check"></i>
                        Kích hoạt
                    </button>
                    <button class="btn-bulk btn-bulk-deactivate" onclick="bulkDeactivate()">
                        <i class="fas fa-user-times"></i>
                        Vô hiệu hóa
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

            <!-- Customers Container -->
            <div class="products-container">
                <div class="table-header">
                    <div class="products-count">Tổng cộng: <strong>348 khách hàng</strong></div>
                </div>

                <!-- Customers Table -->
                <div class="table-responsive">
                    <table class="orders-table">
                        <thead>
                            <tr>
                                <th style="width: 50px;">
                                    <input type="checkbox" class="product-checkbox" id="selectAllCheckbox" onchange="toggleSelectAll(this)">
                                </th>
                                <th>Tên khách hàng</th>
                                <th style="width: 200px;">Email / SĐT</th>
                                <th style="width: 100px;">Đơn hàng</th>
                                <th style="width: 130px;">Tổng chi tiêu</th>
                                <th style="width: 150px;">Ngày tham gia</th>
                                <th style="width: 150px;">Lần mua cuối</th>
                                <th style="width: 120px;">Trạng thái</th>
                                <th style="width: 130px; text-align: center;">Hành động</th>
                            </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${customerList}" var="dto">
                            <tr>
                                <td>
                                    <input type="checkbox" class="product-checkbox row-checkbox" value="${dto.user.id}" onchange="updateBulkActions()">
                                </td>
                                <td>
                                    <div class="product-name-cell">${dto.user.displayName}</div>
                                    <div class="product-description-cell">
                                        <i class="fas fa-map-marker-alt"></i> ${dto.displayAddress}
                                    </div>
                                </td>
                                <td>
                                    <div class="product-name-cell">${dto.user.email}</div>
                                    <div class="product-description-cell">${dto.user.phone}</div>
                                </td>

                                <td>
                                    <c:choose>
                                        <c:when test="${dto.totalOrders > 10}">
                                            <span class="product-stock-high">${dto.totalOrders}</span>
                                        </c:when>
                                        <c:when test="${dto.totalOrders > 0}">
                                            <span class="product-stock-low">${dto.totalOrders}</span>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="product-stock-out">0</span>
                                        </c:otherwise>
                                    </c:choose>
                                </td>

                                <td>
                                    <div class="product-price-main">
                                        <fmt:formatNumber value="${dto.totalSpent}" type="currency" currencySymbol="₫" maxFractionDigits="0"/>
                                    </div>
                                </td>

                                <td>
                                    <div class="date-info">
                                        <strong>${dto.user.createdAt.toLocalDate()}</strong>
                                    </div>
                                </td>

                                <td>
                                    <div class="date-info">
                                        <strong>
                                            <c:choose>
                                                <c:when test="${not empty dto.lastPurchase}">
                                                    ${dto.lastPurchase.toLocalDate()}
                                                </c:when>
                                                <c:otherwise>--</c:otherwise>
                                            </c:choose>
                                        </strong>
                                    </div>
                                </td>

                                <td>
                                    <c:choose>
                                        <c:when test="${dto.user.isActive}">
                                            <span class="status-badge status-active">Hoạt động</span>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="status-badge status-inactive">Vô hiệu hóa</span>
                                        </c:otherwise>
                                    </c:choose>
                                </td>

                                <td>
                                    <div class="action-buttons">
                                        <a href="customer-detail?id=${dto.user.id}" class="btn-action" title="Xem chi tiết">
                                            <i class="fas fa-eye"></i>
                                        </a>
                                        <a href="#" class="btn-action" title="Chỉnh sửa">
                                            <i class="fas fa-edit"></i>
                                        </a>
                                        <button class="btn-action danger" title="Xóa" onclick="deleteCustomer(${dto.user.id})">
                                            <i class="fas fa-trash"></i>
                                        </button>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>

                        <c:if test="${empty customerList}">
                            <tr>
                                <td colspan="9" style="text-align: center; padding: 30px;">
                                    Không tìm thấy khách hàng nào phù hợp.
                                </td>
                            </tr>
                        </c:if>
                        </tbody>
                    </table>
                </div>

                <!-- Pagination -->
                <div class="pagination-container">
                    <div class="pagination-info">
                        Hiển thị <strong>1-6</strong> trong tổng số <strong>348</strong> khách hàng
                    </div>
                    <div class="pagination">
                        <a href="#" class="page-btn disabled">
                            <i class="fas fa-chevron-left"></i>
                        </a>
                        <a href="#" class="page-btn active">1</a>
                        <a href="#" class="page-btn">2</a>
                        <a href="#" class="page-btn">3</a>
                        <a href="#" class="page-btn">4</a>
                        <a href="#" class="page-btn">
                            <i class="fas fa-chevron-right"></i>
                        </a>
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
        const bulkActionsCheckbox = document.getElementById('selectAllCustomers');

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
        const bulkActionsCheckbox = document.getElementById('selectAllCustomers');
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
    document.getElementById('selectAllCustomers').addEventListener('change', function() {
        const selectAllCheckbox = document.getElementById('selectAllCheckbox');
        selectAllCheckbox.checked = this.checked;
        toggleSelectAll(this);
    });

    // Bulk actions functions
    function bulkActivate() {
        const selectedCustomers = getSelectedCustomers();
        if (selectedCustomers.length === 0) return;

        if (confirm(`Bạn có chắc muốn kích hoạt ${selectedCustomers.length} khách hàng đã chọn?`)) {
            console.log('Activating customers:', selectedCustomers);
            // Add your activation logic here
            alert(`Đã kích hoạt ${selectedCustomers.length} khách hàng!`);
            cancelSelection();
        }
    }

    function bulkDeactivate() {
        const selectedCustomers = getSelectedCustomers();
        if (selectedCustomers.length === 0) return;

        if (confirm(`Bạn có chắc muốn vô hiệu hóa ${selectedCustomers.length} khách hàng đã chọn?`)) {
            console.log('Deactivating customers:', selectedCustomers);
            // Add your deactivation logic here
            alert(`Đã vô hiệu hóa ${selectedCustomers.length} khách hàng!`);
            cancelSelection();
        }
    }

    function bulkDelete() {
        const selectedCustomers = getSelectedCustomers();
        if (selectedCustomers.length === 0) return;

        if (confirm(`CẢNH BÁO: Bạn có chắc muốn xóa ${selectedCustomers.length} khách hàng đã chọn? Hành động này không thể hoàn tác!`)) {
            console.log('Deleting customers:', selectedCustomers);
            // Add your deletion logic here
            alert(`Đã xóa ${selectedCustomers.length} khách hàng!`);
            cancelSelection();
        }
    }

    function cancelSelection() {
        const rowCheckboxes = document.querySelectorAll('.row-checkbox');
        const selectAllCheckbox = document.getElementById('selectAllCheckbox');
        const bulkActionsCheckbox = document.getElementById('selectAllCustomers');

        rowCheckboxes.forEach(cb => {
            cb.checked = false;
        });

        selectAllCheckbox.checked = false;
        bulkActionsCheckbox.checked = false;
        selectAllCheckbox.indeterminate = false;
        updateBulkActions();
    }

    function getSelectedCustomers() {
        const rowCheckboxes = document.querySelectorAll('.row-checkbox');
        const selected = [];

        rowCheckboxes.forEach((checkbox, index) => {
            if (checkbox.checked) {
                selected.push(index);
            }
        });

        return selected;
    }
</script>
</body>
</html>
