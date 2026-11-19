package com.paracode.proyectoweb.controller;

import com.paracode.proyectoweb.model.*;
import com.paracode.proyectoweb.repository.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.List;
import java.util.Map;
import java.util.Optional;

@Controller
public class WebController {

    @Autowired private UsuarioRepository usuarioRepo;
    @Autowired private TipoUsuarioRepository tipoUsuarioRepo;
    @Autowired private DireccionRepository direccionRepo;
    @Autowired private ColorRepository colorRepo;
    @Autowired private TelaRepository telaRepo;
    @Autowired private EstiloRepository estiloRepo;
    @Autowired private CorteRepository corteRepo;
    @Autowired private TallaRepository tallaRepo;
    @Autowired private GaleriaRepository galeriaRepo;
    @Autowired private InventarioRepository inventarioRepo;
    @Autowired private ProductoCatalogoRepository productoCatalogoRepo;
    @Autowired private ProductoGaleriaRepository productoGaleriaRepo;
    @Autowired private ProductoPersonalizadoRepository productoPersonalizadoRepo;
    @Autowired private PedidoRepository pedidoRepo;
    @Autowired private DetallePedidoRepository detallePedidoRepo;

    @GetMapping({"/", "/index", "/inicio"})
    public String inicio(Model model) {
        model.addAttribute("productos", productoCatalogoRepo.findAll());
        model.addAttribute("productosGaleria", productoGaleriaRepo.findAll());
        return "index";
    }

    @GetMapping({"/signIn", "/login", "/iniciarSesion"})
    public String vistaSignIn() {
        return "signIn";
    }

    @PostMapping({"/signIn", "/login", "/iniciarSesion"})
    public String procesarSignIn(@RequestParam Map<String, String> params, HttpSession session, Model model) {
        String correo = obtenerParametro(params, "correo", "email", "usuario");
        String contrasena = obtenerParametro(params, "contrasena", "password", "clave");
        String volver = obtenerParametro(params, "volver");

        Optional<Usuario> usuarioOpt = usuarioRepo.findByCorreoAndContrasena(
                correo != null ? correo.toLowerCase() : "", contrasena);
        if (usuarioOpt.isPresent() && Boolean.TRUE.equals(usuarioOpt.get().getEstado())) {
            Usuario u = usuarioOpt.get();
            session.setAttribute("usuarioLogueado", u);
            session.setAttribute("idUsuario", u.getIdUsuario());
            session.setAttribute("nombreUsuario", u.getNombre());
            if (volver != null && volver.matches("[\\w-]+\\.jsp")) {
                return "redirect:/" + volver;
            }
            return "redirect:/index.jsp";
        }

        model.addAttribute("error", "Correo o contraseña incorrectos.");
        return "signIn";
    }

    @GetMapping({"/signUp", "/registro", "/registrar"})
    public String vistaSignUp() {
        return "signUp";
    }

    @PostMapping({"/signUp", "/registro", "/registrar"})
    public String procesarSignUp(@RequestParam Map<String, String> params, HttpSession session, Model model) {
        String nombre = obtenerParametro(params, "nombre", "name");
        String correo = obtenerParametro(params, "correo", "email");
        String contrasena = obtenerParametro(params, "contrasena", "password", "clave");

        if (correo == null || correo.isBlank() || usuarioRepo.findByCorreo(correo.toLowerCase()).isPresent()) {
            model.addAttribute("error", "Ya existe una cuenta con ese correo.");
            return "signUp";
        }

        Usuario nuevo = new Usuario();
        nuevo.setNombre(nombre != null ? nombre : "");
        nuevo.setApellidoP(obtenerParametro(params, "apellidoP") != null ? obtenerParametro(params, "apellidoP") : "");
        nuevo.setApellidoM(obtenerParametro(params, "apellidoM") != null ? obtenerParametro(params, "apellidoM") : "");
        nuevo.setCorreo(correo.toLowerCase());
        nuevo.setContrasena(contrasena != null ? contrasena : "");
        nuevo.setTelefono(obtenerParametro(params, "telefono"));
        nuevo.setEstado(true);

        TipoUsuario tipoCliente = tipoUsuarioRepo.findById(2).orElseGet(() -> {
            TipoUsuario t = new TipoUsuario();
            t.setTipo("Cliente");
            return tipoUsuarioRepo.save(t);
        });
        nuevo.setTipoUsuario(tipoCliente);

        Usuario guardado = usuarioRepo.save(nuevo);

        Galeria galeria = new Galeria();
        galeria.setUsuario(guardado);
        galeria.setHistorialCambios("Galería creada el " + LocalDate.now());
        galeriaRepo.save(galeria);

        session.setAttribute("usuarioLogueado", guardado);
        session.setAttribute("idUsuario", guardado.getIdUsuario());
        session.setAttribute("nombreUsuario", guardado.getNombre());

        return "redirect:/index.jsp";
    }

