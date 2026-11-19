<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" isELIgnored="true" %>
<%@ page import="java.util.List" %>
<%@ page import="com.paracode.proyectoweb.model.*" %>
<%@ page import="com.paracode.proyectoweb.repository.PedidoRepository" %>
<%@ page import="org.springframework.web.context.WebApplicationContext" %>
<%@ page import="org.springframework.web.context.support.WebApplicationContextUtils" %>
<%
  Usuario usuarioPed = (Usuario) session.getAttribute("usuarioLogueado");
  List<Pedido> listaPedidos = (List<Pedido>) request.getAttribute("pedidos");
  if (usuarioPed != null && listaPedidos == null) {
    WebApplicationContext ctx = WebApplicationContextUtils.getWebApplicationContext(application);
    if (ctx != null) {
      listaPedidos = ctx.getBean(PedidoRepository.class).findByUsuarioIdUsuarioOrderByIdPedidoDesc(usuarioPed.getIdUsuario());
    }
  }
%>
<jsp:include page="/WEB-INF/vistas/cabecera.jsp">
  <jsp:param name="titulo" value="Mis pedidos"/>
  <jsp:param name="css" value="pedidos"/>
</jsp:include>

<jsp:include page="/WEB-INF/vistas/navbar.jsp">
  <jsp:param name="activo" value="pedidos.jsp"/>
</jsp:include>

<main class="container py-4">
  <header class="mb-4">
    <h1 class="display-6">Mis pedidos</h1>
  </header>
  <section class="d-flex flex-wrap gap-2 mb-4" aria-label="Filtrar por estado"><button type="button" class="btn btn-opcion active" aria-pressed="true">Todos</button><button type="button" class="btn btn-opcion" aria-pressed="false">En producción</button><button type="button" class="btn btn-opcion" aria-pressed="false">Enviados</button><button type="button" class="btn btn-opcion" aria-pressed="false">Entregados</button></section>
  <section id="lista-pedidos" class="d-grid gap-3" aria-label="Lista de pedidos"></section>
</main>

<div class="modal fade" id="modal-detalle" tabindex="-1" aria-labelledby="t-det" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content panel">
      <div class="modal-header border-0">
        <h2 class="modal-title h4" id="t-det">Detalle del pedido</h2>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Cerrar"></button>
      </div>
      <div class="modal-body">
        <dl class="row mb-0" id="detalle"></dl>
      </div>
      <div class="modal-footer border-0">
        <button type="button" class="btn btn-opcion" data-bs-dismiss="modal">Cerrar</button>
        <form id="form-cancelar" action="pedidos/cancelar" method="post" class="d-inline">
          <input type="hidden" name="folio" id="folio-cancelar" value="">
          <button type="submit" class="btn btn-morado d-none" id="cancelar">Cancelar pedido</button>
        </form>
      </div>
    </div>
  </div>
</div>

<jsp:include page="/WEB-INF/vistas/pie.jsp"/>

<script>
window.XF_SESION_BD = <%= usuarioPed != null ? "{ nombre: \"" + usuarioPed.getNombre().replace("\"", "\\\"") + "\", email: \"" + usuarioPed.getCorreo().replace("\"", "\\\"") + "\" }" : "null" %>;
window.XF_PEDIDOS_BD = [
<% if (listaPedidos != null) {
     boolean primero = true;
     for (Pedido p : listaPedidos) {
       String telaClave = "algodon", tallaClave = "m", colorClave = "negro", estiloClave = "clasica", imagenNombre = "diseno.png";
       int idProductoP = 0;
       if (p.getDetalles() != null && !p.getDetalles().isEmpty() && p.getDetalles().get(0).getProductoPersonalizado() != null) {
         ProductoPersonalizado pp = p.getDetalles().get(0).getProductoPersonalizado();
         idProductoP = pp.getIdProductoP() != null ? pp.getIdProductoP() : 0;
         if (pp.getNombreArchivo() != null) imagenNombre = pp.getNombreArchivo();
         if (pp.getProductoCatalogo() != null) {
           ProductoCatalogo pc = pp.getProductoCatalogo();
           if (pc.getTela() != null) telaClave = pc.getTela().getTela().toLowerCase().replace("ó", "o").replace("é", "e");
           if (pc.getTalla() != null) tallaClave = pc.getTalla().getTalla().toLowerCase();
           if (pc.getColor() != null) colorClave = pc.getColor().getNombre().toLowerCase();
           if (pc.getEstilo() != null) estiloClave = pc.getEstilo().getEstilo().toLowerCase().replace("á", "a").replace(" ", "-");
         }
       }
       int totalPedido = p.getTotal() != null ? p.getTotal().intValue() : 180;
       if (!primero) out.print(",");
       primero = false;
%>
  {
    folio: "<%= p.getFolio() != null ? p.getFolio() : ("XF-" + p.getIdPedido()) %>",
    fecha: "<%= p.getFchConfirmacion() != null ? p.getFchConfirmacion().toString() : "" %>",
    estado: "<%= p.getEstadoPedido() != null ? p.getEstadoPedido() : "produccion" %>",
    tela: "<%= telaClave %>",
    talla: "<%= tallaClave %>",
    color: "<%= colorClave %>",
    estilo: "<%= estiloClave %>",
    imagen: "<%= imagenNombre.replace("\"", "\\\"") %>",
    idProductoP: <%= idProductoP %>,
    total: <%= totalPedido %>
  }
<%   }
   } %>
];
</script>

