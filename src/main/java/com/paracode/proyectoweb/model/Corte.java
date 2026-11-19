package com.paracode.proyectoweb.model;

import javax.persistence.*;

@Entity
@Table(name = "Cortes")
public class Corte {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer idCorte;

    @Column(name = "Corte", length = 40)
    private String corte;

    public Integer getIdCorte() { return idCorte; }
    public void setIdCorte(Integer idCorte) { this.idCorte = idCorte; }
    public String getCorte() { return corte; }
    public void setCorte(String corte) { this.corte = corte; }
}
