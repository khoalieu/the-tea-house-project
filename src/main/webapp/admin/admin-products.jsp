<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
            <!-- Page Header -->
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
            
            <!-- Filters -->
            <div class="filters-section">
                <div class="filters-grid">
                    <div class="filter-group">
                        <label for="category-filter">Danh mục</label>
                        <select id="category-filter" class="form-select">
                            <option value="">Tất cả danh mục</option>
                            <option value="tra-sua-nguyen-lieu">Trà sữa nguyên liệu</option>
                            <option value="tra-thao-moc">Trà thảo mộc</option>
                            <option value="bot-pha-che">Bột pha chế</option>
                            <option value="phu-kien">Phụ kiện</option>
                        </select>
                    </div>
                    
                    <div class="filter-group">
                        <label for="status-filter">Trạng thái</label>
                        <select id="status-filter" class="form-select">
                            <option value="">Tất cả trạng thái</option>
                            <option value="active">Đang bán</option>
                            <option value="inactive">Ngừng bán</option>
                            <option value="out-of-stock">Hết hàng</option>
                        </select>
                    </div>
                    
                    <div class="filter-group">
                        <label for="price-filter">Khoảng giá</label>
                        <select id="price-filter" class="form-select">
                            <option value="">Tất cả giá</option>
                            <option value="0-50000">Dưới 50.000₫</option>
                            <option value="50000-100000">50.000₫ - 100.000₫</option>
                            <option value="100000-200000">100.000₫ - 200.000₫</option>
                            <option value="200000+">Trên 200.000₫</option>
                        </select>
                    </div>
                    
                    <div class="filter-group">
                        <label for="sort-filter">Sắp xếp</label>
                        <select id="sort-filter" class="form-select">
                            <option value="newest">Mới nhất</option>
                            <option value="oldest">Cũ nhất</option>
                            <option value="name-asc">Tên A-Z</option>
                            <option value="name-desc">Tên Z-A</option>
                            <option value="price-asc">Giá thấp đến cao</option>
                            <option value="price-desc">Giá cao đến thấp</option>
                        </select>
                    </div>
                </div>
            </div>
            
            <!-- Bulk Actions Bar -->
            <div class="bulk-actions-bar" id="bulkActionsBar">
                <input type="checkbox" class="product-checkbox" id="selectAllProducts">
                <span class="bulk-actions-info">
                    <strong id="selectedCount">0</strong> sản phẩm được chọn
                </span>
                <div class="bulk-actions-buttons">
                    <button class="btn-bulk btn-bulk-quick-discount" onclick="openQuickDiscountModal()">
                        <i class="fas fa-percentage"></i>
                        Giảm giá nhanh
                    </button>
                    <button class="btn-bulk btn-bulk-promo" onclick="openPromoModal()">
                        <i class="fas fa-tags"></i>
                        Thêm vào KM
                    </button>
                    <button class="btn-bulk btn-bulk-activate" onclick="bulkActivate()">
                        <i class="fas fa-check-circle"></i>
                        Kích hoạt
                    </button>
                    <button class="btn-bulk btn-bulk-deactivate" onclick="bulkDeactivate()">
                        <i class="fas fa-ban"></i>
                        Ngừng bán
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
            
            <!-- Products Container -->
            <div class="products-container">
                <div class="table-header">
                    <div class="products-count">Tổng cộng: <strong>24 sản phẩm</strong></div>
                </div>
                
                <!-- Products Table -->
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
                                <th style="width: 150px;">Danh mục</th>
                                <th style="width: 120px;">Giá bán</th>
                                <th style="width: 100px;">Tồn kho</th>
                                <th style="width: 120px;">Trạng thái</th>
                                <th style="width: 150px; text-align: center;">Hành động</th>
                            </tr>
                        </thead>
                        <tbody>
                            <!-- Product 1 -->
                            <tr>
                                <td>
                                    <input type="checkbox" class="product-checkbox row-checkbox" onchange="updateBulkActions()">
                                </td>
                                <td>
                                    <img src="../assets/images/san-pham-tra-bac-ha.jpg" alt="Trà Bạc Hà Premium" class="product-image-thumb">
                                </td>
                                <td>
                                    <div class="product-name-cell">Trà Bạc Hà Premium</div>
                                    <div class="product-description-cell">Trà thảo mộc cao cấp</div>
                                </td>
                                <td>TBH001</td>
                                <td>Trà thảo mộc</td>
                                <td>
                                    <div class="product-price-main">85,000₫</div>
                                    <div class="product-price-original">95,000₫</div>
                                </td>
                                <td>
                                    <span class="product-stock-high">156</span>
                                </td>
                                <td>
                                    <span class="status-badge status-confirmed">Đang bán</span>
                                </td>
                                <td>
                                    <div class="action-buttons">
                                        <button class="btn-action" title="Xem chi tiết">
                                            <i class="fas fa-eye"></i>
                                        </button>
                                        <a href="admin-product-edit.jsp" class="btn-action" title="Chỉnh sửa">
                                            <i class="fas fa-edit"></i>
                                        </a>
                                        <button class="btn-action danger" title="Xóa">
                                            <i class="fas fa-trash"></i>
                                        </button>
                                    </div>
                                </td>
                            </tr>
                            
                            <!-- Product 2 -->
                            <tr>
                                <td>
                                    <input type="checkbox" class="product-checkbox row-checkbox" onchange="updateBulkActions()">
                                </td>
                                <td>
                                    <img src="../assets/images/san-pham-tra-gung-mat-ong.jpg" alt="Trà Gừng Mật Ong" class="product-image-thumb">
                                </td>
                                <td>
                                    <div class="product-name-cell">Trà Gừng Mật Ong</div>
                                    <div class="product-description-cell">Trà thảo mộc ấm bụng</div>
                                </td>
                                <td>TGMO002</td>
                                <td>Trà thảo mộc</td>
                                <td>
                                    <div class="product-price-main">75,000₫</div>
                                </td>
                                <td>
                                    <span class="product-stock-high">89</span>
                                </td>
                                <td>
                                    <span class="status-badge status-confirmed">Đang bán</span>
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
                            
                            <!-- Product 3 -->
                            <tr>
                                <td>
                                    <input type="checkbox" class="product-checkbox row-checkbox" onchange="updateBulkActions()">
                                </td>
                                <td>
                                    <img src="../assets/images/san-pham-bot-milk-foam.jpg" alt="Bột Milk Foam Trứng Muối" class="product-image-thumb">
                                </td>
                                <td>
                                    <div class="product-name-cell">Bột Milk Foam Trứng Muối</div>
                                    <div class="product-description-cell">Bột pha chế cao cấp</div>
                                </td>
                                <td>BMFTM003</td>
                                <td>Bột pha chế</td>
                                <td>
                                    <div class="product-price-main">120,000₫</div>
                                </td>
                                <td>
                                    <span class="product-stock-low">5</span>
                                </td>
                                <td>
                                    <span class="status-badge status-confirmed">Đang bán</span>
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
                            
                            <!-- Product 4 -->
                            <tr>
                                <td>
                                    <input type="checkbox" class="product-checkbox row-checkbox" onchange="updateBulkActions()">
                                </td>
                                <td>
                                    <img src="../assets/images/san-pham-tra-atiso.jpg" alt="Trà Atiso Đà Lạt" class="product-image-thumb">
                                </td>
                                <td>
                                    <div class="product-name-cell">Trà Atiso Đà Lạt</div>
                                    <div class="product-description-cell">Trà thảo mộc giải nhiệt</div>
                                </td>
                                <td>TADL004</td>
                                <td>Trà thảo mộc</td>
                                <td>
                                    <div class="product-price-main">65,000₫</div>
                                    <div class="product-price-original">70,000₫</div>
                                </td>
                                <td>
                                    <span class="product-stock-low">0</span>
                                </td>
                                <td>
                                    <span class="status-badge status-cancelled">Hết hàng</span>
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
                            
                            <!-- Product 5 -->
                            <tr>
                                <td>
                                    <input type="checkbox" class="product-checkbox row-checkbox" onchange="updateBulkActions()">
                                </td>
                                <td>
                                    <img src="../assets/images/san-pham-tran-chau-den.jpg" alt="Trân Châu Đen Taiwan" class="product-image-thumb">
                                </td>
                                <td>
                                    <div class="product-name-cell">Trân Châu Đen Taiwan</div>
                                    <div class="product-description-cell">Nguyên liệu pha chế</div>
                                </td>
                                <td>TCDT005</td>
                                <td>Trà sữa nguyên liệu</td>
                                <td>
                                    <div class="product-price-main">45,000₫</div>
                                </td>
                                <td>
                                    <span class="product-stock-high">234</span>
                                </td>
                                <td>
                                    <span class="status-badge status-confirmed">Đang bán</span>
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
                            
                            <!-- Product 6 -->
                            <tr>
                                <td>
                                    <input type="checkbox" class="product-checkbox row-checkbox" onchange="updateBulkActions()">
                                </td>
                                <td>
                                    <img src="../assets/images/san-pham-bot-sua-beo.jpg" alt="Bột Sữa Béo Premium" class="product-image-thumb">
                                </td>
                                <td>
                                    <div class="product-name-cell">Bột Sữa Béo Premium</div>
                                    <div class="product-description-cell">Bột pha chế cao cấp</div>
                                </td>
                                <td>BSB006</td>
                                <td>Bột pha chế</td>
                                <td>
                                    <div class="product-price-main">95,000₫</div>
                                </td>
                                <td>
                                    <span class="product-stock-high">67</span>
                                </td>
                                <td>
                                    <span class="status-badge status-confirmed">Đang bán</span>
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
                        </tbody>
                    </table>
                </div>
                
                <!-- Pagination -->
                <div class="pagination-container">
                    <div class="pagination-info">
                        Hiển thị <strong>1-6</strong> trong tổng số <strong>24</strong> sản phẩm
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
                    <option value="1">🔥 Mừng lễ 8/3 (Giảm 20%)</option>
                    <option value="2">📦 Xả kho cuối tháng (Giảm 50%)</option>
                    <option value="3">☀️ Chào hè 2025 (Mua 1 tặng 1)</option>
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
        
        rowCheckboxes.forEach((checkbox, index) => {
            if (checkbox.checked) {
                selected.push(index);
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

// Đóng modal khi click ra ngoài vùng trắng
window.onclick = function(event) {
    const modal = document.getElementById('quickDiscountModal');
    if (event.target == modal) {
        closeQuickDiscountModal();
    }
}
</script>
</body>
</html>
