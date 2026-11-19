package com.paracode.proyectoweb.repository;

import com.paracode.proyectoweb.model.ProductoPersonalizado;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

public interface ProductoPersonalizadoRepository extends JpaRepository<ProductoPersonalizado, Integer> {
    List<ProductoPersonalizado> findByUsuarioIdUsuario(Integer idUsuario);
}
