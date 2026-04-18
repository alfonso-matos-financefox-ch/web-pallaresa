(function () {
  'use strict';

  // ----- Mobile nav toggle -----
  document.querySelectorAll('.site-header .container').forEach(function (container) {
    var nav = container.querySelector('.nav');
    if (!nav) return;

    var btn = document.createElement('button');
    btn.className = 'nav-toggle';
    btn.type = 'button';
    btn.setAttribute('aria-label', 'Menú');
    btn.setAttribute('aria-expanded', 'false');
    btn.innerHTML = '<span></span><span></span><span></span>';

    btn.addEventListener('click', function () {
      var open = nav.classList.toggle('open');
      btn.classList.toggle('is-active', open);
      btn.setAttribute('aria-expanded', open ? 'true' : 'false');
      document.body.classList.toggle('nav-open', open);
    });

    container.appendChild(btn);

    // Close menu on link click (same-page anchors included)
    nav.querySelectorAll('a').forEach(function (a) {
      a.addEventListener('click', function () {
        nav.classList.remove('open');
        btn.classList.remove('is-active');
        btn.setAttribute('aria-expanded', 'false');
        document.body.classList.remove('nav-open');
      });
    });
  });

  // Close menu on Esc
  document.addEventListener('keydown', function (e) {
    if (e.key !== 'Escape') return;
    document.querySelectorAll('.nav.open').forEach(function (nav) {
      nav.classList.remove('open');
      document.body.classList.remove('nav-open');
      var btn = nav.parentElement.querySelector('.nav-toggle');
      if (btn) {
        btn.classList.remove('is-active');
        btn.setAttribute('aria-expanded', 'false');
      }
    });
  });
})();