    @GetMapping({"/logout", "/cerrarSesion"})
    public String cerrarSesion(HttpSession session) {
        session.invalidate();
        return "redirect:/index.jsp";
    }

    @GetMapping("/galeria")
    public String vistaGaleria(Model model) {
        model.addAttribute("productosGaleria", productoGaleriaRepo.findAll());
        model.addAttribute("productosCatalogo", productoCatalogoRepo.findAll());
        return "galeria";
    }

    @GetMapping("/personalizar")
    public String vistaPersonalizar(Model model) {
        model.addAttribute("colores", colorRepo.findAll());
        model.addAttribute("telas", telaRepo.findAll());
        model.addAttribute("tallas", tallaRepo.findAll());
        model.addAttribute("estilos", estiloRepo.findAll());
        model.addAttribute("cortes", corteRepo.findAll());
        model.addAttribute("productos", productoCatalogoRepo.findAll());
        return "personalizar";
    }

    @PostMapping({"/personalizar", "/guardarPersonalizado"})
    public String guardarPersonalizado(@RequestParam Map<String, String> params,
                                       HttpServletRequest request,
                                       HttpSession session) {
        Usuario usuario = (Usuario) session.getAttribute("usuarioLogueado");
        if (usuario == null) {
            return "redirect:/signIn.jsp?volver=personalizar.jsp";
        }

        ProductoCatalogo base = resolverProductoCatalogo(params);
        ProductoPersonalizado personalizado = new ProductoPersonalizado();
        personalizado.setUsuario(usuario);
        personalizado.setProductoCatalogo(base);

        List<Galeria> galerias = galeriaRepo.findByUsuarioIdUsuario(usuario.getIdUsuario());
        if (!galerias.isEmpty()) {
            personalizado.setGaleria(galerias.get(0));
        }

        personalizado.setTextoPersonalizado(obtenerParametro(params, "textoPersonalizado", "texto", "descripcion"));
        personalizado.setCostoAnadido(new BigDecimal("50.00"));

        if (request instanceof MultipartHttpServletRequest) {
            MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
            MultipartFile archivo = multipartRequest.getFile("imagen");
            if (archivo != null && !archivo.isEmpty()) {
                try {
                    personalizado.setNombreArchivo(archivo.getOriginalFilename());
                    personalizado.setTipoImagen(archivo.getContentType());
                    personalizado.setEstampado(archivo.getBytes());
                } catch (Exception ignored) {
                }
            }
        }

        ProductoPersonalizado guardado = productoPersonalizadoRepo.save(personalizado);
        crearPedidoAutomatico(usuario, guardado, 1, params);

        return "redirect:/pedidos.jsp";
    }

    @GetMapping("/pedidos")
    public String vistaPedidos(HttpSession session, Model model) {
        Usuario usuario = (Usuario) session.getAttribute("usuarioLogueado");
        if (usuario != null) {
            model.addAttribute("pedidos", pedidoRepo.findByUsuarioIdUsuarioOrderByIdPedidoDesc(usuario.getIdUsuario()));
        }
        return "pedidos";
    }

    @PostMapping("/pedidos/cancelar")
    public String cancelarPedido(@RequestParam("folio") String folio, HttpSession session) {
        Usuario usuario = (Usuario) session.getAttribute("usuarioLogueado");
        if (usuario == null) {
            return "redirect:/signIn.jsp?volver=pedidos.jsp";
        }
        pedidoRepo.findByFolio(folio).ifPresent(p -> {
            if (p.getUsuario() != null && p.getUsuario().getIdUsuario().equals(usuario.getIdUsuario())) {
                p.setEstadoPedido("cancelado");
                pedidoRepo.save(p);
            }
        });
        return "redirect:/pedidos.jsp";
    }

    @GetMapping("/imagen/{id}")
    @ResponseBody
    public ResponseEntity<byte[]> obtenerImagen(@PathVariable Integer id) {
        Optional<ProductoPersonalizado> opt = productoPersonalizadoRepo.findById(id);
        if (opt.isEmpty() || opt.get().getEstampado() == null) {
            return ResponseEntity.notFound().build();
        }
        ProductoPersonalizado pp = opt.get();
        MediaType mediaType = (pp.getTipoImagen() != null && !pp.getTipoImagen().isBlank())
                ? MediaType.parseMediaType(pp.getTipoImagen())
                : MediaType.IMAGE_PNG;
        return ResponseEntity.ok()
                .header(HttpHeaders.CONTENT_TYPE, mediaType.toString())
                .body(pp.getEstampado());
    }

