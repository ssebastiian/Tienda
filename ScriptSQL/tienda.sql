-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-09-2021 a las 17:19:52
-- Versión del servidor: 10.4.14-MariaDB
-- Versión de PHP: 7.2.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tienda`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_detalle_venta`
--

CREATE TABLE `tbl_detalle_venta` (
  `id_detalle` int(11) NOT NULL,
  `idventa` int(11) NOT NULL,
  `idproducto` int(11) NOT NULL,
  `precio` decimal(20,0) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `descargado` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tbl_detalle_venta`
--

INSERT INTO `tbl_detalle_venta` (`id_detalle`, `idventa`, `idproducto`, `precio`, `cantidad`, `descargado`) VALUES
(2, 8, 2, '7', 1, 0),
(3, 8, 1, '5', 1, 0),
(4, 8, 3, '8', 1, 0),
(5, 9, 2, '7', 1, 0),
(6, 9, 1, '5', 1, 0),
(7, 9, 3, '8', 1, 0),
(8, 10, 2, '7', 1, 0),
(9, 10, 1, '5', 1, 0),
(10, 10, 3, '8', 1, 0),
(11, 11, 2, '7', 1, 0),
(12, 11, 1, '5', 1, 0),
(13, 11, 3, '8', 1, 0),
(14, 12, 2, '7', 1, 0),
(15, 12, 1, '5', 1, 0),
(16, 12, 3, '8', 1, 0),
(17, 13, 2, '7', 1, 0),
(18, 13, 1, '5', 1, 0),
(19, 13, 3, '8', 1, 0),
(20, 14, 2, '7', 1, 0),
(21, 14, 1, '5', 1, 0),
(22, 14, 3, '8', 1, 0),
(23, 15, 2, '7', 1, 0),
(24, 15, 1, '5', 1, 0),
(25, 15, 3, '8', 1, 0),
(26, 16, 2, '7', 1, 0),
(27, 16, 1, '5', 1, 0),
(28, 17, 8, '20', 1, 0),
(29, 17, 6, '10', 1, 0),
(30, 17, 1, '5', 1, 0),
(31, 18, 2, '7', 1, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_productos`
--

CREATE TABLE `tbl_productos` (
  `id_producto` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `precio` decimal(20,2) NOT NULL,
  `descripcion` text NOT NULL,
  `imagen` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tbl_productos`
--

INSERT INTO `tbl_productos` (`id_producto`, `nombre`, `precio`, `descripcion`, `imagen`) VALUES
(1, 'PHP 7', '5.00', 'This new book on PHP 7 introduces writing solid, secure, object-oriented code in the new PHP 7: you will create a complete three-tier application using a natural process of building and testing modules within each tier. This practical approach teaches you about app development and introduces PHP features when they are actually needed rather than providing you with abstract theory and contrived examples.', 'https://d1w7fb2mkkr3kw.cloudfront.net/assets/images/book/lrg/9781/4842/9781484217290.jpg'),
(2, 'Professional ASP.NET MVC 5 ', '7.00', 'MVC 5 is the newest update to the popular Microsoft technology that enables you to build dynamic, data-driven websites. Like previous versions, this guide shows you step-by-step techniques on using MVC to best advantage, with plenty of practical tutorials to illustrate the concepts. It covers controllers, views, and models; forms and HTML helpers; data annotation and validation; membership, authorization, and security.', 'https://images-na.ssl-images-amazon.com/images/I/51u-ERS1W8L._SX396_BO1,204,203,200_.jpg'),
(3, 'Learning Vue.js 2', '8.00', '* Learn how to propagate DOM changes across the website without writing extensive jQuery callbacks code.\r\n* Learn how to achieve reactivity and easily compose views with Vue.js and understand what it does behind the scenes.\r\n* Explore the core features of Vue.js with small examples, learn how to build dynamic content into preexisting web applications, and build Vue.js applications from scratch.', 'https://d1w7fb2mkkr3kw.cloudfront.net/assets/images/book/lrg/9781/7864/9781786469946.jpg'),
(4, 'Curso C/C++ 2015', '25.00', 'Aprende los conceptos basicos de c para la vida real ', 'https://cedisalibros.com/wp-content/uploads/9788441536234.jpg'),
(5, 'PYTHON', '15.00', 'Guia completa para principiantes', 'https://m.media-amazon.com/images/I/51q1cGbAtyL.jpg'),
(6, 'JAVA', '10.00', 'nuevo mundo de java', 'https://storage-gcp-production.publica.la/editorial-macro/issues/2018/10/6ZYSJIPCMPCUO9J9/1540220445_cover.png'),
(7, 'lógica programación', '13.00', 'aprende como organizar tus proyectos e implementarlos con algo nuevo ', 'https://edicionesdelau.com/wp-content/uploads/2017/11/Logica-de-programacion.jpg'),
(8, 'HTML,CSS y JavaScript', '20.00', 'aprende como hacer una pagina completa con las nuevas tecnologías ', 'https://images-na.ssl-images-amazon.com/images/I/41MYcwHbDtL.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_ventas`
--

CREATE TABLE `tbl_ventas` (
  `id_ventas` int(11) NOT NULL,
  `ClaveTrasaccion` varchar(255) NOT NULL,
  `paypaldatos` text NOT NULL,
  `fecha` datetime NOT NULL,
  `correo` varchar(255) NOT NULL,
  `total` decimal(60,0) NOT NULL,
  `status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tbl_ventas`
--

INSERT INTO `tbl_ventas` (`id_ventas`, `ClaveTrasaccion`, `paypaldatos`, `fecha`, `correo`, `total`, `status`) VALUES
(1, '123456', '', '2021-09-21 16:00:20', 'ssebastian@gmail.com', '400', 'pendiente'),
(2, '123456', '', '2021-09-21 16:00:20', 'ssebastian@gmail.com', '500', 'pendiente'),
(3, '23kj7sienk1q89eivvh6nmsc4i', '', '2021-09-21 16:17:02', 'prueba', '12', 'pendiente'),
(4, '23kj7sienk1q89eivvh6nmsc4i', '', '2021-09-21 16:20:40', 'oscar@gmail.com', '20', 'pendiente'),
(5, '23kj7sienk1q89eivvh6nmsc4i', '', '2021-09-21 16:45:01', 'ssebastiancarrillo@gmail.com', '20', 'pendiente'),
(6, '23kj7sienk1q89eivvh6nmsc4i', '', '2021-09-21 17:02:59', 'ssebastiancarrillo@gmail.com', '7', 'pendiente'),
(7, '23kj7sienk1q89eivvh6nmsc4i', '', '2021-09-21 18:09:02', 'ssebastiancarrillo@gmail.com', '20', 'pendiente'),
(8, '23kj7sienk1q89eivvh6nmsc4i', '', '2021-09-21 18:14:15', 'ssebastiancarrillo@gmail.com', '20', 'pendiente'),
(9, '23kj7sienk1q89eivvh6nmsc4i', '', '2021-09-21 18:25:03', 'sebastian@hotmail.com', '20', 'pendiente'),
(10, '23kj7sienk1q89eivvh6nmsc4i', '', '2021-09-21 18:47:13', 'sebastian@hotmail.com', '20', 'pendiente'),
(11, '23kj7sienk1q89eivvh6nmsc4i', '', '2021-09-21 18:47:57', 'sebastian@hotmail.com', '20', 'pendiente'),
(12, '23kj7sienk1q89eivvh6nmsc4i', '', '2021-09-21 18:52:11', 'sebastian@hotmail.com', '20', 'pendiente'),
(13, '23kj7sienk1q89eivvh6nmsc4i', '', '2021-09-21 19:19:11', 'ssebastiancarrillo@gmail.com', '20', 'pendiente'),
(14, '23kj7sienk1q89eivvh6nmsc4i', '', '2021-09-21 19:21:57', 'ssebastiancarrillo@gmail.com', '20', 'pendiente'),
(15, '23kj7sienk1q89eivvh6nmsc4i', '', '2021-09-21 19:23:02', 'ssebastiancarrillo@gmail.com', '20', 'pendiente'),
(16, '23kj7sienk1q89eivvh6nmsc4i', '', '2021-09-21 19:23:16', 'ssebastiancarrillo@gmail.com', '12', 'pendiente'),
(17, '23kj7sienk1q89eivvh6nmsc4i', '', '2021-09-21 20:49:03', 'ssebastiancarrillo@gmail.com', '35', 'pendiente'),
(18, '23kj7sienk1q89eivvh6nmsc4i', '', '2021-09-21 21:24:10', 'ssebastiancarrillo@gmail.com', '7', 'pendiente');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tbl_detalle_venta`
--
ALTER TABLE `tbl_detalle_venta`
  ADD PRIMARY KEY (`id_detalle`),
  ADD KEY `idventa` (`idventa`),
  ADD KEY `idproducto` (`idproducto`);

--
-- Indices de la tabla `tbl_productos`
--
ALTER TABLE `tbl_productos`
  ADD PRIMARY KEY (`id_producto`);

--
-- Indices de la tabla `tbl_ventas`
--
ALTER TABLE `tbl_ventas`
  ADD PRIMARY KEY (`id_ventas`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tbl_detalle_venta`
--
ALTER TABLE `tbl_detalle_venta`
  MODIFY `id_detalle` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT de la tabla `tbl_productos`
--
ALTER TABLE `tbl_productos`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `tbl_ventas`
--
ALTER TABLE `tbl_ventas`
  MODIFY `id_ventas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tbl_detalle_venta`
--
ALTER TABLE `tbl_detalle_venta`
  ADD CONSTRAINT `tbldetalle_fk_1` FOREIGN KEY (`idventa`) REFERENCES `tbl_ventas` (`id_ventas`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbldetalle_fk_2` FOREIGN KEY (`idproducto`) REFERENCES `tbl_productos` (`id_producto`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
