-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 03-06-2021 a las 18:05:47
-- Versión del servidor: 5.7.34
-- Versión de PHP: 7.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `rgarcia_test_compina`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `business`
--

CREATE TABLE `business` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(150) NOT NULL DEFAULT 'Por definir',
  `ruc` float NOT NULL,
  `rubro` varchar(150) NOT NULL DEFAULT 'Por definir',
  `address` text,
  `reference` text,
  `anniversary` date DEFAULT NULL,
  `page` text,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `business`
--

INSERT INTO `business` (`id`, `name`, `ruc`, `rubro`, `address`, `reference`, `anniversary`, `page`, `active`, `created_at`, `updated_at`) VALUES
(1, 'CorporaciÃ³n Capsula', 1025480000, 'Comercial', 'Av. las flores de primavera 184', 'Las flores de primavera', '2021-05-05', 'www.corporacioncapsula.com', 1, '2021-05-26 14:35:07', '2021-05-26 14:35:07'),
(2, 'PERU LNG', 20511600000, 'PETROLERO Y GAS', NULL, NULL, NULL, 'https://perulng.com/', 1, '2021-05-28 02:46:40', '2021-05-28 02:46:40'),
(3, 'Comindent Tarrillo Barba', 20100300000, 'SALUD', NULL, NULL, NULL, 'http://www.tarrillobarba.com.pe', 1, '2021-05-28 02:46:40', '2021-05-28 02:46:40'),
(4, 'BASF PERUANA S A', 20100000000, 'Productos QuÃ­micos', 'Av. Oscar R Benavides Nro. 5915 Z.I. Pque Internacion', NULL, NULL, 'http://www.basf.com.pe/', 1, '2021-05-28 02:46:40', '2021-05-28 02:46:40'),
(5, 'Grupo Beagle', 20255200000, 'Transporte de Carga', '', NULL, NULL, 'http://www.beagleshipping.com/', 1, '2021-05-28 02:46:40', '2021-05-28 02:46:40');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `customers`
--

CREATE TABLE `customers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_business` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(150) NOT NULL DEFAULT 'Por definir',
  `position` varchar(150) NOT NULL DEFAULT 'Por definir',
  `address` text,
  `district` varchar(150) NOT NULL DEFAULT 'Por definir',
  `province` varchar(150) NOT NULL DEFAULT 'Por definir',
  `email` varchar(150) DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `customers`
--

INSERT INTO `customers` (`id`, `id_business`, `name`, `position`, `address`, `district`, `province`, `email`, `phone`, `active`, `created_at`, `updated_at`) VALUES
(1, 1, 'Jorge Mayta', 'Programador', 'Av. las flores de primavera 184', 'San Juan de Lurigancho', 'LIMA', 'jorge.compina@gmail.com', '+51949495862', 1, '2021-05-26 14:36:06', '2021-05-26 14:36:06'),
(2, 3, 'Marita Olivos Salazar', 'ASISTENTE DE GERENCIA', NULL, 'Por definir', 'Por definir', 'molivos@comindent.com.pe', NULL, 1, '2021-05-28 02:35:19', '2021-05-28 02:47:25'),
(3, 4, 'Jose Guzman', 'Logistica', NULL, 'Por definir', 'Por definir', 'jose.guzman@basf.com', NULL, 1, '2021-05-28 02:35:19', '2021-05-28 02:47:42'),
(4, 2, 'Silvana Barrantes', 'COMPRAS Y LOGISTICA', 'Calle Las Palmeras 435,', 'Por definir', 'Por definir', 'sbarrantes@huntloc.pe', '707 2100', 1, '2021-05-28 02:39:52', '2021-05-28 02:48:04'),
(5, 5, 'JESUS PUENTE', 'Jefe de Compras', 'Jr. Comandante JimÃ©nez 120, Magdalena del Mar  Lima 17 - PERU', 'Por definir', 'Por definir', 'j.puente@beagle.com.pe', '6168585', 1, '2021-05-28 02:39:52', '2021-05-28 02:48:17');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `customers_perfil`
--

CREATE TABLE `customers_perfil` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_customer` bigint(20) UNSIGNED NOT NULL,
  `type` text,
  `politic_payment` text,
  `supplier_job` tinyint(1) NOT NULL DEFAULT '0',
  `facture` text,
  `frequency_payment` text,
  `special_text` text,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `details_attention`
--

CREATE TABLE `details_attention` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_people` bigint(20) UNSIGNED NOT NULL,
  `id_business` bigint(20) UNSIGNED NOT NULL,
  `id_customer` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(100) NOT NULL DEFAULT 'Por definir',
  `origin` varchar(100) NOT NULL DEFAULT 'Por definir',
  `status` varchar(100) NOT NULL DEFAULT 'Por definir',
  `date_notice` date DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `details_attention`
--

