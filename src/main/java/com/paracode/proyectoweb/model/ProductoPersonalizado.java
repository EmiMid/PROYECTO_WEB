package com.paracode.proyectoweb.model;

import javax.persistence.*;
import java.math.BigDecimal;

@Entity
@Table(name = "ProductoPersonalizado")
public class ProductoPersonalizado {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer idProductoP;

    @ManyToOne
    @JoinColumn(name = "idGaleria")
    private Galeria galeria;

    @ManyToOne
    @JoinColumn(name = "idProducto")
    private ProductoCatalogo productoCatalogo;

    @ManyToOne
    @JoinColumn(name = "idUsuario")
    private Usuario usuario;

    @Lob
    @Column(name = "Estampado", columnDefinition = "LONGBLOB")
    private byte[] estampado;

    @Column(name = "NombreArchivo", length = 150)
    private String nombreArchivo;

    @Column(name = "TipoImagen", length = 50)
    private String tipoImagen;

    @Column(name = "CostoAnadido")
    private BigDecimal costoAnadido;

    @Column(name = "TextoPersonalizado", length = 255)
    private String textoPersonalizado;

    public Integer getIdProductoP() { return idProductoP; }
    public void setIdProductoP(Integer idProductoP) { this.idProductoP = idProductoP; }
    public Galeria getGaleria() { return galeria; }
    public void setGaleria(Galeria galeria) { this.galeria = galeria; }
    public ProductoCatalogo getProductoCatalogo() { return productoCatalogo; }
    public void setProductoCatalogo(ProductoCatalogo productoCatalogo) { this.productoCatalogo = productoCatalogo; }
    public Usuario getUsuario() { return usuario; }
    public void setUsuario(Usuario usuario) { this.usuario = usuario; }
    public byte[] getEstampado() { return estampado; }
    public void setEstampado(byte[] estampado) { this.estampado = estampado; }
    public String getNombreArchivo() { return nombreArchivo; }
    public void setNombreArchivo(String nombreArchivo) { this.nombreArchivo = nombreArchivo; }
    public String getTipoImagen() { return tipoImagen; }
    public void setTipoImagen(String tipoImagen) { this.tipoImagen = tipoImagen; }
    public BigDecimal getCostoAnadido() { return costoAnadido; }
    public void setCostoAnadido(BigDecimal costoAnadido) { this.costoAnadido = costoAnadido; }
    public String getTextoPersonalizado() { return textoPersonalizado; }
    public void setTextoPersonalizado(String textoPersonalizado) { this.textoPersonalizado = textoPersonalizado; }
}
