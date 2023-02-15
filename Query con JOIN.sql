

-- 1. Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia
SELECT `students`.`name` AS'NOME', `students`.`surname` AS 'COGNOME',`degrees`.`name` AS 'CORSO'
FROM `students` 
JOIN `degrees` 
ON `degrees`.`id` = `students`.`degree_id` 
WHERE `degrees`.`name`='Corso di Laurea in Economia';

-- 2. Selezionare tutti i Corsi di Laurea del Dipartimento di Neuroscienze
SELECT `departments`.`name` AS'DIPARTIMENTO',`degrees`.`name` AS 'CORSO'
FROM `degrees` 
JOIN `departments` 
ON `departments`.`id` = `degrees`.`department_id`
WHERE `departments`.`name`='Dipartimento di Neuroscienze';

-- 3. Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44)
SELECT `teachers`.`name` AS 'NOME',`teachers`.`surname` AS 'COGNOME',`courses`.`name` AS'CORSI'
FROM `courses` 
JOIN `course_teacher` 
ON `courses`.`id` = `course_teacher`. `course_id`
JOIN `teachers` 
ON `teachers`.`id` = `course_teacher`.`teacher_id`
WHERE `teachers`.`id`= '44';

-- 4. Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il relativo dipartimento, in ordine alfabetico per cognome e nome
SELECT `students`.`name` AS `NOME`,`students`.`surname` AS `COGNOME`,`degrees`.`name` AS'CORSO',`departments`.`name` AS'DIPARTIMENTO'
FROM `students` 
JOIN `degrees` 
ON `degrees`.`id` = `students`. `degree_id`
JOIN `departments` 
ON `departments`.`id` = `degrees`.`department_id`
ORDER BY `COGNOME`, `NOME` ASC;

-- 5. Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti
SELECT `degrees`.`name` AS 'CORSO DI LAUREA',`courses`.`name` AS 'CORSO',`teachers`.`name` AS'NOME', `teachers`.`surname` AS'COGNOME'
FROM `teachers` 
JOIN `course_teacher` 
ON `teachers`.`id` = `course_teacher`. `teacher_id`
JOIN `courses` 
ON `courses`.`id` = `course_teacher`.`course_id`
JOIN `degrees` 
ON `degrees`.`id` = `courses`.`degree_id`
ORDER BY `degrees`.`name`;

-- 6. Selezionare tutti i docenti che insegnano nel Dipartimento di Matematica (54)
SELECT DISTINCT`teachers`.`name` AS 'NOME',`teachers`.`surname` AS 'COGNOME',`departments`.`name` AS'DIPARTIMENTO'
FROM `teachers` 
JOIN `course_teacher` 
ON `teachers`.`id` = `course_teacher`. `teacher_id`
JOIN `courses` 
ON `courses`.`id` = `course_teacher`.`course_id`
JOIN `degrees` 
ON `degrees`.`id` = `courses`.`degree_id`
JOIN `departments`
ON `departments`.`id` = `degrees`.`department_id`
WHERE `departments`.`name`= 'Dipartimento di Matematica';

-- 7. BONUS: Selezionare per ogni studente quanti tentativi d’esame ha sostenuto per superare ciascuno dei suoi esami
SELECT `students`.`name` AS 'NOME',`students`.`surname` AS 'COGNOME', `courses`.`name` AS 'CORSO', COUNT(`exam_student`.`vote`) AS'NUM. TENTATIVI'
FROM `students` 
JOIN `exam_student` 
ON `students`.`id` = `exam_student`. `student_id`
JOIN `exams` 
ON `exams`.`id` = `exam_student`.`exam_id`
JOIN `courses` 
ON `courses`.`id` = `exams`.`course_id`
WHERE `exam_student`.`vote`<18 
GROUP BY `students`.`name`,`students`.`surname`,`courses`.`name`;