INSERT INTO `details_attention` (`id`, `id_people`, `id_business`, `id_customer`, `type`, `origin`, `status`, `date_notice`, `active`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 'Ocasional', 'Pagina Web', 'Pendiente por Cotizar', NULL, 1, '2021-05-26 17:16:01', '2021-05-26 17:16:01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `history`
--

CREATE TABLE `history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_people` bigint(20) UNSIGNED DEFAULT NULL,
  `id_attencion` bigint(20) UNSIGNED DEFAULT NULL,
  `text` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `people`
--

CREATE TABLE `people` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(150) NOT NULL DEFAULT 'Por definir',
  `last_name` varchar(150) NOT NULL DEFAULT 'Por definir',
  `birthdate` date DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `people`
--

INSERT INTO `people` (`id`, `name`, `last_name`, `birthdate`, `email`, `phone`, `active`, `created_at`, `updated_at`) VALUES
(1, 'Admin', ' ', '2020-04-03', 'hola@compina.net', '123', 1, '2021-05-19 22:20:43', '2021-05-19 22:20:43'),
(2, 'Ronald', 'Garcia', NULL, NULL, NULL, 1, '2021-05-28 02:26:21', '2021-05-28 02:26:21'),
(3, 'Karina', 'Garcia', NULL, NULL, NULL, 1, '2021-05-28 02:28:15', '2021-05-28 02:28:15');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `requirements`
--

CREATE TABLE `requirements` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `business` varchar(200) NOT NULL DEFAULT 'No existe DATO',
  `name` varchar(150) NOT NULL DEFAULT 'No existe DATO',
  `email` varchar(150) NOT NULL DEFAULT 'No existe DATO',
  `phone` varchar(30) NOT NULL DEFAULT 'No existe DATO',
  `message` text,
  `page_web` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `requirements`
--

INSERT INTO `requirements` (`id`, `business`, `name`, `email`, `phone`, `message`, `page_web`, `created_at`) VALUES
(1, 'COMPINA S.A.C', 'Enrique', 'enrique.com@gmail.com', '949563258', 'Quiero conocer mas de los productos', 'https://merchandisingb2b.com/', '2021-05-26 17:15:10');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_people` bigint(20) UNSIGNED NOT NULL,
  `user_login` varchar(150) NOT NULL DEFAULT 'Nuevo',
  `password` varchar(50) NOT NULL DEFAULT '202cb962ac59075b964b07152d234b70',
  `type_user` varchar(50) NOT NULL DEFAULT 'Tipo Nuevo',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `id_people`, `user_login`, `password`, `type_user`, `active`, `created_at`, `updated_at`) VALUES
(1, 1, 'admin', '202cb962ac59075b964b07152d234b70', 'Administrador', 1, '2021-05-19 22:20:43', '2021-05-19 22:20:43'),
(2, 2, 'ronald', '0c51adfbd5167aed82b28d097c11492d', 'Sistemas', 1, '2021-05-28 02:27:23', '2021-05-28 02:27:23'),
(3, 3, 'karina', '9fe7a5043f89f1e75881a07a8b5e382c', 'Sistemas', 1, '2021-05-28 02:29:13', '2021-05-28 02:29:13');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `business`
--
ALTER TABLE `business`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ruc` (`ruc`);

--
-- Indices de la tabla `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `phone` (`phone`),
  ADD KEY `id_business` (`id_business`);

--
-- Indices de la tabla `customers_perfil`
--
ALTER TABLE `customers_perfil`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_customer` (`id_customer`);

--
-- Indices de la tabla `details_attention`
--
ALTER TABLE `details_attention`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_people` (`id_people`),
  ADD KEY `id_business` (`id_business`),
  ADD KEY `id_customer` (`id_customer`);

--
-- Indices de la tabla `history`
--
ALTER TABLE `history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_people` (`id_people`),
  ADD KEY `id_attencion` (`id_attencion`);

--
-- Indices de la tabla `people`
--
ALTER TABLE `people`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `phone` (`phone`);

--
-- Indices de la tabla `requirements`
--
ALTER TABLE `requirements`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_people` (`id_people`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `business`
--
ALTER TABLE `business`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `customers_perfil`
--
ALTER TABLE `customers_perfil`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `details_attention`
--
ALTER TABLE `details_attention`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `history`
--
ALTER TABLE `history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `people`
--
ALTER TABLE `people`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `requirements`
--
ALTER TABLE `requirements`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `customers`
--
ALTER TABLE `customers`
  ADD CONSTRAINT `customers_ibfk_1` FOREIGN KEY (`id_business`) REFERENCES `business` (`id`);

--
-- Filtros para la tabla `customers_perfil`
--
ALTER TABLE `customers_perfil`
  ADD CONSTRAINT `customers_perfil_ibfk_1` FOREIGN KEY (`id_customer`) REFERENCES `customers` (`id`);

--
-- Filtros para la tabla `details_attention`
--
ALTER TABLE `details_attention`
  ADD CONSTRAINT `details_attention_ibfk_1` FOREIGN KEY (`id_people`) REFERENCES `people` (`id`),
  ADD CONSTRAINT `details_attention_ibfk_2` FOREIGN KEY (`id_business`) REFERENCES `business` (`id`),
  ADD CONSTRAINT `details_attention_ibfk_3` FOREIGN KEY (`id_customer`) REFERENCES `customers` (`id`);

--
-- Filtros para la tabla `history`
--
ALTER TABLE `history`
  ADD CONSTRAINT `history_ibfk_1` FOREIGN KEY (`id_people`) REFERENCES `people` (`id`),
  ADD CONSTRAINT `history_ibfk_2` FOREIGN KEY (`id_attencion`) REFERENCES `details_attention` (`id`);

--
-- Filtros para la tabla `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`id_people`) REFERENCES `people` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
