-- Crear BD y tabla para el proyecto Flask + Flask-Login + MySQL
CREATE DATABASE IF NOT EXISTS desarrollo_web CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE desarrollo_web;

CREATE TABLE IF NOT EXISTS usuarios (
  id_usuario INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  email VARCHAR(120) NOT NULL UNIQUE,
  password VARCHAR(255) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Usuarios de ejemplo (contraseñas en hash; entre paréntesis se muestra la contraseña de texto plano)
-- dayanara@gmail.com (Ana12345)

INSERT INTO usuarios (nombre, email, password) VALUES ('dayanara bedon ', 'dayanara@gmail.com', 'scrypt:32768:8:1$vUJU8BPkY1W5mhMM$6bc59fcff369cc74f447be47e786688eae738395719ff7d2f84dd0d580d07a81ea58035a70b3f58bbee765a640f3efe0e67ba61bea72d98ec9e16006175bb5d2');
