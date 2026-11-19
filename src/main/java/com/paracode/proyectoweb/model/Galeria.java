package com.paracode.proyectoweb.model;

import javax.persistence.*;

@Entity
@Table(name = "Galeria")
public class Galeria {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer idGaleria;

    @ManyToOne
    @JoinColumn(name = "idUsuario")
    private Usuario usuario;

    @Column(name = "HistorialCambios", columnDefinition = "TEXT")
    private String historialCambios;

    public Integer getIdGaleria() { return idGaleria; }
    public void setIdGaleria(Integer idGaleria) { this.idGaleria = idGaleria; }
    public Usuario getUsuario() { return usuario; }
    public void setUsuario(Usuario usuario) { this.usuario = usuario; }
    public String getHistorialCambios() { return historialCambios; }
    public void setHistorialCambios(String historialCambios) { this.historialCambios = historialCambios; }
}
