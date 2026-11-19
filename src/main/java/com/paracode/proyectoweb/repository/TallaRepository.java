package com.paracode.proyectoweb.repository;

import com.paracode.proyectoweb.model.Talla;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.Optional;

public interface TallaRepository extends JpaRepository<Talla, Integer> {
    Optional<Talla> findByTallaIgnoreCase(String talla);
}
