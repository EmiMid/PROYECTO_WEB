package com.paracode.proyectoweb.repository;

import com.paracode.proyectoweb.model.Galeria;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

public interface GaleriaRepository extends JpaRepository<Galeria, Integer> {
    List<Galeria> findByUsuarioIdUsuario(Integer idUsuario);
}
