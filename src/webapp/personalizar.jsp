<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" isELIgnored="true" %>
<%@ page import="com.paracode.proyectoweb.model.Usuario" %>
<%
  Usuario usuarioActual = (Usuario) session.getAttribute("usuarioLogueado");
%>
<jsp:include page="/WEB-INF/vistas/cabecera.jsp">
  <jsp:param name="titulo" value="Personalizar"/>
  <jsp:param name="css" value="personalizar"/>
</jsp:include>

<jsp:include page="/WEB-INF/vistas/navbar.jsp">
  <jsp:param name="activo" value="personalizar.jsp"/>
</jsp:include>

<main class="container py-4">
  <form id="form-personalizar" class="row g-4" action="personalizar" method="post" enctype="multipart/form-data">
    <input type="hidden" name="total" id="input-total" value="180">
    <div class="col-lg-7">
      <div class="vista-grande panel" aria-hidden="true">
        <div class="maqueta">
          <div class="camiseta camiseta--negro"></div>
          <div class="zona-diseno">Tu diseño</div>
        </div>
      </div>
    </div>
    <div class="col-lg-5">
      <div class="card xf-card panel p-4">
        <h1 class="display-6 mb-4" id="titulo">Arma tu playera</h1>
        <fieldset class="mb-4">
          <legend class="fs-6 fw-bold mb-2">Tela</legend>
          <div class="d-flex flex-wrap gap-2"><input type="radio" class="btn-check" name="tela" id="tela-algodon" value="algodon" checked><label class="btn btn-opcion" for="tela-algodon">Algodón</label><input type="radio" class="btn-check" name="tela" id="tela-poliester" value="poliester"><label class="btn btn-opcion" for="tela-poliester">Poliéster</label><input type="radio" class="btn-check" name="tela" id="tela-mezcla" value="mezcla"><label class="btn btn-opcion" for="tela-mezcla">Mezcla</label></div>
        </fieldset>
        <fieldset class="mb-4">
          <legend class="fs-6 fw-bold mb-2">Talla</legend>
          <div class="d-flex flex-wrap gap-2"><input type="radio" class="btn-check" name="talla" id="talla-ch" value="ch"><label class="btn btn-opcion" for="talla-ch">CH</label><input type="radio" class="btn-check" name="talla" id="talla-m" value="m" checked><label class="btn btn-opcion" for="talla-m">M</label><input type="radio" class="btn-check" name="talla" id="talla-g" value="g"><label class="btn btn-opcion" for="talla-g">G</label><input type="radio" class="btn-check" name="talla" id="talla-xg" value="xg"><label class="btn btn-opcion" for="talla-xg">XG</label></div>
        </fieldset>
        <fieldset class="mb-4">
          <legend class="fs-6 fw-bold mb-2">Color</legend>
          <div class="d-flex gap-3"><input type="radio" class="btn-check" name="color" id="color-negro" value="negro" checked><label class="muestra muestra--negro" for="color-negro"><span class="visually-hidden">Negro</span></label><input type="radio" class="btn-check" name="color" id="color-blanco" value="blanco"><label class="muestra muestra--blanco" for="color-blanco"><span class="visually-hidden">Blanco</span></label><input type="radio" class="btn-check" name="color" id="color-morado" value="morado"><label class="muestra muestra--morado" for="color-morado"><span class="visually-hidden">Morado</span></label><input type="radio" class="btn-check" name="color" id="color-rosa" value="rosa"><label class="muestra muestra--rosa" for="color-rosa"><span class="visually-hidden">Rosa</span></label><input type="radio" class="btn-check" name="color" id="color-cian" value="cian"><label class="muestra muestra--cian" for="color-cian"><span class="visually-hidden">Cian</span></label></div>
        </fieldset>
        <fieldset class="mb-4">
          <legend class="fs-6 fw-bold mb-2">Estilo</legend>
          <div class="d-flex flex-wrap gap-2"><input type="radio" class="btn-check" name="estilo" id="estilo-clasica" value="clasica" checked><label class="btn btn-opcion" for="estilo-clasica">Clásica</label><input type="radio" class="btn-check" name="estilo" id="estilo-oversize" value="oversize"><label class="btn btn-opcion" for="estilo-oversize">Oversize</label><input type="radio" class="btn-check" name="estilo" id="estilo-manga-larga" value="manga-larga"><label class="btn btn-opcion" for="estilo-manga-larga">Manga larga</label></div>
        </fieldset>
        <div class="zona-subida text-center p-4 mb-4">
          <p class="fw-bold mb-1">Sube tu imagen</p>
          <p class="small mb-3">Revisamos calidad y contenido. Ajusta el tamaño a tu talla.</p>
          <label class="btn btn-morado" for="imagen">Elegir archivo</label><input class="visually-hidden" type="file" id="imagen" name="imagen" accept="image/*">
          <p id="msg-archivo" class="small mt-2 mb-0" role="status"></p>
        </div>
        <div class="d-flex justify-content-between align-items-center border-top pt-4 gap-3">
          <div><span class="small d-block">Total estimado</span><output class="fs-2 fw-bold" id="total">$[PRECIO]</output></div>
          <button type="submit" class="btn btn-lima btn-lg">Continuar al pago</button>
        </div>
      </div>
    </div>
  </form>
