-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Tempo de geração: 28/06/2022 às 19:53
-- Versão do servidor: 10.1.48-MariaDB-0ubuntu0.18.04.1
-- Versão do PHP: 8.1.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `sshplus`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `acesso_servidor`
--

CREATE TABLE `acesso_servidor` (
  `id_acesso_servidor` int(10) NOT NULL,
  `id_servidor` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_mestre` int(11) NOT NULL DEFAULT '0',
  `id_servidor_mestre` int(11) NOT NULL DEFAULT '0',
  `qtd` int(10) NOT NULL DEFAULT '0',
  `validade` datetime NOT NULL,
  `demo` int(2) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `admin`
--

CREATE TABLE `admin` (
  `id_administrador` int(11) NOT NULL,
  `login` varchar(60) NOT NULL,
  `senha` varchar(60) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `accessKEY` varchar(100) DEFAULT NULL,
  `site` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Despejando dados para a tabela `admin`
--

INSERT INTO `admin` (`id_administrador`, `login`, `senha`, `nome`, `email`, `accessKEY`, `site`) VALUES
(1, 'admin', 'admin', 'Administrador', 'meuemail@gmail.com', NULL, 'meudominio.xyz');

-- --------------------------------------------------------

--
-- Estrutura para tabela `anuncios`
--

CREATE TABLE `anuncios` (
  `anuncio1` text NOT NULL,
  `anuncio2` text NOT NULL,
  `anuncio3` text NOT NULL,
  `anuncio4` text NOT NULL,
  `anuncio5` text NOT NULL,
  `anuncio6` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `arquivo_download`
--

CREATE TABLE `arquivo_download` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `status` enum('funcionando','testes') NOT NULL,
  `tipo` enum('ehi','apk','outros') NOT NULL,
  `operadora` enum('todas','claro','vivo','tim','oi') NOT NULL,
  `data` datetime NOT NULL,
  `detalhes` text NOT NULL,
  `nome_arquivo` varchar(255) NOT NULL,
  `cliente_tipo` enum('vpn','revenda','todos') NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `chamados`
--

CREATE TABLE `chamados` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `id_mestre` int(11) NOT NULL DEFAULT '0',
  `tipo` enum('contassh','revendassh','usuariossh','servidor','outros') NOT NULL,
  `status` enum('aberto','resposta','encerrado') NOT NULL,
  `resposta` text NOT NULL,
  `login` varchar(255) NOT NULL,
  `motivo` varchar(255) NOT NULL,
  `mensagem` text NOT NULL,
  `data` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `configs`
--

CREATE TABLE `configs` (
  `id` int(11) NOT NULL,
  `nome` varchar(60) NOT NULL,
  `valor` varbinary(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Despejando dados para a tabela `configs`
--

INSERT INTO `configs` (`id`, `nome`, `valor`) VALUES
(1, 'versao', 0x312e302e31),
(2, 'notas', 0xf09f918b20415455414c495a41c387c3834f20444953504f4ec38d56454c2120f09f918b),
(3, 'sms', 0x687474703a2f2f646f6d696e696f2e78797a2f736d732e706870),
(4, 'update', 0x687474703a2f2f646f6d696e696f2e78797a2f7570646174652e706870),
(5, 'email', 0x6d6575656d61696c40676d61696c2e636f6d),
(6, 'contato', 0x68747470733a2f2f742e6d652f74656c656772616d),
(7, 'termos', 0x687474703a2f2f646f6d696e696f2e78797a2f617070732f7465726d6f732e706870),
(8, 'checkuser', 0x74727565),
(9, 'msg', 0xf09f9a8020434c4951554520454d20415455414c495a415220f09f9a80),
(10, 'nsms', 0x3031);

-- --------------------------------------------------------

--
-- Estrutura para tabela `configuracao`
--

CREATE TABLE `configuracao` (
  `id_configuracao` int(11) NOT NULL,
  `id_usuario` int(10) NOT NULL,
  `titulo_pagina` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `fatura`
--

CREATE TABLE `fatura` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `servidor_id` int(11) NOT NULL,
  `conta_id` int(11) NOT NULL,
  `tipo` enum('vpn','revenda','outros') NOT NULL,
  `qtd` int(11) NOT NULL,
  `data` datetime NOT NULL,
  `datavencimento` datetime NOT NULL,
  `status` enum('pendente','cancelado','pago') NOT NULL,
  `descrição` text NOT NULL,
  `valor` int(11) NOT NULL,
  `desconto` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `fatura_clientes`
--

CREATE TABLE `fatura_clientes` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `id_mestre` int(11) NOT NULL DEFAULT '0',
  `servidor_id` int(11) NOT NULL,
  `conta_id` int(11) NOT NULL,
  `tipo` enum('vpn','revenda','outros') NOT NULL,
  `qtd` int(11) NOT NULL,
  `data` datetime NOT NULL,
  `datavencimento` datetime NOT NULL,
  `status` enum('pendente','cancelado','pago') NOT NULL,
  `descrição` text NOT NULL,
  `valor` int(11) NOT NULL,
  `desconto` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `fatura_comprovantes`
--

CREATE TABLE `fatura_comprovantes` (
  `id` int(11) NOT NULL,
  `fatura_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `status` enum('aberto','fechado') NOT NULL DEFAULT 'aberto',
  `data` datetime NOT NULL,
  `formapagamento` enum('boleto','deptra') NOT NULL,
  `nota` text NOT NULL,
  `imagem` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `fatura_comprovantes_clientes`
--

CREATE TABLE `fatura_comprovantes_clientes` (
  `id` int(11) NOT NULL,
  `id_mestre` int(11) NOT NULL DEFAULT '0',
  `fatura_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `status` enum('aberto','fechado') NOT NULL DEFAULT 'aberto',
  `data` datetime NOT NULL,
  `formapagamento` enum('boleto','deptra') NOT NULL,
  `nota` text NOT NULL,
  `imagem` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `historico_login`
--

CREATE TABLE `historico_login` (
  `id_historico_login` int(10) NOT NULL,
  `id_usuario` int(10) NOT NULL,
  `data_login` datetime NOT NULL,
  `ip_login` varchar(100) NOT NULL,
  `navegador` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `hist_usuario_ssh_online`
--

CREATE TABLE `hist_usuario_ssh_online` (
  `id_hist_usrSSH` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `hora_conexao` datetime NOT NULL,
  `hora_desconexao` datetime DEFAULT NULL,
  `status` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `hist_usuario_ssh_online_free`
--

CREATE TABLE `hist_usuario_ssh_online_free` (
  `id_hist_usrSSH` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `hora_conexao` datetime NOT NULL,
  `hora_desconexao` datetime DEFAULT NULL,
  `status` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `informativo`
--

CREATE TABLE `informativo` (
  `id` int(11) NOT NULL,
  `data` datetime NOT NULL,
  `imagem` varchar(255) NOT NULL,
  `link` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `mercadopago`
--

CREATE TABLE `mercadopago` (
  `CLIENT_ID` varchar(255) NOT NULL,
  `CLIENT_SECRET` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `noticias`
--

CREATE TABLE `noticias` (
  `id` int(11) NOT NULL,
  `status` enum('ativo','desativado') NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `subtitulo` varchar(255) NOT NULL,
  `msg` text NOT NULL,
  `data` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `notificacoes`
--

CREATE TABLE `notificacoes` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `conta_id` int(11) NOT NULL,
  `data` datetime NOT NULL,
  `tipo` enum('fatura','conta','revenda','outros','usuario','chamados') NOT NULL,
  `linkfatura` varchar(255) NOT NULL,
  `mensagem` text NOT NULL,
  `info_outros` varchar(50) NOT NULL,
  `lido` enum('nao','sim') NOT NULL DEFAULT 'nao',
  `admin` enum('nao','sim') NOT NULL DEFAULT 'nao'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `ovpn`
--

CREATE TABLE `ovpn` (
  `id` int(11) NOT NULL,
  `servidor_id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `arquivo` varchar(255) NOT NULL,
  `data` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `payloads`
--

CREATE TABLE `payloads` (
  `id` int(11) NOT NULL,
  `Name` varbinary(100) NOT NULL,
  `FLAG` varchar(100) NOT NULL,
  `Payload` varchar(200) NOT NULL,
  `SNI` varchar(100) NOT NULL,
  `TlsIP` varchar(100) NOT NULL,
  `ProxyIP` varchar(100) NOT NULL,
  `ProxyPort` varchar(10) NOT NULL,
  `Info` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Despejando dados para a tabela `payloads`
--

INSERT INTO `payloads` (`id`, `Name`, `FLAG`, `Payload`, `SNI`, `TlsIP`, `ProxyIP`, `ProxyPort`, `Info`) VALUES
(1, 0xf09f929c205649564f20434c4f554420f09f929c, 'vivo', 'GET wss://api.bitso.com/ HTTP/1.1[crlf]Host: [app_host][crlf]Upgrade: Websocket[crlf]Connection: Keep-Alive[crlf]Connection: Keep-Alive[crlf][crlf]', 'api.bitso.com', '172.64.195.2', '', '443', 'Tlsws'),
(2, 0xf09f929c205649564f204a4f474f5320f09f929c, 'vivo', 'GET wss://support.pokemon.com/ HTTP/1.1[crlf]Host: [app_host][crlf]Upgrade: Websocket[crlf]Connection: Keep-Alive[crlf]Connection: Keep-Alive[crlf][crlf]', 'support.pokemon.com', '172.64.130.2', '', '443', 'Tlsws'),
(3, 0xf09f92992054494d20434c4f554420f09f9299, 'tim', 'GET wss://static.r4you.co  HTTP/1.1[crlf]Host: [app_host][crlf]Upgrade: websocket[crlf][crlf]', 'static.r4you.co', 'static.r4you.co', '', '443', 'Tlsws'),
(4, 0xf09f92992054494d205241494f20f09f9299, 'tim', 'GET wss://static.r4you.co  HTTP/1.1[crlf]Host: [app_host][crlf]Upgrade: websocket[crlf][crlf]', 'static.r4you.co', '104.26.5.175', '', '443', 'Tlsws'),
(5, 0xe29da4efb88f20434c41524f20535045454420e29da4efb88f, 'claro', 'GET wss://ct.livestream.com/ HTTP/1.1[crlf]Host: [app_host][crlf]Upgrade: websocket[crlf][crlf]', 'ct.livestream.com', 'ct.livestream.com', '', '443', 'Tlsws'),
(6, 0xe29da4efb88f20434c41524f20464c495820e29da4efb88f, 'claro', 'GET wss://lp.livestream.com/ HTTP/1.1[crlf]Host: [app_host][crlf]Upgrade: websocket[crlf][crlf]', 'lp.livestream.com', 'lp.livestream.com', '', '443', 'Tlsws'),
(7, 0xf09f929b204f49204641535420f09f929b, 'oi', 'GET ws://www.hbogo.com.br HTTP/1.1\nHost: [app_host]\nUpgrade: ws\n\n', 'www.hbogo.com.br', 'www.hbogo.com.br', '', '', 'Tlsws'),
(8, 0xf09f929b204f4920574f524c4420f09f929b, 'oi', 'GET ws://www.hbogo.com.br HTTP/1.1\nHost: [app_host]\nUpgrade: ws\n\n', 'www.hbogo.com.br', '104.16.53.91', '', '', 'Tlsws');

-- --------------------------------------------------------

--
-- Estrutura para tabela `portas`
--

CREATE TABLE `portas` (
  `id` int(11) NOT NULL,
  `Porta` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Despejando dados para a tabela `portas`
--

INSERT INTO `portas` (`id`, `Porta`) VALUES
(1, '7100'),
(2, '7200'),
(3, '7300');

-- --------------------------------------------------------

--
-- Estrutura para tabela `servidor`
--

CREATE TABLE `servidor` (
  `id_servidor` int(11) NOT NULL,
  `ativo` int(10) NOT NULL DEFAULT '0',
  `nome` varchar(100) NOT NULL,
  `regiao` enum('asia','america','europa','australia') NOT NULL,
  `limite_usuario` int(10) NOT NULL DEFAULT '0',
  `ip_servidor` varchar(100) NOT NULL,
  `site_servidor` varchar(255) NOT NULL,
  `login_server` varchar(30) NOT NULL,
  `senha` varchar(60) NOT NULL,
  `porta` int(10) NOT NULL DEFAULT '22',
  `dias` int(10) NOT NULL DEFAULT '0',
  `demo` int(11) NOT NULL DEFAULT '0',
  `ehi` varchar(1000) DEFAULT NULL,
  `localizacao` varchar(255) NOT NULL,
  `localizacao_img` varchar(50) NOT NULL,
  `validade` int(11) NOT NULL,
  `limite` int(11) NOT NULL,
  `tipo` enum('premium','free') NOT NULL DEFAULT 'premium',
  `manutencao` enum('nao','sim') NOT NULL DEFAULT 'nao'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `servidores`
--

CREATE TABLE `servidores` (
  `id` int(11) NOT NULL,
  `Name` varbinary(50) NOT NULL,
  `TYPE` varchar(20) NOT NULL DEFAULT 'premium',
  `FLAG` varchar(20) NOT NULL DEFAULT 'br.png',
  `ServerIP` varchar(100) NOT NULL,
  `CheckUser` varchar(200) NOT NULL,
  `ServerPort` varchar(5) NOT NULL DEFAULT '22',
  `SSLPort` varchar(5) NOT NULL DEFAULT '443',
  `USER` varchar(20) NOT NULL,
  `PASS` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Despejando dados para a tabela `servidores`
--

INSERT INTO `servidores` (`id`, `Name`, `TYPE`, `FLAG`, `ServerIP`, `CheckUser`, `ServerPort`, `SSLPort`, `USER`, `PASS`) VALUES
(1, 0xe29aa1204d4555205345525649444f5220303120e29aa1, 'premium', 'br.png', 'meudominio.xyz', 'http://meudominio.xyz:8080/checkUser', 22, 443, '', ''),
(2, 0xe29aa1204d4555205345525649444f5220303220e29aa1, 'premium', 'br.png', 'meudominio.xyz', 'http://meudominio.xyz:8080/checkUser', 22, 443, '', '');

-- --------------------------------------------------------

--
-- Estrutura para tabela `sms`
--

CREATE TABLE `sms` (
  `id_sms` int(11) NOT NULL,
  `id_remetente` int(11) NOT NULL,
  `id_destinatario` int(11) NOT NULL,
  `assunto` varchar(100) NOT NULL,
  `mensagem` varchar(500) NOT NULL,
  `hora_resquisicao` datetime NOT NULL,
  `hora_envio` datetime NOT NULL,
  `status` enum('Aguardando','Enviado','Erro') NOT NULL DEFAULT 'Aguardando'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `smtp`
--

CREATE TABLE `smtp` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `servidor` varchar(255) NOT NULL,
  `porta` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `ssl_secure` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `smtp_usuarios`
--

CREATE TABLE `smtp_usuarios` (
  `id` int(11) NOT NULL,
  `ssl_secure` varchar(255) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `servidor` varchar(255) NOT NULL,
  `empresa` varchar(255) NOT NULL,
  `porta` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `senha` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(60) NOT NULL,
  `id_mestre` int(10) DEFAULT '0',
  `ativo` tinyint(1) NOT NULL DEFAULT '1',
  `atualiza_dados` int(11) NOT NULL DEFAULT '0',
  `login` varchar(60) NOT NULL,
  `senha` varchar(60) NOT NULL,
  `nome` varchar(60) DEFAULT NULL,
  `avatar` varchar(50) NOT NULL DEFAULT '1',
  `email` varchar(100) DEFAULT NULL,
  `celular` varchar(20) NOT NULL,
  `data_cadastro` datetime DEFAULT NULL,
  `tipo` enum('vpn','revenda','','') NOT NULL,
  `subrevenda` enum('nao','sim') NOT NULL,
  `validade` date DEFAULT NULL,
  `suspenso` date DEFAULT NULL,
  `token_user` varchar(120) DEFAULT NULL,
  `permitir_demo` int(11) NOT NULL DEFAULT '0',
  `dias_demo_sub` int(10) NOT NULL DEFAULT '0',
  `apagar` int(11) NOT NULL DEFAULT '0',
  `idcliente_mp` varchar(255) NOT NULL,
  `tokensecret_mp` varchar(255) NOT NULL,
  `dadosdeposito` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `login` varchar(25) NOT NULL,
  `senha` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuario_ssh`
--

CREATE TABLE `usuario_ssh` (
  `id_usuario_ssh` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_servidor` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `login` varchar(30) NOT NULL,
  `senha` varchar(20) NOT NULL,
  `data_validade` date NOT NULL,
  `data_suspensao` datetime DEFAULT NULL,
  `apagar` int(2) NOT NULL DEFAULT '0',
  `acesso` int(10) NOT NULL DEFAULT '1',
  `online` int(11) NOT NULL DEFAULT '0',
  `online_start` datetime DEFAULT NULL,
  `online_hist` int(11) NOT NULL DEFAULT '0',
  `demo` enum('nao','sim') NOT NULL DEFAULT 'nao'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuario_ssh_free`
--

CREATE TABLE `usuario_ssh_free` (
  `id` int(11) NOT NULL,
  `login` varchar(255) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `servidor` int(11) NOT NULL,
  `validade` datetime NOT NULL,
  `ip` varchar(255) NOT NULL,
  `online` int(11) NOT NULL DEFAULT '0',
  `online_start` datetime DEFAULT NULL,
  `online_hist` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `acesso_servidor`
--
ALTER TABLE `acesso_servidor`
  ADD PRIMARY KEY (`id_acesso_servidor`);

--
-- Índices de tabela `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_administrador`);

--
-- Índices de tabela `arquivo_download`
--
ALTER TABLE `arquivo_download`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `chamados`
--
ALTER TABLE `chamados`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `configs`
--
ALTER TABLE `configs`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `configuracao`
--
ALTER TABLE `configuracao`
  ADD PRIMARY KEY (`id_configuracao`);

--
-- Índices de tabela `fatura`
--
ALTER TABLE `fatura`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `fatura_clientes`
--
ALTER TABLE `fatura_clientes`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `fatura_comprovantes`
--
ALTER TABLE `fatura_comprovantes`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `fatura_comprovantes_clientes`
--
ALTER TABLE `fatura_comprovantes_clientes`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `historico_login`
--
ALTER TABLE `historico_login`
  ADD PRIMARY KEY (`id_historico_login`);

--
-- Índices de tabela `hist_usuario_ssh_online`
--
ALTER TABLE `hist_usuario_ssh_online`
  ADD PRIMARY KEY (`id_hist_usrSSH`);

--
-- Índices de tabela `hist_usuario_ssh_online_free`
--
ALTER TABLE `hist_usuario_ssh_online_free`
  ADD PRIMARY KEY (`id_hist_usrSSH`);

--
-- Índices de tabela `informativo`
--
ALTER TABLE `informativo`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `noticias`
--
ALTER TABLE `noticias`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `notificacoes`
--
ALTER TABLE `notificacoes`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `ovpn`
--
ALTER TABLE `ovpn`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `payloads`
--
ALTER TABLE `payloads`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `portas`
--
ALTER TABLE `portas`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `servidor`
--
ALTER TABLE `servidor`
  ADD PRIMARY KEY (`id_servidor`);

--
-- Índices de tabela `servidores`
--
ALTER TABLE `servidores`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `sms`
--
ALTER TABLE `sms`
  ADD PRIMARY KEY (`id_sms`);

--
-- Índices de tabela `smtp`
--
ALTER TABLE `smtp`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `smtp_usuarios`
--
ALTER TABLE `smtp_usuarios`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `login` (`login`),
  ADD UNIQUE KEY `token_user` (`token_user`);

--
-- Índices de tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `usuario_ssh`
--
ALTER TABLE `usuario_ssh`
  ADD PRIMARY KEY (`id_usuario_ssh`),
  ADD UNIQUE KEY `login` (`login`);

--
-- Índices de tabela `usuario_ssh_free`
--
ALTER TABLE `usuario_ssh_free`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `acesso_servidor`
--
ALTER TABLE `acesso_servidor`
  MODIFY `id_acesso_servidor` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `admin`
--
ALTER TABLE `admin`
  MODIFY `id_administrador` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `arquivo_download`
--
ALTER TABLE `arquivo_download`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `chamados`
--
ALTER TABLE `chamados`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `configs`
--
ALTER TABLE `configs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `configuracao`
--
ALTER TABLE `configuracao`
  MODIFY `id_configuracao` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `fatura`
--
ALTER TABLE `fatura`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `fatura_clientes`
--
ALTER TABLE `fatura_clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `fatura_comprovantes`
--
ALTER TABLE `fatura_comprovantes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `fatura_comprovantes_clientes`
--
ALTER TABLE `fatura_comprovantes_clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `historico_login`
--
ALTER TABLE `historico_login`
  MODIFY `id_historico_login` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `hist_usuario_ssh_online`
--
ALTER TABLE `hist_usuario_ssh_online`
  MODIFY `id_hist_usrSSH` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `hist_usuario_ssh_online_free`
--
ALTER TABLE `hist_usuario_ssh_online_free`
  MODIFY `id_hist_usrSSH` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `informativo`
--
ALTER TABLE `informativo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `noticias`
--
ALTER TABLE `noticias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `notificacoes`
--
ALTER TABLE `notificacoes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `ovpn`
--
ALTER TABLE `ovpn`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `payloads`
--
ALTER TABLE `payloads`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `portas`
--
ALTER TABLE `portas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `servidor`
--
ALTER TABLE `servidor`
  MODIFY `id_servidor` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `servidores`
--
ALTER TABLE `servidores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `sms`
--
ALTER TABLE `sms`
  MODIFY `id_sms` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `smtp`
--
ALTER TABLE `smtp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `smtp_usuarios`
--
ALTER TABLE `smtp_usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(60) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `usuario_ssh`
--
ALTER TABLE `usuario_ssh`
  MODIFY `id_usuario_ssh` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `usuario_ssh_free`
--
ALTER TABLE `usuario_ssh_free`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
