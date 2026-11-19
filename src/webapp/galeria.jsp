<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" isELIgnored="true" %>
<%-- Galería: estructura (HTML), estilos en css/galeria.css y lógica en el <script> del final. --%>
<jsp:include page="/WEB-INF/vistas/cabecera.jsp">
  <jsp:param name="titulo" value="Galería"/>
  <jsp:param name="css" value="galeria"/>
</jsp:include>

<jsp:include page="/WEB-INF/vistas/navbar.jsp">
  <jsp:param name="activo" value="galeria.jsp"/>
</jsp:include>

<main class="container py-4">
  <header class="mb-4">
    <h1 class="display-6">Galería de trabajos</h1>
    <p class="lead mb-0">Playeras que ya salieron de nuestro taller.</p>
  </header>
  <section class="d-flex flex-wrap gap-2 mb-4" aria-label="Filtros de la galería"><button type="button" class="btn btn-opcion active" aria-pressed="true">Todas</button><button type="button" class="btn btn-opcion" aria-pressed="false">Playeras</button><button type="button" class="btn btn-opcion" aria-pressed="false">Sudaderas</button><button type="button" class="btn btn-opcion" aria-pressed="false">Oversize</button><button type="button" class="btn btn-opcion" aria-pressed="false">Manga larga</button></section>
  <section class="row row-cols-2 row-cols-md-3 row-cols-lg-4 g-3" id="trabajos" aria-label="Trabajos">
    <div class="col">
      <article class="card xf-card h-100 p-2">
        <div class="bloque bloque--morado ratio ratio-4x3" role="img" aria-label="Vista previa del trabajo"></div>
        <div class="card-body px-2 pb-2 pt-3 d-flex justify-content-between align-items-center">
          <h2 class="h6 mb-0">[TÍTULO]</h2>
          <span class="badge badge-tela">[TELA]</span>
        </div>
      </article>
    </div>
    <div class="col">
      <article class="card xf-card h-100 p-2">
        <div class="bloque bloque--rosa ratio ratio-4x3" role="img" aria-label="Vista previa del trabajo"></div>
        <div class="card-body px-2 pb-2 pt-3 d-flex justify-content-between align-items-center">
          <h2 class="h6 mb-0">[TÍTULO]</h2>
          <span class="badge badge-tela">[TELA]</span>
        </div>
      </article>
    </div>
    <div class="col">
      <article class="card xf-card h-100 p-2">
        <div class="bloque bloque--cian ratio ratio-4x3" role="img" aria-label="Vista previa del trabajo"></div>
        <div class="card-body px-2 pb-2 pt-3 d-flex justify-content-between align-items-center">
          <h2 class="h6 mb-0">[TÍTULO]</h2>
          <span class="badge badge-tela">[TELA]</span>
        </div>
      </article>
    </div>
    <div class="col">
      <article class="card xf-card h-100 p-2">
        <div class="bloque bloque--lima ratio ratio-4x3" role="img" aria-label="Vista previa del trabajo"></div>
        <div class="card-body px-2 pb-2 pt-3 d-flex justify-content-between align-items-center">
          <h2 class="h6 mb-0">[TÍTULO]</h2>
          <span class="badge badge-tela">[TELA]</span>
        </div>
      </article>
    </div>
    <div class="col">
      <article class="card xf-card h-100 p-2">
        <div class="bloque bloque--morado ratio ratio-4x3" role="img" aria-label="Vista previa del trabajo"></div>
        <div class="card-body px-2 pb-2 pt-3 d-flex justify-content-between align-items-center">
          <h2 class="h6 mb-0">[TÍTULO]</h2>
          <span class="badge badge-tela">[TELA]</span>
        </div>
      </article>
    </div>
    <div class="col">
      <article class="card xf-card h-100 p-2">
        <div class="bloque bloque--rosa ratio ratio-4x3" role="img" aria-label="Vista previa del trabajo"></div>
        <div class="card-body px-2 pb-2 pt-3 d-flex justify-content-between align-items-center">
          <h2 class="h6 mb-0">[TÍTULO]</h2>
          <span class="badge badge-tela">[TELA]</span>
        </div>
      </article>
    </div>
    <div class="col">
      <article class="card xf-card h-100 p-2">
        <div class="bloque bloque--cian ratio ratio-4x3" role="img" aria-label="Vista previa del trabajo"></div>
        <div class="card-body px-2 pb-2 pt-3 d-flex justify-content-between align-items-center">
          <h2 class="h6 mb-0">[TÍTULO]</h2>
          <span class="badge badge-tela">[TELA]</span>
        </div>
      </article>
    </div>
    <div class="col">
      <article class="card xf-card h-100 p-2">
        <div class="bloque bloque--lima ratio ratio-4x3" role="img" aria-label="Vista previa del trabajo"></div>
        <div class="card-body px-2 pb-2 pt-3 d-flex justify-content-between align-items-center">
          <h2 class="h6 mb-0">[TÍTULO]</h2>
          <span class="badge badge-tela">[TELA]</span>
        </div>
      </article>
    </div>
    <div class="col">
      <article class="card xf-card h-100 p-2">
        <div class="bloque bloque--morado ratio ratio-4x3" role="img" aria-label="Vista previa del trabajo"></div>
        <div class="card-body px-2 pb-2 pt-3 d-flex justify-content-between align-items-center">
          <h2 class="h6 mb-0">[TÍTULO]</h2>
          <span class="badge badge-tela">[TELA]</span>
        </div>
      </article>
    </div>
    <div class="col">
      <article class="card xf-card h-100 p-2">
        <div class="bloque bloque--rosa ratio ratio-4x3" role="img" aria-label="Vista previa del trabajo"></div>
        <div class="card-body px-2 pb-2 pt-3 d-flex justify-content-between align-items-center">
          <h2 class="h6 mb-0">[TÍTULO]</h2>
          <span class="badge badge-tela">[TELA]</span>
        </div>
      </article>
    </div>
    <div class="col">
      <article class="card xf-card h-100 p-2">
        <div class="bloque bloque--cian ratio ratio-4x3" role="img" aria-label="Vista previa del trabajo"></div>
        <div class="card-body px-2 pb-2 pt-3 d-flex justify-content-between align-items-center">
          <h2 class="h6 mb-0">[TÍTULO]</h2>
          <span class="badge badge-tela">[TELA]</span>
        </div>
      </article>
    </div>
    <div class="col">
      <article class="card xf-card h-100 p-2">
        <div class="bloque bloque--lima ratio ratio-4x3" role="img" aria-label="Vista previa del trabajo"></div>
        <div class="card-body px-2 pb-2 pt-3 d-flex justify-content-between align-items-center">
          <h2 class="h6 mb-0">[TÍTULO]</h2>
          <span class="badge badge-tela">[TELA]</span>
        </div>
      </article>
    </div>
  </section>
  <p id="vacio" class="d-none text-center py-5" role="status">No hay trabajos con ese filtro.</p>
  <nav class="mt-5 d-flex justify-content-center" aria-label="Paginación">
    <ul class="pagination mb-0" id="paginas">
      <li class="page-item disabled"><span class="page-link">Anterior</span></li>
      <li class="page-item active" aria-current="page"><span class="page-link">1</span></li>
      <li class="page-item"><a class="page-link" href="#">2</a></li>
      <li class="page-item"><a class="page-link" href="#">3</a></li>
      <li class="page-item"><a class="page-link" href="#">Siguiente</a></li>
    </ul>
  </nav>
  <section class="cta panel p-4 p-md-5 mt-5 d-flex flex-wrap justify-content-between align-items-center gap-3">
    <h2 class="h3 mb-0">¿Tienes una idea? Estámpala.</h2>
    <a class="btn btn-lima btn-lg" href="personalizar.jsp">Personaliza la tuya</a>
  </section>
