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

        // Tô đậm mục theo vùng đang xem
        const sections = [...document.querySelectorAll('.section-block')];
        const links = [...document.querySelectorAll('.subnav-link')];
        const map = Object.fromEntries(links.map(l => [l.getAttribute('href'), l]));

        const onScroll = () => {
            let current = null;
            const y = window.scrollY + 140; // offset cho header
            sections.forEach(s => {
                if (s.offsetTop <= y) current = '#' + s.id;
            });
            links.forEach(l => l.classList.remove('active'));
            if (current && map[current]) map[current].classList.add('active');
        };
        document.addEventListener('scroll', onScroll, { passive: true });
        onScroll();

    // scrip con mắt ẩn hiện mật khẩu
  (function initPasswordToggles() {
    document.querySelectorAll('.password-field .eye-icon').forEach(eye => {
      const field = eye.closest('.password-field');
      if (!field) return;
      const input = field.querySelector('input');
      if (!input) return;

      eye.addEventListener('click', () => {
        const isHidden = input.type === 'password';
        input.type = isHidden ? 'text' : 'password';

        const icon = eye.querySelector('i');
        if (icon) {
          icon.classList.toggle('fa-eye-slash', isHidden);
          icon.classList.toggle('fa-eye', !isHidden);
        }

        // Hiệu ứng màu con mắt (tuỳ chọn)
        eye.style.color = isHidden ? '#28a745' : '#6b7280';
      });
    });
  })();


