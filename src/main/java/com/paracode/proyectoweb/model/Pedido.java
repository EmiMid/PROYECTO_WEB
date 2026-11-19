package com.paracode.proyectoweb.model;

import javax.persistence.*;
import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.List;

@Entity
@Table(name = "Pedidos")
public class Pedido {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer idPedido;

    @Column(name = "Folio", length = 20, unique = true)
    private String folio;

    @ManyToOne
    @JoinColumn(name = "idUsuario")
    private Usuario usuario;

    @ManyToOne
    @JoinColumn(name = "idDireccion")
    private Direccion direccion;

    @Column(name = "fchConfirmacion")
    private LocalDate fchConfirmacion;

    @Column(name = "fchEntrega")
    private LocalDate fchEntrega;

    @Column(name = "EstadoPedido", length = 30)
    private String estadoPedido = "produccion";

    @Column(name = "Total")
    private BigDecimal total = BigDecimal.ZERO;

    @OneToMany(mappedBy = "pedido", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    private List<DetallePedido> detalles;

    public Integer getIdPedido() { return idPedido; }
    public void setIdPedido(Integer idPedido) { this.idPedido = idPedido; }
    public String getFolio() { return folio; }
    public void setFolio(String folio) { this.folio = folio; }
    public Usuario getUsuario() { return usuario; }
    public void setUsuario(Usuario usuario) { this.usuario = usuario; }
    public Direccion getDireccion() { return direccion; }
    public void setDireccion(Direccion direccion) { this.direccion = direccion; }
    public LocalDate getFchConfirmacion() { return fchConfirmacion; }
    public void setFchConfirmacion(LocalDate fchConfirmacion) { this.fchConfirmacion = fchConfirmacion; }
    public LocalDate getFchEntrega() { return fchEntrega; }
    public void setFchEntrega(LocalDate fchEntrega) { this.fchEntrega = fchEntrega; }
    public String getEstadoPedido() { return estadoPedido; }
    public void setEstadoPedido(String estadoPedido) { this.estadoPedido = estadoPedido; }
    public BigDecimal getTotal() { return total; }
    public void setTotal(BigDecimal total) { this.total = total; }
    public List<DetallePedido> getDetalles() { return detalles; }
    public void setDetalles(List<DetallePedido> detalles) { this.detalles = detalles; }
}
