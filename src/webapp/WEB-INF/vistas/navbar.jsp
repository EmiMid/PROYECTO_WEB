<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.paracode.proyectoweb.model.Usuario" %>
<%
  Usuario usuarioNav = (Usuario) session.getAttribute("usuarioLogueado");
%>
<header>
  <nav class="navbar xf-nav navbar-expand-lg sticky-top" data-bs-theme="dark">
    <div class="container-fluid px-lg-5">
      <a class="navbar-brand" href="index.jsp">XFUERA</a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#menu" aria-controls="menu" aria-expanded="false" aria-label="Abrir menú">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="menu">
        <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
        <li class="nav-item">
          <a class="nav-link${param.activo == 'index.jsp' ? ' active' : ''}" href="index.jsp"${param.activo == 'index.jsp' ? ' aria-current="page"' : ''}>Catálogo</a>
        </li>
        <li class="nav-item">
          <a class="nav-link${param.activo == 'galeria.jsp' ? ' active' : ''}" href="galeria.jsp"${param.activo == 'galeria.jsp' ? ' aria-current="page"' : ''}>Galería</a>
        </li>
        <li class="nav-item">
          <a class="nav-link${param.activo == 'personalizar.jsp' ? ' active' : ''}" href="personalizar.jsp"${param.activo == 'personalizar.jsp' ? ' aria-current="page"' : ''}>Personalizar</a>
        </li>
        <li class="nav-item">
          <a class="nav-link${param.activo == 'pedidos.jsp' ? ' active' : ''}" href="pedidos.jsp"${param.activo == 'pedidos.jsp' ? ' aria-current="page"' : ''}>Mis pedidos</a>
        </li>
        </ul>
        <% if (usuarioNav != null) { %>
          <span class="navbar-text text-white me-lg-3 mb-2 mb-lg-0 d-block d-lg-inline">Hola, <%= usuarioNav.getNombre().split(" ")[0] %></span>
          <a id="btn-sesion" class="btn btn-blanco" href="logout">Cerrar sesión</a>
        <% } else { %>
          <a id="btn-sesion" class="btn btn-lima" href="signIn.jsp">Iniciar sesión</a>
        <% } %>
      </div>
    </div>
  </nav>
</header>
