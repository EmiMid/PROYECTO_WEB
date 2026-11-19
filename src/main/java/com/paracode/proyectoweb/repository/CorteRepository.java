package com.paracode.proyectoweb.repository;

import com.paracode.proyectoweb.model.Corte;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.Optional;

public interface CorteRepository extends JpaRepository<Corte, Integer> {
    Optional<Corte> findByCorteIgnoreCase(String corte);
}
