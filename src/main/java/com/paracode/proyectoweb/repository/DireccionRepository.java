package com.paracode.proyectoweb.repository;

import com.paracode.proyectoweb.model.Direccion;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

public interface DireccionRepository extends JpaRepository<Direccion, Integer> {
    List<Direccion> findByUsuarioIdUsuario(Integer idUsuario);
}
