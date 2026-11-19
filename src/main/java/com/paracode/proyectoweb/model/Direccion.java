package com.paracode.proyectoweb.model;

import javax.persistence.*;

@Entity
@Table(name = "Direcciones")
public class Direccion {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer idDireccion;

    @ManyToOne
    @JoinColumn(name = "idUsuario")
    private Usuario usuario;

    @Column(name = "Calle", length = 60)
    private String calle;

    @Column(name = "NumExt", length = 15)
    private String numExt;

    @Column(name = "NumInterior", length = 15)
    private String numInterior;

    @Column(name = "Colonia", length = 60)
    private String colonia;

    @Column(name = "Municipio", length = 60)
    private String municipio;

    @Column(name = "Edificio", length = 30)
    private String edificio;

    @Column(name = "Avenida", length = 60)
    private String avenida;

    @Column(name = "CodigoPostal", length = 10)
    private String codigoPostal;

    public Integer getIdDireccion() { return idDireccion; }
    public void setIdDireccion(Integer idDireccion) { this.idDireccion = idDireccion; }
    public Usuario getUsuario() { return usuario; }
    public void setUsuario(Usuario usuario) { this.usuario = usuario; }
    public String getCalle() { return calle; }
    public void setCalle(String calle) { this.calle = calle; }
    public String getNumExt() { return numExt; }
    public void setNumExt(String numExt) { this.numExt = numExt; }
    public String getNumInterior() { return numInterior; }
    public void setNumInterior(String numInterior) { this.numInterior = numInterior; }
    public String getColonia() { return colonia; }
    public void setColonia(String colonia) { this.colonia = colonia; }
    public String getMunicipio() { return municipio; }
    public void setMunicipio(String municipio) { this.municipio = municipio; }
    public String getEdificio() { return edificio; }
    public void setEdificio(String edificio) { this.edificio = edificio; }
    public String getAvenida() { return avenida; }
    public void setAvenida(String avenida) { this.avenida = avenida; }
    public String getCodigoPostal() { return codigoPostal; }
    public void setCodigoPostal(String codigoPostal) { this.codigoPostal = codigoPostal; }
}
