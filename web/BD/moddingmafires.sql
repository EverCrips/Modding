-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-06-2018 a las 09:57:24
-- Versión del servidor: 10.1.21-MariaDB
-- Versión de PHP: 7.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `moddingmafires`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `idCategoria` int(10) NOT NULL,
  `nombreCategoria` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`idCategoria`, `nombreCategoria`) VALUES
(1, 'ADMINISTRADOR'),
(2, 'CLIENTE');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cotizaciones`
--

CREATE TABLE `cotizaciones` (
  `numeroCotizacion` int(11) NOT NULL,
  `estadoCotizacion` varchar(30) NOT NULL,
  `nombreCotizacion` varchar(50) NOT NULL,
  `descripcionCotizacion` varchar(100) NOT NULL,
  `idUsuarioCotizacion` int(11) NOT NULL,
  `montoCotizacion` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cotizaciones`
--

INSERT INTO `cotizaciones` (`numeroCotizacion`, `estadoCotizacion`, `nombreCotizacion`, `descripcionCotizacion`, `idUsuarioCotizacion`, `montoCotizacion`) VALUES
(1, 'Abierto', 'Cotización Notebook ', 'Se realiza la cotización de un notebook hp. Remodelar teclado y apartados.', 1, '2.000'),
(2, 'Abierto', 'Cotización Mouse Gamer', 'Se realiza la cotización de mouse gamer. Se requiere color verde.', 1, '50.000'),
(3, ' Abierta ', ' Pantalla ', ' Portasdasd ', 1, '90.000'),
(4, ' Abierto ', ' Cotizacion Teclado Gamer ', ' Cotizar mejorar su propio teclado ', 1, '98.000'),
(5, ' Abierto ', ' Cotizacion Ventiladores Con Led ', ' Cotizar mejorar su propio ventilador ', 3, ' 30.000 ');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detallecotizaciones`
--

CREATE TABLE `detallecotizaciones` (
  `numeroCotizacionDetalle` int(11) NOT NULL,
  `fechaDetalle` date NOT NULL,
  `estadoDetalle` varchar(50) NOT NULL,
  `descripcionCotizacion` varchar(300) NOT NULL,
  `idCotizacionDetalle` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `detallecotizaciones`
--

INSERT INTO `detallecotizaciones` (`numeroCotizacionDetalle`, `fechaDetalle`, `estadoDetalle`, `descripcionCotizacion`, `idCotizacionDetalle`) VALUES
(1, '2018-05-30', 'Recepción Producto', 'Se realiza la recepción del notebook ', 1),
(2, '2018-05-30', 'Avance número 1', 'Se le instala el teclado retroiluminado al notebook', 1),
(3, '2018-05-31', 'Avance número 2', 'Se colocan calcomanias', 1),
(4, '2018-06-01', 'Despachado', 'Se realiza el despacho del producto', 1),
(5, '2018-06-03', 'Recepción Producto', 'Se recepciona el producto', 2),
(6, '2018-05-13', 'Avance número 1', 'Se hacen los retoques al mouse. Se realizan lsa pruebas correspondientes', 2),
(13, '2018-06-14', 'Despacho', 'Se realiza el despacho del producto', 2),
(14, '2018-06-16', ' INTENTANDO ', ' PortasSDASDdasd ', 1),
(15, '2018-06-19', ' Avance Numero prueba ', ' Entrega del producto ', 5),
(16, '2018-06-19', ' Avance Numero 1 ', ' Compra de luces ', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `direcciones`
--

CREATE TABLE `direcciones` (
  `idDireccion` int(11) NOT NULL,
  `nombreDireccion` varchar(70) NOT NULL,
  `ciudadDireccion` varchar(50) NOT NULL,
  `regionDireccion` varchar(50) NOT NULL,
  `comunaDireccion` varchar(50) NOT NULL,
  `idUsuarioDireccion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `direcciones`
--

