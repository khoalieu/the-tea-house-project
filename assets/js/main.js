/* assets/js/main.js */
// Cuộn mượt
        document.querySelectorAll('.subnav a[href^="#"]').forEach(a => {
            a.addEventListener('click', e => {
                e.preventDefault();
                const id = a.getAttribute('href');
                const el = document.querySelector(id);
                if (el) el.scrollIntoView({ behavior: 'smooth', block: 'start' });
            });
        });

    
// Toggle ẩn / hiện mật khẩu
(function initPasswordToggles() {
  document.querySelectorAll('.password-field').forEach(field => {
    const input = field.querySelector('input');
    const eye   = field.querySelector('.eye-icon');
    if (!input || !eye) return;

    const icon = eye.querySelector('i');

    eye.addEventListener('click', () => {
      const isHidden = input.type === 'password';
      input.type = isHidden ? 'text' : 'password';

      if (icon) {
        icon.classList.toggle('fa-eye', !isHidden);
        icon.classList.toggle('fa-eye-slash', isHidden);
      }
    });
  });
})();


