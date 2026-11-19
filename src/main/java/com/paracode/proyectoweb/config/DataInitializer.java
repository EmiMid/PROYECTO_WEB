package com.paracode.proyectoweb.config;

import com.paracode.proyectoweb.model.*;
import com.paracode.proyectoweb.repository.*;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;

import java.math.BigDecimal;
import java.time.LocalDate;

@Component
public class DataInitializer implements CommandLineRunner {

    private final TipoUsuarioRepository tipoUsuarioRepo;
    private final ColorRepository colorRepo;
    private final TelaRepository telaRepo;
    private final EstiloRepository estiloRepo;
    private final CorteRepository corteRepo;
    private final TallaRepository tallaRepo;
    private final InventarioRepository inventarioRepo;
    private final ProductoCatalogoRepository productoCatalogoRepo;

    public DataInitializer(TipoUsuarioRepository tipoUsuarioRepo,
                           ColorRepository colorRepo,
                           TelaRepository telaRepo,
                           EstiloRepository estiloRepo,
                           CorteRepository corteRepo,
                           TallaRepository tallaRepo,
                           InventarioRepository inventarioRepo,
                           ProductoCatalogoRepository productoCatalogoRepo) {
        this.tipoUsuarioRepo = tipoUsuarioRepo;
        this.colorRepo = colorRepo;
        this.telaRepo = telaRepo;
        this.estiloRepo = estiloRepo;
        this.corteRepo = corteRepo;
        this.tallaRepo = tallaRepo;
        this.inventarioRepo = inventarioRepo;
        this.productoCatalogoRepo = productoCatalogoRepo;
    }

