package com.paracode.proyectoweb.repository;

import com.paracode.proyectoweb.model.Estilo;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.Optional;

public interface EstiloRepository extends JpaRepository<Estilo, Integer> {
    Optional<Estilo> findByEstiloIgnoreCase(String estilo);
}
