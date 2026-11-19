package com.paracode.proyectoweb.repository;

import com.paracode.proyectoweb.model.Usuario;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.Optional;

public interface UsuarioRepository extends JpaRepository<Usuario, Integer> {
    Optional<Usuario> findByCorreoAndContrasena(String correo, String contrasena);
    Optional<Usuario> findByCorreo(String correo);
}
