DROP USER IF EXISTS 'user here'@'localhost';
-- Crea el usuario
CREATE USER IF NOT EXISTS 'user here'@'%' IDENTIFIED BY 'password here';
-- Otorga todos los permisos en todos los esquemas al usuario
GRANT ALL ON *.* TO 'user here'@'%';
