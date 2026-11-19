<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="true" %>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
(function () {
  'use strict';
  const esc = s => String(s).replace(/[&<>"']/g, c => ({ '&': '&amp;', '<': '&lt;', '>': '&gt;', '"': '&quot;', "'": '&#39;' }[c]));
  const norm = s => String(s).normalize('NFD').replace(/[\u0300-\u036f]/g, '').toLowerCase();
  const moneda = n => new Intl.NumberFormat('es-MX', { style: 'currency', currency: 'MXN', maximumFractionDigits: 0 }).format(n);
  const fecha = iso => {
    const valor = String(iso || '');
    const d = valor.includes('T') ? new Date(valor) : new Date(valor + 'T00:00:00');
    return d.toLocaleDateString('es-MX', { day: 'numeric', month: 'long', year: 'numeric' });
  };

  const TELAS = { algodon: 'Algodón', poliester: 'Poliéster', mezcla: 'Mezcla' };
  const ESTILOS = { clasica: 'Clásica', oversize: 'Oversize', 'manga-larga': 'Manga larga' };
  const COLORES = { negro: 'Negro', blanco: 'Blanco', morado: 'Morado', rosa: 'Rosa', cian: 'Cian' };
  const EXTRA = { tela: { algodon: 0, poliester: 20, mezcla: 40 }, estilo: { clasica: 0, oversize: 40, 'manga-larga': 60 }, talla: { ch: 0, m: 0, g: 10, xg: 20 }, estampado: 50 };
  const PRODUCTOS = window.XF_PRODUCTOS_BD || [
    { id: 1, nombre: 'Playera Neón', tipo: 'playera', tela: 'algodon', color: 'morado', base: 180 },
    { id: 2, nombre: 'Playera Medianoche', tipo: 'playera', tela: 'algodon', color: 'negro', base: 180 },
    { id: 3, nombre: 'Playera Flamingo', tipo: 'playera', tela: 'algodon', color: 'rosa', base: 190 },
    { id: 4, nombre: 'Playera Océano', tipo: 'playera', tela: 'poliester', color: 'cian', base: 200 },
    { id: 5, nombre: 'Sudadera Violeta', tipo: 'sudadera', tela: 'algodon', color: 'morado', base: 380 },
    { id: 6, nombre: 'Sudadera Noche', tipo: 'sudadera', tela: 'mezcla', color: 'negro', base: 400 },
    { id: 7, nombre: 'Playera Sport Rosa', tipo: 'playera', tela: 'poliester', color: 'rosa', base: 210 },
    { id: 8, nombre: 'Sudadera Cian', tipo: 'sudadera', tela: 'poliester', color: 'cian', base: 390 }
  ];

  function mensaje(i) {
    if (i.validity.customError) return i.validationMessage;
    if (i.validity.valueMissing) return i.type === 'checkbox' ? 'Debes aceptar para continuar' : 'Este campo es obligatorio';
    if (i.validity.typeMismatch) return 'Escribe un correo válido';
    if (i.validity.tooShort) return 'Mínimo ' + i.minLength + ' caracteres';
    return i.validationMessage;
  }
  function validar(form) {
    form.classList.add('was-validated');
    form.querySelectorAll('input').forEach(i => {
      const caja = i.closest('.form-floating, .form-check') || i.parentElement;
      let f = caja.nextElementSibling;
      if (!f || !f.classList.contains('invalid-feedback')) { f = document.createElement('div'); f.className = 'invalid-feedback'; caja.after(f); }
      f.textContent = mensaje(i); f.classList.toggle('d-block', !i.checkValidity());
      if (!i.dataset.vivo) { i.dataset.vivo = 1; i.addEventListener('input', () => validar(form)); }
    });
    return form.checkValidity();
  }
  const alerta = (el, tipo, html) => { el.innerHTML = '<div class="alert alert-' + tipo + '" role="alert">' + html + '</div>'; };

  window.XF = { esc, norm, moneda, fecha, TELAS, ESTILOS, COLORES, EXTRA, PRODUCTOS, validar, alerta };
})();
</script>
