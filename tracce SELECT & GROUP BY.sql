-- ---------------------------------------  QUERY CON SELECT

-- 1. Selezionare tutti gli studenti nati nel 1990 (160)
SELECT `name`, `surname`, YEAR(`date_of_birth`) FROM `students` WHERE YEAR(`date_of_birth`)= 1990;

-- 2. Selezionare tutti i corsi che valgono più di 10 crediti (479)
SELECT `name`,`cfu` FROM `courses` WHERE `cfu`> 10;

-- 3. Selezionare tutti gli studenti che hanno più di 30 anni
SELECT `name`, `surname`, `date_of_birth` FROM `students` WHERE DATE(`date_of_birth`) <= DATE_SUB(CURDATE(), INTERVAL 30 YEAR);

-- 4. Selezionare tutti i corsi del primo semestre del primo anno di un qualsiasi corso di laurea (286)
SELECT `name`,`period`,`year` FROM `courses` WHERE `period`='I semestre' AND `year`=1;

-- 5. Selezionare tutti gli appelli d'esame che avvengono nel pomeriggio (dopo le 14) del 20/06/2020 (21)
SELECT `course_id`, `date`,`hour` FROM `exams` WHERE HOUR(`hour`)>=14 AND `date`='2020-06-20';

-- 6. Selezionare tutti i corsi di laurea magistrale (38)
SELECT `name` AS 'CORSO DI LAUREA' FROM `degrees` WHERE `level`='magistrale';

-- 7. Da quanti dipartimenti è composta l'università? (12)
SELECT COUNT(`id`) AS 'NUMERO DIPARTIMENTI' FROM `departments`;

-- 8. Quanti sono gli insegnanti che non hanno un numero di telefono? (50)
SELECT COUNT(*) AS 'INSEGNANTI SENZA TELEFONO'FROM `teachers` WHERE `phone`IS NULL;


-- ------------------------------------------ QUERY CON GROUP BY

-- 1. Contare quanti iscritti ci sono stati ogni anno
SELECT COUNT(*) AS 'NUMERO STUDENTI', YEAR(`enrolment_date`) AS 'ANNO DI IMMATRICOLAZIONE' FROM `students` GROUP BY YEAR(`enrolment_date`);

-- 2. Contare gli insegnanti che hanno l'ufficio nello stesso edificio
SELECT COUNT(*) AS 'NUMERO INSEGNANTI','office_address' AS 'INDIRIZZO' FROM `teachers` GROUP BY `office_address`;

-- 3. Calcolare la media dei voti di ogni appello d'esame
SELECT ROUND(AVG(`vote`)) AS 'MEDIA VOTO', `exam_id` AS 'ESAME' FROM `exam_student` GROUP BY `exam_id`;

-- 4. Contare quanti corsi di laurea ci sono per ogni dipartimento
SELECT COUNT(*) AS 'NUMERO CORSI DI LAUREA', `department_id` AS 'DIPARTIMENTO' FROM `degrees` GROUP BY `department_id`;
