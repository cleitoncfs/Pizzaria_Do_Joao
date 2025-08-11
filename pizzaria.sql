-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 14/05/2024 às 19:27
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `pizzaria`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `bordas`
--

CREATE TABLE `bordas` (
  `id` int(11) NOT NULL,
  `tipo` varchar(100) DEFAULT NULL,
  `preco` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `bordas`
--

INSERT INTO `bordas` (`id`, `tipo`, `preco`) VALUES
(1, 'Borda simples', 0.00),
(2, 'Borda recheada - Catupiry', 1.00),
(3, 'Borda recheada - Cheddar', 1.50);

-- --------------------------------------------------------

--
-- Estrutura para tabela `massas`
--

CREATE TABLE `massas` (
  `id` int(11) NOT NULL,
  `tipo` varchar(100) DEFAULT NULL,
  `preco` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `massas`
--

INSERT INTO `massas` (`id`, `tipo`, `preco`) VALUES
(1, 'Massa comum', 0.00),
(2, 'Massa integral', 2.00),
(3, 'Massa temperada', 3.00);

-- --------------------------------------------------------

--
-- Estrutura para tabela `pedidos`
--

CREATE TABLE `pedidos` (
  `id` int(11) NOT NULL,
  `pizza_id` int(11) NOT NULL,
  `status_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `pedidos`
--

INSERT INTO `pedidos` (`id`, `pizza_id`, `status_id`) VALUES
(1, 2, 3),
(2, 7, 3),
(4, 10, 3);

-- --------------------------------------------------------

--
-- Estrutura para tabela `pizzas`
--

CREATE TABLE `pizzas` (
  `id` int(11) NOT NULL,
  `borda_id` int(11) NOT NULL,
  `massa_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `pizzas`
--

INSERT INTO `pizzas` (`id`, `borda_id`, `massa_id`) VALUES
(2, 2, 1),
(7, 1, 3),
(9, 1, 1),
(10, 2, 1),
(11, 2, 1),
(14, 1, 2),
(15, 1, 1),
(16, 2, 2),
(17, 2, 3),
(20, 2, 2),
(22, 2, 2),
(23, 1, 2),
(24, 1, 1),
(25, 2, 2),
(26, 2, 3),
(27, 1, 2),
(30, 2, 3),
(32, 1, 2),
(33, 1, 2),
(34, 1, 2);

-- --------------------------------------------------------

--
-- Estrutura para tabela `pizza_sabor`
--

CREATE TABLE `pizza_sabor` (
  `id` int(11) NOT NULL,
  `pizza_id` int(11) NOT NULL,
  `sabor_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `pizza_sabor`
--

INSERT INTO `pizza_sabor` (`id`, `pizza_id`, `sabor_id`) VALUES
(1, 2, 1),
(2, 7, 2),
(3, 9, 1),
(4, 9, 2),
(5, 9, 3),
(6, 10, 4),
(7, 11, 1),
(8, 14, 1),
(9, 15, 1),
(10, 15, 2),
(11, 16, 1),
(12, 17, 1),
(13, 20, 1),
(14, 20, 3),
(15, 20, 5),
(16, 22, 1),
(17, 22, 5),
(18, 22, 7),
(19, 23, 1),
(20, 23, 5),
(21, 23, 7),
(22, 24, 1),
(23, 25, 1),
(24, 25, 2),
(25, 25, 3),
(26, 26, 1),
(27, 26, 2),
(28, 26, 3),
(29, 27, 1),
(30, 27, 2),
(31, 27, 3),
(32, 30, 1),
(33, 30, 2),
(34, 30, 7),
(35, 32, 6),
(36, 32, 7),
(37, 33, 3),
(38, 33, 4),
(39, 33, 5),
(40, 34, 1),
(41, 34, 2),
(42, 34, 3);

-- --------------------------------------------------------

--
-- Estrutura para tabela `sabores`
--

CREATE TABLE `sabores` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `preco` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `sabores`
--

INSERT INTO `sabores` (`id`, `nome`, `preco`) VALUES
(1, '4 Queijos', 8.99),
(2, 'Frango com catupiry', 8.99),
(3, 'Calabresa', 9.99),
(4, 'Lombinho', 9.99),
(5, 'Filé com cheddar', 10.99),
(6, 'Portuguesa', 8.99),
(7, 'Margherita', 7.99);

-- --------------------------------------------------------

--
-- Estrutura para tabela `status`
--

CREATE TABLE `status` (
  `id` int(11) NOT NULL,
  `tipo` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `status`
--

INSERT INTO `status` (`id`, `tipo`) VALUES
(1, 'Em produção'),
(2, 'Em entrega'),
(3, 'Concluído');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `bordas`
--
ALTER TABLE `bordas`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `massas`
--
ALTER TABLE `massas`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pizza_id` (`pizza_id`),
  ADD KEY `status_id` (`status_id`);

--
-- Índices de tabela `pizzas`
--
ALTER TABLE `pizzas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `borda_id` (`borda_id`),
  ADD KEY `massa_id` (`massa_id`);

--
-- Índices de tabela `pizza_sabor`
--
ALTER TABLE `pizza_sabor`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pizza_id` (`pizza_id`),
  ADD KEY `sabor_id` (`sabor_id`);

--
-- Índices de tabela `sabores`
--
ALTER TABLE `sabores`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `bordas`
--
ALTER TABLE `bordas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `massas`
--
ALTER TABLE `massas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de tabela `pizzas`
--
ALTER TABLE `pizzas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT de tabela `pizza_sabor`
--
ALTER TABLE `pizza_sabor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT de tabela `sabores`
--
ALTER TABLE `sabores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `status`
--
ALTER TABLE `status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`pizza_id`) REFERENCES `pizzas` (`id`),
  ADD CONSTRAINT `pedidos_ibfk_2` FOREIGN KEY (`status_id`) REFERENCES `status` (`id`);

--
-- Restrições para tabelas `pizzas`
--
ALTER TABLE `pizzas`
  ADD CONSTRAINT `pizzas_ibfk_1` FOREIGN KEY (`borda_id`) REFERENCES `bordas` (`id`),
  ADD CONSTRAINT `pizzas_ibfk_2` FOREIGN KEY (`massa_id`) REFERENCES `massas` (`id`);

--
-- Restrições para tabelas `pizza_sabor`
--
ALTER TABLE `pizza_sabor`
  ADD CONSTRAINT `pizza_sabor_ibfk_1` FOREIGN KEY (`pizza_id`) REFERENCES `pizzas` (`id`),
  ADD CONSTRAINT `pizza_sabor_ibfk_2` FOREIGN KEY (`sabor_id`) REFERENCES `sabores` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
