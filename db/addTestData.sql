DROP PROCEDURE if EXISTS addTestData;
CREATE PROCEDURE addTestData()
BEGIN
  CREATE TEMPORARY TABLE temp(id INT) AS (SELECT id FROM cursuri ORDER BY id LIMIT 2);

  DELETE FROM teste;
  DELETE FROM teme;

  INSERT INTO teme (denumire, timp_start, timp_sfarsit, ref_curs) VALUES ('tema_1', NOW(), ADDDATE(NOW(), 7), (SELECT temp.id FROM temp LIMIT 1));
  INSERT INTO teme (denumire, timp_start, timp_sfarsit, ref_curs) VALUES ('tema_2', NOW(), ADDDATE(NOW(), 7), (SELECT temp.id FROM temp ORDER BY temp.id DESC LIMIT 1));

  INSERT INTO teste (denumire, timp_start, timp_sfarsit, ref_curs) VALUES ('test_1', NOW(), ADDDATE(NOW(), 7), (SELECT temp.id FROM temp LIMIT 1));
  INSERT INTO teste (denumire, timp_start, timp_sfarsit, ref_curs) VALUES ('test_2', NOW(), ADDDATE(NOW(), 7), (SELECT temp.id FROM temp ORDER BY temp.id DESC LIMIT 1));

  DROP TEMPORARY TABLE temp;
END;

CALL addTestData();