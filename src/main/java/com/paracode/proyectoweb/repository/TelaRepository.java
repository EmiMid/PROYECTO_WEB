package com.paracode.proyectoweb.repository;

import com.paracode.proyectoweb.model.Tela;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.Optional;

public interface TelaRepository extends JpaRepository<Tela, Integer> {
    Optional<Tela> findByTelaIgnoreCase(String tela);
}