INSERT INTO `direcciones` (`idDireccion`, `nombreDireccion`, `ciudadDireccion`, `regionDireccion`, `comunaDireccion`, `idUsuarioDireccion`) VALUES
(1, 'Villa Pajaeritos ', 'Santiago ', 'Metropolitana de Santiago ', 'Independencia', 6),
(2, '', '', '', '', 7),
(3, 'asd', 'sadsadsad', 'Metropolitana de Santiago ', 'Cerro Navia', 8),
(4, 'asdsa', 'sadsadsad', 'Magallanes', 'Punta Arenas', 9),
(13, 'Villa Los Aromos', 'sadsadsad', 'Tarapacá', 'Pica', 11),
(16, 'Villa Los Aromos', 'Los Andes', 'Valparaíso', 'Limache', 11),
(17, 'Villa Pajaeritos', 'Los Andes', 'Los Ríos', 'San José De La Mariquina', 12),
(18, 'Villa Pajaeritos', 'Los Andes', 'Los Ríos', 'Panguipulli', 12);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `idUsuario` int(11) NOT NULL,
  `estadoUsuario` tinyint(1) NOT NULL,
  `nombreUsuario` varchar(30) NOT NULL,
  `apellidosUsuario` varchar(40) NOT NULL,
  `runUsuario` varchar(14) NOT NULL,
  `celularUsuario` varchar(15) NOT NULL,
  `emailUsuario` varchar(100) NOT NULL,
  `passUsuario` varchar(20) NOT NULL,
  `idCategoriaUsuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`idUsuario`, `estadoUsuario`, `nombreUsuario`, `apellidosUsuario`, `runUsuario`, `celularUsuario`, `emailUsuario`, `passUsuario`, `idCategoriaUsuario`) VALUES
(1, 1, 'Francisca', 'Vazques', '12.122.122-5', '+(569)11222212', 'inventado@gmail.cl', 'asdfg123456', 2),
(2, 1, 'Cristopher', 'Perez Vargas', '18.973.714-9', '+(569)78829337', 'vargas.cristopher@hotmail.com', '123456', 1),
(3, 1, 'Maluenda', 'Versati', '19.827.341-2', '+(569)11222244', 'inventado@gmail.com', 'pass123456', 2),
(4, 1, 'armando', 'asdsad', '12.122.122-3', '+56911221144', 'ddd@hotmail.com', 'pass123456', 2),
(5, 1, 'Armande', 'asdsad', '12.122.122-3', '+56911221149', 'da@hotmail.com', 'pass123456', 2),
(6, 1, ' Francisco Alberto', 'Perez Cotapo', '17.542.234-1', '+(569)11222233', 'test3@gmail.com', '123456', 2),
(8, 1, 'sdf', 'sadsadsa', '18.973.714-9', '+(569)163443', 'test4@gmail.com', '12345', 2),
(9, 1, 'Kevin', 'asdsadsa', '18.973.714-9', '+(569)564645', 'test5@gmail.com', 'asdfg', 2),
(10, 1, 'ultima', 'ultima', '15.123.125-2', '+(569)11212211', 'test8@gmail.com', 'asdfg', 2),
(11, 1, 'sdf', 'sadasd', '15.123.125-2', '+(569)11222233', 'asdsadasdas@gmail.com', 'asdfghj', 2),
(12, 1, 'asddsad', 'sadsadsa', '23.234.222-6', '+(569)11222211', 'asd123@gmail.com', 'asdfg', 2);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`idCategoria`);

--
-- Indices de la tabla `cotizaciones`
--
ALTER TABLE `cotizaciones`
  ADD PRIMARY KEY (`numeroCotizacion`);

--
-- Indices de la tabla `detallecotizaciones`
--
ALTER TABLE `detallecotizaciones`
  ADD PRIMARY KEY (`numeroCotizacionDetalle`);

--
-- Indices de la tabla `direcciones`
--
ALTER TABLE `direcciones`
  ADD PRIMARY KEY (`idDireccion`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`idUsuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `idCategoria` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `cotizaciones`
--
ALTER TABLE `cotizaciones`
  MODIFY `numeroCotizacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `detallecotizaciones`
--
ALTER TABLE `detallecotizaciones`
  MODIFY `numeroCotizacionDetalle` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