</main>

<jsp:include page="/WEB-INF/vistas/pie.jsp"/>

<jsp:include page="/WEB-INF/vistas/scripts.jsp"/>

<script>
/* Galería: filtros y paginación */
(function () {
  'use strict';
  const { TELAS, ESTILOS, esc, norm } = XF;
  const NOMBRES = ['Neón urbano', 'Grafiti rosa', 'Ola cian', 'Trazo lima', 'Noche violeta', 'Spray', 'Pulso', 'Marea', 'Cometa', 'Barrio', 'Eco', 'Vértigo', 'Fuego frío', 'Rayo', 'Calle 7', 'Latido'];
  const TELA = ['algodon', 'poliester', 'mezcla'], ESTILO = ['clasica', 'oversize', 'manga-larga'], BLOQ = ['morado', 'rosa', 'cian', 'lima'];
  const TRABAJOS = NOMBRES.map((n, i) => ({ titulo: n, tipo: i % 3 === 2 ? 'sudadera' : 'playera', tela: TELA[i % 3], estilo: ESTILO[(i * 2) % 3], bloque: BLOQ[i % 4] }));
  const POR_PAGINA = 8;
  const cont = document.querySelector('[aria-label="Trabajos"]');
  const pag = document.querySelector('nav[aria-label="Paginación"] .pagination');
  const chips = [...document.querySelectorAll('[aria-label="Filtros de la galería"] .btn-opcion')];
  const MAPA = { todas: t => true, playeras: t => t.tipo === 'playera', sudaderas: t => t.tipo === 'sudadera', oversize: t => t.estilo === 'oversize', 'manga larga': t => t.estilo === 'manga-larga' };
  let filtro = 'todas', pagina = 1;

  const card = t => `<div class="col"><article class="card xf-card h-100 p-2"><div class="bloque bloque--${t.bloque} ratio ratio-4x3" role="img" aria-label="Vista previa de ${esc(t.titulo)}"></div>
<div class="card-body px-2 pb-2 pt-3 d-flex justify-content-between align-items-center"><h2 class="h6 mb-0">${esc(t.titulo)}</h2><span class="badge badge-tela">${TELAS[t.tela]}</span></div></article></div>`;

  function pintar() {
    const l = TRABAJOS.filter(MAPA[filtro]);
    const total = Math.max(1, Math.ceil(l.length / POR_PAGINA));
    pagina = Math.min(pagina, total);
    cont.innerHTML = l.slice((pagina - 1) * POR_PAGINA, pagina * POR_PAGINA).map(card).join('');
    let h = `<li class="page-item${pagina === 1 ? ' disabled' : ''}"><a class="page-link" href="#" data-p="${pagina - 1}">Anterior</a></li>`;
    for (let i = 1; i <= total; i++) h += `<li class="page-item${i === pagina ? ' active' : ''}"${i === pagina ? ' aria-current="page"' : ''}><a class="page-link" href="#" data-p="${i}">${i}</a></li>`;
    h += `<li class="page-item${pagina === total ? ' disabled' : ''}"><a class="page-link" href="#" data-p="${pagina + 1}">Siguiente</a></li>`;
    pag.innerHTML = h;
    pag.parentElement.classList.toggle('d-none', total === 1);
  }
  pag.addEventListener('click', e => {
    const a = e.target.closest('a[data-p]'); if (!a) return;
    e.preventDefault(); if (a.parentElement.classList.contains('disabled')) return;
    pagina = +a.dataset.p; pintar(); window.scrollTo({ top: 0, behavior: 'smooth' });
  });
  chips.forEach(c => c.addEventListener('click', () => {
    filtro = norm(c.textContent); pagina = 1;
    chips.forEach(x => { x.classList.toggle('active', x === c); x.setAttribute('aria-pressed', x === c); });
    pintar();
  }));
  pintar();
})();
</script>
</body>
</html>
