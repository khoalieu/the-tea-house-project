/* assets/js/main.js */

document.addEventListener('DOMContentLoaded', () => {

    // Chức năng cốt lõi: Tải header và footer
    loadHTMLComponent('header-placeholder', '_header.html');
    loadHTMLComponent('footer-placeholder', '_footer.html');

    // (Gọi các hàm khác ở đây...)

});

async function loadHTMLComponent(elementId, filePath) {
    try {
        const response = await fetch(filePath);
        if (!response.ok) {
            throw new Error(`Không thể tải ${filePath}. 
                             Status: ${response.status}`);
        }
        const htmlContent = await response.text();
        const element = document.getElementById(elementId);
        if (element) {
            element.innerHTML = htmlContent;
        }
    } catch (error) {
        console.error('Lỗi khi tải thành phần HTML:', error);
    }
}