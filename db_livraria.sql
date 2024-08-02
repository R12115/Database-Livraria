-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 02/08/2024 às 22:40
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `db_livraria`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `tbl_autores`
--

CREATE TABLE `tbl_autores` (
  `id_autor` int(11) NOT NULL,
  `nome` varchar(200) DEFAULT NULL,
  `nacionalidade` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `tbl_autores`
--

INSERT INTO `tbl_autores` (`id_autor`, `nome`, `nacionalidade`) VALUES
(1, 'J.R.R. Tolkien', 'Britânico'),
(2, 'J.K Rowling', 'Briânica'),
(3, 'Dan Brown', 'Americano'),
(4, 'C.S Lewis', 'Britânico');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tbl_livros`
--

CREATE TABLE `tbl_livros` (
  `id_livro` int(11) NOT NULL,
  `titulo` varchar(200) DEFAULT NULL,
  `ano_publicacao` year(4) DEFAULT NULL,
  `preco` decimal(10,0) DEFAULT NULL,
  `id_autor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `tbl_livros`
--

INSERT INTO `tbl_livros` (`id_livro`, `titulo`, `ano_publicacao`, `preco`, `id_autor`) VALUES
(1, 'O Senhor dos Anéis', '1954', 46, 1),
(2, 'Harry Potter', '1997', 40, 2),
(3, 'O Código Da Vinci', '2003', 30, 3),
(4, 'As Crônicas de Nárnia', '1950', 35, 4);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tbl_vendas`
--

CREATE TABLE `tbl_vendas` (
  `id_vendas` int(11) NOT NULL,
  `data_venda` int(11) DEFAULT NULL,
  `quantidade` int(11) DEFAULT NULL,
  `valor_total` decimal(10,0) DEFAULT NULL,
  `id_livro` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `tbl_vendas`
--

INSERT INTO `tbl_vendas` (`id_vendas`, `data_venda`, `quantidade`, `valor_total`, `id_livro`) VALUES
(1, 2013, 3, 138, 1),
(2, 2007, 2, 80, 2),
(3, 2016, 1, 30, 3),
(4, 2008, 5, 175, 4);

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `tbl_autores`
--
ALTER TABLE `tbl_autores`
  ADD PRIMARY KEY (`id_autor`);

--
-- Índices de tabela `tbl_livros`
--
ALTER TABLE `tbl_livros`
  ADD PRIMARY KEY (`id_livro`),
  ADD KEY `id_autor` (`id_autor`);

--
-- Índices de tabela `tbl_vendas`
--
ALTER TABLE `tbl_vendas`
  ADD PRIMARY KEY (`id_vendas`),
  ADD KEY `id_livro` (`id_livro`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `tbl_autores`
--
ALTER TABLE `tbl_autores`
  MODIFY `id_autor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `tbl_livros`
--
ALTER TABLE `tbl_livros`
  MODIFY `id_livro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `tbl_vendas`
--
ALTER TABLE `tbl_vendas`
  MODIFY `id_vendas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `tbl_livros`
--
ALTER TABLE `tbl_livros`
  ADD CONSTRAINT `tbl_livros_ibfk_1` FOREIGN KEY (`id_autor`) REFERENCES `tbl_autores` (`id_autor`);

--
-- Restrições para tabelas `tbl_vendas`
--
ALTER TABLE `tbl_vendas`
  ADD CONSTRAINT `tbl_vendas_ibfk_1` FOREIGN KEY (`id_livro`) REFERENCES `tbl_livros` (`id_livro`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
