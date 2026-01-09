CREATE DATABASE Miccoli_08_clinica_medica
CHARACTER SET utf8mb4
COLLATE utf8mb4_general_ci;

use Miccoli_08_clinica_medica;
/* Criacao de tabelas */
create table pacientes(id_paciente int auto_increment primary key,
nome varchar(50) NOT NULL ,
idade int NOT NULL,
cartao_de_saude boolean NOT NULL,
data_nascimento Date NOT NULL,
telephone varchar(9) NOT NULL,
email varchar(55) NOT NULL,
nr_cartao varchar(9) unique,
nif varchar(9) unique NOT NULL );
/* Inserecao de dados */
INSERT INTO pacientes(nome,idade,cartao_de_saude,data_nascimento,telephone,email,nr_cartao,nif)
VALUES
('Jonas Silva',32,TRUE,'1992-02-17','98743128','jonas.silva001@gmail.com','123456789','984476191'),
('Lucas Morais',17,TRUE,'2008-09-12','984671212','lucasfortnite09@gmail.com','123457880','983746280'),
('Carla Titos',36,FALSE,'1988-07-15','918345213','carlatitos1988@outlook.com',NULL,'983753132'),
('Mateus Cabo',27,FALSE,'1997-09-23','984829454','mateusinhoCabo9@icloud.com',NULL,'983172849'),
('Joana Mala',20,TRUE,'2005-02-19','98743128','joana.mala@gmail.com','123456777','984462543'),
('Luan Dorais',47,TRUE,'1977-09-22','984671212','lupindorais@hotmail.com','123454458','983763556'),
('Carlos Jerson',36,FALSE,'1988-05-25','918345242','jersonarlos1988@outlook.com',NULL,'983487132'),
('Jeff Coimbra',27,FALSE,'1997-09-23','984829544','coimbra.Jeff@icloud.com',NULL,'931245849'),
('Ana Rodrigues',29,TRUE,'1996-03-10','987654321','ana.rodrigues@gmail.com','123456111','984567123'),
('Pedro Mendes',40,TRUE,'1983-11-05','912345678','pedro.mendes@hotmail.com','123456222','983456789');

/*True(1)=Tem False(0)=Nao tem */     

create table profissionais(id_profissional int auto_increment primary key, 
nome varchar(50) not null, 
idade int not null check (idade>=18),  /* idade obrigatoria maior que 18*/ 
anos_de_experiencia  int not NULL  check(anos_de_experiencia >=0),   /*anos de experiencia sempre maior que 0 */
especialidade varchar(30) NOT NULL );

insert into profissionais(nome,idade,anos_de_experiencia,especialidade)
value
('Edson Barbosa',45,20,'Fisioterapia'),
('Future Numlk',40,15,'Geral'),
('Nelson Perrazo',55,30,'Neurologia'),
('Casandra Ferro',50,25,'Obstetricia'),
('Victoria Roberta',30,10,'Dentista'),
('Eluisa Fontes',25,5,'Ajudante_Dentaista'),
('Fernanda Porto',30,5,'Ajudante_obstetricia'),
('Simone Silva',25,5,'Receptionista'),
('Orlando Sitio',32,8,'Pediatra'),
('Alexandre Martins',20,1,'Gerente'),
('Fatima Natalia',45,24,'Contabelista'),
('Debora Paixao',22,2,'Receptionista');

create table consultas(id_consulta int auto_increment primary key,
id_paciente int,
id_profissional int,
data Date NOT NULL,
hora time NOT NULL, 
status ENUM ('marcada','realizada','cancelada')NOT NULL,  /* o enum serve para apenas usar as palavras selecionadas */
foreign key(id_paciente) references pacientes(id_paciente),
foreign key(id_profissional) references profissionais(id_profissional),
check (status in('marcada','realizada','cancelada')));
INSERT INTO consultas(id_paciente, id_profissional, data, hora, status)
VALUES
(1,3,'2025-12-10','09:30:00','marcada'),
(2,10,'2025-12-11','14:00:00','realizada'),
(3,4,'2025-12-12','11:00:00','cancelada'),
(4,7,'2025-12-13','10:30:00','marcada'),
(5,1,'2025-12-14','15:00:00','realizada'),
(6,2,'2025-12-15','09:00:00','cancelada'),
(7,3,'2025-12-16','13:30:00','marcada'),
(8,4,'2025-12-17','10:00:00','realizada'),
(9,5,'2025-12-18','11:15:00','marcada'),
(10,6,'2025-12-19','14:45:00','cancelada');


create table tratamentos (id_tratamento int auto_increment primary key,
id_profissional int,
id_paciente int ,
descricao varchar(100) NOT NULL,
data_inicio Date NOT NULL,
data_fim Date NOT NULL,
foreign key(id_profissional) references profissionais(id_profissional),
foreign key(id_paciente)references pacientes(id_paciente),
check(data_fim>=data_inicio));

