<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%--
  Cabecera común. Abre <html>, <head> y <body> (la vista cierra </body></html>).
  Parámetros: titulo = título de la pestaña, css = nombre de la hoja de estilos de la vista (sin .css).
--%>
<!doctype html>
<html lang="es">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>${param.titulo} | XFUERA</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Bricolage+Grotesque:opsz,wght@12..96,800&amp;family=DM+Sans:wght@400;500;700&amp;display=swap" rel="stylesheet">
  <link href="css/${param.css}.css" rel="stylesheet">
</head>
<body>
