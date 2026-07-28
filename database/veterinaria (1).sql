-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Generation Time: Jul 28, 2026 at 06:25 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `veterinaria`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `obtener_perfil_usuario` (IN `p_nombre` VARCHAR(16))   BEGIN
    SELECT t.nombreTipo AS rol, u.imagen AS imagen, t.imagen AS imagen_tipo
    FROM usuarios u
    JOIN tipo t ON u.ID_tipoUsuario = t.ID_tipo
    WHERE u.Nombre = p_nombre;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_delete_cita` (IN `p_id_cita` INT)   BEGIN
    DELETE FROM cita WHERE ID_cita = p_id_cita;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_delete_cita_servicio` (IN `p_id_cita_servicio` INT)   BEGIN
    DELETE FROM cita_servicio WHERE ID_cita_servicio = p_id_cita_servicio;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_delete_dueño` (IN `p_id_dueño` INT)   BEGIN
    DELETE FROM dueño WHERE ID_dueño = p_id_dueño;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_delete_expediente` (IN `p_id_expediente` INT)   BEGIN
    DELETE FROM expediente_medico WHERE ID_expediente = p_id_expediente;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_delete_mascota` (IN `p_id_mascota` INT)   BEGIN
    DELETE FROM mascota WHERE ID_mascota = p_id_mascota;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_delete_servicio` (IN `p_id_servicio` INT)   BEGIN
    DELETE FROM servicio WHERE ID_servicio = p_id_servicio;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_delete_usuario` (IN `p_id_user` INT)   BEGIN
    DELETE FROM usuario WHERE ID_user = p_id_user;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_delete_vacunacion` (IN `p_id_vacunacion` INT)   BEGIN
    DELETE FROM vacunacion WHERE ID_vacunacion = p_id_vacunacion;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_cita` (IN `p_id_cita` INT)   BEGIN
    SELECT * FROM cita WHERE ID_cita = p_id_cita;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_cita_servicio` (IN `p_id_cita_servicio` INT)   BEGIN
    SELECT * FROM cita_servicio WHERE ID_cita_servicio = p_id_cita_servicio;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_dueño` (IN `p_id_dueño` INT)   BEGIN
    SELECT * FROM dueño WHERE ID_dueño = p_id_dueño;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_expediente` (IN `p_id_expediente` INT)   BEGIN
    SELECT * FROM expediente_medico WHERE ID_expediente = p_id_expediente;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_mascota` (IN `p_id_mascota` INT)   BEGIN
    SELECT * FROM mascota WHERE ID_mascota = p_id_mascota;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_servicio` (IN `p_id_servicio` INT)   BEGIN
    SELECT * FROM servicio WHERE ID_servicio = p_id_servicio;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_usuario` (IN `p_id_user` INT)   BEGIN
    SELECT * FROM usuario WHERE ID_user = p_id_user;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_vacunacion` (IN `p_id_vacunacion` INT)   BEGIN
    SELECT * FROM vacunacion WHERE ID_vacunacion = p_id_vacunacion;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert_cita` (IN `p_id_mascota` INT, IN `p_id_user` INT, IN `p_fecha` DATE, IN `p_hora` TIME, IN `p_motivo` VARCHAR(255), IN `p_estado` VARCHAR(50))   BEGIN
    INSERT INTO cita (ID_mascota, ID_user, fecha, hora, motivo, estado)
    VALUES (p_id_mascota, p_id_user, p_fecha, p_hora, p_motivo, p_estado);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert_cita_servicio` (IN `p_id_cita` INT, IN `p_id_servicio` INT, IN `p_cantidad` INT, IN `p_costo_unitario` DECIMAL(10,2), IN `p_subtotal` DECIMAL(10,2))   BEGIN
    INSERT INTO cita_servicio (ID_cita, ID_servicio, cantidad, costo_unitario, subtotal)
    VALUES (p_id_cita, p_id_servicio, p_cantidad, p_costo_unitario, p_subtotal);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert_dueño` (IN `p_nombre` VARCHAR(100), IN `p_telefono` VARCHAR(20), IN `p_direccion` VARCHAR(255), IN `p_correo` VARCHAR(100))   BEGIN
    INSERT INTO dueño (nombre, telefono, direccion, correo)
    VALUES (p_nombre, p_telefono, p_direccion, p_correo);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert_expediente` (IN `p_id_mascota` INT, IN `p_id_user` INT, IN `p_fecha` DATE, IN `p_sintomas` TEXT, IN `p_diagnostico` TEXT, IN `p_tratamiento` TEXT, IN `p_observaciones` TEXT)   BEGIN
    INSERT INTO expediente_medico (ID_mascota, ID_user, fecha, sintomas, diagnostico, tratamiento, observaciones)
    VALUES (p_id_mascota, p_id_user, p_fecha, p_sintomas, p_diagnostico, p_tratamiento, p_observaciones);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert_mascota` (IN `p_id_dueño` INT, IN `p_nombre` INT(100), IN `p_especie` VARCHAR(50), IN `p_raza` VARCHAR(50), IN `p_edad` INT, IN `p_peso` DECIMAL(5,2), IN `p_sexo` VARCHAR(10), IN `p_foto` VARCHAR(255))   BEGIN
    INSERT INTO mascota (ID_dueño, nombre, especie, raza, edad, peso, sexo, foto)
    VALUES (p_id_dueño, p_nombre, p_especie, p_raza, p_edad, p_peso, p_sexo, p_foto);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert_servicio` (IN `p_nombre` VARCHAR(100), IN `p_descripcion` VARCHAR(255), IN `p_costo` DECIMAL(10,2))   BEGIN
    INSERT INTO servicio (nombre, descripcion, costo)
    VALUES (p_nombre, p_descripcion, p_costo);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert_usuario` (IN `p_nombre` VARCHAR(100), IN `p_correo` VARCHAR(100), IN `p_contraseña` VARCHAR(100), IN `p_tipo` VARCHAR(50), IN `p_estatus` VARCHAR(50), IN `p_permiso` INT(50))   BEGIN
    INSERT INTO usuario (nombre, correo, contraseña, tipo, estatus, permiso)
    VALUES (p_nombre, p_correo, p_contraseña, p_tipo, p_estatus, p_permiso);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert_vacunacion` (IN `p_id_mascota` INT, IN `p_id_user` INT, IN `p_nombre_vacuna` VARCHAR(100), IN `p_fecha_aplicacion` DATE, IN `p_proxima_dosis` DATE, IN `p_estado` VARCHAR(50))   BEGIN INSERT INTO vacunacion (ID_mascota, ID_usuario, nombre_vacuna, fecha_aplicacion, proxima_dosis, estado) VALUES (p_id_mascota, p_id_user, p_nombre_vacuna, p_fecha_aplicacion, p_proxima_dosis, p_estado); END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_listar_expedientes_por_mascota` (IN `p_id_mascota` INT)   BEGIN
    SELECT e.ID_expediente, e.Fecha, e.Sintomas, e.Diagnostico, e.Tratamiento, e.Observaciones,
           u.Nombre AS veterinario
    FROM expediente_medico e
    JOIN usuarios u ON e.ID_usuario = u.ID_usuario
    WHERE e.ID_mascota = p_id_mascota
    ORDER BY e.Fecha DESC;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_update_cita` (IN `p_id_cita` INT, IN `p_id_mascota` INT, IN `p_id_user` INT, IN `p_fecha` DATE, IN `p_hora` TIME, IN `p_motivo` VARCHAR(255), IN `p_estado` VARCHAR(50))   BEGIN
    UPDATE cita
    SET ID_mascota = p_id_mascota,
        ID_user = p_id_user,
        fecha = p_fecha,
        hora = p_hora,
        motivo = p_motivo,
        estado = p_estado
    WHERE ID_cita = p_id_cita;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_update_cita_servicio` (IN `p_id_cita_servicio` INT, IN `p_id_cita` INT, IN `p_id_servicio` INT, IN `p_cantidad` INT, IN `p_costo_unitario` DECIMAL(10,2), IN `p_subtotal` DECIMAL(10,2))   BEGIN
    UPDATE cita_servicio
    SET ID_cita = p_id_cita,
        ID_servicio = p_id_servicio,
        cantidad = p_cantidad,
        costo_unitario = p_costo_unitario,
        subtotal = p_subtotal
    WHERE ID_cita_servicio = p_id_cita_servicio;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_update_dueño` (IN `p_id_dueño` INT, IN `p_nombre` VARCHAR(100), IN `p_telefono` VARCHAR(20), IN `p_direccion` VARCHAR(255), IN `p_correo` VARCHAR(100))   BEGIN
    UPDATE dueño
    SET nombre = p_nombre,
        telefono = p_telefono,
        direccion = p_direccion,
        correo = p_correo
    WHERE ID_dueño = p_id_dueño;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_update_expediente` (IN `p_id_expdiente` INT, IN `p_id_mascota` INT, IN `p_id_user` INT, IN `p_fecha` DATE, IN `p_sintomas` TEXT, IN `p_diagnostico` TEXT, IN `p_tratamiento` TEXT, IN `p_observaciones` TEXT)   BEGIN
    UPDATE expediente_medico
    SET ID_mascota = p_id_mascota,
        ID_user = p_id_user,
        fecha = p_fecha,
        sintomas = p_sintomas,
        diagnostico = p_diagnostico,
        tratamiento = p_tratamiento,
        observaciones = p_observaciones
    WHERE ID_expediente = p_id_expediente;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_update_mascota` (IN `p_id_mascota` INT, IN `p_id_dueño` INT, IN `p_nombre` VARCHAR(100), IN `p_especie` VARCHAR(50), IN `p_raza` VARCHAR(50), IN `p_edad` INT, IN `P_peso` DECIMAL(5,2), IN `p_sexo` VARCHAR(10), IN `p_foto` VARCHAR(255))   BEGIN
    UPDATE mascota
    SET ID_dueño = p_id_dueño,
        nombre = p_nombre,
        especie = p_especie,
        raza = p_raza,
        edad = p_edad,
        peso = p_peso,
        sexo = p_sexo,
        foto = p_foto
    WHERE ID_mascota = p_id_mascota;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_update_servicio` (IN `p_id_servicio` INT, IN `p_nombre` VARCHAR(100), IN `p_descripcion` VARCHAR(255), IN `p_costo` DECIMAL(10,2))   BEGIN
    UPDATE servicio
    SET nombre = p_nombre,
        descripcion = p_descripcion,
        costo = p_costo
    WHERE ID_servicio = p_id_servicio;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_update_usuario` (IN `p_id_user` INT, IN `p_nombre` VARCHAR(100), IN `p_correo` VARCHAR(100), IN `p_contraseña` VARCHAR(100), IN `p_tipo` VARCHAR(50), IN `p_estatus` VARCHAR(50), IN `p_permiso` VARCHAR(50))   BEGIN
    UPDATE usuario
    SET nombre = p_nombre,
        correo = p_correo,
        contraseña = p_contraseña,
        tipo = p_tipo,
        estatus = p_estatus,
        permiso = p_permiso
    WHERE ID_user = p_id_user;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_update_vacunacion` (IN `p_id_vacunacion` INT, IN `p_id_mascota` INT, IN `p_id_user` INT, IN `p_nombre_vacuna` VARCHAR(100), IN `p_fecha_aplicacion` DATE, IN `p_proxima_dosis` DATE, IN `p_estado` VARCHAR(50))   BEGIN
    UPDATE vacunacion
    SET ID_mascota = p_id_mascota,
        ID_user = p_id_user,
        nombre_vacuna = p_nombre_vacuna,
        fecha_aplicacion = p_fecha_aplicacion,
        proxima_dosis = p_proxima_dosis,
        estado = p_estado
    WHERE ID_vacunacion = p_id_vacunacion;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `cita`
--

CREATE TABLE `cita` (
  `ID_cita` int(11) NOT NULL,
  `ID_mascota` int(11) NOT NULL,
  `ID_usuario` int(11) DEFAULT NULL,
  `Fecha` date NOT NULL,
  `Hora` time NOT NULL,
  `Motivo` varchar(255) NOT NULL,
  `Estado` varchar(60) NOT NULL,
  `Motivo_cancelacion` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `cita`
--

INSERT INTO `cita` (`ID_cita`, `ID_mascota`, `ID_usuario`, `Fecha`, `Hora`, `Motivo`, `Estado`, `Motivo_cancelacion`) VALUES
(1, 1, 15, '2026-07-23', '15:00:00', 'Tiene una berruga que crece y crece, parece que tiene vida ', 'Confirmada', NULL),
(3, 3, NULL, '2026-07-30', '12:00:00', 'Habla, eso no es normal', 'Cancelada', 'Precio caro');

-- --------------------------------------------------------

--
-- Table structure for table `cita_servicio`
--

CREATE TABLE `cita_servicio` (
  `ID_cita_servicio` int(11) NOT NULL,
  `ID_cita` int(11) NOT NULL,
  `ID_servicio` int(11) NOT NULL,
  `Cantidad` int(11) NOT NULL,
  `Costo_unitario` decimal(10,2) NOT NULL,
  `Subtotal` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `cita_servicio`
--

INSERT INTO `cita_servicio` (`ID_cita_servicio`, `ID_cita`, `ID_servicio`, `Cantidad`, `Costo_unitario`, `Subtotal`) VALUES
(1, 1, 1, 1, 250.00, 250),
(2, 1, 1, 4, 250.00, 1000);

-- --------------------------------------------------------

--
-- Table structure for table `detalle_venta`
--

CREATE TABLE `detalle_venta` (
  `ID_detalle` int(11) NOT NULL,
  `ID_venta` int(11) NOT NULL,
  `ID_farmaco` int(11) NOT NULL,
  `Cantidad` int(11) NOT NULL,
  `Precio_unitario` decimal(10,2) NOT NULL,
  `Subtotal` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `detalle_venta`
--

INSERT INTO `detalle_venta` (`ID_detalle`, `ID_venta`, `ID_farmaco`, `Cantidad`, `Precio_unitario`, `Subtotal`) VALUES
(1, 1, 1, 2, 150.00, 300.00),
(2, 1, 2, 1, 500.00, 500.00),
(3, 2, 1, 1, 150.00, 150.00),
(4, 2, 2, 2, 500.00, 1000.00),
(5, 3, 3, 2, 170.00, 340.00),
(6, 3, 2, 2, 500.00, 1000.00),
(7, 4, 2, 6, 500.00, 3000.00);

-- --------------------------------------------------------

--
-- Table structure for table `dueño`
--

CREATE TABLE `dueño` (
  `ID_dueño` int(11) NOT NULL,
  `Nombre` varchar(32) NOT NULL,
  `Telefono` varchar(32) NOT NULL,
  `Direccion` varchar(64) NOT NULL,
  `Correo` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `dueño`
--

INSERT INTO `dueño` (`ID_dueño`, `Nombre`, `Telefono`, `Direccion`, `Correo`) VALUES
(1, 'Carlos', '4491112233', 'Villas de nuestra señora de la asuncion #114', 'goku@gmail.com'),
(2, 'Jimi Hendrix', '4491112234', 'London', 'psicodelic@gmail.com'),
(3, 'Eric Clapton', '4499998877', 'UK Birminham', 'eric@gmail.com'),
(4, 'Daniela Villareal', '4499998879', 'Avenida de los maestrso #666', 'daniela@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `estatus`
--

CREATE TABLE `estatus` (
  `ID_estatus` int(11) NOT NULL,
  `nombreEstatus` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `estatus`
--

INSERT INTO `estatus` (`ID_estatus`, `nombreEstatus`) VALUES
(1, 'Activo'),
(3, 'Bloqueado'),
(2, 'Inactivo');

-- --------------------------------------------------------

--
-- Table structure for table `expediente_medico`
--

CREATE TABLE `expediente_medico` (
  `ID_expediente` int(11) NOT NULL,
  `ID_mascota` int(11) NOT NULL,
  `ID_usuario` int(11) NOT NULL,
  `Fecha` date NOT NULL,
  `Sintomas` varchar(255) NOT NULL,
  `Diagnostico` varchar(255) NOT NULL,
  `Tratamiento` text NOT NULL,
  `Observaciones` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `expediente_medico`
--

INSERT INTO `expediente_medico` (`ID_expediente`, `ID_mascota`, `ID_usuario`, `Fecha`, `Sintomas`, `Diagnostico`, `Tratamiento`, `Observaciones`) VALUES
(1, 1, 1, '2026-07-23', 'Flojera', 'Tiene cansancio', 'Descanso y té verde', 'Esta gordito');

-- --------------------------------------------------------

--
-- Table structure for table `farmacia`
--

CREATE TABLE `farmacia` (
  `ID_farmaco` int(11) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `Descripcion` varchar(255) NOT NULL,
  `Precio` decimal(10,2) NOT NULL,
  `Laboratorio` varchar(100) DEFAULT NULL,
  `Categoria` varchar(50) NOT NULL DEFAULT 'Medicamento'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `farmacia`
--

INSERT INTO `farmacia` (`ID_farmaco`, `Nombre`, `Descripcion`, `Precio`, `Laboratorio`, `Categoria`) VALUES
(1, 'Amoxilina', 'La amoxicilina es eficaz contra una variedad de infecciones bacterianas, incluyendo:\r\n\r\nInfecciones respiratorias: como neumonía, bronquitis y sinusitis.\r\nInfecciones del oído, nariz y garganta: como otitis media y faringitis.\r\nInfecciones urinarias: que ', 150.00, '', 'Medicamento'),
(2, 'Ivermectina', 'Eficaz contra parásitos internos y externos, como lombrices y ácaros.', 500.00, 'pokemon', 'Medicamento'),
(3, 'Correa para perro', 'Correa universal para perros', 170.00, '', 'Accesorio');

-- --------------------------------------------------------

--
-- Table structure for table `inventario`
--

CREATE TABLE `inventario` (
  `ID_inventario` int(11) NOT NULL,
  `ID_farmaco` int(11) NOT NULL,
  `Lote` varchar(50) NOT NULL,
  `Fecha_caducidad` date DEFAULT NULL,
  `Cantidad_disponible` int(11) NOT NULL,
  `Fecha_ingreso` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `inventario`
--

INSERT INTO `inventario` (`ID_inventario`, `ID_farmaco`, `Lote`, `Fecha_caducidad`, `Cantidad_disponible`, `Fecha_ingreso`) VALUES
(1, 1, 'L001', '2027-04-13', 17, '2026-07-21'),
(2, 2, 'L002', '2026-07-30', 4, '2026-07-23'),
(3, 3, 'L003', NULL, 33, '2026-07-24');

-- --------------------------------------------------------

--
-- Table structure for table `mascota`
--

CREATE TABLE `mascota` (
  `ID_mascota` int(11) NOT NULL,
  `ID_dueño` int(11) NOT NULL,
  `Nombre` varchar(16) NOT NULL,
  `Especie` varchar(32) NOT NULL,
  `Raza` varchar(32) NOT NULL,
  `Edad` int(11) NOT NULL,
  `Peso` double NOT NULL,
  `Sexo` varchar(16) NOT NULL,
  `Foto` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `mascota`
--

INSERT INTO `mascota` (`ID_mascota`, `ID_dueño`, `Nombre`, `Especie`, `Raza`, `Edad`, `Peso`, `Sexo`, `Foto`) VALUES
(1, 1, 'Tomy', 'Perro', 'Pitbull', 4, 11.7, 'Macho', ''),
(2, 2, 'Rubert', 'Gato', 'Esfinge', 2, 2.7, 'Hembra', 'images/Rubert_1784606625.jpg'),
(3, 3, 'Leo', 'Perro', 'Yorkshire Terrier', 9, 3.5, 'Macho', 'images/Leo_1784651312.jpg'),
(4, 4, 'Kirby', 'Serpiente', 'Boa', 2, 5.7, 'Hembra', 'images/Kirby_1784662094.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `permiso`
--

CREATE TABLE `permiso` (
  `ID_permiso` int(11) NOT NULL,
  `nombrePermiso` varchar(69) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `permiso`
--

INSERT INTO `permiso` (`ID_permiso`, `nombrePermiso`) VALUES
(4, 'Agendar y consultar sus propias citas (Cliente)'),
(2, 'Alta y consulta de dueños, mascotas y citas (Recepcionista)'),
(3, 'Consulta de mascotas, registro de diagnósticos y vacunas(Veterinario)'),
(1, 'CRUD completo (Administrador)');

-- --------------------------------------------------------

--
-- Table structure for table `servicios`
--

CREATE TABLE `servicios` (
  `ID_servicio` int(11) NOT NULL,
  `Nombre` varchar(64) NOT NULL,
  `Descripcion` varchar(255) NOT NULL,
  `Precio` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `servicios`
--

INSERT INTO `servicios` (`ID_servicio`, `Nombre`, `Descripcion`, `Precio`) VALUES
(1, 'Consulta general', 'Revision general de la mascota', 250);

-- --------------------------------------------------------

--
-- Table structure for table `tipo`
--

CREATE TABLE `tipo` (
  `ID_tipo` int(11) NOT NULL,
  `nombreTipo` varchar(32) NOT NULL,
  `imagen` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tipo`
