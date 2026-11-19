<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<jsp:include page="/WEB-INF/vistas/cabecera.jsp">
  <jsp:param name="titulo" value="Iniciar sesión"/>
  <jsp:param name="css" value="signIn"/>
</jsp:include>

<main class="form-signin">
  <div class="card xf-card panel p-4 p-md-5"> <a class="marca d-block text-center mb-4 text-decoration-none" href="index.jsp">XFUERA</a>
    <form id="form" action="signIn" method="post" novalidate>
      <input type="hidden" name="volver" value="<%= request.getParameter("volver") != null ? request.getParameter("volver") : "" %>">
      <h1 class="h3 mb-4 text-center">Introduce los datos de tu cuenta</h1>
      <div id="alerta">
        <% if (request.getAttribute("error") != null) { %>
          <div class="alert alert-danger" role="alert"><%= request.getAttribute("error") %> <a class="alert-link" href="signUp.jsp">¿Necesitas una cuenta?</a></div>
        <% } %>
      </div>
      <div class="form-floating mb-2"><input type="email" class="form-control" id="email" name="email" placeholder="Correo electrónico" autocomplete="email" required autofocus><label for="email">Correo electrónico</label></div>
      <div class="form-floating mb-3"><input type="password" class="form-control" id="clave" name="clave" placeholder="Contraseña" autocomplete="current-password" required><label for="clave">Contraseña</label></div>
      <div class="form-check mb-4"><input class="form-check-input" type="checkbox" value="recordarme" id="recordarme" name="recordarme"><label class="form-check-label" for="recordarme">Recuérdame</label></div>
      <button class="btn btn-lima btn-lg w-100" type="submit">Iniciar sesión</button>
    </form>
    <p class="text-center mt-4 mb-0">¿No tienes cuenta? <a href="signUp.jsp">Regístrate</a></p>
  </div>
</main>

<jsp:include page="/WEB-INF/vistas/scripts.jsp"/>

<script>
(function () {
  'use strict';
  const f = document.getElementById('form');
  f.addEventListener('submit', e => {
    if (!XF.validar(f)) e.preventDefault();
  });
})();
</script>
</body>
</html>