    @Override
    public void run(String... args) {
        if (tipoUsuarioRepo.count() == 0) {
            TipoUsuario admin = new TipoUsuario();
            admin.setTipo("Administrador");
            tipoUsuarioRepo.save(admin);

            TipoUsuario cliente = new TipoUsuario();
            cliente.setTipo("Cliente");
            tipoUsuarioRepo.save(cliente);
        }

        if (colorRepo.count() == 0) {
            colorRepo.save(crearColor("Negro", "#000000"));
            colorRepo.save(crearColor("Blanco", "#FFFFFF"));
            colorRepo.save(crearColor("Morado", "#6F42C1"));
            colorRepo.save(crearColor("Rosa", "#E83E8C"));
            colorRepo.save(crearColor("Cian", "#0DCAF0"));
        }

        if (telaRepo.count() == 0) {
            telaRepo.save(crearTela("Algodón"));
            telaRepo.save(crearTela("Poliéster"));
            telaRepo.save(crearTela("Mezcla"));
        }

        if (estiloRepo.count() == 0) {
            estiloRepo.save(crearEstilo("Clásica"));
            estiloRepo.save(crearEstilo("Oversize"));
            estiloRepo.save(crearEstilo("Manga larga"));
        }

        if (corteRepo.count() == 0) {
            corteRepo.save(crearCorte("Recto"));
            corteRepo.save(crearCorte("Slim Fit"));
            corteRepo.save(crearCorte("Cuello Redondo"));
            corteRepo.save(crearCorte("Cuello V"));
        }

        if (tallaRepo.count() == 0) {
            tallaRepo.save(crearTalla("CH"));
            tallaRepo.save(crearTalla("M"));
            tallaRepo.save(crearTalla("G"));
            tallaRepo.save(crearTalla("XG"));
        }

        Inventario inv;
        if (inventarioRepo.count() == 0) {
            inv = new Inventario();
            inv.setFchActualizacion(LocalDate.now());
            inv.setCantidadDisponible(200);
            inv = inventarioRepo.save(inv);
        } else {
            inv = inventarioRepo.findAll().get(0);
        }

        if (productoCatalogoRepo.count() == 0) {
            Color negro = colorRepo.findByNombreIgnoreCase("Negro").orElse(null);
            Color morado = colorRepo.findByNombreIgnoreCase("Morado").orElse(null);
            Color rosa = colorRepo.findByNombreIgnoreCase("Rosa").orElse(null);
            Color cian = colorRepo.findByNombreIgnoreCase("Cian").orElse(null);

            Tela algodon = telaRepo.findByTelaIgnoreCase("Algodón").orElse(null);
            Tela poliester = telaRepo.findByTelaIgnoreCase("Poliéster").orElse(null);
            Tela mezcla = telaRepo.findByTelaIgnoreCase("Mezcla").orElse(null);

            Talla tallaM = tallaRepo.findByTallaIgnoreCase("M").orElse(null);
            Estilo clasica = estiloRepo.findByEstiloIgnoreCase("Clásica").orElse(null);
            Estilo oversize = estiloRepo.findByEstiloIgnoreCase("Oversize").orElse(null);
            Corte cuelloRedondo = corteRepo.findByCorteIgnoreCase("Cuello Redondo").orElse(null);

            productoCatalogoRepo.save(crearProducto(inv, morado, algodon, tallaM, clasica, cuelloRedondo, "Playera Neón", "playera", "Playera de algodón en tono morado", "180.00"));
            productoCatalogoRepo.save(crearProducto(inv, negro, algodon, tallaM, clasica, cuelloRedondo, "Playera Medianoche", "playera", "Playera clásica negra de algodón", "180.00"));
            productoCatalogoRepo.save(crearProducto(inv, rosa, algodon, tallaM, clasica, cuelloRedondo, "Playera Flamingo", "playera", "Playera rosa de algodón", "190.00"));
            productoCatalogoRepo.save(crearProducto(inv, cian, poliester, tallaM, clasica, cuelloRedondo, "Playera Océano", "playera", "Playera deportiva cian de poliéster", "200.00"));
            productoCatalogoRepo.save(crearProducto(inv, morado, algodon, tallaM, oversize, cuelloRedondo, "Sudadera Violeta", "sudadera", "Sudadera oversize morada de algodón", "380.00"));
            productoCatalogoRepo.save(crearProducto(inv, negro, mezcla, tallaM, oversize, cuelloRedondo, "Sudadera Noche", "sudadera", "Sudadera negra mezcla de fibras", "400.00"));
            productoCatalogoRepo.save(crearProducto(inv, rosa, poliester, tallaM, clasica, cuelloRedondo, "Playera Sport Rosa", "playera", "Playera ligera rosa de poliéster", "210.00"));
            productoCatalogoRepo.save(crearProducto(inv, cian, poliester, tallaM, oversize, cuelloRedondo, "Sudadera Cian", "sudadera", "Sudadera cian de poliéster", "390.00"));
        }
    }

    private Color crearColor(String nombre, String codigo) {
        Color c = new Color();
        c.setNombre(nombre);
        c.setCodigo(codigo);
        return c;
    }

    private Tela crearTela(String nombre) {
        Tela t = new Tela();
        t.setTela(nombre);
        return t;
    }

    private Estilo crearEstilo(String nombre) {
        Estilo e = new Estilo();
        e.setEstilo(nombre);
        return e;
    }

    private Corte crearCorte(String nombre) {
        Corte c = new Corte();
        c.setCorte(nombre);
        return c;
    }

    private Talla crearTalla(String nombre) {
        Talla t = new Talla();
        t.setTalla(nombre);
        return t;
    }

    private ProductoCatalogo crearProducto(Inventario inv, Color color, Tela tela, Talla talla,
                                           Estilo estilo, Corte corte, String nombre, String tipo,
                                           String desc, String precio) {
        ProductoCatalogo p = new ProductoCatalogo();
        p.setInventario(inv);
        p.setColor(color);
        p.setTela(tela);
        p.setTalla(talla);
        p.setEstilo(estilo);
        p.setCorte(corte);
        p.setNombre(nombre);
        p.setTipoPrenda(tipo);
        p.setDescripcion(desc);
        p.setCostoBase(new BigDecimal(precio));
        return p;
    }
}
