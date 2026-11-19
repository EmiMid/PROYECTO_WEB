<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<jsp:include page="/WEB-INF/vistas/cabecera.jsp">
  <jsp:param name="titulo" value="Registrarse"/>
  <jsp:param name="css" value="signUp"/>
</jsp:include>

<main class="container py-4 d-flex align-items-center min-vh-100">
  <div class="card registro w-100">
    <div class="row g-0">
      <div class="col-lg-7 p-4 p-md-5"><a class="marca d-inline-block mb-3 text-decoration-none" href="index.jsp">XFUERA</a>
        <h1 class="h2 mb-4">Crea tu cuenta</h1>
        <form id="form" action="signUp" method="post" novalidate>
          <div id="alerta">
            <% if (request.getAttribute("error") != null) { %>
              <div class="alert alert-danger" role="alert"><%= request.getAttribute("error") %> <a class="alert-link" href="signIn.jsp">Inicia sesión</a></div>
            <% } %>
          </div>
          <div class="form-floating mb-3"><input type="text" class="form-control" id="nombre" name="nombre" placeholder="Nombre" autocomplete="name" required><label for="nombre">Nombre</label>
            <div class="invalid-feedback"></div>
          </div>
          <div class="form-floating mb-3"><input type="email" class="form-control" id="correo" name="correo" placeholder="Correo electrónico" autocomplete="email" required><label for="correo">Correo electrónico</label>
            <div class="invalid-feedback"></div>
          </div>
          <div class="form-floating mb-3"><input type="password" class="form-control" id="clave" name="clave" placeholder="Contraseña" autocomplete="new-password" required><label for="clave">Contraseña</label>
            <div class="invalid-feedback"></div>
          </div>
          <div class="form-floating mb-3"><input type="password" class="form-control" id="clave2" placeholder="Repite tu contraseña" autocomplete="new-password" required><label for="clave2">Repite tu contraseña</label>
            <div class="invalid-feedback"></div>
          </div>
          <div class="form-check mb-4"><input class="form-check-input" type="checkbox" id="terminos" required><label class="form-check-label" for="terminos">Acepto los <a href="#">términos de servicio</a></label>
            <div class="invalid-feedback">Debes aceptar los términos.</div>
          </div>
          <button class="btn btn-lima btn-lg w-100" type="submit">Crear cuenta</button>
        </form>
        <p class="mt-4 mb-0">¿Ya tienes cuenta? <a id="ir-login" href="signIn.jsp">Inicia sesión</a></p>
      </div>
      <div class="col-lg-5 lado d-none d-lg-flex flex-column justify-content-center align-items-center gap-4 p-5 text-center" aria-hidden="true">
        <div class="camiseta camiseta--morado"></div>
        <p class="h3 mb-0">Arma tu primera playera con tu idea.</p>
      </div>
    </div>
  </div>
</main>

<jsp:include page="/WEB-INF/vistas/scripts.jsp"/>

<script>
(function () {
  'use strict';
  const f = document.getElementById('form');
  const clave = f.querySelector('#clave'), clave2 = f.querySelector('#clave2');
  clave.minLength = 8;
  function reglas() {
    clave.setCustomValidity(/[A-Za-z]/.test(clave.value) && /\d/.test(clave.value) ? '' : 'Usa al menos una letra y un número');
    clave2.setCustomValidity(clave2.value === clave.value ? '' : 'Las contraseñas no coinciden');
  }
  f.addEventListener('submit', e => {
    reglas();
    if (!XF.validar(f)) e.preventDefault();
  });
  [clave, clave2].forEach(i => i.addEventListener('input', reglas));
})();
</script>
</body>
</html>
