package com.paracode.proyectoweb.model;

import javax.persistence.*;
import java.math.BigDecimal;

@Entity
@Table(name = "ProductoCatalogo")
public class ProductoCatalogo {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer idProductoC;

    @ManyToOne
    @JoinColumn(name = "idInventario")
    private Inventario inventario;

    @ManyToOne
    @JoinColumn(name = "idColor")
    private Color color;

    @ManyToOne
    @JoinColumn(name = "idTela")
    private Tela tela;

    @ManyToOne
    @JoinColumn(name = "idTalla")
    private Talla talla;

    @ManyToOne
    @JoinColumn(name = "idEstilo")
    private Estilo estilo;

    @ManyToOne
    @JoinColumn(name = "idCorte")
    private Corte corte;

    @Column(name = "Nombre", length = 100)
    private String nombre;

    @Column(name = "TipoPrenda", length = 30)
    private String tipoPrenda;

    @Column(name = "descripcion", length = 255)
    private String descripcion;

    @Column(name = "CostoBase")
    private BigDecimal costoBase;

    public Integer getIdProductoC() { return idProductoC; }
    public void setIdProductoC(Integer idProductoC) { this.idProductoC = idProductoC; }
    public Inventario getInventario() { return inventario; }
    public void setInventario(Inventario inventario) { this.inventario = inventario; }
    public Color getColor() { return color; }
    public void setColor(Color color) { this.color = color; }
    public Tela getTela() { return tela; }
    public void setTela(Tela tela) { this.tela = tela; }
    public Talla getTalla() { return talla; }
    public void setTalla(Talla talla) { this.talla = talla; }
    public Estilo getEstilo() { return estilo; }
    public void setEstilo(Estilo estilo) { this.estilo = estilo; }
    public Corte getCorte() { return corte; }
    public void setCorte(Corte corte) { this.corte = corte; }
    public String getNombre() { return nombre; }
    public void setNombre(String nombre) { this.nombre = nombre; }
    public String getTipoPrenda() { return tipoPrenda; }
    public void setTipoPrenda(String tipoPrenda) { this.tipoPrenda = tipoPrenda; }
    public String getDescripcion() { return descripcion; }
    public void setDescripcion(String descripcion) { this.descripcion = descripcion; }
    public BigDecimal getCostoBase() { return costoBase; }
    public void setCostoBase(BigDecimal costoBase) { this.costoBase = costoBase; }
}
