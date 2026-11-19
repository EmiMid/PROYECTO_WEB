package com.paracode.proyectoweb.repository;

import com.paracode.proyectoweb.model.Color;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.Optional;

public interface ColorRepository extends JpaRepository<Color, Integer> {
    Optional<Color> findByNombreIgnoreCase(String nombre);
}