--

INSERT INTO `tipo` (`ID_tipo`, `nombreTipo`, `imagen`) VALUES
(1, 'Administrador', 'images/admin2.jpg'),
(2, 'Recepcionista', 'images/recepcionista2.jpg'),
(3, 'Veterinario', 'images/veterinario.jpg'),
(4, 'Cliente', 'images/default.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `usuarios`
--

CREATE TABLE `usuarios` (
  `ID_usuario` int(11) NOT NULL,
  `Nombre` varchar(16) NOT NULL,
  `Contrasena` varchar(64) NOT NULL,
  `ID_tipoUsuario` int(11) NOT NULL,
  `ID_estatus` int(11) NOT NULL,
  `ID_permiso` int(11) NOT NULL,
  `imagen` varchar(255) DEFAULT NULL,
  `ID_dueño` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `usuarios`
--

INSERT INTO `usuarios` (`ID_usuario`, `Nombre`, `Contrasena`, `ID_tipoUsuario`, `ID_estatus`, `ID_permiso`, `imagen`, `ID_dueño`) VALUES
(1, 'Alan', 'df6d2338b2b8fce1ec2f6dda0a630eb0', 1, 3, 3, NULL, NULL),
(3, 'Melanie', 'd35bf56ac5252da38bddb6d455a0edd5', 3, 3, 3, NULL, NULL),
(5, 'Sofia', '$2y$10$Ca7rLyHoNcY/qtWWicdsNO83T3VvwTxQnwypt9rwCe56/CzLXd1re', 2, 2, 3, NULL, NULL),
(6, 'Jafeth', '$2y$10$5AILFd9vrQRgLBSnoLonTe6zzudOLXIs3fCxMNNqXuAH9tQAvJR8y', 1, 1, 2, NULL, NULL),
(7, 'cachorrito', '$2y$10$ZarR30vQJBhtiV2pEbMSbubQ74LprR3FVTKD4sJxIVmQSFW3bzqmW', 2, 3, 2, 'images/cachorrito_1784568696.jpg', NULL),
(14, 'Ozzy', '$2y$10$Jv1Gvb5E.FeOIQ2DOKW/CeLWc9eu4hqAUOxP4QCEFEtz.DdmjATou', 1, 1, 1, 'images/vLp4YxTWECVF8pHwbPnjY6.jpg', NULL),
(15, 'bomboro', '$2y$10$eP3uhDuOsnFP9UamIN8LjOrA9AP6eO6UYVXWdUl7EGG/4t1yvmEOi', 2, 1, 2, NULL, NULL),
(16, 'maztherzanch', '$2y$10$NUrzfIblekSpgR1A5vckzOVkNwjU0ri5AQibxWmUxfkqQ2UuT.jd.', 4, 1, 4, NULL, 1),
(17, 'Hendrix', '$2y$10$Q0rWNj2oIP.kueoKuEeKTuh9yZfK4nlvvixKNy430dj0NvYrCbqju', 4, 1, 4, NULL, 2),
(18, 'Eric', '$2y$10$uv2ffCeC8Q32ZcTsxwpSX.IY2Sum0npA5XMXOJ/yY485./g2XIAAO', 4, 1, 4, NULL, 3),
(19, 'Daniela', '$2y$10$WF6GmrLoHALYbnNpWDot.udPIJkmrB2yu8mBiSatEGyc4kFqcHjLS', 1, 1, 1, 'images/Daniela_1784662264.jpg', 4),
(20, 'Albert', '$2y$10$H3n.31pHQli26d3EZ7qfEeLvvykzAQ56MXzmWt2NfvmTgHcwpZXci', 3, 1, 3, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vacunacion`
--

CREATE TABLE `vacunacion` (
  `ID_vacunacion` int(11) NOT NULL,
  `ID_mascota` int(11) NOT NULL,
  `ID_usuario` int(11) NOT NULL,
  `nombre_vacuna` varchar(100) NOT NULL,
  `fecha_aplicacion` date NOT NULL,
  `proxima_dosis` date NOT NULL,
  `estado` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `vacunacion`
--

INSERT INTO `vacunacion` (`ID_vacunacion`, `ID_mascota`, `ID_usuario`, `nombre_vacuna`, `fecha_aplicacion`, `proxima_dosis`, `estado`) VALUES
(3, 2, 17, 'Rabia', '2026-07-24', '2026-07-27', 'Aplicada'),
(4, 3, 20, 'chiltpin', '2026-07-24', '2028-10-26', 'Aplicada');

-- --------------------------------------------------------

--
-- Table structure for table `venta`
--

CREATE TABLE `venta` (
  `ID_venta` int(11) NOT NULL,
  `Folio` varchar(20) NOT NULL,
  `Fecha` datetime NOT NULL,
  `ID_usuario` int(11) NOT NULL,
  `ID_dueño` int(11) DEFAULT NULL,
  `Total` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `venta`
--

INSERT INTO `venta` (`ID_venta`, `Folio`, `Fecha`, `ID_usuario`, `ID_dueño`, `Total`) VALUES
(1, 'V-000001', '2026-07-23 18:45:52', 19, 1, 800.00),
(2, 'V-000002', '2026-07-23 19:15:15', 19, 2, 1150.00),
(3, 'V-000003', '2026-07-24 22:39:26', 19, 3, 1340.00),
(4, 'V-000004', '2026-07-24 22:57:21', 15, NULL, 3000.00);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cita`
--
ALTER TABLE `cita`
  ADD PRIMARY KEY (`ID_cita`),
  ADD KEY `cita_mascota` (`ID_mascota`),
  ADD KEY `cita_usuario` (`ID_usuario`);

--
-- Indexes for table `cita_servicio`
--
ALTER TABLE `cita_servicio`
  ADD PRIMARY KEY (`ID_cita_servicio`),
  ADD KEY `cs_cita` (`ID_cita`),
  ADD KEY `cs_servicio` (`ID_servicio`);

--
-- Indexes for table `detalle_venta`
--
ALTER TABLE `detalle_venta`
  ADD PRIMARY KEY (`ID_detalle`),
  ADD KEY `dv_venta` (`ID_venta`),
  ADD KEY `dv_farmaco` (`ID_farmaco`);

--
-- Indexes for table `dueño`
--
ALTER TABLE `dueño`
  ADD PRIMARY KEY (`ID_dueño`),
  ADD UNIQUE KEY `Telefono` (`Telefono`);

--
-- Indexes for table `estatus`
--
ALTER TABLE `estatus`
  ADD PRIMARY KEY (`ID_estatus`),
  ADD UNIQUE KEY `nombreEstatus` (`nombreEstatus`);

--
-- Indexes for table `expediente_medico`
--
ALTER TABLE `expediente_medico`
  ADD PRIMARY KEY (`ID_expediente`),
  ADD KEY `exp_mascota` (`ID_mascota`),
  ADD KEY `exp_usuario` (`ID_usuario`);

--
-- Indexes for table `farmacia`
--
ALTER TABLE `farmacia`
  ADD PRIMARY KEY (`ID_farmaco`);

--
-- Indexes for table `inventario`
--
ALTER TABLE `inventario`
  ADD PRIMARY KEY (`ID_inventario`),
  ADD KEY `inv_farmaco` (`ID_farmaco`);

--
-- Indexes for table `mascota`
--
ALTER TABLE `mascota`
  ADD PRIMARY KEY (`ID_mascota`),
  ADD KEY `mascota_dueño` (`ID_dueño`);

--
-- Indexes for table `permiso`
--
ALTER TABLE `permiso`
  ADD PRIMARY KEY (`ID_permiso`),
  ADD UNIQUE KEY `nombrePermiso` (`nombrePermiso`);

--
-- Indexes for table `servicios`
--
ALTER TABLE `servicios`
  ADD PRIMARY KEY (`ID_servicio`);

--
-- Indexes for table `tipo`
--
ALTER TABLE `tipo`
  ADD PRIMARY KEY (`ID_tipo`),
  ADD UNIQUE KEY `nombreTipo` (`nombreTipo`),
  ADD UNIQUE KEY `nombreTipo_2` (`nombreTipo`);

--
-- Indexes for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`ID_usuario`),
  ADD UNIQUE KEY `Nombre` (`Nombre`),
  ADD KEY `usr_estatus` (`ID_estatus`),
  ADD KEY `usr_permisos` (`ID_permiso`),
  ADD KEY `usr_tipo` (`ID_tipoUsuario`),
  ADD KEY `usr_dueño` (`ID_dueño`);

--
-- Indexes for table `vacunacion`
--
ALTER TABLE `vacunacion`
  ADD PRIMARY KEY (`ID_vacunacion`),
  ADD KEY `vac_mascota` (`ID_mascota`),
  ADD KEY `vac_usuario` (`ID_usuario`);

--
-- Indexes for table `venta`
--
ALTER TABLE `venta`
  ADD PRIMARY KEY (`ID_venta`),
  ADD UNIQUE KEY `Folio` (`Folio`),
  ADD KEY `venta_usuario` (`ID_usuario`),
  ADD KEY `venta_dueño` (`ID_dueño`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cita`
--
ALTER TABLE `cita`
  MODIFY `ID_cita` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `cita_servicio`
--
ALTER TABLE `cita_servicio`
  MODIFY `ID_cita_servicio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `detalle_venta`
--
ALTER TABLE `detalle_venta`
  MODIFY `ID_detalle` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `dueño`
--
ALTER TABLE `dueño`
  MODIFY `ID_dueño` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `estatus`
--
ALTER TABLE `estatus`
  MODIFY `ID_estatus` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `expediente_medico`
--
ALTER TABLE `expediente_medico`
  MODIFY `ID_expediente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `farmacia`
--
ALTER TABLE `farmacia`
  MODIFY `ID_farmaco` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `inventario`
--
ALTER TABLE `inventario`
  MODIFY `ID_inventario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `mascota`
--
ALTER TABLE `mascota`
  MODIFY `ID_mascota` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `permiso`
--
ALTER TABLE `permiso`
  MODIFY `ID_permiso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `servicios`
--
ALTER TABLE `servicios`
  MODIFY `ID_servicio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tipo`
--
ALTER TABLE `tipo`
  MODIFY `ID_tipo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `ID_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `vacunacion`
--
ALTER TABLE `vacunacion`
  MODIFY `ID_vacunacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `venta`
--
ALTER TABLE `venta`
  MODIFY `ID_venta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cita`
--
ALTER TABLE `cita`
  ADD CONSTRAINT `cita_mascota` FOREIGN KEY (`ID_mascota`) REFERENCES `mascota` (`ID_mascota`) ON UPDATE CASCADE,
  ADD CONSTRAINT `cita_usuario` FOREIGN KEY (`ID_usuario`) REFERENCES `usuarios` (`ID_usuario`) ON UPDATE CASCADE;

--
-- Constraints for table `cita_servicio`
--
ALTER TABLE `cita_servicio`
  ADD CONSTRAINT `cs_cita` FOREIGN KEY (`ID_cita`) REFERENCES `cita` (`ID_cita`) ON UPDATE CASCADE,
  ADD CONSTRAINT `cs_servicio` FOREIGN KEY (`ID_servicio`) REFERENCES `servicios` (`ID_servicio`) ON UPDATE CASCADE;

--
-- Constraints for table `detalle_venta`
--
ALTER TABLE `detalle_venta`
  ADD CONSTRAINT `dv_farmaco` FOREIGN KEY (`ID_farmaco`) REFERENCES `farmacia` (`ID_farmaco`) ON UPDATE CASCADE,
  ADD CONSTRAINT `dv_venta` FOREIGN KEY (`ID_venta`) REFERENCES `venta` (`ID_venta`) ON UPDATE CASCADE;

--
-- Constraints for table `expediente_medico`
--
ALTER TABLE `expediente_medico`
  ADD CONSTRAINT `exp_mascota` FOREIGN KEY (`ID_mascota`) REFERENCES `mascota` (`ID_mascota`) ON UPDATE CASCADE,
  ADD CONSTRAINT `exp_usuario` FOREIGN KEY (`ID_usuario`) REFERENCES `usuarios` (`ID_usuario`) ON UPDATE CASCADE;

--
-- Constraints for table `inventario`
--
ALTER TABLE `inventario`
  ADD CONSTRAINT `inv_farmaco` FOREIGN KEY (`ID_farmaco`) REFERENCES `farmacia` (`ID_farmaco`) ON UPDATE CASCADE;

--
-- Constraints for table `mascota`
--
ALTER TABLE `mascota`
  ADD CONSTRAINT `mascota_dueño` FOREIGN KEY (`ID_dueño`) REFERENCES `dueño` (`ID_dueño`) ON UPDATE CASCADE;

--
-- Constraints for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usr_dueño` FOREIGN KEY (`ID_dueño`) REFERENCES `dueño` (`ID_dueño`) ON DELETE SET NULL,
  ADD CONSTRAINT `usr_estatus` FOREIGN KEY (`ID_estatus`) REFERENCES `estatus` (`ID_estatus`) ON DELETE CASCADE,
  ADD CONSTRAINT `usr_permisos` FOREIGN KEY (`ID_permiso`) REFERENCES `permiso` (`ID_permiso`) ON DELETE CASCADE,
  ADD CONSTRAINT `usr_tipo` FOREIGN KEY (`ID_tipoUsuario`) REFERENCES `tipo` (`ID_tipo`) ON DELETE CASCADE;

--
-- Constraints for table `vacunacion`
--
ALTER TABLE `vacunacion`
  ADD CONSTRAINT `vac_mascota` FOREIGN KEY (`ID_mascota`) REFERENCES `mascota` (`ID_mascota`) ON UPDATE CASCADE,
  ADD CONSTRAINT `vac_usuario` FOREIGN KEY (`ID_usuario`) REFERENCES `usuarios` (`ID_usuario`) ON UPDATE CASCADE;

--
-- Constraints for table `venta`
--
ALTER TABLE `venta`
  ADD CONSTRAINT `venta_dueño` FOREIGN KEY (`ID_dueño`) REFERENCES `dueño` (`ID_dueño`) ON UPDATE CASCADE,
  ADD CONSTRAINT `venta_usuario` FOREIGN KEY (`ID_usuario`) REFERENCES `usuarios` (`ID_usuario`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
