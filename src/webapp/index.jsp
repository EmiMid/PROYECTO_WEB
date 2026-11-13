<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!doctype html>
<html lang="es">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>XFUERA</title>

  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

  <style>
    body {
      padding-top: 3.5rem;
    }
    .carousel {
      margin-bottom: 4rem;
    }
    .carousel-caption {
      bottom: 3rem;
      z-index: 10;
    }
  </style>
</head>
<body>

  <!-- ================= HEADER / NAVBAR ================= -->
  <header data-bs-theme="dark">
    <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
      <div class="container-fluid">
        <a class="navbar-brand" href="#">XFUERA</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">
          <ul class="navbar-nav me-auto mb-2 mb-md-0">
            <li class="nav-item">
              <a class="nav-link active" aria-current="page" href="#">Inicio</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">Galería</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">Catalogo</a>
            </li>
          </ul>
          <div class="d-flex gap-2">
            <a href="signIn.jsp" class="btn btn-outline-light">Iniciar sesión</a>
          </div>
        </div>
      </div>
    </nav>
  </header>

  <main>
    <!-- ================= CARRUSEL ================= -->
    <div id="myCarousel" class="carousel slide mb-6" data-bs-ride="carousel">
      <div class="carousel-indicators">
        <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
        <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="1" aria-label="Slide 2"></button>
        <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="2" aria-label="Slide 3"></button>
      </div>
      <div class="carousel-inner">

        <!-- Slide 1 -->
        <div class="carousel-item active">
          <img src="https://picsum.photos/1920/600?random=1" class="d-block w-100 object-fit-cover" style="height: 32rem;" alt="Slide 1">
          <div class="container">
            <div class="carousel-caption text-start">
              <h1>Titular de ejemplo.</h1>
              <p class="opacity-75">Texto representativo para la primera diapositiva del carrusel.</p>
              <p><a class="btn btn-lg btn-primary" href="#">Regístrate hoy</a></p>
            </div>
          </div>
        </div>

        <!-- Slide 2 -->
        <div class="carousel-item">
          <img src="https://picsum.photos/1920/600?random=2" class="d-block w-100 object-fit-cover" style="height: 32rem;" alt="Slide 2">
          <div class="container">
            <div class="carousel-caption">
              <h1>Otro titular de ejemplo.</h1>
              <p>Texto representativo para la segunda diapositiva del carrusel.</p>
              <p><a class="btn btn-lg btn-primary" href="#">Saber más</a></p>
            </div>
          </div>
        </div>

        <!-- Slide 3 -->
        <div class="carousel-item">
          <img src="https://picsum.photos/1920/600?random=3" class="d-block w-100 object-fit-cover" style="height: 32rem;" alt="Slide 3">
          <div class="container">
            <div class="carousel-caption text-end">
              <h1>Uno más por si acaso.</h1>
              <p>Texto representativo para la tercera diapositiva de este carrusel.</p>
              <p><a class="btn btn-lg btn-primary" href="#">Ver galería</a></p>
            </div>
          </div>
        </div>
      </div>

      <!-- Controles del carrusel -->
      <button class="carousel-control-prev" type="button" data-bs-target="#myCarousel" data-bs-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Anterior</span>
      </button>
      <button class="carousel-control-next" type="button" data-bs-target="#myCarousel" data-bs-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Siguiente</span>
      </button>
    </div>


    <!-- ================= CONTENIDO DE MARKETING ================= -->
    <div class="container marketing mt-5">

    <div class="row justify-content-left mb-5">
        <div class="col-md-3">
          <form class="d-flex" role="search">
            <input class="form-control me-2" type="search" placeholder="Buscar catálogo..." aria-label="Search" />
            <button class="btn btn-outline-success" type="submit">Buscar</button>
          </form>
        </div>
      </div>

      <!-- Tres columnas -->
      <div class="row text-center">
        <div class="col-lg-4">
          <img src="https://picsum.photos/140/140?random=4" class="rounded-circle mb-3 object-fit-cover" width="140" height="140" alt="Placeholder">
          <h2 class="fw-normal">Encabezado</h2>
          <p>Contenido representativo para las tres columnas de texto debajo del carrusel. Esta es la primera.</p>
          <p><a class="btn btn-secondary" href="#">Ver detalles &raquo;</a></p>
        </div>
        <div class="col-lg-4">
          <img src="https://picsum.photos/140/140?random=5" class="rounded-circle mb-3 object-fit-cover" width="140" height="140" alt="Placeholder">
          <h2 class="fw-normal">Encabezado</h2>
          <p>Otro texto interesante. Esta vez hemos pasado a la segunda columna del diseño.</p>
          <p><a class="btn btn-secondary" href="#">Ver detalles &raquo;</a></p>
        </div>
        <div class="col-lg-4">
          <img src="https://picsum.photos/140/140?random=6" class="rounded-circle mb-3 object-fit-cover" width="140" height="140" alt="Placeholder">
          <h2 class="fw-normal">Encabezado</h2>
          <p>Y por último, la tercera columna de contenido. Un texto de relleno para visualizar.</p>
          <p><a class="btn btn-secondary" href="#">Ver detalles &raquo;</a></p>
        </div>
      </div>

      <hr class="featurette-divider my-5" />

      <!-- Secciones Featurettes -->
      <div class="row featurette align-items-center">
        <div class="col-md-7">
          <h2 class="featurette-heading fw-normal lh-1">Primer título destacado. <span class="text-body-secondary">Te sorprenderá.</span></h2>
          <p class="lead">Excelente contenido de marcador de posición para la primera sección. Imagina algo emocionante aquí.</p>
        </div>
        <div class="col-md-5">
          <img src="https://picsum.photos/500/500?random=7" class="img-fluid mx-auto rounded" width="500" height="500" alt="Feature">
        </div>
      </div>

      <hr class="featurette-divider my-5" />

      <div class="row featurette align-items-center">
        <div class="col-md-7 order-md-2">
          <h2 class="featurette-heading fw-normal lh-1">Oh sí, es tan bueno. <span class="text-body-secondary">Míralo tú mismo.</span></h2>
          <p class="lead">¿Otra sección? Por supuesto. Más contenido para darte una idea de cómo se vería en el mundo real.</p>
        </div>
        <div class="col-md-5 order-md-1">
          <img src="https://picsum.photos/500/500?random=8" class="img-fluid mx-auto rounded" width="500" height="500" alt="Feature">
        </div>
      </div>

      <hr class="featurette-divider my-5" />

      <div class="row featurette align-items-center">
        <div class="col-md-7">
          <h2 class="featurette-heading fw-normal lh-1">Y por último, este. <span class="text-body-secondary">Jaque mate.</span></h2>
          <p class="lead">Y sí, este es el último bloque de contenido. Simplemente para que veas cómo queda tu propia información.</p>
        </div>
        <div class="col-md-5">
          <img src="https://picsum.photos/500/500?random=9" class="img-fluid mx-auto rounded" width="500" height="500" alt="Feature">
        </div>
      </div>

      <hr class="featurette-divider my-5" />
    </div>

    <!-- ================= FOOTER ================= -->
    <footer class="container mb-3">
      <p class="float-end"><a href="#">Volver arriba</a></p>
      <p>&copy; 2026 PARACODE S.A de C.V &middot; </p>
    </footer>
  </main>

  <!-- Bootstrap JS Bundle (Contiene Popper para que funcionen los dropdowns y el carrusel) -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>