<jsp:include page="/WEB-INF/vistas/scripts.jsp"/>

<script>
(function () {
  'use strict';
  const { TELAS, ESTILOS, COLORES, esc, moneda, fecha, norm } = XF;
  const lista = document.querySelector('[aria-label="Lista de pedidos"]');
  const chips = [...document.querySelectorAll('[aria-label="Filtrar por estado"] .btn-opcion')];
  const MAPA = { todos: 'todos', 'en produccion': 'produccion', enviados: 'enviado', entregados: 'entregado' };
  const ESTADOS = { produccion: ['En producción', 50], enviado: ['Enviado', 75], entregado: ['Entregado', 100], cancelado: ['Cancelado', 0] };
  const s = window.XF_SESION_BD;
  const mios = window.XF_PEDIDOS_BD || [];
  let filtro = 'todos', actual = null;

  if (!s) {
    document.querySelector('[aria-label="Filtrar por estado"]').classList.add('d-none');
    lista.innerHTML = '<div class="card xf-card p-4 text-center"><p class="mb-3">Inicia sesión para ver tus pedidos.</p><div><a class="btn btn-lima" href="signIn.jsp?volver=pedidos.jsp">Iniciar sesión</a></div></div>';
    return;
  }

  const card = p => { const [t, pr] = ESTADOS[p.estado] || ESTADOS.produccion; return `<article class="card xf-card"><div class="card-body p-3 p-md-4"><div class="row align-items-center g-3">
<div class="col-auto" aria-hidden="true"><div class="vista mini"><div class="camiseta camiseta--${p.color}"></div></div></div>
<div class="col"><h2 class="h5 mb-1">Pedido #${esc(p.folio)}</h2><p class="small mb-2">Realizado el ${fecha(p.fecha)}</p><span class="badge badge-tela">${TELAS[p.tela] || p.tela}</span> <span class="badge badge-tela">${p.talla.toUpperCase()}</span> <span class="badge badge-tela">${ESTILOS[p.estilo] || p.estilo}</span></div>
<div class="col-12 col-md-3"><span class="badge estado estado--${p.estado}">${t}</span><div class="progress mt-2" role="progressbar" aria-label="Avance del pedido" aria-valuenow="${pr}" aria-valuemin="0" aria-valuemax="100"><div class="progress-bar" style="width:${pr}%"></div></div></div>
<div class="col-12 col-md-auto d-flex d-md-block align-items-center justify-content-between text-md-end"><p class="fw-bold fs-5 mb-md-2">${moneda(p.total)}</p><button type="button" class="btn btn-opcion" data-folio="${esc(p.folio)}">Ver detalle</button></div></div></div></article>`; };

  function pintar() {
    const l = mios.filter(p => filtro === 'todos' || p.estado === filtro);
    lista.innerHTML = l.length ? l.map(card).join('') :
      '<div class="card xf-card p-4 text-center"><p class="mb-3">' + (mios.length ? 'No hay pedidos en este estado.' : 'Aún no tienes pedidos.') + '</p><div><a class="btn btn-lima" href="personalizar.jsp">Personaliza la tuya</a></div></div>';
  }
  chips.forEach(c => c.addEventListener('click', () => {
    filtro = MAPA[norm(c.textContent)] || 'todos';
    chips.forEach(x => { x.classList.toggle('active', x === c); x.setAttribute('aria-pressed', x === c); });
    pintar();
  }));

  const modal = bootstrap.Modal.getOrCreateInstance(document.getElementById('modal-detalle'));
  const det = document.getElementById('detalle'), cancelar = document.getElementById('cancelar');
  const folioCancelar = document.getElementById('folio-cancelar');
  lista.addEventListener('click', e => {
    const b = e.target.closest('[data-folio]'); if (!b) return;
    actual = mios.find(p => p.folio === b.dataset.folio);
    const fila = (k, v) => `<dt class="col-5 fw-normal">${k}</dt><dd class="col-7 fw-bold">${v}</dd>`;
    const imgHtml = actual.idProductoP ? `<br><img src="imagen/${actual.idProductoP}" alt="Estampado" class="img-thumbnail mt-1" style="max-height:90px;">` : '';
    det.innerHTML = fila('Folio', esc(actual.folio)) + fila('Fecha', fecha(actual.fecha)) + fila('Estado', (ESTADOS[actual.estado] || ESTADOS.produccion)[0]) + fila('Tela', TELAS[actual.tela] || actual.tela) + fila('Talla', actual.talla.toUpperCase()) + fila('Color', COLORES[actual.color] || actual.color) + fila('Estilo', ESTILOS[actual.estilo] || actual.estilo) + fila('Imagen', esc(actual.imagen) + imgHtml) + fila('Total', moneda(actual.total));
    folioCancelar.value = actual.folio;
    cancelar.classList.toggle('d-none', actual.estado !== 'produccion');
    modal.show();
  });
  document.getElementById('form-cancelar').addEventListener('submit', e => {
    if (!actual || !confirm('¿Cancelar el pedido ' + actual.folio + '?')) e.preventDefault();
  });
  pintar();
})();
</script>
</body>
</html>
