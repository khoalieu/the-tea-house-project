---

## Kiểu Chữ (Typography)

Phần này định nghĩa các font chữ và thang đo kích thước chữ được sử dụng trong toàn bộ dự án.

### 1. Font Chữ (Font Families)

Dự án sử dụng cặp font Lora và Montserrat, được chọn để tạo cảm giác sạch sẽ, hiện đại và chuyên nghiệp, phù hợp với một "digital catalog".

* **Font Tiêu đề (Headings): Lora**
    * Sử dụng cho `<h1>`, `<h2>`, `<h3>`, `<h4>`.
    * **Lý do:** Font Serif "hiền" và hiện đại, có độ cong mềm mại, tạo cảm giác đáng tin cậy, "giáo dục" và tự nhiên.
    * **Biến CSS (sử dụng):** `--font-primary: 'Lora', serif;`

* **Font Văn bản (Body): Montserrat**
    * Sử dụng cho `<p>` và các văn bản nội dung khác.
    * **Lý do:** Font Sans-serif rất sạch sẽ, cấu trúc hình học rõ ràng, mang lại cảm giác hiện đại và ngăn nắp.
    * **Biến CSS (sử dụng):** `--font-body: 'Montserrat', sans-serif;`

#### Đánh giá (QA View):

* **Hỗ trợ Tiếng Việt:** Cả hai font đều hỗ trợ tiếng Việt đầy đủ.
* **Tính dễ đọc:** Montserrat là một trong những font không chân dễ đọc nhất, hoạt động tốt trên cả mobile và desktop.
* **Tính nhất quán:** Cả Lora và Montserrat đều có nhiều trọng lượng (font weight) khác nhau, giúp dễ dàng xây dựng thang đo kích thước chữ.
* **An toàn:** Đây là một cặp đôi "an toàn", đảm bảo tính chuyên nghiệp cho dự án.

### 2. Thang Đo Kiểu Chữ (Typography Scale)

Hệ thống thang đo kích thước chữ được xây dựng dựa trên tỉ lệ **1.25** và kích thước cơ bản là **16px**.

| Element | Font Family | Font Size (rem) | Font Size (px) | Font Weight | Line Height |
| :--- | :--- | :--- | :--- | :--- | :--- |
| `<h1>` | 'Lora', serif | 2.5rem | 40px | 700 (Bold) | 1.2 |
| `<h2>` | 'Lora', serif | 2rem | 32px | 700 (Bold) | 1.2 |
| `<h3>` | 'Lora', serif | 1.563rem | 25px | 700 (Bold) | 1.3 |
| `<h4>` | 'Lora', serif | 1.25rem | 20px | 700 (Bold) | 1.3 |
| `<p>` (Body) | 'Montserrat', sans-serif | 1rem | 16px | 400 (Regular) | 1.5 |
| Small text | 'Montserrat', sans-serif | 0.875rem | 14px | 400 (Regular) | 1.4 |

#### Đánh giá (QA View) - Lý do chọn thang đo này:

* **Dễ đọc:** Kích thước `16px` với `line-height` 1.5 là cực kỳ dễ đọc cho văn bản nội dung.
* **Dễ bảo trì:** Dựa trên một tỉ lệ (1.25), giúp hệ thống dễ dàng điều chỉnh sau này nếu cần.
* **Nhất quán:** Các kích thước (ví dụ 16px, 32px, 40px) và `line-height` (ví dụ `16px * 1.5 = 24px`) tuân thủ "Hệ Thống Khoảng Cách 8px" của dự án, tạo ra sự thống nhất trực quan.
* **Dễ kiểm thử:** Việc sử dụng thang đo chuẩn hóa giúp QA dễ dàng kiểm tra (review code) xem các thành viên có đang sử dụng đúng các giá trị đã định nghĩa hay dùng các "magic number" (số ngẫu nhiên) hay không.
BẢNG MÀU HỆ THỐNG (System Color Tokens)

| Biến CSS                            |Giá trị / Mã màu        | Mô tả / Ứng dụng 
|-------------------------------------|------------------------|----------------------------------------
| `--color-bg`                        | `#ffffff`              | Nền chung toàn bộ trang 

| `--corlor-text`                     | `#191919`              | màu chữ trung cho toàn bộ trang web

| `--color-primary`                   | `#107e84`              | Màu chủ đạo (Primary Brand Color) 

| `--color-wishlist`                  | `#107e84`              | Màu cho biểu tượng yêu thích (Wishlist)

| `--color-second-bg `                | `white`                | Màu nền phụ (container / section nhỏ)

| `--Bbutton-bg`                      | `#107e84`              | Nền cho nút chính (Primary Button)

| `--button-text`                     | `#ffffff`              | Màu chữ của nút chính

| `--button-second-bg`                | `#ffffff`              | Nền của nút phụ (Secondary Button) 

| `--button-second-text`              | `#107e84`              | Màu chữ của nút phụ

| `--color-danger`                    | `#b55f5f`              | Màu cảnh báo(Destructive) 

| `--button-danger-text`              | `#ffffff`              | Màu chữ trên nút cảnh báo 

| `--color-accent`                    | `#107e84`              | Màu nhấn cho icon, border, link 

| `--color-success`                   | `#5c955c`              | Màu trạng thái thành công (Success) 

| `--color-failure`                   | `#b55f5f`              | Màu trạng thái lỗi (Failure) 

    | `--color-alert`                     | `#ff6f00`              | Màu cảnh báo chung (Alert / Warning)  