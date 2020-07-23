/* ATENÇÂO!! EVITE RODAR AS CONSULTAS SEM 'WHERE' NO SEU SERVIDOR DE PRODUÇÃO, TESTE SEMPRE EM UM AMBIENTE CONTROLADO! */

/* Rode o comando abaixo para entrar no banco de dados (no exemplo abaixo é "otrs") */
USE otrs;

/* Liste todas as tabelas do banco */
SHOW TABLES;

/* Lista todos os dados da tabela ticket (Cuidado! Em sistemas com muitos tickets esse comando pode travar o servidor, use "WHERE" para limitar a consulta) */
SELECT * FROM ticket;

/* Selecionar apenas alguns campos da talbela ticket */
SELECT id, tn, title, customer_user_id, create_time, ticket_state_id FROM ticket;

/* Mostra o mesmo resultado da consulta anterior, porém mostra o Estado do chamado de forma mais amigável */
SELECT 
ticket.id, 
ticket.tn, 
ticket.title,
ticket.customer_user_id, 
ticket.create_time,
ticket_state.name
FROM ticket INNER JOIN ticket_state ON ticket.ticket_state_id = ticket_state.id;

/* Melhor a consulta anterior, colocando nomes mais amigáveis nas colunas */
SELECT 
ticket.id AS ID, 
ticket.tn AS NUMERO, 
ticket.title AS ASSUNTO,
ticket.customer_user_id AS CLIENTE, 
ticket.create_time AS CRIADO,
ticket_state.name AS ESTADO
FROM ticket INNER JOIN ticket_state ON ticket.ticket_state_id = ticket_state.id;

/* Mostra todos os chamados abertos nas últimas 24 horas */
SELECT 
ticket.id AS ID, 
ticket.tn AS NUMERO, 
ticket.title AS ASSUNTO,
ticket.customer_user_id AS CLIENTE, 
ticket.create_time AS CRIADO,
ticket_state.name AS ESTADO
FROM ticket INNER JOIN ticket_state ON ticket.ticket_state_id = ticket_state.id
WHERE ticket.create_time >= now() - INTERVAL 1 DAY;

/* Conta quantos chamados foram abertos nas últimas 24 horas */
SELECT COUNT(*) FROM ticket WHERE create_time >= now() - INTERVAL 1 DAY;

/* Mostra todos os chamados fechados nas últimas 24 horas */
SELECT 
ticket.id AS ID, 
ticket.tn AS NUMERO, 
ticket.title AS ASSUNTO,
ticket.customer_user_id AS CLIENTE, 
ticket.create_time AS CRIADO,
ticket_state.name AS ESTADO
FROM ticket 
INNER JOIN ticket_state ON ticket.ticket_state_id = ticket_state.id
INNER JOIN ticket_history ON ticket_history.ticket_id = ticket.id

WHERE ticket.create_time >= now() - INTERVAL 1 DAY;


