INSERT INTO `addon_account` (name, label, shared) VALUES 
	('society_gang','Gang',1)
;

INSERT INTO `datastore` (name, label, shared) VALUES 
	('society_gang','Gang',1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES 
	('society_gang', 'Gang', 1)
;

INSERT INTO `jobs` (`name`, `label`, `whitelisted`) VALUES
('gang', '💸 Bratva Nostra', 1);


INSERT INTO `job_grades` (`job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
('gang', 0, 'soldato', 'Recrue', 0, '{}', '{}'),
('gang', 2, 'mafioso', 'Mafioso', 0, '{}', '{}'),
('gang', 3, 'capo', 'Capo', 0, '{}', '{}'),
('gang', 4, 'assassin', 'Assassin', 0, '{}', '{}'),
('gang', 5, 'consigliere', 'Consigliere', 0, '{}', '{}'),
('gang', 6, 'boss', 'Le Parrain', 0, '{}', '{}');