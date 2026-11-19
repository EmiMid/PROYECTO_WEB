package com.paracode.proyectoweb.repository;

import com.paracode.proyectoweb.model.Inventario;
import org.springframework.data.jpa.repository.JpaRepository;

public interface InventarioRepository extends JpaRepository<Inventario, Integer> {
}
