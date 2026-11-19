package com.paracode.proyectoweb.model;

import javax.persistence.*;

@Entity
@Table(name = "Color")
public class Color {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer idColor;

    @Column(name = "Nombre", length = 30)
    private String nombre;

    @Column(name = "Codigo", length = 7)
    private String codigo;

    public Integer getIdColor() { return idColor; }
    public void setIdColor(Integer idColor) { this.idColor = idColor; }
    public String getNombre() { return nombre; }
    public void setNombre(String nombre) { this.nombre = nombre; }
    public String getCodigo() { return codigo; }
    public void setCodigo(String codigo) { this.codigo = codigo; }
}
