<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" isELIgnored="true" %>
<%@ page import="java.util.List" %>
<%@ page import="com.paracode.proyectoweb.model.ProductoCatalogo" %>
<%@ page import="com.paracode.proyectoweb.repository.ProductoCatalogoRepository" %>
<%@ page import="org.springframework.web.context.WebApplicationContext" %>
<%@ page import="org.springframework.web.context.support.WebApplicationContextUtils" %>
<%
  List<ProductoCatalogo> listaProductos = (List<ProductoCatalogo>) request.getAttribute("productos");
  if (listaProductos == null) {
    WebApplicationContext ctx = WebApplicationContextUtils.getWebApplicationContext(application);
    if (ctx != null) {
      listaProductos = ctx.getBean(ProductoCatalogoRepository.class).findAll();
    }
  }
%>
<jsp:include page="/WEB-INF/vistas/cabecera.jsp">
  <jsp:param name="titulo" value="Catálogo"/>
  <jsp:param name="css" value="index"/>
</jsp:include>

<jsp:include page="/WEB-INF/vistas/navbar.jsp">
  <jsp:param name="activo" value="index.jsp"/>
</jsp:include>

<main class="container py-4">
  <section class="hero panel p-4 p-md-5 mb-4">
    <div class="row align-items-center g-4">
      <div class="col-md-7">
        <h1>Playeras con tu <span class="resalte">idea</span>, estampadas.</h1>
        <div class="d-flex flex-wrap gap-3 mt-4"><a class="btn btn-lima btn-lg" href="personalizar.jsp">Personaliza la tuya</a><a class="btn btn-blanco btn-lg" href="galeria.jsp">Ver galería</a></div>
      </div>
      <div class="col-md-5 d-flex justify-content-center" aria-hidden="true">
        <div class="camiseta camiseta--morado"></div>
      </div>
    </div>
  </section>
  <section class="d-flex flex-wrap align-items-center gap-2 mb-4" aria-label="Filtros del catálogo">
    <form class="buscador" role="search"><label class="visually-hidden" for="q">Buscar</label><input id="q" type="search" class="form-control rounded-pill" placeholder="Buscar playeras y estilos"></form>
    <button type="button" class="btn btn-opcion active" aria-pressed="true">Todas</button><button type="button" class="btn btn-opcion" aria-pressed="false">Playeras</button><button type="button" class="btn btn-opcion" aria-pressed="false">Sudaderas</button>
  </section>
  <section class="row row-cols-1 row-cols-sm-2 row-cols-lg-4 g-3" id="productos" aria-label="Productos">
  </section>
  <p id="vacio" class="d-none text-center py-5" role="status">No encontramos playeras con ese filtro. Prueba con otra búsqueda.</p>
  <section class="mt-5">
    <div class="d-flex justify-content-between align-items-baseline mb-3">
      <h2 class="h3 mb-0">Galería de trabajos</h2>
      <a href="galeria.jsp">Ver todo</a>
    </div>
    <div class="row row-cols-2 row-cols-lg-4 g-3" aria-hidden="true">
      <div class="col">
        <div class="bloque bloque--morado"></div>
      </div>
      <div class="col">
        <div class="bloque bloque--rosa"></div>
      </div>
      <div class="col">
        <div class="bloque bloque--cian"></div>
      </div>
      <div class="col">
        <div class="bloque bloque--lima"></div>
      </div>
    </div>
  </section>
</main>

<jsp:include page="/WEB-INF/vistas/pie.jsp"/>

<script>
window.XF_PRODUCTOS_BD = [
<% if (listaProductos != null) {
     boolean primero = true;
     for (ProductoCatalogo p : listaProductos) {
       if (p.getNombre() == null || "Playera Personalizada".equals(p.getNombre())) continue;
       String telaClave = p.getTela() != null ? p.getTela().getTela().toLowerCase().replace("ó", "o").replace("é", "e") : "algodon";
       String colorClave = p.getColor() != null ? p.getColor().getNombre().toLowerCase() : "negro";
       String tipoClave = p.getTipoPrenda() != null ? p.getTipoPrenda() : "playera";
       int basePrecio = p.getCostoBase() != null ? p.getCostoBase().intValue() : 180;
       if (!primero) out.print(",");
       primero = false;
%>
  { id: <%= p.getIdProductoC() %>, nombre: "<%= p.getNombre().replace("\"", "\\\"") %>", tipo: "<%= tipoClave %>", tela: "<%= telaClave %>", color: "<%= colorClave %>", base: <%= basePrecio %> }
<%   }
   } %>
];
</script>

<jsp:include page="/WEB-INF/vistas/scripts.jsp"/>

<script>
(function () {
  'use strict';
  const { PRODUCTOS, TELAS, esc, moneda, norm } = XF;
  const cont = document.querySelector('[aria-label="Productos"]');
  const chips = [...document.querySelectorAll('[aria-label="Filtros del catálogo"] .btn-opcion')];
  const buscador = document.getElementById('q');
  const MAPA = { todas: 'todas', playeras: 'playera', sudaderas: 'sudadera', algodon: 'algodon', poliester: 'poliester' };
  const vacio = document.createElement('p');
  vacio.className = 'text-center py-5 mb-0 d-none'; vacio.setAttribute('role', 'status');
  vacio.textContent = 'No encontramos productos con esos filtros. Prueba otra búsqueda.';
  cont.after(vacio);
  let filtro = 'todas';

  const card = p => `<div class="col"><article class="card xf-card h-100 p-3"><div class="vista mb-3" aria-hidden="true"><div class="camiseta camiseta--${p.color}"></div></div>
<h3 class="h6 mb-1"><a class="stretched-link text-reset text-decoration-none" href="personalizar.jsp?producto=${p.id}">${esc(p.nombre)}</a></h3>
<div class="d-flex justify-content-between align-items-center"><span>Desde ${moneda(p.base)}</span><span class="badge badge-tela">${TELAS[p.tela] || p.tela}</span></div></article></div>`;

  function pintar() {
    const q = norm(buscador.value.trim());
    const l = PRODUCTOS.filter(p => (filtro === 'todas' || p.tipo === filtro || p.tela === filtro) && norm(p.nombre + ' ' + p.tipo + ' ' + (TELAS[p.tela] || p.tela)).includes(q));
    cont.innerHTML = l.map(card).join('');
    vacio.classList.toggle('d-none', l.length > 0);
  }
  chips.forEach(c => c.addEventListener('click', () => {
    filtro = MAPA[norm(c.textContent)] || 'todas';
    chips.forEach(x => { x.classList.toggle('active', x === c); x.setAttribute('aria-pressed', x === c); });
    pintar();
  }));
  buscador.addEventListener('input', pintar);
  buscador.form.addEventListener('submit', e => { e.preventDefault(); pintar(); });
  pintar();
})();
</script>
</body>
</html>
