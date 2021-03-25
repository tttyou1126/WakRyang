/* mysql 시퀀스 기본 생성 예 */

﻿
/* seq_mysql 테이블 생성 */
CREATE TABLE seq_mysql(
id INT NOT NULL,
seq_name VARCHAR(50) NOT NULL
);

/* 생성된 펑션 삭제 */
DROP FUNCTION IF EXISTS get_seq;

/* Auto_increment 적용 */
DELIMITER $$
CREATE FUNCTION get_seq (p_seq_name VARCHAR(45))
RETURNS INT READS SQL DATA
BEGIN
DECLARE RESULT_ID INT;
UPDATE seq_mysql SET id = LAST_INSERT_ID(id+1)
WHERE seq_name = p_seq_name;
SET RESULT_ID = (SELECT LAST_INSERT_ID());
RETURN RESULT_ID;
END $$
DELIMITER ;

/* 시퀀스 생성 */
INSERT INTO seq_mysql
VALUES (0, 'seq_board');

/* 시퀀스 삽입 */
get_seq('seq_board')


select get_seq('seq_board')
from dual
;