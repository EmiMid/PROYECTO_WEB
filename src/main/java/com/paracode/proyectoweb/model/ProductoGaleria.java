package com.paracode.proyectoweb.model;

import javax.persistence.*;
import java.math.BigDecimal;

@Entity
@Table(name = "ProductoGaleria")
public class ProductoGaleria {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer idProductoG;

    @ManyToOne
    @JoinColumn(name = "idGaleria")
    private Galeria galeria;

    @ManyToOne
    @JoinColumn(name = "idProducto")
    private ProductoCatalogo productoCatalogo;

    @Column(name = "Titulo", length = 80)
    private String titulo;

    @Lob
    @Column(name = "Estampado", columnDefinition = "LONGBLOB")
    private byte[] estampado;

    @Column(name = "TipoImagen", length = 50)
    private String tipoImagen;

    @Column(name = "CostoAnadido")
    private BigDecimal costoAnadido;

    public Integer getIdProductoG() { return idProductoG; }
    public void setIdProductoG(Integer idProductoG) { this.idProductoG = idProductoG; }
    public Galeria getGaleria() { return galeria; }
    public void setGaleria(Galeria galeria) { this.galeria = galeria; }
    public ProductoCatalogo getProductoCatalogo() { return productoCatalogo; }
    public void setProductoCatalogo(ProductoCatalogo productoCatalogo) { this.productoCatalogo = productoCatalogo; }
    public String getTitulo() { return titulo; }
    public void setTitulo(String titulo) { this.titulo = titulo; }
    public byte[] getEstampado() { return estampado; }
    public void setEstampado(byte[] estampado) { this.estampado = estampado; }
    public String getTipoImagen() { return tipoImagen; }
    public void setTipoImagen(String tipoImagen) { this.tipoImagen = tipoImagen; }
    public BigDecimal getCostoAnadido() { return costoAnadido; }
    public void setCostoAnadido(BigDecimal costoAnadido) { this.costoAnadido = costoAnadido; }
}
