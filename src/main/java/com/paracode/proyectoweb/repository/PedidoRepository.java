package com.paracode.proyectoweb.repository;

import com.paracode.proyectoweb.model.Pedido;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;
import java.util.Optional;

public interface PedidoRepository extends JpaRepository<Pedido, Integer> {
    List<Pedido> findByUsuarioIdUsuarioOrderByIdPedidoDesc(Integer idUsuario);
    Optional<Pedido> findByFolio(String folio);
}
