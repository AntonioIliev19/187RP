INSERT INTO `items` (`name`, `label`, `limit`, `rare`, `can_remove`) VALUES
('carjack', 'Car Jack', 1, 0, 1),
('speccheck', 'Spectrometer', 1, 0, 1),
('defuser', 'Bomb Defuser', 1, 0, 1),
('bombpart1', 'Casing', -1, 0, 1),
('bombpart2', 'Wires', -1, 0, 1),
('bombpart3', 'Trigger', -1, 0, 1),
('trash', 'Trash', -1, 0, 1),
('engbomb', 'Engine Bomb', 5, 0, 1);

INSERT INTO `shops` ( `store`, `item`, `price`) VALUES
( 'TwentyFourSeven', 'carjack', 40);