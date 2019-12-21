/* ATENÇÂO!! EVITE RODAR AS CONSULTAS SEM 'WHERE' NO SEU SERVIDOR DE PRODUÇÃO, TESTE SEMPRE EM UM AMBIENTE CONTROLADO! */

USE otrs;

SHOW TABLES;

SELECT * FROM ticket;

SELECT id, tn, title, customer_user_id, create_time, ticket_state_id FROM ticket;

SELECT 
ticket.id, 
ticket.tn, 
ticket.title,
ticket.customer_user_id, 
ticket.create_time,
ticket_state.name
FROM ticket INNER JOIN ticket_state ON ticket.ticket_state_id = ticket_state.id;

SELECT 
ticket.id AS ID, 
ticket.tn AS NUMERO, 
ticket.title AS ASSUNTO,
ticket.customer_user_id AS CLIENTE, 
ticket.create_time AS CRIADO,
ticket_state.name AS ESTADO
FROM ticket INNER JOIN ticket_state ON ticket.ticket_state_id = ticket_state.id;

SELECT 
ticket.id AS ID, 
ticket.tn AS NUMERO, 
ticket.title AS ASSUNTO,
ticket.customer_user_id AS CLIENTE, 
ticket.create_time AS CRIADO,
ticket_state.name AS ESTADO
FROM ticket INNER JOIN ticket_state ON ticket.ticket_state_id = ticket_state.id
WHERE ticket.create_time >= now() - INTERVAL 1 DAY;

SELECT COUNT(*) FROM ticket WHERE create_time >= now() - INTERVAL 1 DAY;
