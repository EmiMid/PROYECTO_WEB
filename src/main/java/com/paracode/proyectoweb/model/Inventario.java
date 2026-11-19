package com.paracode.proyectoweb.model;

import javax.persistence.*;
import java.time.LocalDate;

@Entity
@Table(name = "Inventario")
public class Inventario {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer idInventario;

    @Column(name = "FchActualizacion")
    private LocalDate fchActualizacion;

    @Column(name = "cantidadDisponible")
    private Integer cantidadDisponible;

    public Integer getIdInventario() { return idInventario; }
    public void setIdInventario(Integer idInventario) { this.idInventario = idInventario; }
    public LocalDate getFchActualizacion() { return fchActualizacion; }
    public void setFchActualizacion(LocalDate fchActualizacion) { this.fchActualizacion = fchActualizacion; }
    public Integer getCantidadDisponible() { return cantidadDisponible; }
    public void setCantidadDisponible(Integer cantidadDisponible) { this.cantidadDisponible = cantidadDisponible; }
}