    private void crearPedidoAutomatico(Usuario usuario,
                                       ProductoPersonalizado pers,
                                       int cantidad,
                                       Map<String, String> params) {
        Direccion dir = guardarDireccionDesdeParams(usuario, params);

        Pedido pedido = new Pedido();
        pedido.setUsuario(usuario);
        pedido.setDireccion(dir);
        pedido.setFchConfirmacion(LocalDate.now());
        pedido.setFchEntrega(LocalDate.now().plusDays(5));
        pedido.setEstadoPedido("produccion");

        BigDecimal total = new BigDecimal("180.00");
        String totalParam = obtenerParametro(params, "total");
        if (totalParam != null && !totalParam.isBlank()) {
            try {
                total = new BigDecimal(totalParam);
            } catch (NumberFormatException ignored) {
            }
        }
        pedido.setTotal(total);

        Pedido pedidoGuardado = pedidoRepo.save(pedido);
        pedidoGuardado.setFolio(String.format("XF-%05d", pedidoGuardado.getIdPedido()));
        pedidoGuardado = pedidoRepo.save(pedidoGuardado);

        DetallePedido detalle = new DetallePedido();
        detalle.setPedido(pedidoGuardado);
        detalle.setProductoPersonalizado(pers);
        detalle.setCantidad(cantidad);
        detalle.setSubtotal(total);

        List<Inventario> inventarios = inventarioRepo.findAll();
        if (!inventarios.isEmpty()) {
            Inventario inv = inventarios.get(0);
            detalle.setInventario(inv);
            if (inv.getCantidadDisponible() != null && inv.getCantidadDisponible() >= cantidad) {
                inv.setCantidadDisponible(inv.getCantidadDisponible() - cantidad);
                inv.setFchActualizacion(LocalDate.now());
                inventarioRepo.save(inv);
            }
        }

        detallePedidoRepo.save(detalle);
    }

    private Direccion guardarDireccionDesdeParams(Usuario usuario, Map<String, String> params) {
        List<Direccion> existentes = direccionRepo.findByUsuarioIdUsuario(usuario.getIdUsuario());
        if (!existentes.isEmpty()) {
            return existentes.get(0);
        }
        Direccion porDefecto = new Direccion();
        porDefecto.setUsuario(usuario);
        porDefecto.setCalle("Entrega en taller / Por definir");
        return direccionRepo.save(porDefecto);
    }

    private ProductoCatalogo resolverProductoCatalogo(Map<String, String> params) {
        ProductoCatalogo nuevo = new ProductoCatalogo();
        nuevo.setNombre("Playera Personalizada");
        nuevo.setTipoPrenda("playera");
        nuevo.setCostoBase(new BigDecimal("180.00"));

        String colorParam = obtenerParametro(params, "color");
        if (colorParam != null && !colorParam.isBlank()) {
            colorRepo.findByNombreIgnoreCase(colorParam).ifPresent(nuevo::setColor);
        }
        String telaParam = obtenerParametro(params, "tela");
        if (telaParam != null && !telaParam.isBlank()) {
            String normTela = telaParam.equalsIgnoreCase("algodon") ? "Algodón"
                    : telaParam.equalsIgnoreCase("poliester") ? "Poliéster" : telaParam;
            telaRepo.findByTelaIgnoreCase(normTela).ifPresent(nuevo::setTela);
        }
        String tallaParam = obtenerParametro(params, "talla");
        if (tallaParam != null && !tallaParam.isBlank()) {
            tallaRepo.findByTallaIgnoreCase(tallaParam).ifPresent(nuevo::setTalla);
        }
        String estiloParam = obtenerParametro(params, "estilo");
        if (estiloParam != null && !estiloParam.isBlank()) {
            String normEstilo = estiloParam.equalsIgnoreCase("clasica") ? "Clásica"
                    : estiloParam.equalsIgnoreCase("manga-larga") ? "Manga larga" : estiloParam;
            estiloRepo.findByEstiloIgnoreCase(normEstilo).ifPresent(nuevo::setEstilo);
        }

        return productoCatalogoRepo.save(nuevo);
    }

    private String obtenerParametro(Map<String, String> params, String... claves) {
        for (String clave : claves) {
            if (params.containsKey(clave) && params.get(clave) != null) {
                return params.get(clave).trim();
            }
        }
        return null;
    }
}
