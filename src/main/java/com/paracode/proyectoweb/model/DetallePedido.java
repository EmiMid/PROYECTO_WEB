package com.paracode.proyectoweb.model;

import javax.persistence.*;
import java.math.BigDecimal;

@Entity
@Table(name = "DetallesPedido")
public class DetallePedido {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer idDetallesPedido;

    @ManyToOne
    @JoinColumn(name = "idPedido")
    private Pedido pedido;

    @ManyToOne
    @JoinColumn(name = "idInventario")
    private Inventario inventario;

    @ManyToOne
    @JoinColumn(name = "idPedidoPersonalizado")
    private ProductoPersonalizado productoPersonalizado;

    @ManyToOne
    @JoinColumn(name = "idProductoG")
    private ProductoGaleria productoGaleria;

    @Column(name = "Cantidad")
    private Integer cantidad = 1;

    @Column(name = "Subtotal")
    private BigDecimal subtotal = BigDecimal.ZERO;

    public Integer getIdDetallesPedido() { return idDetallesPedido; }
    public void setIdDetallesPedido(Integer idDetallesPedido) { this.idDetallesPedido = idDetallesPedido; }
    public Pedido getPedido() { return pedido; }
    public void setPedido(Pedido pedido) { this.pedido = pedido; }
    public Inventario getInventario() { return inventario; }
    public void setInventario(Inventario inventario) { this.inventario = inventario; }
    public ProductoPersonalizado getProductoPersonalizado() { return productoPersonalizado; }
    public void setProductoPersonalizado(ProductoPersonalizado productoPersonalizado) { this.productoPersonalizado = productoPersonalizado; }
    public ProductoGaleria getProductoGaleria() { return productoGaleria; }
    public void setProductoGaleria(ProductoGaleria productoGaleria) { this.productoGaleria = productoGaleria; }
    public Integer getCantidad() { return cantidad; }
    public void setCantidad(Integer cantidad) { this.cantidad = cantidad; }
    public BigDecimal getSubtotal() { return subtotal; }
    public void setSubtotal(BigDecimal subtotal) { this.subtotal = subtotal; }
}