</main>

<div class="modal fade" id="modal-pago" tabindex="-1" aria-labelledby="t-pago" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content panel">
      <div class="modal-header border-0">
        <h2 class="modal-title h4" id="t-pago">Confirma tu pedido</h2>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Cerrar"></button>
      </div>
      <div class="modal-body">
        <dl class="row mb-0" id="resumen"></dl>
      </div>
      <div class="modal-footer border-0"><button type="button" class="btn btn-opcion" data-bs-dismiss="modal">Seguir editando</button><button type="button" class="btn btn-lima" id="confirmar">Confirmar pedido</button></div>
    </div>
  </div>
</div>

<jsp:include page="/WEB-INF/vistas/pie.jsp"/>

<jsp:include page="/WEB-INF/vistas/scripts.jsp"/>

<script>
(function () {
  'use strict';
  const haySesion = <%= usuarioActual != null %>;
  const { EXTRA, PRODUCTOS, TELAS, ESTILOS, COLORES, moneda, esc } = XF;
  const f = document.getElementById('form-personalizar');
  const salida = f.querySelector('output');
  const inputTotal = document.getElementById('input-total');
  const zona = f.querySelector('.zona-diseno');
  const entrada = document.getElementById('imagen');
  const val = n => f.querySelector(`input[name="${n}"]:checked`).value;
  const marcar = (n, v) => { const i = document.getElementById(n + '-' + v); if (i) i.checked = true; };
  const msg = document.createElement('p'); msg.className = 'small mt-3 mb-0'; msg.setAttribute('role', 'status');
  f.querySelector('.zona-subida').append(msg);
  const alertaEl = document.createElement('div'); alertaEl.setAttribute('aria-live', 'polite');
  f.querySelector('.border-top').before(alertaEl);
  let base = 180, archivo = null, url = null;

  const prod = PRODUCTOS.find(p => p.id === +new URLSearchParams(location.search).get('producto'));
  if (prod) { base = prod.base - EXTRA.tela[prod.tela]; marcar('tela', prod.tela); marcar('color', prod.color); }

  const total = () => base + EXTRA.tela[val('tela')] + EXTRA.estilo[val('estilo')] + EXTRA.talla[val('talla')] + (archivo ? EXTRA.estampado : 0);
  const precio = () => {
    const t = total();
    salida.textContent = moneda(t);
    inputTotal.value = t;
  };
  f.addEventListener('change', e => { if (e.target.name !== 'imagen') precio(); });

  function quitar() {
    if (url) URL.revokeObjectURL(url);
    url = archivo = null; entrada.value = ''; zona.textContent = 'Tu diseño'; zona.classList.remove('tiene-imagen'); msg.textContent = ''; precio();
  }
  entrada.addEventListener('change', () => {
    const a = entrada.files[0]; if (!a) return quitar();
    if (!/^image\/(png|jpe?g|webp)$/.test(a.type)) { quitar(); msg.className = 'small mt-3 mb-0 text-danger'; msg.textContent = 'Usa una imagen PNG, JPG o WebP.'; return; }
    if (a.size > 5 * 1024 * 1024) { quitar(); msg.className = 'small mt-3 mb-0 text-danger'; msg.textContent = 'La imagen pesa más de 5 MB.'; return; }
    if (url) URL.revokeObjectURL(url);
    archivo = a; url = URL.createObjectURL(a);
    const img = new Image(); img.alt = ''; img.src = url;
    img.onload = () => {
      msg.className = 'small mt-3 mb-0' + (img.naturalWidth < 600 ? ' text-warning-emphasis' : '');
      msg.innerHTML = esc(a.name) + (img.naturalWidth < 600 ? '. Resolución baja: podría verse pixelada.' : '') + ' <button type="button" class="btn btn-link btn-sm p-0 align-baseline">Quitar</button>';
      msg.querySelector('button').addEventListener('click', quitar);
    };
    zona.textContent = ''; zona.append(img); zona.classList.add('tiene-imagen'); precio();
  });

  const modalEl = document.getElementById('modal-pago');
  const modal = bootstrap.Modal.getOrCreateInstance(modalEl);
  const resumen = document.getElementById('resumen');
  f.addEventListener('submit', e => {
    e.preventDefault(); alertaEl.innerHTML = '';
    if (!haySesion) return XF.alerta(alertaEl, 'warning', 'Inicia sesión para continuar con tu pedido. <a class="alert-link" href="signIn.jsp?volver=personalizar.jsp">Iniciar sesión</a>');
    if (!archivo) return XF.alerta(alertaEl, 'danger', 'Sube tu imagen para continuar.');
    const fila = (k, v) => `<dt class="col-5 fw-normal">${k}</dt><dd class="col-7 fw-bold">${v}</dd>`;
    resumen.innerHTML = fila('Tela', TELAS[val('tela')]) + fila('Talla', val('talla').toUpperCase()) + fila('Color', COLORES[val('color')]) + fila('Estilo', ESTILOS[val('estilo')]) + fila('Imagen', esc(archivo.name)) + fila('Total', moneda(total()));
    modal.show();
  });
  document.getElementById('confirmar').addEventListener('click', () => {
    f.submit();
  });
  precio();
})();
</script>
</body>
</html>
