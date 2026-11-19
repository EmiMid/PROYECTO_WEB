package com.paracode.proyectoweb.model;

import javax.persistence.*;

@Entity
@Table(name = "Talla")
public class Talla {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer idTalla;

    @Column(name = "Talla", length = 20)
    private String talla;

    public Integer getIdTalla() { return idTalla; }
    public void setIdTalla(Integer idTalla) { this.idTalla = idTalla; }
    public String getTalla() { return talla; }
    public void setTalla(String talla) { this.talla = talla; }
}