INSERT INTO tratamentos(id_profissional, id_paciente, descricao, data_inicio, data_fim)
VALUES
(3,1,'Tratamento neurologico para dores de cabeca','2025-12-10','2025-12-20'),
(4,3,'Acompanhamento obstetrico','2025-12-12','2025-12-22'),
(7,4,'Auxilio obstetrico natal','2025-12-13','2025-12-25'),
(1,5,'Fisioterapia para coluna','2025-12-14','2025-12-28'),
(2,2,'Consulta geral e check-up','2025-12-15','2025-12-15'),
(5,6,'Tratamento dentário','2025-12-16','2025-12-18'),
(6,7,'Apoio odontológico','2025-12-17','2025-12-20'),
(8,8,'Acompanhamento pediátrico','2025-12-18','2025-12-22'),
(9,9,'Terapia respiratória','2025-12-19','2025-12-26'),
(10,10,'Exames gerais','2025-12-20','2025-12-25');
create table pagamentos(id_pagamento int auto_increment primary key,
id_paciente int ,
id_consulta int,
id_tratamento int,
valor decimal (10,2) NOT NULL check(valor>=0), /* valor sempre mair que 0 euros*/
situacao ENUM('pago','pendente','cancelado') NOT NULL,
foreign key(id_paciente) references pacientes(id_paciente),
foreign key(id_consulta) references consultas(id_consulta),
foreign key(id_tratamento)references tratamentos(id_tratamento));

INSERT INTO pagamentos(id_paciente, id_consulta, id_tratamento, valor, situacao)
VALUES
(1,1,1,12000.00,'pendente'),
(2,2,5,9000.00,'pago'),
(3,3,2,15000.00,'pago'),
(4,4,3,13500.00,'cancelado'),
(5,5,4,11000.00,'pago'),
(6,6,6,8000.00,'pendente'),
(7,7,7,9500.00,'pago'),
(8,8,8,7000.00,'cancelado'),
(9,9,9,10000.00,'pago'),
(10,10,10,8500.00,'pendente');

create table registros (id_registros int auto_increment primary key,
id_paciente int,
id_consulta int ,
id_tratamento int,
id_pagamento int,
foreign key(id_paciente)references pacientes(id_paciente),
foreign key (id_consulta)references consultas(id_consulta),
foreign key (id_tratamento) references tratamentos(id_tratamento),
foreign key (id_pagamento) references pagamentos(id_pagamento),
unique(id_paciente,id_consulta,id_tratamento,id_pagamento));

INSERT INTO registros(id_paciente, id_consulta, id_tratamento, id_pagamento)
VALUES
(1,1,1,1),
(2,2,5,2),
(3,3,2,3),
(4,4,3,4),
(5,5,4,5),
(6,6,6,6),
(7,7,7,7),
(8,8,8,8),
(9,9,9,9),
(10,10,10,10);

/* Criacao de useres*/
create user 'admin'@'%' identified by 'adm1Clinica(25)';
create user 'operador'@'%' identified by 'recepc@0(25)';
create user 'leitor'@'%' identified by'P@g@ment0s(25)';
create user 'leitor2'@'%' identified by 'C0nsult0res(25)';

/* Permissoes de cada user */
grant all privileges on clinica_medica.* to 'admin'@'%';
grant select,insert,UPDATE on clinica_medica.* to 'operador'@'%';
grant select,insert on clinica_medica.* to 'leitor'@'%';
grant select on clinica_medica.* to 'leitor2'@'%';

revoke insert,UPDATE on clinica_medica.* from 'leitor'@'%';

SHOW GRANTS FOR 'admin'@'%';
SHOW GRANTS FOR 'operador'@'%';
SHOW GRANTS FOR 'leitor'@'%';
SHOW GRANTS FOR 'leitor2'@'%';

flush privileges;

/* Selects */
 
/*Consulta devolve nome, idade e contacto de todos os pacientes.*/

SELECT nome, idade, telephone FROM pacientes;



/*Filtra apenas os pacientes que têm cartão de saúde.*/
SELECT nome, cartao_de_saude
FROM pacientes
WHERE cartao_de_saude = TRUE;



/*Junta informações das tabelas consultas + pacientes + profissionais.*/

SELECT p.nome AS paciente, pr.nome AS profissional, c.data, c.hora
FROM consultas c
INNER JOIN pacientes p ON c.id_paciente = p.id_paciente
INNER JOIN profissionais pr ON c.id_profissional = pr.id_profissional;



/* Garante que todos os pacientes aparecem, mesmo sem consulta marcada. */

SELECT p.nome, c.data, c.status
FROM pacientes p
LEFT JOIN consultas c ON p.id_paciente = c.id_paciente;


/* Mostra todos os profissionais mesmo se não houver consulta associada.*/

