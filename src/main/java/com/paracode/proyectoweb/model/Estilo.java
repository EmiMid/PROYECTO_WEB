package com.paracode.proyectoweb.model;

import javax.persistence.*;

@Entity
@Table(name = "Estilo")
public class Estilo {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer idEstilo;

    @Column(name = "Estilo", length = 40)
    private String estilo;

    public Integer getIdEstilo() { return idEstilo; }
    public void setIdEstilo(Integer idEstilo) { this.idEstilo = idEstilo; }
    public String getEstilo() { return estilo; }
    public void setEstilo(String estilo) { this.estilo = estilo; }
}
