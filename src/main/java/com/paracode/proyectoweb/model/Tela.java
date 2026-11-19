package com.paracode.proyectoweb.model;

import javax.persistence.*;

@Entity
@Table(name = "Tela")
public class Tela {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer idTela;

    @Column(name = "Tela", length = 40)
    private String tela;

    public Integer getIdTela() { return idTela; }
    public void setIdTela(Integer idTela) { this.idTela = idTela; }
    public String getTela() { return tela; }
    public void setTela(String tela) { this.tela = tela; }
}