SELECT pr.nome, c.data, c.status
FROM consultas c
RIGHT JOIN profissionais pr ON c.id_profissional = pr.id_profissional;


/* Conta quantas consultas cada profissional já realizou.*/

SELECT pr.nome AS profissional, COUNT(c.id_consulta) AS total_consultas
FROM profissionais pr
LEFT JOIN consultas c ON pr.id_profissional = c.id_profissional
GROUP BY pr.nome;

/* HAVING é usado após o GROUP BY para filtrar agregações. */

SELECT pr.nome, COUNT(c.id_consulta) AS total
FROM profissionais pr
LEFT JOIN consultas c ON pr.id_profissional = c.id_profissional
GROUP BY pr.nome
HAVING COUNT(c.id_consulta) > 1;

/* Soma o valor de todos os pagamentos pagos.*/

SELECT SUM(valor) AS total_recebido
FROM pagamentos
WHERE situacao = 'pago';


/* Ordena os tratamentos pela data mais recente.*/

SELECT id_tratamento, descricao, data_inicio, data_fim
FROM tratamentos
ORDER BY data_fim DESC;



/* A subquery calcula a média,depois selecionamos os pacientes com valores acima dessa média. */

SELECT nome
FROM pacientes
WHERE id_paciente IN (
    SELECT id_paciente
    FROM pagamentos
    WHERE valor > (SELECT AVG(valor) FROM pagamentos)
);


/* Views */
/*Lista todas as consultas marcadas, com nome do paciente, nome do médico, data e estado. */
CREATE VIEW consultas_marcadas_view AS
SELECT 
    c.id_consulta,
    p.nome AS paciente,
    pr.nome AS profissional,
    pr.especialidade,
    c.data,
    c.hora,
    c.status
FROM consultas c
INNER JOIN pacientes p ON c.id_paciente = p.id_paciente
INNER JOIN profissionais pr ON c.id_profissional = pr.id_profissional
WHERE c.status = 'marcada';



/* Mostra pacientes com pagamentos por liquidar.*/
CREATE VIEW pagamentos_pendentes_view AS
SELECT
    p.nome AS paciente,
    pg.valor,
    pg.situacao
FROM pagamentos pg
INNER JOIN pacientes p ON pg.id_paciente = p.id_paciente
WHERE pg.situacao = 'pendente';

/* Procedures */
/* Lista todas as consultas de um paciente.(PROCEDURES) */
DELIMITER //

CREATE PROCEDURE listar_consultas_paciente(IN pid INT)
BEGIN
    SELECT
        c.id_consulta,
        c.data,
        c.hora,
        c.status,
        pr.nome AS profissional,
        pr.especialidade
    FROM consultas c
    INNER JOIN profissionais pr ON c.id_profissional = pr.id_profissional
    WHERE c.id_paciente = pid;
END //

DELIMITER ;

/* impede marcar consulta na data no passado ou estado invalido */
DELIMITER //

CREATE PROCEDURE inserir_consulta_com_validacao(
    IN pid INT,
    IN prof_id INT,
    IN dataC DATE,
    IN horaC TIME,
    IN statusC VARCHAR(20)
)
BEGIN
    -- Validar data da consulta
    IF dataC < CURDATE() THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Erro: A data não pode ser no passado.';
    END IF;

    -- Validar status
    IF statusC NOT IN ('marcada','realizada','cancelada') THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Erro: Status inválido.';
    END IF;

    -- Inserir consulta válida
    INSERT INTO consultas (id_paciente, id_profissional, data, hora, status)
    VALUES (pid, prof_id, dataC, horaC, statusC);
END //

DELIMITER ;

 /* Sempre que uma consulta é criada, é registado um log na tabela auditoria.*/
CREATE TABLE auditoria (
    id_log INT AUTO_INCREMENT PRIMARY KEY,
    acao VARCHAR(100),
    data_hora DATETIME,
    id_consulta INT
);

/* Triggers */
/*Registar automaticamente quando uma consulta é criada, guardando isso numa tabela de auditoria */
DELIMITER //

CREATE TRIGGER log_insercao_consulta
AFTER INSERT ON consultas
FOR EACH ROW
BEGIN
    INSERT INTO auditoria (acao, data_hora, id_consulta)
    VALUES ('Consulta criada', NOW(), NEW.id_consulta);
END //

DELIMITER ;
/* Registar automaticamente quando uma consulta é criada, guardando isso numa tabela de auditoria */
DELIMITER //

CREATE TRIGGER validar_idade_paciente
BEFORE INSERT ON pacientes
FOR EACH ROW
BEGIN
    IF NEW.idade < 0 OR NEW.idade > 120 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Erro: Idade inválida. A idade deve estar entre 0 e 120 anos.';
    END IF;
END //

DELIMITER ;


